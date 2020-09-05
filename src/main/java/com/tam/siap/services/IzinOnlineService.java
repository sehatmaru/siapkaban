package com.tam.siap.services;

import com.tam.siap.models.*;
import com.tam.siap.models.request.EmailRequestDto;
import com.tam.siap.models.responses.DokumenListResponse;
import com.tam.siap.models.responses.LayananResponse;
import com.tam.siap.models.responses.ViewDokumenResponse;
import com.tam.siap.services.master.*;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.tam.siap.utils.TamUtils.*;
import static com.tam.siap.utils.refs.JenisDokumen.*;
import static com.tam.siap.utils.refs.JenisLokasi.TANGERANG;
import static com.tam.siap.utils.refs.Role.*;
import static com.tam.siap.utils.refs.Status.FAILED;
import static com.tam.siap.utils.refs.Status.SUCCESS;
import static com.tam.siap.utils.refs.StatusLayanan.ON_PROGRESS;
import static com.tam.siap.utils.refs.StatusLayanan.REJECTED;

@Service
public class IzinOnlineService {

    @Autowired
    AccountService accountService;

    @Autowired
    JenisDokumenService jenisDokumenService;

    @Autowired
    DokumenService dokumenService;

    @Autowired
    UploadService uploadService;

    @Autowired
    LayananService layananService;

    @Autowired
    RoleService roleService;

    @Autowired
    EmailService emailService;

    @Autowired
    EditorService editorService;

    public DokumenListResponse docFilter(SJLayanan subLayanan) {
        List<JDokumen> docs = jenisDokumenService.findJenisDokumen(subLayanan);
        DokumenListResponse response = new DokumenListResponse();

        List<JDokumen> permohonan = new ArrayList<>();
        List<JDokumen> persyaratan = new ArrayList<>();
        List<JDokumen> lainnya = new ArrayList<>();

        for (JDokumen doc : docs) {
            switch (doc.getDeskripsi()) {
                case PERMOHONAN:
                    permohonan.add(doc);
                    break;
                case PERSYARATAN:
                    persyaratan.add(doc);
                    break;
                case LAINNYA:
                    lainnya.add(doc);
                    break;
            }
        }

        response.setPermohonan(permohonan);
        response.setPersyaratan(persyaratan);
        response.setLainnya(lainnya);

        System.out.println(response.toString());

        return response;
    }

    public String getTemplate(Layanan layanan, JDokumen dokumen) {
        String result = editorService.htmlToString(layanan, dokumen);

        if (result == null) return "Error";
        else return result;
    }

    public int saveTemplate(Layanan layanan, JDokumen jDokumen, String html) {
        int result = FAILED;

        String path = editorService.htmlToDocx(layanan, jDokumen, html);

        if (path != null) {
            Dokumen dokumen = new Dokumen(
                    jDokumen.getKeterangan(),
                    path,
                    jDokumen,
                    layanan.getPemohonon(),
                    1
            );

            dokumenService.save(dokumen);

            result = SUCCESS;
        }

        return result;
    }

    public String uploadTemplate(MemoryBuffer memoryBuffer, Layanan layanan, JDokumen dokumen) {
        String result = null;
        String path = editorService.docxToHTML(memoryBuffer, layanan, dokumen);

        if (path != null) result = editorService.htmlToString(path);

        if (result != null) return result;
        else return "Error";
    }

    public File downloadTemplate(Layanan layanan, JDokumen dokumen) {
        if (dokumenService.isDocumentExist(dokumen, layanan.getPemohonon())) {
            Dokumen dok = dokumenService.findByJenisDokumenAndPemohon(dokumen, layanan.getPemohonon());

            return new File(dok.getPath());
        } else return editorService.getPath(layanan, dokumen);
    }

    public List<JDokumen> docFilter(Role role, int status) {
        if (role.getId() == PEMERIKSA_P2 || role.getId() == KEPALA_SUB_SEKSI_P2 || role.getId() == KEPALA_SEKSI_P2) {
            return jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(PEMERIKSA_P2), "" + status);
        } else if (role.getId() == PEMERIKSA_PERBEND || role.getId() == KEPALA_SUB_SEKSI_PERBEND || role.getId() == KEPALA_SEKSI_PERBEND) {
            return jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(PEMERIKSA_PERBEND), "" + status);
        } else {
            return jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(PEMERIKSA_PKC), "" + status);
        }
    }

    public int submit(List<MemoryBuffer> memoryBuffer, Layanan layanan, List<Dokumen> dokumen) {
        int result = FAILED;

        layanan.setNomor(getNomor());
        layanan.setStatus(ON_PROGRESS);
        layananService.save(layanan);
        layananService.flush();
        uploadDoc(memoryBuffer, dokumen, layanan);

        if (layananService.isLayananExist(layanan.getNomor())) result = SUCCESS;

        return result;
    }

    public void uploadDoc(List<MemoryBuffer> memoryBuffer, List<Dokumen> dokumen, Layanan layanan) {
        for (int i=0; i<dokumen.size(); i++) {
            dokumen.get(i).setPath(uploadService.saveFile(
                    memoryBuffer.get(i),
                    dokumen.get(i),
                    layanan.getNomor()));
            saveDB(dokumen.get(i), layanan);
        }
    }

    private void saveDB(Dokumen dokumen, Layanan layanan){
        dokumen.setLayanan(layananService.findLayananById(layanan.getId()));
        dokumenService.save(dokumen);
    }

    public int processLayanan(Layanan layanan, StatusLayanan statusLayanan) {
        int result = SUCCESS;

        Account account = accountService.findById(statusLayanan.getAccountId());
        String status = fetchStringWithColon(
                statusLayanan.getAccountId(),
                statusLayanan.getTanggal(),
                statusLayanan.getStatus(),
                statusLayanan.getCatatan()
        );

        switch (account.getRole().getId()) {
            case PENERIMA_DOKUMEN :
                layanan.setPenerima(status);

                if (statusLayanan.getStatus().equals(Integer.toString(REJECTED))) {
                    Map<String, String> model = new HashMap<>();
                    model.put("nomor_pengajuan", layanan.getNomor());
                    model.put("waktu_response", statusLayanan.getTanggal());
                    model.put("npwp_pemohon", layanan.getPemohonon().getPerusahaan().getNpwp());
                    model.put("nama_pemohon", layanan.getPemohonon().getPerusahaan().getNama());
                    model.put("alamat_pemohon", layanan.getPemohonon().getPerusahaan().getAlamat());
                    model.put("daftar_perbaikan", statusLayanan.getCatatan());

                    EmailRequestDto request = new EmailRequestDto(
                            "siapkaban@gmail.com",
                            layanan.getPemohonon().getPribadi().getEmail(),
                            "Penolakan Permohonan",
                            3,
                            account.getUsername(),
                            model
                    );

                    layanan.setStatus(REJECTED);

                    if (layanan.getLokasi() == TANGERANG) model.put("jenis_kppbc", "A TANGERANG");
                    else model.put("jenis_kppbc", "MERAK");

                    if (!emailService.sendMail(request)) result = FAILED;
                } else {
                    layanan.setKepKantor(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            ""
                    ));
                }

                break;
            case PEMERIKSA_P2 :
                layanan.setPemeriksaP2(status);
                break;
            case PEMERIKSA_PERBEND :
                layanan.setPemeriksaPerbend(status);
                break;
            case PEMERIKSA_PKC :
                layanan.setPemeriksaPkc(status);
                break;
            case KEPALA_SEKSI_P2 :
                layanan.setKepSeksiP2(status);

                if (layanan.getKepSubSeksiP2() == null) {
                    layanan.setKepSubSeksiP2(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            ""
                    ));
                }

                break;
            case KEPALA_SEKSI_PERBEND :
                layanan.setKepSeksiPerbend(status);

                if (layanan.getKepSubSeksiPerbend() == null) {
                    layanan.setKepSubSeksiPerbend(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            ""
                    ));
                }

                break;
            case KEPALA_SEKSI_PKC :
                layanan.setKepSeksiPkc(status);

                if (layanan.getKepSubSeksiPkc() == null) {
                    layanan.setKepSubSeksiPkc(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            ""
                    ));
                }

                break;
            case KEPALA_SUB_SEKSI_P2 :
                layanan.setKepSubSeksiP2(status);

                if (layanan.getPemeriksaP2() == null) {
                    layanan.setPemeriksaP2(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            ""
                    ));
                }

                break;
            case KEPALA_SUB_SEKSI_PERBEND :
                layanan.setKepSubSeksiPerbend(status);

                if (layanan.getPemeriksaPerbend() == null) {
                    layanan.setPemeriksaPerbend(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            ""
                    ));
                }

                break;
            case KEPALA_SUB_SEKSI_PKC :
                layanan.setKepSubSeksiPkc(status);

                if (layanan.getPemeriksaPkc() == null) {
                    layanan.setPemeriksaPkc(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            ""
                    ));
                }

                break;
            case KEPALA_KANTOR :
                layanan.setKepKantor(status);

                Account kepSeksiP2 = accountService.findByRoleAndLokasi(roleService.getRole(KEPALA_SEKSI_P2), account.getLokasi());
                Account kepSeksiPerbend = accountService.findByRoleAndLokasi(roleService.getRole(KEPALA_SEKSI_PERBEND), account.getLokasi());

                layanan.setKepSeksiP2(fetchStringWithColon(
                        Integer.toString(kepSeksiP2.getId()),
                        "",
                        "",
                        ""
                ));

                layanan.setKepSeksiPerbend(fetchStringWithColon(
                        Integer.toString(kepSeksiPerbend.getId()),
                        "",
                        "",
                        ""
                ));

                layanan.setKepSeksiPkc(fetchStringWithColon(
                        Integer.toString(statusLayanan.getNextPic().getId()),
                        "",
                        "",
                        ""
                ));

                break;
            default: result = FAILED;
        }

        layananService.save(layanan);

        return result;
    }

    public List<ViewDokumenResponse> viewDocs(Layanan layanan) {
        List<ViewDokumenResponse> result = new ArrayList<>();
        List<Dokumen> docs = dokumenService.findByLayanan(layanan);

        for (Dokumen doc : docs) {
            result.add(new ViewDokumenResponse(doc, new File(doc.getPath())));
        }

        return result;
    }

    public List<LayananResponse> viewPerizinanOnline(Account account) {
        List<LayananResponse> responses = new ArrayList<>();

        switch (account.getRole().getId()) {
            case KEPALA_KANTOR:
                List<Layanan> kepKantor = layananService.findLayananByPenerimaIsNotNull(account.getLokasi());

                for (Layanan data : kepKantor) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepKantor()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case PENERIMA_DOKUMEN:
                List<Layanan> penerima = layananService.findLayananByPenerimaIsNull(account.getLokasi());

                for (Layanan data : penerima) {
                    responses.add(setDataLayananToResponse(data));
                }

                break;
            case PEMOHON:
                List<Layanan> pemohon = layananService.findLayananByPemohon(account);

                for (Layanan data : pemohon) {
                    responses.add(setDataLayananToResponse(data));
                }

                break;
            case PEMERIKSA_P2:
                List<Layanan> pemeriksaP2 = layananService.findLayananByPemeriksaP2IsNotNull(account.getLokasi());

                for (Layanan data : pemeriksaP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaP2()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case PEMERIKSA_PERBEND:
                List<Layanan> pemeriksaPerbend = layananService.findLayananByPemeriksaPerbendIsNotNull(account.getLokasi());

                for (Layanan data : pemeriksaPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaPerbend()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case PEMERIKSA_PKC:
                List<Layanan> pemeriksaPkc = layananService.findLayananByPemeriksaPkcIsNotNull(account.getLokasi());

                for (Layanan data : pemeriksaPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaPkc()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case KEPALA_SEKSI_P2:
                List<Layanan> kepSeksiP2 = layananService.findLayananByKepSeksiP2IsNotNull(account.getLokasi());

                for (Layanan data : kepSeksiP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiP2()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case KEPALA_SEKSI_PERBEND:
                List<Layanan> kepSeksiPerbend = layananService.findLayananByKepSeksiPerbendIsNotNull(account.getLokasi());

                for (Layanan data : kepSeksiPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPerbend()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case KEPALA_SEKSI_PKC:
                List<Layanan> kepSeksiPkc = layananService.findLayananByKepSeksiPkcIsNotNull(account.getLokasi());

                for (Layanan data : kepSeksiPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPkc()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_P2:
                List<Layanan> kepSubSeksiP2 = layananService.findLayananByKepSubSeksiP2IsNotNull(account.getLokasi());

                for (Layanan data : kepSubSeksiP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiP2()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_PERBEND:
                List<Layanan> kepSubSeksiPerbend = layananService.findLayananByKepSubSeksiPerbendIsNotNull(account.getLokasi());

                for (Layanan data : kepSubSeksiPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiPerbend()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_PKC:
                List<Layanan> kepSubSeksiPkc = layananService.findLayananByKepSubSeksiPkcIsNotNull(account.getLokasi());

                for (Layanan data : kepSubSeksiPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiPkc()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
        }

        return responses;
    }

    public List<Account> getNextPic(Account account) {
        List<Account> response = new ArrayList<>();

        switch (account.getRole().getId()) {
            case PENERIMA_DOKUMEN:
                response = accountService.getAccountList(roleService.getRole(KEPALA_KANTOR), account.getLokasi());
                break;
            case KEPALA_KANTOR:
                response = accountService.getAccountList(roleService.getRole(KEPALA_SEKSI_PKC), account.getLokasi());
                break;
            case KEPALA_SEKSI_P2:
                response = accountService.getAccountList(roleService.getRole(KEPALA_SUB_SEKSI_P2), account.getLokasi());
                break;
            case KEPALA_SEKSI_PERBEND:
                response = accountService.getAccountList(roleService.getRole(KEPALA_SUB_SEKSI_PERBEND), account.getLokasi());
                break;
            case KEPALA_SEKSI_PKC:
                response = accountService.getAccountList(roleService.getRole(KEPALA_SUB_SEKSI_PKC), account.getLokasi());
                break;
            case KEPALA_SUB_SEKSI_P2:
                response = accountService.getAccountList(roleService.getRole(PEMERIKSA_P2), account.getLokasi());
                break;
            case KEPALA_SUB_SEKSI_PERBEND:
                response = accountService.getAccountList(roleService.getRole(PEMERIKSA_PERBEND), account.getLokasi());
                break;
            case KEPALA_SUB_SEKSI_PKC:
                response = accountService.getAccountList(roleService.getRole(PEMERIKSA_PKC), account.getLokasi());
                break;
        }

        return response;
    }

    private LayananResponse setDataLayananToResponse(Layanan layanan) {
        LayananResponse response = new LayananResponse();
        response.setId(Integer.toString(layanan.getId()));
        response.setNomor(layanan.getNomor());
        response.setTanggalRequest(layanan.getTanggal().toString());
        response.setNamaPerusahaan(layanan.getPemohonon().getPerusahaan().getNama());
        response.setJenisPerusahaan(layanan.getPemohonon().getPerusahaan().getJenis().getKeterangan());
        response.setLayanan(layanan.getSubLayanan().getKeterangan());

        if (layanan.getPenerima() != null) {
            if (!layanan.getPenerima().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getPenerima());
                Account account = accountService.findById(status.getAccountId());

                response.setPenerima(account.getPribadi().getNama());
                response.setTanggalPenerima(status.getTanggal());
            }
        }

        if (layanan.getKepSeksiP2() != null) {
            if (!layanan.getKepSeksiP2().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSeksiP2());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSeksiP2(account.getPribadi().getNama());
                response.setTanggalKepSeksiP2(status.getTanggal());
            }
        }

        if (layanan.getKepSeksiPerbend() != null) {
            if (!layanan.getKepSeksiPerbend().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSeksiPerbend());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSeksiPerbend(account.getPribadi().getNama());
                response.setTanggalKepSeksiPerbend(status.getTanggal());
            }
        }

        if (layanan.getKepSeksiPkc() != null) {
            if (!layanan.getKepSeksiPkc().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSeksiPkc());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSeksiPkc(account.getPribadi().getNama());
                response.setTanggalKepSeksiPkc(status.getTanggal());
            }
        }

        if (layanan.getKepSubSeksiP2() != null) {
            if (!layanan.getKepSubSeksiP2().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSubSeksiP2());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSubSeksiP2(account.getPribadi().getNama());
                response.setTanggalKepSubSeksiP2(status.getTanggal());
            }
        }

        if (layanan.getKepSubSeksiPerbend() != null) {
            if (!layanan.getKepSubSeksiPerbend().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSubSeksiPerbend());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSubSeksiPerbend(account.getPribadi().getNama());
                response.setTanggalKepSubSeksiPerbend(status.getTanggal());
            }
        }

        if (layanan.getKepSubSeksiPkc() != null) {
            if (!layanan.getKepSubSeksiPkc().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSubSeksiPkc());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSubSeksiPkc(account.getPribadi().getNama());
                response.setTanggalKepSubSeksiPkc(status.getTanggal());
            }
        }

        if (layanan.getPemeriksaP2() != null) {
            if (!layanan.getPemeriksaP2().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getPemeriksaP2());
                Account account = accountService.findById(status.getAccountId());

                response.setPemeriksaP2(account.getPribadi().getNama());
                response.setTanggalPemeriksaP2(status.getTanggal());
            }
        }

        if (layanan.getPemeriksaPerbend() != null) {
            if (!layanan.getPemeriksaPerbend().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getPemeriksaPerbend());
                Account account = accountService.findById(status.getAccountId());

                response.setPemeriksaPerbend(account.getPribadi().getNama());
                response.setTanggalPemeriksaPerbend(status.getTanggal());
            }
        }

        if (layanan.getPemeriksaPkc() != null) {
            if (!layanan.getPemeriksaPkc().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getPemeriksaPkc());
                Account account = accountService.findById(status.getAccountId());

                response.setPemeriksaPkc(account.getPribadi().getNama());
                response.setTanggalPemeriksaPkc(status.getTanggal());
            }
        }

        if (layanan.getKepKantor() != null) {
            if (!layanan.getKepKantor().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepKantor());
                Account account = accountService.findById(status.getAccountId());

                response.setKepKantor(account.getPribadi().getNama());
                response.setTanggalKepKantor(status.getTanggal());
            }
        }

        return response;
    }

    private String getNomor(){
        String nomor = getRandomNumber();

        for (int i=0; i<=10; i++) {
            if (layananService.isLayananExist(nomor)) nomor = getRandomNumber();
            else break;
        }

        return nomor;
    }
}
