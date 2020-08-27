package com.tam.siap.services;

import com.tam.siap.models.*;
import com.tam.siap.models.responses.DokumenListResponse;
import com.tam.siap.models.responses.LayananResponse;
import com.tam.siap.models.responses.ViewDokumenResponse;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.DokumenService;
import com.tam.siap.services.master.JenisDokumenService;
import com.tam.siap.services.master.LayananService;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import org.codehaus.groovy.reflection.stdclasses.CachedSAMClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.interceptor.CacheAspectSupport;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import static com.tam.siap.utils.TamUtils.*;
import static com.tam.siap.utils.refs.JenisDokumen.*;
import static com.tam.siap.utils.refs.Role.*;
import static com.tam.siap.utils.refs.Status.FAILED;
import static com.tam.siap.utils.refs.Status.SUCCESS;
import static com.tam.siap.utils.refs.StatusLayanan.ON_PROGRESS;

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

    private int id = 0;

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

    public int submit(List<MemoryBuffer> memoryBuffer, Layanan layanan, List<Dokumen> dokumen) {
        int result = FAILED;

        layanan.setNomor(getNomor());
        layanan.setStatus(ON_PROGRESS);
        layananService.save(layanan);
        layananService.flush();
        id = layanan.getId();
        uploadDoc(memoryBuffer, dokumen, layanan.getNomor());

        if (layananService.isLayananExist(layanan.getNomor())) result = SUCCESS;

        return result;
    }

    public void uploadDoc(List<MemoryBuffer> memoryBuffer, List<Dokumen> dokumen, String nomor) {
        for (int i=0; i<dokumen.size(); i++) {
            dokumen.get(i).setPath(uploadService.saveFile(
                    memoryBuffer.get(i),
                    dokumen.get(i),
                    nomor));
            saveDB(dokumen.get(i));
        }
    }

    private void saveDB(Dokumen dokumen){
        dokumen.setLayanan(layananService.findLayananById(id));
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
            case PENERIMA_DOKUMEN : layanan.setPenerima(status);
            case PEMERIKSA_P2 : layanan.setPemeriksaP2(status);
            case PEMERIKSA_PERBEND : layanan.setPemeriksaPerbend(status);
            case PEMERIKSA_PKC : layanan.setPemeriksaPkc(status);
            case KEPALA_SEKSI_P2 : layanan.setKepSeksiP2(status);
            case KEPALA_SEKSI_PERBEND : layanan.setKepSeksiPerbend(status);
            case KEPALA_SEKSI_PKC : layanan.setKepSeksiPkc(status);
            case KEPALA_SUB_SEKSI_P2 : layanan.setKepSubSeksiP2(status);
            case KEPALA_SUB_SEKSI_PERBEND : layanan.setKepSubSeksiPerbend(status);
            case KEPALA_SUB_SEKSI_PKC : layanan.setKepSubSeksiPkc(status);
            case KEPALA_KANTOR : layanan.setKepKantor(status);
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

    //for penerima dok & kep kantor
    public List<LayananResponse> viewPerizinanOnline(Role role) {
        List<LayananResponse> responses = new ArrayList<>();
        List<Layanan> layanans = new ArrayList<>();

        switch (role.getId()) {
            case PENERIMA_DOKUMEN:
                layanans = layananService.findLayananByPenerimaIsNull();
                break;
            case KEPALA_KANTOR:
                layanans = layananService.findLayananByPenerimaIsNotNull();
                break;
        }

        for (Layanan layanan : layanans) {
            responses.add(setDataLayananToResponse(layanan));
        }

        return responses;
    }

    //for pemeriksa, kep seksi, kep sub seksi
    public List<LayananResponse> viewPerizinanOnline(Role role, Account account) {
        List<LayananResponse> responses = new ArrayList<>();

        switch (role.getId()) {
            case PEMERIKSA_P2:
                List<Layanan> pemeriksaP2 = layananService.findLayananByPemeriksaP2IsNotNull();

                for (Layanan data : pemeriksaP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaP2()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case PEMERIKSA_PERBEND:
                List<Layanan> pemeriksaPerbend = layananService.findLayananByPemeriksaPerbendIsNotNull();

                for (Layanan data : pemeriksaPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaPerbend()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case PEMERIKSA_PKC:
                List<Layanan> pemeriksaPkc = layananService.findLayananByPemeriksaPkcIsNotNull();

                for (Layanan data : pemeriksaPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaPkc()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case KEPALA_SEKSI_P2:
                List<Layanan> kepSeksiP2 = layananService.findLayananByKepSeksiP2IsNotNull();

                for (Layanan data : kepSeksiP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiP2()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case KEPALA_SEKSI_PERBEND:
                List<Layanan> kepSeksiPerbend = layananService.findLayananByKepSeksiPerbendIsNotNull();

                for (Layanan data : kepSeksiPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPerbend()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case KEPALA_SEKSI_PKC:
                List<Layanan> kepSeksiPkc = layananService.findLayananByKepSeksiPkcIsNotNull();

                for (Layanan data : kepSeksiPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPkc()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_P2:
                List<Layanan> kepSubSeksiP2 = layananService.findLayananByKepSubSeksiP2IsNotNull();

                for (Layanan data : kepSubSeksiP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiP2()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_PERBEND:
                List<Layanan> kepSubSeksiPerbend = layananService.findLayananByKepSubSeksiPerbendIsNotNull();

                for (Layanan data : kepSubSeksiPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiPerbend()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_PKC:
                List<Layanan> kepSubSeksiPkc = layananService.findLayananByKepSubSeksiPkcIsNotNull();

                for (Layanan data : kepSubSeksiPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiPkc()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data));
                    }
                }

                break;
        }

        return responses;
    }

    private LayananResponse setDataLayananToResponse(Layanan layanan) {
        LayananResponse response = new LayananResponse();
        response.setNomor(layanan.getNomor());
        response.setTanggalRequest(layanan.getTanggal());
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
