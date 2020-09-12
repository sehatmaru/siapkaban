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
import java.text.SimpleDateFormat;
import java.util.*;

import static com.tam.siap.utils.TamUtils.*;
import static com.tam.siap.utils.refs.JenisDokumen.*;
import static com.tam.siap.utils.refs.JenisEmail.*;
import static com.tam.siap.utils.refs.JenisLokasi.MERAK;
import static com.tam.siap.utils.refs.JenisLokasi.TANGERANG;
import static com.tam.siap.utils.refs.JenisPengawas.KANWIL;
import static com.tam.siap.utils.refs.Role.*;
import static com.tam.siap.utils.refs.Status.FAILED;
import static com.tam.siap.utils.refs.Status.SUCCESS;
import static com.tam.siap.utils.refs.StatusLayanan.*;

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

    @Autowired
    SubJenisLayananService subJenisLayananService;

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
        String result;

        System.out.println("layanan + id " + layanan.getId() + " " + dokumen.getId());

        if (dokumenService.isDocumentExist(dokumen, layanan)) {
            Dokumen dok = dokumenService.findByJenisDokumenAndLayanan(dokumen, layanan);
            result = editorService.htmlToString(dok.getPath().replace("docx", "html"));
        } else {
            result = editorService.htmlToString(layanan, dokumen);
        }

        if (result == null) return "Error";
        else return result;
    }

    public int saveTemplate(Layanan layanan, JDokumen jDokumen, String html) {
        int result = FAILED;
        System.out.println("html = " + html);

        String path = editorService.htmlToDocx(layanan, jDokumen, html);
        editorService.docxToHTML(path, layanan, jDokumen);

        if (path != null) {
            if (!dokumenService.isDocumentExist(jDokumen, layanan)) {
                Dokumen dokumen = new Dokumen(
                        jDokumen.getKeterangan(),
                        path,
                        jDokumen,
                        layanan.getPemohonon(),
                        layanan,
                        1
                );

                dokumenService.save(dokumen);
            }

            result = SUCCESS;
        }

        return result;
    }

    public String uploadTemplate(MemoryBuffer memoryBuffer, Layanan layanan, JDokumen dokumen) {
        String result = null;
        String path = editorService.docxToHTML(memoryBuffer, layanan, dokumen);

        if (path != null) {
            result = editorService.htmlToString(path);

            if (!dokumenService.isDocumentExist(dokumen, layanan)) {
                Dokumen dok = new Dokumen(
                        dokumen.getKeterangan(),
                        path.replace("html", "docx"),
                        dokumen,
                        layanan.getPemohonon(),
                        layanan,
                        1
                );

                dokumenService.save(dok);
            }
        }

        if (result != null) return result;
        else return "Error";
    }

    public File downloadTemplate(Layanan layanan, JDokumen dokumen) {
        if (dokumenService.isDocumentExist(dokumen, layanan)) {
            Dokumen dok = dokumenService.findByJenisDokumenAndLayanan(dokumen, layanan);

            return new File(dok.getPath());
        } else return editorService.getPath(layanan, dokumen);
    }

    public List<JDokumen> docFilter(Role role, Layanan layanan, int status) {
        if (role.getId() == PEMERIKSA_P2 || role.getId() == KEPALA_SUB_SEKSI_P2 || role.getId() == KEPALA_SEKSI_P2) {
            return jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(PEMERIKSA_P2), "" + status);
        } else if (role.getId() == PEMERIKSA_PERBEND || role.getId() == KEPALA_SUB_SEKSI_PERBEND || role.getId() == KEPALA_SEKSI_PERBEND) {
            return jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(PEMERIKSA_PERBEND), "" + status);
        } else if (role.getId() == PEMERIKSA_PKC || role.getId() == KEPALA_SUB_SEKSI_PKC || role.getId() == KEPALA_SEKSI_PKC) {
            List<JDokumen> result = new ArrayList<>();
            List<JDokumen> docs = jenisDokumenService.findJenisDokumen(subJenisLayananService.getSubJenisLayanan(44));

            for (JDokumen dokumen : docs) {
                if (dokumen.getRole().getId() != PEMERIKSA_PKC) {
                    if (dokumen.getStatus().equals(String.valueOf(status))) {
                        if (dokumenService.isDocumentExist(dokumen, layanan)) result.add(dokumen);
                    }
                } else {
                    if (dokumen.getStatus().equals(String.valueOf(status))) result.add(dokumen);
                }
            }

            return result;
        } else if (role.getId() == KANWIL_KEPALA_BIDANG_P2 || role.getId() == KANWIL_KEPALA_SEKSI_INTELIJEN || role.getId() == KANWIL_PEMERIKSA_P2) {
            return jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(KANWIL_PEMERIKSA_P2), "" + status);
        } else if (role.getId() == KANWIL_KEPALA_BIDANG_FASILITAS || role.getId() == KANWIL_KEPALA_SEKSI_PF || role.getId() == KANWIL_PEMERIKSA_DOKUMEN) {
            List<JDokumen> result = new ArrayList<>();
            List<JDokumen> docs = jenisDokumenService.findJenisDokumen(subJenisLayananService.getSubJenisLayanan(44));

            for (JDokumen dokumen : docs) {
                if (dokumen.getRole().getId() != KANWIL_PEMERIKSA_DOKUMEN) {
                    if (dokumen.getStatus().equals(String.valueOf(status))) {
                        if (dokumenService.isDocumentExist(dokumen, layanan)) result.add(dokumen);
                    }
                } else {
                    if (dokumen.getStatus().equals(String.valueOf(status))) result.add(dokumen);
                }
            }

            return result;
        } else if (role.getId() == KANWIL_KEPALA_BIDANG_PKC || role.getId() == KANWIL_KEPALA_SEKSI_PKC || role.getId() == KANWIL_PEMERIKSA_PKC) {
            return jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(KANWIL_PEMERIKSA_PKC), "" + status);
        } else return new ArrayList<>();

    }

    public int submit(List<MemoryBuffer> memoryBuffer, Layanan layanan, List<Dokumen> dokumen) {
        int result = FAILED;

        layanan.setNomor(getNomor());

        if (!isTPBOrKITEPerubahanNonLokasiOrPencabutan(layanan)) layanan.setStatus(ON_BATCH_1_KPPBC);
        else layanan.setStatus(ON_BATCH_1_KANWIL);

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

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        Account account = accountService.findById(statusLayanan.getAccountId());
        String status = fetchStringWithColon(
                statusLayanan.getAccountId(),
                statusLayanan.getTanggal(),
                statusLayanan.getStatus(),
                statusLayanan.getCatatan()
        );

        switch (account.getRole().getId()) {
            case PENERIMA_DOKUMEN :
                layanan.setPenerima(
                        fetchStringWithColon(
                                statusLayanan.getAccountId(),
                                statusLayanan.getTanggal(),
                                String.valueOf(ACCEPTED),
                                statusLayanan.getCatatan()
                        )
                );

                if (statusLayanan.getStatus().equals(Integer.toString(REJECTED))) {
                    result = sendEmail(layanan, statusLayanan, REJECTED, EMAIL_PENOLAKAN);
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
                layanan.setPemeriksaP2(
                        fetchStringWithColon(
                                statusLayanan.getAccountId(),
                                statusLayanan.getTanggal(),
                                String.valueOf(ACCEPTED),
                                statusLayanan.getCatatan()
                        )
                );

                break;
            case PEMERIKSA_PERBEND :
                layanan.setPemeriksaPerbend(
                        fetchStringWithColon(
                                statusLayanan.getAccountId(),
                                statusLayanan.getTanggal(),
                                String.valueOf(ACCEPTED),
                                statusLayanan.getCatatan()
                        )
                );

                break;
            case PEMERIKSA_PKC :
                layanan.setPemeriksaPkc(
                        fetchStringWithColon(
                                statusLayanan.getAccountId(),
                                statusLayanan.getTanggal(),
                                String.valueOf(ACCEPTED),
                                statusLayanan.getCatatan()
                        )
                );

                break;
            case KEPALA_SEKSI_P2 :
                if (layanan.getStatus() == ON_BATCH_1_KPPBC) {
                    layanan.setKepSeksiP2(status);

                    if (layanan.getKepSubSeksiP2() == null) {
                        layanan.setKepSubSeksiP2(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getStatus() == ON_BATCH_2_KPPBC) {
                    layanan.setKepSeksiP2(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;
            case KEPALA_SEKSI_PERBEND :
                if (layanan.getStatus() == ON_BATCH_1_KPPBC) {
                    layanan.setKepSeksiPerbend(status);

                    if (layanan.getKepSubSeksiPerbend() == null) {
                        layanan.setKepSubSeksiPerbend(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getStatus() == ON_BATCH_2_KPPBC) {
                    layanan.setKepSeksiPerbend(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;
            case KEPALA_SEKSI_PKC :
                if (layanan.getStatus() == ON_BATCH_1_KPPBC) {
                    layanan.setKepSeksiPkc(status);

                    if(isTPBOrKITEPerubahanLokasiOrPencabutan(layanan)) {
                        StatusLayanan kepSeksiP2 = splitStringWithColon(layanan.getKepSeksiP2());
                        StatusLayanan kepSeksiPerbend = splitStringWithColon(layanan.getKepSeksiPerbend());

                        if (kepSeksiP2.getTanggal() == null) {
                            layanan.setKepSeksiP2(fetchStringWithColon(
                                    kepSeksiP2.getAccountId(),
                                    dateFormat.format(new Date()),
                                    String.valueOf(ON_PROGRESS),
                                    ""
                            ));

                            Account kepSubSeksiP2 = getRandomAccount(roleService.getRole(KEPALA_SUB_SEKSI_P2), layanan.getLokasi());
                            layanan.setKepSubSeksiP2(fetchStringWithColon(
                                    Integer.toString(kepSubSeksiP2.getId()),
                                    "",
                                    "",
                                    ""
                            ));
                        }

                        if (kepSeksiPerbend.getTanggal() == null) {
                            layanan.setKepSeksiPerbend(fetchStringWithColon(
                                    kepSeksiPerbend.getAccountId(),
                                    dateFormat.format(new Date()),
                                    String.valueOf(ON_PROGRESS),
                                    ""
                            ));

                            Account kepSubSeksiPerbend = getRandomAccount(roleService.getRole(KEPALA_SUB_SEKSI_PERBEND), layanan.getLokasi());
                            layanan.setKepSubSeksiPerbend(fetchStringWithColon(
                                    Integer.toString(kepSubSeksiPerbend.getId()),
                                    "",
                                    "",
                                    ""
                            ));
                        }
                    }

                    if (layanan.getKepSubSeksiPkc() == null) {
                        layanan.setKepSubSeksiPkc(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getStatus() == ON_BATCH_2_KPPBC) layanan.setKepSeksiPkc(status);

                break;
            case KEPALA_SUB_SEKSI_P2 :
                if (layanan.getStatus() == ON_BATCH_1_KPPBC) {
                    layanan.setKepSubSeksiP2(status);

                    if (layanan.getPemeriksaP2() == null) {
                        layanan.setPemeriksaP2(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getStatus() == ON_BATCH_2_KPPBC) {
                    layanan.setKepSubSeksiP2(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;
            case KEPALA_SUB_SEKSI_PERBEND :
                if (layanan.getStatus() == ON_BATCH_1_KPPBC) {
                    layanan.setKepSubSeksiPerbend(status);

                    if (layanan.getPemeriksaPerbend() == null) {
                        layanan.setPemeriksaPerbend(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getStatus() == ON_BATCH_2_KPPBC) {
                    layanan.setKepSubSeksiPerbend(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;
            case KEPALA_SUB_SEKSI_PKC :
                if (layanan.getStatus() == ON_BATCH_1_KPPBC) {
                    layanan.setKepSubSeksiPkc(status);
                    layanan.setStatus(ON_BATCH_2_KPPBC);

                    if(isTPBOrKITEPerubahanLokasiOrPencabutan(layanan)) {
                        StatusLayanan kepSubSeksiP2 = splitStringWithColon(layanan.getKepSubSeksiP2());
                        StatusLayanan kepSubSeksiPerbend = splitStringWithColon(layanan.getKepSubSeksiPerbend());

                        if (kepSubSeksiP2.getTanggal() == null) {
                            layanan.setKepSubSeksiP2(fetchStringWithColon(
                                    kepSubSeksiP2.getAccountId(),
                                    dateFormat.format(new Date()),
                                    String.valueOf(ON_PROGRESS),
                                    ""
                            ));

                            Account pemeriksaP2 = getRandomAccount(roleService.getRole(PEMERIKSA_P2), layanan.getLokasi());
                            layanan.setPemeriksaP2(fetchStringWithColon(
                                    Integer.toString(pemeriksaP2.getId()),
                                    "",
                                    "",
                                    ""
                            ));
                        }

                        if (kepSubSeksiPerbend.getTanggal() == null) {
                            layanan.setKepSubSeksiPerbend(fetchStringWithColon(
                                    kepSubSeksiPerbend.getAccountId(),
                                    dateFormat.format(new Date()),
                                    String.valueOf(ON_PROGRESS),
                                    ""
                            ));

                            Account pemeriksaPerbend = getRandomAccount(roleService.getRole(PEMERIKSA_PERBEND), layanan.getLokasi());
                            layanan.setPemeriksaPerbend(fetchStringWithColon(
                                    Integer.toString(pemeriksaPerbend.getId()),
                                    "",
                                    "",
                                    ""
                            ));
                        }
                    }

                    if (layanan.getPemeriksaPkc() == null) {
                        layanan.setPemeriksaPkc(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getStatus() == ON_BATCH_2_KPPBC) layanan.setKepSubSeksiPkc(status);

                break;
            case KEPALA_KANTOR :
                if (layanan.getStatus() == ON_BATCH_1_KPPBC) {
                    layanan.setKepKantor(status);

                    if (isTPBOrKITEPerubahanLokasiOrPencabutan(layanan)) {
                        layanan.setKepSeksiP2(fetchStringWithColon(
                                Integer.toString(accountService.findByRoleAndLokasi(roleService.getRole(KEPALA_SEKSI_P2), account.getLokasi()).getId()),
                                "",
                                "",
                                ""
                        ));

                        layanan.setKepSeksiPerbend(fetchStringWithColon(
                                Integer.toString(accountService.findByRoleAndLokasi(roleService.getRole(KEPALA_SEKSI_PERBEND), account.getLokasi()).getId()),
                                "",
                                "",
                                ""
                        ));
                    }

                    layanan.setKepSeksiPkc(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            ""
                    ));
                } else if (layanan.getStatus() == ON_BATCH_2_KPPBC) {
                    layanan.setKepKantor(status);

                    if (statusLayanan.getStatus().equals(String.valueOf(ACCEPTED))) {
                        if (layanan.getSubLayanan().getPengawas() == KANWIL) layanan.setStatus(ON_BATCH_1_KANWIL);
                        else layanan.setStatus(ACCEPTED);

                        result = sendEmail(layanan, statusLayanan, ACCEPTED, EMAIL_PENERIMAAN);
                    }
                }

                break;
            case KANWIL_KEPALA_KANTOR :
                if (layanan.getStatus() == ON_BATCH_1_KANWIL) {
                    layanan.setKepKantorKanwil(status);

                    if (isTPBOrKITEPerizinanBaru(layanan)) {
                        layanan.setKepBidangP2Kanwil(fetchStringWithColon(
                                Integer.toString(accountService.findByRole(roleService.getRole(KANWIL_KEPALA_BIDANG_P2)).getId()),
                                "",
                                "",
                                ""
                        ));
                    }

                    layanan.setKepBidPkcKanwil(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            ""
                    ));
                } else if (layanan.getStatus() == ON_BATCH_2_KANWIL) {
                    layanan.setKepKantorKanwil(status);

                    if (statusLayanan.getStatus().equals(String.valueOf(ACCEPTED))) {
                        result = sendEmail(layanan, statusLayanan, ACCEPTED, EMAIL_PENERIMAAN);
                    }
                }

                break;
            case KANWIL_KEPALA_BIDANG_FASILITAS:
                if (layanan.getStatus() == ON_BATCH_1_KANWIL) {
                    layanan.setKepBidangFasilitasKanwil(status);

                    if (isTPBOrKITEPerizinanBaru(layanan)) {
                        StatusLayanan kepBidangP2 = splitStringWithColon(layanan.getKepBidangP2Kanwil());

                        if (kepBidangP2.getTanggal() == null) {
                            layanan.setKepBidangP2Kanwil(fetchStringWithColon(
                                    kepBidangP2.getAccountId(),
                                    dateFormat.format(new Date()),
                                    String.valueOf(ON_PROGRESS),
                                    ""
                            ));

                            Account kepSeksiIntelijen = getRandomAccount(roleService.getRole(KANWIL_KEPALA_SEKSI_INTELIJEN));
                            layanan.setKepSeksiIntelijenKanwil(fetchStringWithColon(
                                    Integer.toString(kepSeksiIntelijen.getId()),
                                    "",
                                    "",
                                    ""
                            ));
                        }
                    }

                    if (layanan.getKepSeksiPfKanwil() == null) {
                        layanan.setKepSeksiPfKanwil(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getStatus() == ON_BATCH_2_KANWIL) layanan.setKepBidangFasilitasKanwil(status);

                break;
            case KANWIL_KEPALA_SEKSI_PF:
                if (layanan.getStatus() == ON_BATCH_1_KANWIL) {
                    layanan.setKepSeksiPfKanwil(status);
                    layanan.setStatus(ON_BATCH_2_KANWIL);

                    if (isTPBOrKITEPerizinanBaru(layanan)) {
                        StatusLayanan kepSeksiIntelijen = splitStringWithColon(layanan.getKepSeksiIntelijenKanwil());

                        if (kepSeksiIntelijen.getTanggal() == null) {
                            layanan.setKepSeksiIntelijenKanwil(fetchStringWithColon(
                                    kepSeksiIntelijen.getAccountId(),
                                    dateFormat.format(new Date()),
                                    String.valueOf(ON_PROGRESS),
                                    ""
                            ));

                            Account pemeriksaP2 = getRandomAccount(roleService.getRole(KANWIL_PEMERIKSA_P2));
                            layanan.setPemeriksaP2Kanwil(fetchStringWithColon(
                                    Integer.toString(pemeriksaP2.getId()),
                                    "",
                                    "",
                                    ""
                            ));
                        }
                    }

                    if (layanan.getPemeriksaDokumenKanwil() == null) {
                        layanan.setPemeriksaDokumenKanwil(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getStatus() == ON_BATCH_2_KANWIL) layanan.setKepSeksiPfKanwil(status);

                break;
            case KANWIL_PEMERIKSA_DOKUMEN:
                layanan.setPemeriksaDokumenKanwil(
                        fetchStringWithColon(
                                statusLayanan.getAccountId(),
                                statusLayanan.getTanggal(),
                                String.valueOf(ACCEPTED),
                                statusLayanan.getCatatan()
                        )
                );

                break;

            case KANWIL_PENERIMA_DOKUMEN :
                layanan.setPenerimaKanwil(
                        fetchStringWithColon(
                                statusLayanan.getAccountId(),
                                statusLayanan.getTanggal(),
                                String.valueOf(ACCEPTED),
                                statusLayanan.getCatatan()
                        )
                );

                if (statusLayanan.getStatus().equals(Integer.toString(REJECTED))) {
                    result = sendEmail(layanan, statusLayanan, REJECTED, EMAIL_PENOLAKAN);
                } else {
                    layanan.setKepKantorKanwil(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            ""
                    ));
                }
                break;

            case KANWIL_KEPALA_BIDANG_P2 :
                if (layanan.getStatus() == ON_BATCH_1_KANWIL) {
                    layanan.setKepBidangP2Kanwil(status);

                    if (layanan.getKepSeksiIntelijenKanwil() == null) {
                        layanan.setKepSeksiIntelijenKanwil(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getStatus() == ON_BATCH_2_KANWIL) {
                    layanan.setKepBidangP2Kanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;

            case KANWIL_KEPALA_SEKSI_INTELIJEN :
                if (layanan.getStatus() == ON_BATCH_1_KANWIL) {
                    layanan.setKepSeksiIntelijenKanwil(status);

                    if (layanan.getPemeriksaP2Kanwil() == null) {
                        layanan.setPemeriksaP2Kanwil(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getStatus() == ON_BATCH_2_KANWIL) {
                    layanan.setKepSeksiIntelijenKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;

            case KANWIL_KEPALA_BIDANG_PKC :
                if (layanan.getStatus() == ON_BATCH_1_KANWIL) {
                    layanan.setKepBidPkcKanwil(status);

                    if(isKPOrTPS(layanan)) {
                        if (layanan.getKepSeksiPkcKanwil() == null) {
                            layanan.setKepSeksiPkcKanwil(fetchStringWithColon(
                                    Integer.toString(statusLayanan.getNextPic().getId()),
                                    "",
                                    "",
                                    ""
                            ));
                        }
                    }
                } else if (layanan.getStatus() == ON_BATCH_2_KANWIL) layanan.setKepBidPkcKanwil(status);

                break;

            case KANWIL_KEPALA_SEKSI_PKC :
                if (layanan.getStatus() == ON_BATCH_1_KANWIL) {
                    layanan.setKepSeksiPkcKanwil(status);

                    if(isKPOrTPS(layanan)) {
                        if (layanan.getPemeriksaPkcKanwil() == null) {
                            layanan.setPemeriksaPkcKanwil(fetchStringWithColon(
                                    Integer.toString(statusLayanan.getNextPic().getId()),
                                    "",
                                    "",
                                    ""
                            ));
                        }
                    }
                } else if (layanan.getStatus() == ON_BATCH_2_KPPBC) layanan.setKepSeksiPkcKanwil(status);

                break;

            case KANWIL_PEMERIKSA_P2 :
                layanan.setPemeriksaP2Kanwil(
                        fetchStringWithColon(
                                statusLayanan.getAccountId(),
                                statusLayanan.getTanggal(),
                                String.valueOf(ACCEPTED),
                                statusLayanan.getCatatan()
                        )
                );

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
            if (doc.getJenisDokumen().getSubLayanan().getId() != 44) result.add(new ViewDokumenResponse(doc, new File(doc.getPath())));
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
                        if (data.getStatus() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getKepSeksiPkc()).getStatus().equals(ACCEPTED + "")) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_KANTOR:
                List<Layanan> kanwilKepKantor = layananService.findLayananByPemeriksaDokumenKanwilIsNotNull();

                for (Layanan data : kanwilKepKantor) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepKantorKanwil()).getAccountId())) {
                        if(data.getStatus() == ON_BATCH_2_KANWIL){
                            if(splitStringWithColon(data.getKepBidangP2Kanwil()).getStatus().equals(ACCEPTED + "")) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }

                break;
            case PENERIMA_DOKUMEN:
                List<Layanan> penerima = layananService.findLayananByPenerimaIsNull(account.getLokasi());

                for (Layanan data : penerima) {
                    if (!isTPBOrKITEPerubahanNonLokasiOrPencabutan(data)) responses.add(setDataLayananToResponse(data));
                }

                break;
            case KANWIL_PENERIMA_DOKUMEN:
                List<Layanan> pendokKanwil = layananService.findLayananByPenerimaKanwilIsNullAndStatus(ON_BATCH_1_KANWIL);

                for (Layanan data : pendokKanwil) {
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
            case KANWIL_PEMERIKSA_P2:
                List<Layanan> pemeriksaP2Kanwil = layananService.findLayananByPemeriksaP2KanwilIsNotNull();

                for (Layanan data : pemeriksaP2Kanwil) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaP2Kanwil()).getAccountId())) {
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
                        if (data.getStatus() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getKepSubSeksiP2()).getStatus().equals(ACCEPTED + "")
                                    || splitStringWithColon(data.getKepSubSeksiP2()).getStatus().equals(REJECTED + "")) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_BIDANG_P2:
                List<Layanan> kepBidangP2Kanwil = layananService.findLayananByKepBidangP2KanwilIsNotNull();

                for (Layanan data : kepBidangP2Kanwil) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepBidangP2Kanwil()).getAccountId())) {
                        if (data.getStatus() == ON_BATCH_2_KANWIL) {
                            if (splitStringWithColon(data.getKepSeksiIntelijenKanwil()).getStatus().equals(ACCEPTED + "")
                                    || splitStringWithColon(data.getKepSeksiIntelijenKanwil()).getStatus().equals(REJECTED + "")) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }

                break;
            case KEPALA_SEKSI_PERBEND:
                List<Layanan> kepSeksiPerbend = layananService.findLayananByKepSeksiPerbendIsNotNull(account.getLokasi());

                for (Layanan data : kepSeksiPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPerbend()).getAccountId())) {
                        if (data.getStatus() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getKepSubSeksiPerbend()).getStatus().equals(ACCEPTED + "")
                                    || splitStringWithColon(data.getKepSubSeksiPerbend()).getStatus().equals(REJECTED + "")) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else  {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }

                break;
            case KEPALA_SEKSI_PKC:
                List<Layanan> kepSeksiPkc = layananService.findLayananByKepSeksiPkcIsNotNull(account.getLokasi());

                for (Layanan data : kepSeksiPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPkc()).getAccountId())) {
                        if (data.getStatus() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getKepSubSeksiPkc()).getStatus().equals(ACCEPTED + "")
                                    || splitStringWithColon(data.getKepSubSeksiPkc()).getStatus().equals(REJECTED + "")) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_P2:
                List<Layanan> kepSubSeksiP2 = layananService.findLayananByKepSubSeksiP2IsNotNull(account.getLokasi());

                for (Layanan data : kepSubSeksiP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiP2()).getAccountId())) {
                        if (data.getStatus() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getPemeriksaP2()).getStatus() != null) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_SEKSI_INTELIJEN:
                List<Layanan> kepSeksiIntelijen = layananService.findLayananByKepSeksiIntelijenIsNotNull();

                for (Layanan data : kepSeksiIntelijen) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiIntelijenKanwil()).getAccountId())) {
                        if (data.getStatus() == ON_BATCH_2_KANWIL) {
                            if (splitStringWithColon(data.getPemeriksaP2Kanwil()).getStatus() != null) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_PERBEND:
                List<Layanan> kepSubSeksiPerbend = layananService.findLayananByKepSubSeksiPerbendIsNotNull(account.getLokasi());

                for (Layanan data : kepSubSeksiPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiPerbend()).getAccountId())) {
                        if (data.getStatus() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getPemeriksaPerbend()).getStatus() != null) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_PKC:
                List<Layanan> kepSubSeksiPkc = layananService.findLayananByKepSubSeksiPkcIsNotNull(account.getLokasi());

                for (Layanan data : kepSubSeksiPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiPkc()).getAccountId())) {
                        if (data.getStatus() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getPemeriksaPkc()).getStatus() != null) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_BIDANG_FASILITAS:
                List<Layanan> kepBidFasilitas = layananService.findLayananByKepBidangFasilitasKanwilIsNotNull();

                for (Layanan data : kepBidFasilitas) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepBidangFasilitasKanwil()).getAccountId())) {
                        if (data.getStatus() == ON_BATCH_2_KANWIL) {
                            if (splitStringWithColon(data.getKepSeksiPfKanwil()).getStatus().equals(ACCEPTED + "")
                                    || splitStringWithColon(data.getKepSeksiPfKanwil()).getStatus().equals(REJECTED + "")) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_SEKSI_PF:
                List<Layanan> kepSeksiPf = layananService.findLayananByKepSeksiPfKanwilIsNotNull();

                for (Layanan data : kepSeksiPf) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPfKanwil()).getAccountId())) {
                        if (data.getStatus() == ON_BATCH_2_KANWIL) {
                            if (splitStringWithColon(data.getPemeriksaDokumenKanwil()).getStatus() != null) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_BIDANG_PKC:
                List<Layanan> kepBidPkc = layananService.findLayananByKepBidPKCKanwilIsNotNull();

                for(Layanan data : kepBidPkc) {
                    if(Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepBidPkcKanwil()).getAccountId())) {
                        if(data.getStatus() == ON_BATCH_2_KANWIL) {
                            if(splitStringWithColon(data.getKepSeksiPkcKanwil()).getStatus() != null) {
                                responses.add(setDataLayananToResponse(data));
                            }
                        } else {
                            responses.add(setDataLayananToResponse(data));
                        }
                    }
                }
                break;
            case KANWIL_KEPALA_SEKSI_PKC:
                List<Layanan> kepSiPkc = layananService.findByLayananKepSeksiPKCKanwilIsNotNull();

                for(Layanan data : kepSiPkc) {
                    if(data.getStatus() == ON_BATCH_2_KANWIL) {
                        if(splitStringWithColon(data.getKepSeksiPkcKanwil()).getStatus() != null) {
                            responses.add(setDataLayananToResponse(data));
                        }
                    } else {
                        responses.add(setDataLayananToResponse(data));
                    }
                }
                break;
            case KANWIL_PEMERIKSA_DOKUMEN:
                List<Layanan> pemeriksaDokumen = layananService.findLayananByPemeriksaDokumenKanwilIsNotNull();

                for (Layanan data : pemeriksaDokumen) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaDokumenKanwil()).getAccountId())) {
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
            case KANWIL_PENERIMA_DOKUMEN:
                response = accountService.getAccountList(roleService.getRole(KANWIL_KEPALA_KANTOR));
                break;
            case KEPALA_KANTOR:
                response = accountService.getAccountList(roleService.getRole(KEPALA_SEKSI_PKC), account.getLokasi());
                break;
            case KANWIL_KEPALA_KANTOR:
                response = accountService.getAccountList(roleService.getRole(KANWIL_KEPALA_BIDANG_P2), account.getLokasi());
                break;
            case KEPALA_SEKSI_P2:
                response = accountService.getAccountList(roleService.getRole(KEPALA_SUB_SEKSI_P2), account.getLokasi());
                break;
            case KANWIL_KEPALA_BIDANG_P2:
                response = accountService.getAccountList(roleService.getRole(KANWIL_KEPALA_SEKSI_INTELIJEN));
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
            case KANWIL_KEPALA_SEKSI_INTELIJEN:
                response = accountService.getAccountList(roleService.getRole(KANWIL_PEMERIKSA_P2));
                break;
            case KEPALA_SUB_SEKSI_PERBEND:
                response = accountService.getAccountList(roleService.getRole(PEMERIKSA_PERBEND), account.getLokasi());
                break;
            case KEPALA_SUB_SEKSI_PKC:
                response = accountService.getAccountList(roleService.getRole(PEMERIKSA_PKC), account.getLokasi());
                break;
            case KANWIL_KEPALA_BIDANG_FASILITAS:
                response = accountService.getAccountList(roleService.getRole(KANWIL_KEPALA_SEKSI_PF));
                break;
            case KANWIL_KEPALA_SEKSI_PF:
                response = accountService.getAccountList(roleService.getRole(KANWIL_PEMERIKSA_DOKUMEN));
            case KANWIL_KEPALA_BIDANG_PKC:
                response = accountService.getAccountList(roleService.getRole(KANWIL_KEPALA_SEKSI_PKC));
            case KANWIL_KEPALA_SEKSI_PKC:
                response = accountService.getAccountList(roleService.getRole(KANWIL_PEMERIKSA_PKC));
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

        if (layanan.getPenerimaKanwil() != null) {
            if (!layanan.getPenerimaKanwil().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getPenerimaKanwil());
                Account account = accountService.findById(status.getAccountId());

                response.setPenerimaKanwil(account.getPribadi().getNama());
                response.setTanggalPenerimaKanwil(status.getTanggal());
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

        if (layanan.getKepBidangP2Kanwil() != null) {
            if (!layanan.getKepBidangP2Kanwil().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepBidangP2Kanwil());
                Account account = accountService.findById(status.getAccountId());

                response.setKepBidangP2Kanwil(account.getPribadi().getNama());
                response.setTanggalKepBidangP2Kanwil(status.getTanggal());
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

        if (layanan.getKepSeksiIntelijenKanwil() != null) {
            if (!layanan.getKepSeksiIntelijenKanwil().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSeksiIntelijenKanwil());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSeksiIntelijenKanwil(account.getPribadi().getNama());
                response.setTanggalKepSeksiIntelijenKanwil(status.getTanggal());
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

        if (layanan.getPemeriksaP2Kanwil() != null) {
            if (!layanan.getPemeriksaP2Kanwil().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getPemeriksaP2Kanwil());
                Account account = accountService.findById(status.getAccountId());

                response.setPemeriksaP2Kanwil(account.getPribadi().getNama());
                response.setTanggalPemeriksaP2Kanwil(status.getTanggal());
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

        if (layanan.getKepBidangFasilitasKanwil() != null) {
            if (!layanan.getKepBidangFasilitasKanwil().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepBidangFasilitasKanwil());
                Account account = accountService.findById(status.getAccountId());

                response.setKepBidangFasilitasKanwil(account.getPribadi().getNama());
                response.setTanggalKepBidangFasilitasKanwil(status.getTanggal());
            }
        }

        if (layanan.getKepSeksiPfKanwil() != null) {
            if (!layanan.getKepSeksiPfKanwil().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSeksiPfKanwil());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSeksiPfKanwil(account.getPribadi().getNama());
                response.setTanggalKepSeksiPfKanwil(status.getTanggal());
            }
        }

        if (layanan.getPemeriksaDokumenKanwil() != null) {
            if (!layanan.getPemeriksaDokumenKanwil().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getPemeriksaDokumenKanwil());
                Account account = accountService.findById(status.getAccountId());

                response.setPemeriksaDokumenKanwil(account.getPribadi().getNama());
                response.setTanggalPemeriksaDokumenKanwil(status.getTanggal());
            }
        }

        if(layanan.getKepKantorKanwil() != null) {
            if(!layanan.getKepKantorKanwil().isEmpty()) {
                StatusLayanan statusLayanan = splitStringWithColon(layanan.getKepKantorKanwil());
                Account account = accountService.findById(statusLayanan.getAccountId());

                response.setKepKantorKanwil(account.getPribadi().getNama());
                response.setTanggalKepKantorKanwil(statusLayanan.getTanggal());
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

    private Account getRandomAccount(Role role) {
        List<Account> accounts = accountService.findAllByRole(role);

        Random rand = new Random();
        return accounts.get(rand.nextInt(accounts.size()));
    }

    private Account getRandomAccount(Role role, int lokasi) {
        List<Account> accounts = accountService.findAllByRoleAndLokasi(role, lokasi);

        Random rand = new Random();
        return accounts.get(rand.nextInt(accounts.size()));
    }

    private int sendEmail(Layanan layanan, StatusLayanan statusLayanan, int respond, int type) {
        int result = SUCCESS;

        Account account = accountService.findById(statusLayanan.getAccountId());
        String subject = "";

        if (respond == REJECTED) subject = "Penolakan Permohonan";
        else if (respond == ACCEPTED) subject = "Respon Permohonan";

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
                subject,
                type,
                account.getUsername(),
                model
        );

        layanan.setStatus(respond);

        if (layanan.getLokasi() == TANGERANG) model.put("jenis_kppbc", "A TANGERANG");
        else if (layanan.getLokasi() == MERAK) model.put("jenis_kppbc", "MERAK");
        else model.put("jenis_kppbc", "KANWIL");

        if (type == EMAIL_PENERIMAAN) {
            List<Dokumen> docs = new ArrayList<>();

            Dokumen ba = dokumenService.findByJenisDokumenAndLayanan(jenisDokumenService.getJenisDokumen(BA_PEMERIKSAAN_LOKASI), layanan);
            Dokumen suratRekomendasi = dokumenService.findByJenisDokumenAndLayanan(jenisDokumenService.getJenisDokumen(SURAT_REKOMENDASI), layanan);
            Dokumen suratPengembalianBerkas = dokumenService.findByJenisDokumenAndLayanan(jenisDokumenService.getJenisDokumen(SURAT_PENGEMBALIAN_BERKAS), layanan);

            docs.add(ba);
            docs.add(suratRekomendasi);

            if (!emailService.sendMail(request, docs)) result = FAILED;
        } else {
            if (!emailService.sendMail(request)) result = FAILED;
        }

        return result;
    }

    private boolean isKPOrTPS(Layanan layanan) {
        return layanan.getSubLayanan().getLayanan().getPenimbunan() != null
                || layanan.getSubLayanan().getLayanan().getPengelola() != null;
    }

    private boolean isTPBOrKITEPerizinanBaru(Layanan layanan) {
        if (layanan.getSubLayanan().getLayanan().getPerusahaan() != null
        || layanan.getSubLayanan().getLayanan().getFasilitas() != null) {
            return layanan.getSubLayanan().getKeterangan().equals("Perizinan Baru");
        } else return false;
    }

    private boolean isTPBOrKITEPerubahanLokasiOrPencabutan(Layanan layanan) {
        if (layanan.getSubLayanan().getLayanan().getPerusahaan() != null
                || layanan.getSubLayanan().getLayanan().getFasilitas() != null) {
            return layanan.getSubLayanan().getKeterangan().contains("lokasi");
        } else return false;
    }

    private boolean isTPBOrKITEPerubahanNonLokasiOrPencabutan(Layanan layanan) {
        if (layanan.getSubLayanan().getLayanan().getPerusahaan() != null
                || layanan.getSubLayanan().getLayanan().getFasilitas() != null) {
            if (layanan.getSubLayanan().getLayanan().getKeterangan().equals("Perubahan")) {
                return !layanan.getSubLayanan().getKeterangan().contains("lokasi");
            } else return false;
        } else return false;
    }
}
