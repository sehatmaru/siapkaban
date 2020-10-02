package com.tam.siap.services;

import com.tam.siap.models.*;
import com.tam.siap.models.request.EmailRequestDto;
import com.tam.siap.models.responses.*;
import com.tam.siap.services.master.*;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.tam.siap.utils.TamUtils.*;
import static com.tam.siap.utils.refs.JenisEmail.*;
import static com.tam.siap.utils.refs.ProgressPic.*;
import static com.tam.siap.utils.refs.JenisDokumen.*;
import static com.tam.siap.utils.refs.JenisLokasi.MERAK;
import static com.tam.siap.utils.refs.JenisLokasi.TANGERANG;
import static com.tam.siap.utils.refs.ProgressLayanan.*;
import static com.tam.siap.utils.refs.Role.*;
import static com.tam.siap.utils.refs.Status.*;
import static com.tam.siap.utils.refs.Status.REJECTED;
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

    public File getTemplate(Layanan layanan, JDokumen dokumen) {
        System.out.println("layanan + id " + layanan.getId() + " " + dokumen.getId());

        if (dokumenService.isDocumentExist(dokumen, layanan)) {
            Dokumen dok = dokumenService.findByJenisDokumenAndLayanan(dokumen, layanan);
            return new File(dok.getPath());
        } else return new File(editorService.getTemplate(layanan, dokumen));
    }

    public UploadTemplateResponse uploadTemplate(MemoryBuffer memoryBuffer, Layanan layanan, JDokumen dokumen) {
        String path = editorService.uploadFile(memoryBuffer, layanan, dokumen);

        if (path != null) {
            editorService.docxToPdf(path);

            if (!dokumenService.isDocumentExist(dokumen, layanan)) {
                Dokumen dok = new Dokumen(
                        dokumen.getKeterangan(),
                        path.replace("docx", "pdf"),
                        dokumen,
                        layanan.getPemohonon(),
                        layanan,
                        1
                );

                dokumenService.save(dok);

                return new UploadTemplateResponse(1, new File(path.replace("docx", "pdf")));
            } else {
                Dokumen dok = dokumenService.findByJenisDokumenAndLayanan(dokumen, layanan);
                dok.setPath(path.replace("docx", "pdf"));

                dokumenService.save(dok);

                return new UploadTemplateResponse(1, new File(path.replace("docx", "pdf")));
            }
        } else return new UploadTemplateResponse(2, null);
    }

    public List<DocFilter> docFilter(Role role, Layanan layanan, int status) {
        if (role.getId() == PEMERIKSA_P2) {
            List<DocFilter> result = new ArrayList<>();
            List<JDokumen> jenisDocs = jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(PEMERIKSA_P2), "" + status);

            for (JDokumen data : jenisDocs) {
                if (dokumenService.isDocumentExist(data, layanan)) {
                    Dokumen dokumen = dokumenService.findByJenisDokumenAndLayanan(data, layanan);
                    result.add(new DocFilter(data, new File(dokumen.getPath()), new File(dokumen.getPath().replace("pdf", "docx")), 1));
                } else result.add(new DocFilter(data, new File(editorService.getTemplate(layanan, data)), new File(editorService.getTemplate(layanan, data).replace("pdf", "docx")), 2));
            }

            return result;
        } else if (role.getId() == PEMERIKSA_PERBEND) {
            List<DocFilter> result = new ArrayList<>();
            List<JDokumen> jenisDocs = jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(PEMERIKSA_PERBEND), "" + status);

            for (JDokumen data : jenisDocs) {
                if (dokumenService.isDocumentExist(data, layanan)) {
                    Dokumen dokumen = dokumenService.findByJenisDokumenAndLayanan(data, layanan);
                    result.add(new DocFilter(data, new File(dokumen.getPath()), new File(dokumen.getPath().replace("pdf", "docx")), 1));
                } else result.add(new DocFilter(data, new File(editorService.getTemplate(layanan, data)), new File(editorService.getTemplate(layanan, data).replace("pdf", "docx")), 2));
            }

            return result;
        } else if (role.getId() == PEMERIKSA_PKC) {
            List<DocFilter> result = new ArrayList<>();
            List<JDokumen> jenisDocs = jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(PEMERIKSA_PKC), "" + status);

            for (JDokumen data : jenisDocs) {
                if (dokumenService.isDocumentExist(data, layanan)) {
                    if (isTPBPencabutan(layanan)) {
                        if (data.getId() == HASIL_PEMERIKSAAN_SEDERHANA
                            || data.getId() == SURAT_REKOMENDASI
                            || data.getId() == NOTA_DINAS
                            || data.getId() == SURAT_PENGEMBALIAN_BERKAS) {
                            Dokumen dokumen = dokumenService.findByJenisDokumenAndLayanan(data, layanan);
                            result.add(new DocFilter(data, new File(dokumen.getPath()), new File(dokumen.getPath().replace("pdf", "docx")), 1));
                        }
                    } else {
                        if (data.getId() == BA_PEMERIKSAAN_LOKASI
                                || data.getId() == SURAT_REKOMENDASI
                                || data.getId() == NOTA_DINAS
                                || data.getId() == SURAT_PENGEMBALIAN_BERKAS) {
                            Dokumen dokumen = dokumenService.findByJenisDokumenAndLayanan(data, layanan);
                            result.add(new DocFilter(data, new File(dokumen.getPath()), new File(dokumen.getPath().replace("pdf", "docx")), 1));
                        }
                    }
                } else  {
                    if (isTPBPencabutan(layanan)) {
                        if (data.getId() == HASIL_PEMERIKSAAN_SEDERHANA
                                || data.getId() == SURAT_REKOMENDASI
                                || data.getId() == NOTA_DINAS
                                || data.getId() == SURAT_PENGEMBALIAN_BERKAS) {
                            result.add(new DocFilter(data, new File(editorService.getTemplate(layanan, data)), new File(editorService.getTemplate(layanan, data).replace("pdf", "docx")), 2));
                        }
                    } else {
                        if (data.getId() == BA_PEMERIKSAAN_LOKASI
                                || data.getId() == SURAT_REKOMENDASI
                                || data.getId() == NOTA_DINAS
                                || data.getId() == SURAT_PENGEMBALIAN_BERKAS) {
                            result.add(new DocFilter(data, new File(editorService.getTemplate(layanan, data)), new File(editorService.getTemplate(layanan, data).replace("pdf", "docx")), 2));
                        }
                    }
                }
            }

            return result;
        } else if (role.getId() == KANWIL_PEMERIKSA_P2) {
            List<DocFilter> result = new ArrayList<>();
            List<JDokumen> jenisDocs = jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(KANWIL_PEMERIKSA_P2), "" + status);

            for (JDokumen data : jenisDocs) {
                if (dokumenService.isDocumentExist(data, layanan)) {
                    Dokumen dokumen = dokumenService.findByJenisDokumenAndLayanan(data, layanan);
                    result.add(new DocFilter(data, new File(dokumen.getPath()), new File(dokumen.getPath().replace("pdf", "docx")), 1));
                } else result.add(new DocFilter(data, new File(editorService.getTemplate(layanan, data)), new File(editorService.getTemplate(layanan, data).replace("pdf", "docx")), 2));
            }

            return result;
        } else if (role.getId() == KANWIL_PEMERIKSA_DOKUMEN) {
            List<DocFilter> result = new ArrayList<>();
            List<JDokumen> jenisDocs = jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(KANWIL_PEMERIKSA_DOKUMEN), "" + status);

            for(JDokumen data : jenisDocs) {
                if (isTPBKITEPerizinanBaru(layanan)) {
                    if (layanan.getProgress() == ON_BATCH_2_KANWIL) {
                        if (data.getId() == UNDANGAN_PEMAPARAN
                                || data.getId() == NOTA_DINAS_UNDANGAN_PEMAPARAN
                                || data.getId() == SURAT_PENOLAKAN_PEMERIKSA_DOKUMEN) {
                            if (dokumenService.isDocumentExist(data, layanan)) {
                                Dokumen dokumen = dokumenService.findByJenisDokumenAndLayanan(data, layanan);
                                result.add(new DocFilter(data, new File(dokumen.getPath()), new File(dokumen.getPath().replace("pdf", "docx")), 1));
                            } else result.add(new DocFilter(data, new File(editorService.getTemplate(layanan, data)), new File(editorService.getTemplate(layanan, data).replace("pdf", "docx")), 2));
                        }
                    } else if (layanan.getProgress() == ON_BATCH_3_KANWIL) {
                        if (data.getId() == BA_PEMAPARAN
                                || data.getId() == SKEP_PEMERIKSA_DOKUMEN) {
                            if (dokumenService.isDocumentExist(data, layanan)) {
                                Dokumen dokumen = dokumenService.findByJenisDokumenAndLayanan(data, layanan);
                                result.add(new DocFilter(data, new File(dokumen.getPath()), new File(dokumen.getPath().replace("pdf", "docx")), 1));
                            } else result.add(new DocFilter(data, new File(editorService.getTemplate(layanan, data)), new File(editorService.getTemplate(layanan, data).replace("pdf", "docx")), 2));
                        }
                    }
                } else {
                    if (data.getId() == TELAAH
                            || data.getId() == NOTA_DINAS_PEMERIKSA_DOKUMEN
                            || data.getId() == SKEP_PEMERIKSA_DOKUMEN
                            || data.getId() == SURAT_PENOLAKAN_PEMERIKSA_DOKUMEN) {
                        if (dokumenService.isDocumentExist(data, layanan)) {
                            Dokumen dokumen = dokumenService.findByJenisDokumenAndLayanan(data, layanan);
                            result.add(new DocFilter(data, new File(dokumen.getPath()), new File(dokumen.getPath().replace("pdf", "docx")), 1));
                        } else result.add(new DocFilter(data, new File(editorService.getTemplate(layanan, data)), new File(editorService.getTemplate(layanan, data).replace("pdf", "docx")), 2));
                    }
                }
            }

            return result;
        } else if (role.getId() == KANWIL_PEMERIKSA_PKC) {
            List<DocFilter> result = new ArrayList<>();
            List<JDokumen> jenisDocs = jenisDokumenService.findJenisDokumenByRoleAndStatus(roleService.getRole(KANWIL_PEMERIKSA_PKC), "" + status);

            for (JDokumen data : jenisDocs) {
                if (dokumenService.isDocumentExist(data, layanan)) {
                    Dokumen dokumen = dokumenService.findByJenisDokumenAndLayanan(data, layanan);
                    result.add(new DocFilter(data, new File(dokumen.getPath()), new File(dokumen.getPath().replace("pdf", "docx")), 1));
                } else result.add(new DocFilter(data, new File(editorService.getTemplate(layanan, data)), new File(editorService.getTemplate(layanan, data).replace("pdf", "docx")), 2));
            }

            return result;
        } else if (role.getId() == KEPALA_SUB_SEKSI_P2 || role.getId() == KEPALA_SEKSI_P2) {
            List<DocFilter> result = new ArrayList<>();
            List<Dokumen> docs = dokumenService.findByLayanan(layanan);

            for (Dokumen data : docs) {
                if (data.getJenisDokumen().getRole() != null) {
                    if (data.getJenisDokumen().getRole().getId() == PEMERIKSA_P2) {
                        if (data.getJenisDokumen().getId() == NOTA_DINAS_PROFIL) result.add(new DocFilter(data.getJenisDokumen(), new File(data.getPath()), new File(data.getPath().replace("pdf", "docx")), 1));
                    }
                }
            }

            return result;
        } else if (role.getId() == KEPALA_SUB_SEKSI_PERBEND || role.getId() == KEPALA_SEKSI_PERBEND) {
            List<DocFilter> result = new ArrayList<>();
            List<Dokumen> docs = dokumenService.findByLayanan(layanan);

            for (Dokumen data : docs) {
                if (data.getJenisDokumen().getRole() != null) {
                    if (data.getJenisDokumen().getRole().getId() == PEMERIKSA_PERBEND) {
                        if (data.getJenisDokumen().getId() == NOTA_DINAS_TAGIHAN) result.add(new DocFilter(data.getJenisDokumen(), new File(data.getPath()), new File(data.getPath().replace("pdf", "docx")), 1));
                    }
                }
            }

            return result;
        } else if (role.getId() == KEPALA_SUB_SEKSI_PKC || role.getId() == KEPALA_SEKSI_PKC || role.getId() == KEPALA_KANTOR) {
            List<DocFilter> result = new ArrayList<>();
            List<Dokumen> docs = dokumenService.findByLayanan(layanan);

            for (Dokumen data : docs) {
                if (data.getJenisDokumen().getId() == HASIL_PEMERIKSAAN_SEDERHANA
                        || data.getJenisDokumen().getId() == BA_PEMERIKSAAN_LOKASI
                        || data.getJenisDokumen().getId() == NOTA_DINAS
                        || data.getJenisDokumen().getId() == SURAT_REKOMENDASI
                        || data.getJenisDokumen().getId() == SURAT_PENGEMBALIAN_BERKAS) result.add(new DocFilter(data.getJenisDokumen(), new File(data.getPath()), new File(data.getPath().replace("pdf", "docx")), 1));
            }

            return result;
        } else if (role.getId() == KANWIL_KEPALA_SEKSI_INTELIJEN || role.getId() == KANWIL_KEPALA_BIDANG_P2) {
            List<DocFilter> result = new ArrayList<>();
            List<Dokumen> docs = dokumenService.findByLayanan(layanan);

            for (Dokumen data : docs) {
                if (data.getJenisDokumen().getRole() != null) {
                    if (data.getJenisDokumen().getRole().getId() == KANWIL_PEMERIKSA_P2) {
                        if (data.getJenisDokumen().getId() == NOTA_DINAS_PROFIL_PEMERIKSA_P2) result.add(new DocFilter(data.getJenisDokumen(), new File(data.getPath()), new File(data.getPath().replace("pdf", "docx")), 1));
                    }
                }
            }

            return result;
        } else if (role.getId() == KANWIL_KEPALA_BIDANG_FASILITAS || role.getId() == KANWIL_KEPALA_SEKSI_PF || role.getId() == KANWIL_KEPALA_KANTOR) {
            List<DocFilter> result = new ArrayList<>();
            List<Dokumen> docs = dokumenService.findByLayanan(layanan);

            for (Dokumen data : docs) {
                if (isTPBKITEPerizinanBaru(layanan)) {
                    if (layanan.getProgress() == ON_BATCH_2_KANWIL) {
                        if (data.getJenisDokumen().getId() == UNDANGAN_PEMAPARAN
                                || data.getJenisDokumen().getId() == NOTA_DINAS_UNDANGAN_PEMAPARAN
                                || data.getJenisDokumen().getId() == SURAT_PENOLAKAN_PEMERIKSA_DOKUMEN) {
                            result.add(new DocFilter(data.getJenisDokumen(), new File(data.getPath()), new File(data.getPath().replace("pdf", "docx")), 1));
                        }
                    } else if (layanan.getProgress() == ON_BATCH_3_KANWIL) {
                        if (data.getJenisDokumen().getId() == BA_PEMAPARAN
                                || data.getJenisDokumen().getId() == SKEP_PEMERIKSA_DOKUMEN) {
                            result.add(new DocFilter(data.getJenisDokumen(), new File(data.getPath()), new File(data.getPath().replace("pdf", "docx")), 1));
                        }
                    }
                } else {
                    if (data.getJenisDokumen().getId() == TELAAH
                            || data.getJenisDokumen().getId() == NOTA_DINAS_PEMERIKSA_DOKUMEN
                            || data.getJenisDokumen().getId() == SKEP_PEMERIKSA_DOKUMEN
                            || data.getJenisDokumen().getId() == SURAT_PENOLAKAN_PEMERIKSA_DOKUMEN
                            || data.getJenisDokumen().getId() == NOTA_DINAS_PEMERIKSA_PKC
                            || data.getJenisDokumen().getId() == SKEP_PEMERIKSA_PKC
                            || data.getJenisDokumen().getId() == SURAT_PENOLAKAN_PEMERIKSA_PKC) result.add(new DocFilter(data.getJenisDokumen(), new File(data.getPath()), new File(data.getPath().replace("pdf", "docx")), 1));
                }
            }

            return result;
        } else if (role.getId() == KANWIL_KEPALA_BIDANG_PKC || role.getId() == KANWIL_KEPALA_SEKSI_PKC){
            List<DocFilter> result = new ArrayList<>();
            List<Dokumen> docs = dokumenService.findByLayanan(layanan);

            for (Dokumen data : docs) {
                if (data.getJenisDokumen().getRole() != null) {
                    if (data.getJenisDokumen().getRole().getId() == KANWIL_PEMERIKSA_PKC) {
                        if (data.getJenisDokumen().getId() == NOTA_DINAS_PEMERIKSA_PKC
                                || data.getJenisDokumen().getId() == SKEP_PEMERIKSA_PKC
                                || data.getJenisDokumen().getId() == SURAT_PENOLAKAN_PEMERIKSA_PKC) result.add(new DocFilter(data.getJenisDokumen(), new File(data.getPath()), new File(data.getPath().replace("pdf", "docx")), 1));
                    }
                }
            }

            return result;
        } else return new ArrayList<>();

    }

    public int submit(List<MemoryBuffer> memoryBuffer, Layanan layanan, List<Dokumen> dokumen) {
        int result = FAILED;

        layanan.setNomor(getNomor());
        layanan.setStatus(ON_PROGRESS);

        if (isTPBPerubahanNonLokasiKITEPerubahanOrPencabutan(layanan)) layanan.setProgress(ON_BATCH_1_KANWIL);
        else layanan.setProgress(ON_BATCH_1_KPPBC);

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

        switch (account.getRole().getId()) {
            case PENERIMA_DOKUMEN :
                layanan.setPenerima(
                        fetchStringWithColon(
                                statusLayanan.getAccountId(),
                                statusLayanan.getTanggal(),
                                String.valueOf(DONE),
                                statusLayanan.getStatus(),
                                statusLayanan.getCatatan()
                        )
                );

                if (statusLayanan.getStatus().equals(Integer.toString(REJECTED))) {
                    layanan.setProgress(COMPLETE);
                    layanan.setStatus(REJECTED);
                    result = sendEmail(layanan, statusLayanan, REJECTED, EMAIL_PENOLAKAN);
                } else {
                    layanan.setKepKantor(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            "",
                            ""
                    ));
                }

                break;
            case PEMERIKSA_P2 :
                if (checkDoc(PEMERIKSA_P2, Integer.parseInt(statusLayanan.getStatus()), layanan)) {
                    layanan.setPemeriksaP2(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );
                } else result = DOC_NOT_FOUND;

                break;
            case PEMERIKSA_PERBEND :
                if (checkDoc(PEMERIKSA_PERBEND, Integer.parseInt(statusLayanan.getStatus()), layanan)) {
                    layanan.setPemeriksaPerbend(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );
                } else result = DOC_NOT_FOUND;

                break;
            case PEMERIKSA_PKC :
                if (checkDoc(PEMERIKSA_PKC, Integer.parseInt(statusLayanan.getStatus()), layanan)) {
                    if (statusLayanan.getStatus().equals("" + REJECTED)) layanan.setStatus(REJECTED);

                    layanan.setPemeriksaPkc(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );
                } else result = DOC_NOT_FOUND;

                break;
            case KEPALA_SEKSI_P2 :
                if (layanan.getProgress() == ON_BATCH_1_KPPBC) {
                    layanan.setKepSeksiP2(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if (layanan.getKepSubSeksiP2() == null) {
                        layanan.setKepSubSeksiP2(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KPPBC) {
                    layanan.setKepSeksiP2(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;
            case KEPALA_SEKSI_PERBEND :
                if (layanan.getProgress() == ON_BATCH_1_KPPBC) {
                    layanan.setKepSeksiPerbend(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if (layanan.getKepSubSeksiPerbend() == null) {
                        layanan.setKepSubSeksiPerbend(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KPPBC) {
                    layanan.setKepSeksiPerbend(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;
            case KEPALA_SEKSI_PKC :
                if (layanan.getProgress() == ON_BATCH_1_KPPBC) {
                    if (statusLayanan.getStatus().equals("" + REJECTED)) layanan.setStatus(REJECTED);

                    layanan.setKepSeksiPkc(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if(isTPBPerubahanLokasi(layanan) || isTPBPencabutan(layanan)) {
                        StatusLayanan kepSeksiP2 = splitStringWithColon(layanan.getKepSeksiP2());
                        StatusLayanan kepSeksiPerbend = splitStringWithColon(layanan.getKepSeksiPerbend());

                        if (kepSeksiP2.getTanggal() == null) {
                            layanan.setKepSeksiP2(fetchStringWithColon(
                                    kepSeksiP2.getAccountId(),
                                    dateFormat.format(new Date()),
                                    String.valueOf(WAITING),
                                    String.valueOf(ACCEPTED),
                                    ""
                            ));

                            Account kepSubSeksiP2 = getRandomAccount(roleService.getRole(KEPALA_SUB_SEKSI_P2), layanan.getLokasi());
                            layanan.setKepSubSeksiP2(fetchStringWithColon(
                                    Integer.toString(kepSubSeksiP2.getId()),
                                    "",
                                    "",
                                    "",
                                    ""
                            ));
                        }

                        if (kepSeksiPerbend.getTanggal() == null) {
                            layanan.setKepSeksiPerbend(fetchStringWithColon(
                                    kepSeksiPerbend.getAccountId(),
                                    dateFormat.format(new Date()),
                                    String.valueOf(WAITING),
                                    String.valueOf(ACCEPTED),
                                    ""
                            ));

                            Account kepSubSeksiPerbend = getRandomAccount(roleService.getRole(KEPALA_SUB_SEKSI_PERBEND), layanan.getLokasi());
                            layanan.setKepSubSeksiPerbend(fetchStringWithColon(
                                    Integer.toString(kepSubSeksiPerbend.getId()),
                                    "",
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
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KPPBC) layanan.setKepSeksiPkc(
                        fetchStringWithColon(
                                statusLayanan.getAccountId(),
                                statusLayanan.getTanggal(),
                                String.valueOf(DONE),
                                statusLayanan.getStatus(),
                                statusLayanan.getCatatan()
                        )
                );

                break;
            case KEPALA_SUB_SEKSI_P2 :
                if (layanan.getProgress() == ON_BATCH_1_KPPBC) {
                    layanan.setKepSubSeksiP2(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(ON_PROGRESS),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if (layanan.getPemeriksaP2() == null) {
                        layanan.setPemeriksaP2(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KPPBC) {
                    layanan.setKepSubSeksiP2(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;
            case KEPALA_SUB_SEKSI_PERBEND :
                if (layanan.getProgress() == ON_BATCH_1_KPPBC) {
                    layanan.setKepSubSeksiPerbend(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if (layanan.getPemeriksaPerbend() == null) {
                        layanan.setPemeriksaPerbend(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KPPBC) {
                    layanan.setKepSubSeksiPerbend(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;
            case KEPALA_SUB_SEKSI_PKC :
                if (layanan.getProgress() == ON_BATCH_1_KPPBC) {
                    if (statusLayanan.getStatus().equals("" + REJECTED)) layanan.setStatus(REJECTED);

                    layanan.setProgress(ON_BATCH_2_KPPBC);
                    layanan.setKepSubSeksiPkc(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if(isTPBPerubahanLokasi(layanan)
                        || isTPBPencabutan(layanan)) {
                        StatusLayanan kepSubSeksiP2 = splitStringWithColon(layanan.getKepSubSeksiP2());
                        StatusLayanan kepSubSeksiPerbend = splitStringWithColon(layanan.getKepSubSeksiPerbend());

                        if (kepSubSeksiP2.getTanggal() == null) {
                            layanan.setKepSubSeksiP2(fetchStringWithColon(
                                    kepSubSeksiP2.getAccountId(),
                                    dateFormat.format(new Date()),
                                    String.valueOf(WAITING),
                                    String.valueOf(ACCEPTED),
                                    ""
                            ));

                            Account pemeriksaP2 = getRandomAccount(roleService.getRole(PEMERIKSA_P2), layanan.getLokasi());
                            layanan.setPemeriksaP2(fetchStringWithColon(
                                    Integer.toString(pemeriksaP2.getId()),
                                    "",
                                    "",
                                    "",
                                    ""
                            ));
                        }

                        if (kepSubSeksiPerbend.getTanggal() == null) {
                            layanan.setKepSubSeksiPerbend(fetchStringWithColon(
                                    kepSubSeksiPerbend.getAccountId(),
                                    dateFormat.format(new Date()),
                                    String.valueOf(WAITING),
                                    String.valueOf(ACCEPTED),
                                    ""
                            ));

                            Account pemeriksaPerbend = getRandomAccount(roleService.getRole(PEMERIKSA_PERBEND), layanan.getLokasi());
                            layanan.setPemeriksaPerbend(fetchStringWithColon(
                                    Integer.toString(pemeriksaPerbend.getId()),
                                    "",
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
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KPPBC) layanan.setKepSubSeksiPkc(
                        fetchStringWithColon(
                                statusLayanan.getAccountId(),
                                statusLayanan.getTanggal(),
                                String.valueOf(DONE),
                                statusLayanan.getStatus(),
                                statusLayanan.getCatatan()
                        )
                );

                break;
            case KEPALA_KANTOR :
                if (layanan.getProgress() == ON_BATCH_1_KPPBC) {
                    if (statusLayanan.getStatus().equals("" + REJECTED)) layanan.setStatus(REJECTED);

                    layanan.setKepKantor(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if (isTPBPerubahanLokasi(layanan)
                        || isTPBPencabutan(layanan)) {
                        layanan.setKepSeksiP2(fetchStringWithColon(
                                Integer.toString(accountService.findByRoleAndLokasi(roleService.getRole(KEPALA_SEKSI_P2), account.getLokasi()).getId()),
                                "",
                                "",
                                "",
                                ""
                        ));

                        layanan.setKepSeksiPerbend(fetchStringWithColon(
                                Integer.toString(accountService.findByRoleAndLokasi(roleService.getRole(KEPALA_SEKSI_PERBEND), account.getLokasi()).getId()),
                                "",
                                "",
                                "",
                                ""
                        ));
                    }

                    layanan.setKepSeksiPkc(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            "",
                            ""
                    ));
                } else if (layanan.getProgress() == ON_BATCH_2_KPPBC) {
                    layanan.setKepKantor(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if (statusLayanan.getStatus().equals(String.valueOf(ACCEPTED))) {
                        layanan.setProgress(ON_BATCH_1_KANWIL);

                        result = sendEmail(layanan, statusLayanan, ACCEPTED, EMAIL_PENERIMAAN_KPPBC);
                    } else {
                        layanan.setProgress(COMPLETE);
                        layanan.setStatus(REJECTED);

                        result = sendEmail(layanan, statusLayanan, REJECTED, EMAIL_PENOLAKAN);
                    }
                }

                break;
            case KANWIL_KEPALA_KANTOR :
                if (layanan.getProgress() == ON_BATCH_1_KANWIL) {
                    if (statusLayanan.getStatus().equals("" + REJECTED)) layanan.setStatus(REJECTED);

                    layanan.setKepKantorKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if (isTPBKITEPerizinanBaru(layanan)) {
                        layanan.setKepBidangP2Kanwil(fetchStringWithColon(
                                Integer.toString(accountService.findByRole(roleService.getRole(KANWIL_KEPALA_BIDANG_P2)).getId()),
                                "",
                                "",
                                "",
                                ""
                        ));
                    }

                    if (isKPOrTPS(layanan)) {
                        layanan.setKepBidPkcKanwil(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                "",
                                ""
                        ));
                    } else {
                        layanan.setKepBidangFasilitasKanwil(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KANWIL) {
                    if (statusLayanan.getStatus().equals(String.valueOf(ACCEPTED))) {
                        if (isTPBKITEPerizinanBaru(layanan)) {
                            layanan.setProgress(ON_BATCH_3_KANWIL);

                            layanan.setKepKantorKanwil(
                                    fetchStringWithColon(
                                            statusLayanan.getAccountId(),
                                            statusLayanan.getTanggal(),
                                            String.valueOf(HOLD),
                                            statusLayanan.getStatus(),
                                            statusLayanan.getCatatan()
                                    )
                            );

                            result = sendEmail(layanan, statusLayanan, ACCEPTED, EMAIL_UNDANGAN);
                        } else {
                            layanan.setStatus(ACCEPTED);
                            layanan.setProgress(COMPLETE);

                            layanan.setKepKantorKanwil(
                                    fetchStringWithColon(
                                            statusLayanan.getAccountId(),
                                            statusLayanan.getTanggal(),
                                            String.valueOf(DONE),
                                            statusLayanan.getStatus(),
                                            statusLayanan.getCatatan()
                                    )
                            );

                            result = sendEmail(layanan, statusLayanan, ACCEPTED, EMAIL_PENERIMAAN_KANWIL);
                        }
                    } else {
                        layanan.setProgress(COMPLETE);
                        layanan.setStatus(REJECTED);

                        layanan.setKepKantorKanwil(
                                fetchStringWithColon(
                                        statusLayanan.getAccountId(),
                                        statusLayanan.getTanggal(),
                                        String.valueOf(DONE),
                                        statusLayanan.getStatus(),
                                        statusLayanan.getCatatan()
                                )
                        );

                        result = sendEmail(layanan, statusLayanan, REJECTED, EMAIL_PENERIMAAN_KANWIL);
                    }
                } else if (layanan.getProgress() == ON_BATCH_3_KANWIL) {
                    layanan.setStatus(Integer.parseInt(statusLayanan.getStatus()));
                    layanan.setProgress(COMPLETE);

                    layanan.setKepKantorKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if (statusLayanan.getStatus().equals(ACCEPTED + "")) {
                        result = sendEmail(layanan, statusLayanan, ACCEPTED, EMAIL_PENERIMAAN_KANWIL);
                    } else {
                        result = sendEmail(layanan, statusLayanan, REJECTED, EMAIL_PENOLAKAN);
                    }

                }

                break;
            case KANWIL_KEPALA_BIDANG_FASILITAS:
                if (layanan.getProgress() == ON_BATCH_1_KANWIL) {
                    if (statusLayanan.getStatus().equals("" + REJECTED)) layanan.setStatus(REJECTED);

                    layanan.setKepBidangFasilitasKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if (isTPBKITEPerizinanBaru(layanan)) {
                        StatusLayanan kepBidangP2 = splitStringWithColon(layanan.getKepBidangP2Kanwil());

                        if (kepBidangP2.getTanggal() == null) {
                            layanan.setKepBidangP2Kanwil(fetchStringWithColon(
                                    kepBidangP2.getAccountId(),
                                    dateFormat.format(new Date()),
                                    String.valueOf(WAITING),
                                    String.valueOf(ACCEPTED),
                                    ""
                            ));

                            Account kepSeksiIntelijen = getRandomAccount(roleService.getRole(KANWIL_KEPALA_SEKSI_INTELIJEN));
                            layanan.setKepSeksiIntelijenKanwil(fetchStringWithColon(
                                    Integer.toString(kepSeksiIntelijen.getId()),
                                    "",
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
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KANWIL) {
                    if (isTPBKITEPerizinanBaru(layanan)) {
                        layanan.setKepBidangFasilitasKanwil(
                                fetchStringWithColon(
                                        statusLayanan.getAccountId(),
                                        statusLayanan.getTanggal(),
                                        String.valueOf(HOLD),
                                        statusLayanan.getStatus(),
                                        statusLayanan.getCatatan()
                                )
                        );
                    } else {
                        layanan.setKepBidangFasilitasKanwil(
                                fetchStringWithColon(
                                        statusLayanan.getAccountId(),
                                        statusLayanan.getTanggal(),
                                        String.valueOf(DONE),
                                        statusLayanan.getStatus(),
                                        statusLayanan.getCatatan()
                                )
                        );
                    }
                } else if (layanan.getProgress() == ON_BATCH_3_KANWIL) {
                    layanan.setKepBidangFasilitasKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;
            case KANWIL_KEPALA_SEKSI_PF:
                if (layanan.getProgress() == ON_BATCH_1_KANWIL) {
                    if (statusLayanan.getStatus().equals("" + REJECTED)) layanan.setStatus(REJECTED);

                    layanan.setProgress(ON_BATCH_2_KANWIL);
                    layanan.setKepSeksiPfKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if (isTPBKITEPerizinanBaru(layanan)) {
                        StatusLayanan kepSeksiIntelijen = splitStringWithColon(layanan.getKepSeksiIntelijenKanwil());

                        if (kepSeksiIntelijen.getTanggal() == null) {
                            layanan.setKepSeksiIntelijenKanwil(fetchStringWithColon(
                                    kepSeksiIntelijen.getAccountId(),
                                    dateFormat.format(new Date()),
                                    String.valueOf(WAITING),
                                    String.valueOf(ACCEPTED),
                                    ""
                            ));

                            Account pemeriksaP2 = getRandomAccount(roleService.getRole(KANWIL_PEMERIKSA_P2));
                            layanan.setPemeriksaP2Kanwil(fetchStringWithColon(
                                    Integer.toString(pemeriksaP2.getId()),
                                    "",
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
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KANWIL) {
                    if (isTPBKITEPerizinanBaru(layanan)) {
                        layanan.setKepSeksiPfKanwil(
                                fetchStringWithColon(
                                        statusLayanan.getAccountId(),
                                        statusLayanan.getTanggal(),
                                        String.valueOf(HOLD),
                                        statusLayanan.getStatus(),
                                        statusLayanan.getCatatan()
                                )
                        );
                    } else {
                        layanan.setKepSeksiPfKanwil(
                                fetchStringWithColon(
                                        statusLayanan.getAccountId(),
                                        statusLayanan.getTanggal(),
                                        String.valueOf(DONE),
                                        statusLayanan.getStatus(),
                                        statusLayanan.getCatatan()
                                )
                        );
                    }
                } else if (layanan.getProgress() == ON_BATCH_3_KANWIL) {
                    layanan.setKepSeksiPfKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;
            case KANWIL_PEMERIKSA_DOKUMEN:
                if (checkDoc(KANWIL_PEMERIKSA_DOKUMEN, Integer.parseInt(statusLayanan.getStatus()), layanan)) {
                    if (layanan.getProgress() == ON_BATCH_2_KANWIL) {
                        if (isTPBKITEPerizinanBaru(layanan)) {
                            layanan.setPemeriksaDokumenKanwil(
                                    fetchStringWithColon(
                                            statusLayanan.getAccountId(),
                                            statusLayanan.getTanggal(),
                                            String.valueOf(HOLD),
                                            statusLayanan.getStatus(),
                                            statusLayanan.getCatatan()
                                    )
                            );
                        } else {
                            layanan.setPemeriksaDokumenKanwil(
                                    fetchStringWithColon(
                                            statusLayanan.getAccountId(),
                                            statusLayanan.getTanggal(),
                                            String.valueOf(DONE),
                                            statusLayanan.getStatus(),
                                            statusLayanan.getCatatan()
                                    )
                            );
                        }
                    } else if (layanan.getProgress() == ON_BATCH_3_KANWIL) {
                        layanan.setPemeriksaDokumenKanwil(
                                fetchStringWithColon(
                                        statusLayanan.getAccountId(),
                                        statusLayanan.getTanggal(),
                                        String.valueOf(DONE),
                                        statusLayanan.getStatus(),
                                        statusLayanan.getCatatan()
                                )
                        );
                    }
                } else result = DOC_NOT_FOUND;

                break;

            case KANWIL_PENERIMA_DOKUMEN :
                layanan.setPenerimaKanwil(
                        fetchStringWithColon(
                                statusLayanan.getAccountId(),
                                statusLayanan.getTanggal(),
                                String.valueOf(DONE),
                                statusLayanan.getStatus(),
                                statusLayanan.getCatatan()
                        )
                );

                if (statusLayanan.getStatus().equals(Integer.toString(REJECTED))) {
                    layanan.setProgress(COMPLETE);
                    layanan.setStatus(REJECTED);

                    result = sendEmail(layanan, statusLayanan, REJECTED, EMAIL_PENOLAKAN);
                } else {
                    layanan.setKepKantorKanwil(fetchStringWithColon(
                            Integer.toString(statusLayanan.getNextPic().getId()),
                            "",
                            "",
                            "",
                            ""
                    ));
                }

                break;

            case KANWIL_KEPALA_BIDANG_P2 :
                if (layanan.getProgress() == ON_BATCH_1_KANWIL) {
                    layanan.setKepBidangP2Kanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if (layanan.getKepSeksiIntelijenKanwil() == null) {
                        layanan.setKepSeksiIntelijenKanwil(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KANWIL) {
                    layanan.setKepBidangP2Kanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;

            case KANWIL_KEPALA_SEKSI_INTELIJEN :
                if (layanan.getProgress() == ON_BATCH_1_KANWIL) {
                    layanan.setKepSeksiIntelijenKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if (layanan.getPemeriksaP2Kanwil() == null) {
                        layanan.setPemeriksaP2Kanwil(fetchStringWithColon(
                                Integer.toString(statusLayanan.getNextPic().getId()),
                                "",
                                "",
                                "",
                                ""
                        ));
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KANWIL) {
                    layanan.setKepSeksiIntelijenKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;

            case KANWIL_KEPALA_BIDANG_PKC :
                if (layanan.getProgress() == ON_BATCH_1_KANWIL) {
                    if (statusLayanan.getStatus().equals("" + REJECTED)) layanan.setStatus(REJECTED);

                    layanan.setKepBidPkcKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if(isKPOrTPS(layanan)) {
                        if (layanan.getKepSeksiPkcKanwil() == null) {
                            layanan.setKepSeksiPkcKanwil(fetchStringWithColon(
                                    Integer.toString(statusLayanan.getNextPic().getId()),
                                    "",
                                    "",
                                    "",
                                    ""
                            ));
                        }
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KANWIL) {
                    layanan.setKepBidPkcKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;

            case KANWIL_KEPALA_SEKSI_PKC :
                if (layanan.getProgress() == ON_BATCH_1_KANWIL) {
                    if (statusLayanan.getStatus().equals("" + REJECTED)) layanan.setStatus(REJECTED);
                    layanan.setProgress(ON_BATCH_2_KANWIL);

                    layanan.setKepSeksiPkcKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(WAITING),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );

                    if(isKPOrTPS(layanan)) {
                        if (layanan.getPemeriksaPkcKanwil() == null) {
                            layanan.setPemeriksaPkcKanwil(fetchStringWithColon(
                                    Integer.toString(statusLayanan.getNextPic().getId()),
                                    "",
                                    "",
                                    "",
                                    ""
                            ));
                        }
                    }
                } else if (layanan.getProgress() == ON_BATCH_2_KANWIL) {
                    layanan.setKepSeksiPkcKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    statusLayanan.getStatus(),
                                    statusLayanan.getCatatan()
                            )
                    );
                }

                break;

            case KANWIL_PEMERIKSA_P2 :
                if (checkDoc(KANWIL_PEMERIKSA_P2, Integer.parseInt(statusLayanan.getStatus()), layanan)) {
                    layanan.setPemeriksaP2Kanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                } else result = DOC_NOT_FOUND;

                break;

            case KANWIL_PEMERIKSA_PKC :
                if (checkDoc(KANWIL_PEMERIKSA_PKC, Integer.parseInt(statusLayanan.getStatus()), layanan)) {
                    layanan.setPemeriksaPkcKanwil(
                            fetchStringWithColon(
                                    statusLayanan.getAccountId(),
                                    statusLayanan.getTanggal(),
                                    String.valueOf(DONE),
                                    String.valueOf(ACCEPTED),
                                    statusLayanan.getCatatan()
                            )
                    );
                } else result = DOC_NOT_FOUND;

                break;

            default: result = FAILED;
        }

        layananService.save(layanan);

        System.out.println("hasil = " + result);

        return result;
    }

    public List<ViewDokumenResponse> viewDocs(Layanan layanan, Account account) {
        List<ViewDokumenResponse> result = new ArrayList<>();
        List<Dokumen> docs = dokumenService.findByLayanan(layanan);

        for (Dokumen doc : docs) {
            if (doc.getJenisDokumen().getSubLayanan() != null
                && doc.getJenisDokumen().getSubLayanan().getId() == 44) {
                if (layanan.getProgress() == ON_BATCH_1_KANWIL
                        || layanan.getProgress() == ON_BATCH_2_KANWIL
                        || layanan.getProgress() == ON_BATCH_3_KANWIL) {
                    if (account.getRole().getId() == KEPALA_KANTOR
                            || account.getRole().getId() == KEPALA_SEKSI_PKC
                            || account.getRole().getId() == KEPALA_SUB_SEKSI_PKC
                            || account.getRole().getId() == PEMERIKSA_PKC) {
                        if (doc.getJenisDokumen().getId() == NOTA_DINAS_PROFIL
                                || doc.getJenisDokumen().getId() == NOTA_DINAS_TAGIHAN) result.add(new ViewDokumenResponse(doc, new File(doc.getPath().replace("docx", "pdf"))));
                    } else if (account.getRole().getId() == KANWIL_KEPALA_KANTOR
                            || account.getRole().getId() == KANWIL_KEPALA_BIDANG_FASILITAS
                            || account.getRole().getId() == KANWIL_KEPALA_SEKSI_PF
                            || account.getRole().getId() == KANWIL_PEMERIKSA_DOKUMEN) {
                        if (doc.getJenisDokumen().getId() == BA_PEMERIKSAAN_LOKASI
                                || doc.getJenisDokumen().getId() == HASIL_PEMERIKSAAN_SEDERHANA
                                || doc.getJenisDokumen().getId() == SURAT_REKOMENDASI
                                || doc.getJenisDokumen().getId() == NOTA_DINAS_PROFIL_PEMERIKSA_P2) result.add(new ViewDokumenResponse(doc, new File(doc.getPath().replace("docx", "pdf"))));
                    } else if (account.getRole().getId() == KANWIL_PENERIMA_DOKUMEN
                            || account.getRole().getId() == KANWIL_PEMERIKSA_P2
                            || account.getRole().getId() == KANWIL_KEPALA_BIDANG_P2
                            || account.getRole().getId() == KANWIL_KEPALA_SEKSI_INTELIJEN) {
                        if (doc.getJenisDokumen().getId() == BA_PEMERIKSAAN_LOKASI
                                || doc.getJenisDokumen().getId() == HASIL_PEMERIKSAAN_SEDERHANA
                                || doc.getJenisDokumen().getId() == SURAT_REKOMENDASI) result.add(new ViewDokumenResponse(doc, new File(doc.getPath().replace("docx", "pdf"))));
                    }
                }
            } else result.add(new ViewDokumenResponse(doc, new File(doc.getPath())));
        }

        return result;
    }

    public List<PemohonLayananResponse> viewStatusLayanan(Account account) {
        List<PemohonLayananResponse> result = new ArrayList<>();

        if (account.getRole().getId() == PEMOHON) {
            List<Layanan> layanans = layananService.findLayananByPemohon(account);

            for (Layanan data : layanans) {
                result.add(setDataLayananToResponse(data));
            }
        } else if (account.getRole().getId() == ADMIN) {
            List<Layanan> layanans = layananService.getAllLayanan();

            for (Layanan data : layanans) {
                result.add(setDataLayananToResponse(data));
            }
        }

        System.out.println("status = " + result.toString());

        return result;
    }

    private PemohonLayananResponse setDataLayananToResponse(Layanan layanan) {
        PemohonLayananResponse response = new PemohonLayananResponse();
        response.setId(Integer.toString(layanan.getId()));
        response.setNomor(layanan.getNomor());
        response.setTanggalRequest(layanan.getTanggal().toString());
        response.setNamaPerusahaan(layanan.getPemohonon().getPerusahaan().getNama());
        response.setJenisPerusahaan(layanan.getPemohonon().getPerusahaan().getJenis().getKeterangan());
        response.setLayanan(layanan.getSubLayanan().getKeterangan());
        response.setDataLayanan(layanan);

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

        if (layanan.getKepKantor() != null) {
            if (!layanan.getKepKantor().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepKantor());
                Account account = accountService.findById(status.getAccountId());

                response.setKepKantor(account.getPribadi().getNama());
                response.setTanggalKepKantor(status.getTanggal());
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

        if (layanan.getKepSubSeksiPkc() != null) {
            if (!layanan.getKepSubSeksiPkc().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSubSeksiPkc());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSubSeksiPkc(account.getPribadi().getNama());
                response.setTanggalKepSubSeksiPkc(status.getTanggal());
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

        if (layanan.getKepSeksiP2() != null) {
            if (!layanan.getKepSeksiP2().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSeksiP2());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSeksiP2(account.getPribadi().getNama());
                response.setTanggalKepSeksiP2(status.getTanggal());
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

        if (layanan.getKepSeksiPerbend() != null) {
            if (!layanan.getKepSeksiPerbend().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSeksiPerbend());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSeksiPerbend(account.getPribadi().getNama());
                response.setTanggalKepSeksiPerbend(status.getTanggal());
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

        if (layanan.getPemeriksaPerbend() != null) {
            if (!layanan.getPemeriksaPerbend().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getPemeriksaPerbend());
                Account account = accountService.findById(status.getAccountId());

                response.setPemeriksaPerbend(account.getPribadi().getNama());
                response.setTanggalPemeriksaPerbend(status.getTanggal());
            }
        }

        if (layanan.getKepKantorKanwil() != null) {
            if (!layanan.getKepKantorKanwil().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepKantorKanwil());
                Account account = accountService.findById(status.getAccountId());

                response.setKepKantorKanwil(account.getPribadi().getNama());
                response.setTanggalKepKantorKanwil(status.getTanggal());
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

        if (layanan.getKepBidPkcKanwil() != null) {
            if (!layanan.getKepBidPkcKanwil().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepBidPkcKanwil());
                Account account = accountService.findById(status.getAccountId());

                response.setKepBidPkcKanwil(account.getPribadi().getNama());
                response.setTanggalKepBidPkcKanwil(status.getTanggal());
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

        if (layanan.getKepSeksiPkcKanwil() != null) {
            if (!layanan.getKepSeksiPkcKanwil().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSeksiPkcKanwil());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSeksiPkcKanwil(account.getPribadi().getNama());
                response.setTanggalKepSeksiPkcKanwil(status.getTanggal());
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

        if (layanan.getPemeriksaPkcKanwil() != null) {
            if (!layanan.getPemeriksaPkcKanwil().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getPemeriksaPkcKanwil());
                Account account = accountService.findById(status.getAccountId());

                response.setPemeriksaPkcKanwil(account.getPribadi().getNama());
                response.setTanggalPemeriksaPkcKanwil(status.getTanggal());
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

        if (layanan.getKepSeksiIntelijenKanwil() != null) {
            if (!layanan.getKepSeksiIntelijenKanwil().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getKepSeksiIntelijenKanwil());
                Account account = accountService.findById(status.getAccountId());

                response.setKepSeksiIntelijenKanwil(account.getPribadi().getNama());
                response.setTanggalKepSeksiIntelijenKanwil(status.getTanggal());
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

        if (layanan.getPemeriksaP2() != null) {
            if (!layanan.getPemeriksaP2().isEmpty()) {
                StatusLayanan status = splitStringWithColon(layanan.getPemeriksaP2());
                Account account = accountService.findById(status.getAccountId());

                response.setPemeriksaP2(account.getPribadi().getNama());
                response.setTanggalPemeriksaP2(status.getTanggal());
            }
        }

        return response;
    }

    public List<LayananResponse> viewPerizinanOnline(Account account, Role role) {
        List<LayananResponse> responses = new ArrayList<>();

        switch (account.getRole().getId()) {
            case KEPALA_KANTOR:
                List<Layanan> kepKantor = layananService.findLayananByKepKantorIsNotNull(account.getLokasi());

                for (Layanan data : kepKantor) {
                    if (data.getProgress() == ON_BATCH_2_KPPBC) {
                        if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepKantor()).getAccountId())) {
                            if (splitStringWithColon(data.getKepSeksiPkc()).getProgress() != null && splitStringWithColon(data.getKepSeksiPkc()).getProgress().equals("" + DONE)) {
                                if (splitStringWithColon(data.getKepKantor()).getProgress() != null && !splitStringWithColon(data.getKepKantor()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        }
                    } else {
                        if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepKantor()).getAccountId())) {
                            if (splitStringWithColon(data.getKepKantor()).getProgress() == null) {
                                responses.add(setDataLayananToResponse(data, role));
                            }
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_KANTOR:
                List<Layanan> kanwilKepKantor = layananService.findLayananByKepKantorKanwilIsNotNull();

                for (Layanan data : kanwilKepKantor) {
                    if (data.getProgress() == ON_BATCH_1_KANWIL){
                        if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepKantorKanwil()).getAccountId())) {
                            if (splitStringWithColon(data.getKepKantorKanwil()).getProgress() == null) {
                                responses.add(setDataLayananToResponse(data, role));
                            }
                        }
                    } else if (data.getProgress() == ON_BATCH_2_KANWIL){
                        if (!isKPOrTPS(data)) {
                            if (isTPBKITEPerizinanBaru(data)) {
                                if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepKantorKanwil()).getAccountId())) {
                                    if (splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress() != null && splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress().equals(HOLD + "")) {
                                        if (splitStringWithColon(data.getKepKantorKanwil()).getProgress() != null && splitStringWithColon(data.getKepKantorKanwil()).getProgress().equals(WAITING + "")) {
                                            responses.add(setDataLayananToResponse(data, role));
                                        }
                                    }
                                }
                            } else {
                                if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepKantorKanwil()).getAccountId())) {
                                    if (splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress() != null && splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress().equals(DONE + "")) {
                                        if (splitStringWithColon(data.getKepKantorKanwil()).getProgress() != null && !splitStringWithColon(data.getKepKantorKanwil()).getProgress().equals(DONE + "")) {
                                            responses.add(setDataLayananToResponse(data, role));
                                        }
                                    }
                                }
                            }
                        } else {
                            if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepKantorKanwil()).getAccountId())) {
                                if (splitStringWithColon(data.getKepBidPkcKanwil()).getProgress() != null && splitStringWithColon(data.getKepBidPkcKanwil()).getProgress().equals(DONE + "")) {
                                    if (splitStringWithColon(data.getKepKantorKanwil()).getProgress() != null && !splitStringWithColon(data.getKepKantorKanwil()).getProgress().equals(DONE + "")) {
                                        responses.add(setDataLayananToResponse(data, role));
                                    }
                                }
                            }
                        }
                    } else if(data.getProgress() == ON_BATCH_3_KANWIL) {
                        if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepKantorKanwil()).getAccountId())) {
                            if (splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress() != null && splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepKantorKanwil()).getProgress() != null && !splitStringWithColon(data.getKepKantorKanwil()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        }
                    }
                }

                break;
            case PENERIMA_DOKUMEN:
                List<Layanan> penerima = layananService.findLayananByPenerimaIsNull(account.getLokasi());

                for (Layanan data : penerima) {
                    if (!isTPBPerubahanNonLokasiKITEPerubahanOrPencabutan(data)) responses.add(setDataLayananToResponse(data, role));
                }

                break;
            case KANWIL_PENERIMA_DOKUMEN:
                List<Layanan> pendokKanwil = layananService.findLayananByPenerimaKanwilIsNullAndProgress(ON_BATCH_1_KANWIL);

                for (Layanan data : pendokKanwil) {
                    responses.add(setDataLayananToResponse(data, role));
                }

                break;
            case PEMOHON:
                List<Layanan> pemohon = layananService.findLayananByPemohon(account);

                for (Layanan data : pemohon) {
                    responses.add(setDataLayananToResponse(data, role));
                }

                break;
            case PEMERIKSA_P2:
                List<Layanan> pemeriksaP2 = layananService.findLayananByPemeriksaP2IsNotNull(account.getLokasi());

                for (Layanan data : pemeriksaP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaP2()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getPemeriksaP2()).getProgress() == null) {
                                responses.add(setDataLayananToResponse(data, role));
                            }
                        }
                    }
                }

                break;
            case KANWIL_PEMERIKSA_P2:
                List<Layanan> pemeriksaP2Kanwil = layananService.findLayananByPemeriksaP2KanwilIsNotNull();

                for (Layanan data : pemeriksaP2Kanwil) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaP2Kanwil()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_2_KANWIL) {
                            if (splitStringWithColon(data.getPemeriksaP2Kanwil()).getProgress() == null) {
                                responses.add(setDataLayananToResponse(data, role));
                            }
                        }
                    }
                }

                break;
            case PEMERIKSA_PERBEND:
                List<Layanan> pemeriksaPerbend = layananService.findLayananByPemeriksaPerbendIsNotNull(account.getLokasi());

                for (Layanan data : pemeriksaPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaPerbend()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getPemeriksaPerbend()).getProgress() == null) {
                                responses.add(setDataLayananToResponse(data, role));
                            }
                        }
                    }
                }

                break;
            case PEMERIKSA_PKC:
                List<Layanan> pemeriksaPkc = layananService.findLayananByPemeriksaPkcIsNotNull(account.getLokasi());

                for (Layanan data : pemeriksaPkc) {

                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaPkc()).getAccountId())) {
                        if (splitStringWithColon(data.getPemeriksaPkc()).getProgress() == null) {
                            responses.add(setDataLayananToResponse(data, role));
                        }
                    }
                }

                break;
            case KEPALA_SEKSI_P2:
                List<Layanan> kepSeksiP2 = layananService.findLayananByKepSeksiP2IsNotNull(account.getLokasi());

                for (Layanan data : kepSeksiP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiP2()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_2_KPPBC) { if (splitStringWithColon(data.getKepSubSeksiP2()).getProgress() != null &&
                            splitStringWithColon(data.getKepSubSeksiP2()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepSeksiP2()).getProgress() != null && !splitStringWithColon(data.getKepSeksiP2()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        } else {
                            if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiP2()).getAccountId())) {
                                if (splitStringWithColon(data.getKepSeksiP2()).getProgress() == null) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_BIDANG_P2:
                List<Layanan> kepBidangP2Kanwil = layananService.findLayananByKepBidangP2KanwilIsNotNull();

                for (Layanan data : kepBidangP2Kanwil) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepBidangP2Kanwil()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_2_KANWIL) {
                            if (splitStringWithColon(data.getKepSeksiIntelijenKanwil()).getProgress() != null &&
                            splitStringWithColon(data.getKepSeksiIntelijenKanwil()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepBidangP2Kanwil()).getProgress() != null &&
                                        !splitStringWithColon(data.getKepBidangP2Kanwil()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        } else {
                            if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepBidangP2Kanwil()).getAccountId())) {
                                if (splitStringWithColon(data.getKepBidangP2Kanwil()).getProgress() == null) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        }
                    }
                }

                break;
            case KEPALA_SEKSI_PERBEND:
                List<Layanan> kepSeksiPerbend = layananService.findLayananByKepSeksiPerbendIsNotNull(account.getLokasi());

                for (Layanan data : kepSeksiPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPerbend()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getKepSubSeksiPerbend()).getProgress() != null && splitStringWithColon(data.getKepSubSeksiPerbend()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepSeksiPerbend()).getProgress() != null && !splitStringWithColon(data.getKepSeksiPerbend()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        } else  {
                            if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPerbend()).getAccountId())) {
                                if (splitStringWithColon(data.getKepSeksiPerbend()).getProgress() == null) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        }
                    }
                }

                break;
            case KEPALA_SEKSI_PKC:
                List<Layanan> kepSeksiPkc = layananService.findLayananByKepSeksiPkcIsNotNull(account.getLokasi());

                for (Layanan data : kepSeksiPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPkc()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getKepSubSeksiPkc()).getProgress() != null && splitStringWithColon(data.getKepSubSeksiPkc()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepSeksiPkc()).getProgress() != null && !splitStringWithColon(data.getKepSeksiPkc()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        } else {
                            if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPkc()).getAccountId())) {
                                if (splitStringWithColon(data.getKepSeksiPkc()).getProgress() == null) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        }
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_P2:
                List<Layanan> kepSubSeksiP2 = layananService.findLayananByKepSubSeksiP2IsNotNull(account.getLokasi());

                for (Layanan data : kepSubSeksiP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiP2()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getPemeriksaP2()).getProgress() != null && splitStringWithColon(data.getPemeriksaP2()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepSubSeksiP2()).getProgress() != null && !splitStringWithColon(data.getKepSubSeksiP2()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        } else {
                            if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiP2()).getAccountId())) {
                                if (splitStringWithColon(data.getKepSubSeksiP2()).getProgress() == null) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_SEKSI_INTELIJEN:
                List<Layanan> kepSeksiIntelijen = layananService.findLayananByKepSeksiIntelijenIsNotNull();

                for (Layanan data : kepSeksiIntelijen) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiIntelijenKanwil()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_2_KANWIL) {
                            if (splitStringWithColon(data.getPemeriksaP2Kanwil()).getProgress() != null && splitStringWithColon(data.getPemeriksaP2Kanwil()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepSeksiIntelijenKanwil()).getProgress() != null && !splitStringWithColon(data.getKepSeksiIntelijenKanwil()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        } else {
                            if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiIntelijenKanwil()).getAccountId())) {
                                if (splitStringWithColon(data.getKepSeksiIntelijenKanwil()).getProgress() == null) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        }
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_PERBEND:
                List<Layanan> kepSubSeksiPerbend = layananService.findLayananByKepSubSeksiPerbendIsNotNull(account.getLokasi());

                for (Layanan data : kepSubSeksiPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiPerbend()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getPemeriksaPerbend()).getProgress() != null && splitStringWithColon(data.getPemeriksaPerbend()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepSubSeksiPerbend()).getProgress() != null && !splitStringWithColon(data.getKepSubSeksiPerbend()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        } else {
                            if (splitStringWithColon(data.getKepSubSeksiPerbend()).getProgress() == null) {
                                responses.add(setDataLayananToResponse(data, role));
                            }
                        }
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_PKC:
                List<Layanan> kepSubSeksiPkc = layananService.findLayananByKepSubSeksiPkcIsNotNull(account.getLokasi());

                for (Layanan data : kepSubSeksiPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiPkc()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_2_KPPBC) {
                            if (splitStringWithColon(data.getPemeriksaPkc()).getProgress() != null && splitStringWithColon(data.getPemeriksaPkc()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepSubSeksiPkc()).getProgress() != null && !splitStringWithColon(data.getKepSubSeksiPkc()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        } else {
                            if (splitStringWithColon(data.getKepSubSeksiPkc()).getProgress() == null) {
                                responses.add(setDataLayananToResponse(data, role));
                            }
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_BIDANG_FASILITAS:
                List<Layanan> kepBidFasilitas = layananService.findLayananByKepBidangFasilitasKanwilIsNotNull();

                for (Layanan data : kepBidFasilitas) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepBidangFasilitasKanwil()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_1_KANWIL) {
                            if (splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress() == null) {
                                responses.add(setDataLayananToResponse(data, role));
                            }

                        } else if (data.getProgress() == ON_BATCH_2_KANWIL) {
                            if (isTPBKITEPerizinanBaru(data)) {
                                if (splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress() != null && splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress().equals(HOLD + "")) {
                                    if (splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress() != null && splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress().equals(WAITING + "")) {
                                        responses.add(setDataLayananToResponse(data, role));
                                    }
                                }
                            } else {
                                if (splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress() != null && splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress().equals(DONE + "")) {
                                    if (splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress() != null && !splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress().equals(DONE + "")) {
                                        responses.add(setDataLayananToResponse(data, role));
                                    }
                                }
                            }
                        } else if (data.getProgress() == ON_BATCH_3_KANWIL) {
                            if (splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress() != null &&
                                    splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress() != null &&
                                        !splitStringWithColon(data.getKepBidangFasilitasKanwil()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_SEKSI_PF:
                List<Layanan> kepSeksiPf = layananService.findLayananByKepSeksiPfKanwilIsNotNull();

                for (Layanan data : kepSeksiPf) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPfKanwil()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_1_KANWIL) {
                            if (splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress() == null) {
                                responses.add(setDataLayananToResponse(data, role));
                            }
                        } else if (data.getProgress() == ON_BATCH_2_KANWIL) {
                            if (isTPBKITEPerizinanBaru(data)) {
                                if (splitStringWithColon(data.getPemeriksaDokumenKanwil()).getProgress() != null && splitStringWithColon(data.getPemeriksaDokumenKanwil()).getProgress().equals(HOLD + "")) {
                                    if (splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress() != null && splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress().equals(WAITING + "")) {
                                        responses.add(setDataLayananToResponse(data, role));
                                    }
                                }
                            } else {
                                if (splitStringWithColon(data.getPemeriksaDokumenKanwil()).getProgress() != null && splitStringWithColon(data.getPemeriksaDokumenKanwil()).getProgress().equals(DONE + "")) {
                                    if (splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress() != null && !splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress().equals(DONE + "")) {
                                        responses.add(setDataLayananToResponse(data, role));
                                    }
                                }
                            }
                        } else if (data.getProgress() == ON_BATCH_3_KANWIL) {
                            if (splitStringWithColon(data.getPemeriksaDokumenKanwil()).getProgress() != null && splitStringWithColon(data.getPemeriksaDokumenKanwil()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress() != null && !splitStringWithColon(data.getKepSeksiPfKanwil()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_BIDANG_PKC:
                List<Layanan> kepBidPkc = layananService.findLayananByKepBidPKCKanwilIsNotNull();

                for(Layanan data : kepBidPkc) {
                    if(Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepBidPkcKanwil()).getAccountId())) {
                        if(data.getProgress() == ON_BATCH_2_KANWIL) {
                            if(splitStringWithColon(data.getKepSeksiPkcKanwil()).getProgress() != null && splitStringWithColon(data.getKepSeksiPkcKanwil()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepBidPkcKanwil()).getProgress() != null && !splitStringWithColon(data.getKepBidPkcKanwil()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        } else {
                            if (splitStringWithColon(data.getKepBidPkcKanwil()).getProgress() == null) {
                                responses.add(setDataLayananToResponse(data, role));
                            }
                        }
                    }
                }

                break;
            case KANWIL_KEPALA_SEKSI_PKC:
                List<Layanan> kepSiPkc = layananService.findByLayananKepSeksiPKCKanwilIsNotNull();

                for(Layanan data : kepSiPkc) {
                    if(Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPkcKanwil()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_2_KANWIL) {
                            if (splitStringWithColon(data.getPemeriksaPkcKanwil()).getProgress() != null && splitStringWithColon(data.getPemeriksaPkcKanwil()).getProgress().equals(DONE + "")) {
                                if (splitStringWithColon(data.getKepSeksiPkcKanwil()).getProgress() != null && !splitStringWithColon(data.getKepSeksiPkcKanwil()).getProgress().equals(DONE + "")) {
                                    responses.add(setDataLayananToResponse(data, role));
                                }
                            }
                        } else {
                            if (splitStringWithColon(data.getKepSeksiPkcKanwil()).getProgress() == null) {
                                responses.add(setDataLayananToResponse(data, role));
                            }
                        }
                    }
                }

                break;
            case KANWIL_PEMERIKSA_DOKUMEN:
                List<Layanan> pemeriksaDokumen = layananService.findLayananByPemeriksaDokumenKanwilIsNotNull();

                for (Layanan data : pemeriksaDokumen) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaDokumenKanwil()).getAccountId())) {
                        if (data.getProgress() == ON_BATCH_3_KANWIL) {
                            if (splitStringWithColon(data.getPemeriksaDokumenKanwil()).getProgress() != null
                                && splitStringWithColon(data.getPemeriksaDokumenKanwil()).getProgress().equals("" + HOLD)) {
                                responses.add(setDataLayananToResponse(data, role));
                            }
                        } else {
                            if (splitStringWithColon(data.getPemeriksaDokumenKanwil()).getProgress() == null) {
                                responses.add(setDataLayananToResponse(data, role));
                            }
                        }
                    }
                }

                break;
            case KANWIL_PEMERIKSA_PKC:
                List<Layanan> pemeriksaPkcKanwil = layananService.findLayananByPemeriksaPkcKanwilIsNotNull();

                for (Layanan data : pemeriksaPkcKanwil) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaPkcKanwil()).getAccountId())) {
                        if (splitStringWithColon(data.getPemeriksaPkcKanwil()).getProgress() == null) {
                            responses.add(setDataLayananToResponse(data, role));
                        }
                    }
                }

                break;
        }

        return responses;
    }

    public List<LayananResponse> viewStatusLayanan(Account account, Role role) {
        List<LayananResponse> responses = new ArrayList<>();

        switch (account.getRole().getId()) {
            case KEPALA_KANTOR:
                List<Layanan> kepKantor = layananService.findLayananByKepKantorIsNotNull(account.getLokasi());

                for (Layanan data : kepKantor) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepKantor()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KANWIL_KEPALA_KANTOR:
                List<Layanan> kanwilKepKantor = layananService.findLayananByKepKantorKanwilIsNotNull();

                for (Layanan data : kanwilKepKantor) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepKantorKanwil()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case PENERIMA_DOKUMEN:
                List<Layanan> penerima = layananService.findLayananByPenerimaIsNotNull(account.getLokasi());

                for (Layanan data : penerima) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPenerima()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KANWIL_PENERIMA_DOKUMEN:
                List<Layanan> pendokKanwil = layananService.findLayananByPenerimaKanwilIsNotNull();

                for (Layanan data : pendokKanwil) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPenerimaKanwil()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case PEMERIKSA_P2:
                List<Layanan> pemeriksaP2 = layananService.findLayananByPemeriksaP2IsNotNull(account.getLokasi());

                for (Layanan data : pemeriksaP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaP2()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KANWIL_PEMERIKSA_P2:
                List<Layanan> pemeriksaP2Kanwil = layananService.findLayananByPemeriksaP2KanwilIsNotNull();

                for (Layanan data : pemeriksaP2Kanwil) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaP2Kanwil()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case PEMERIKSA_PERBEND:
                List<Layanan> pemeriksaPerbend = layananService.findLayananByPemeriksaPerbendIsNotNull(account.getLokasi());

                for (Layanan data : pemeriksaPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaPerbend()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case PEMERIKSA_PKC:
                List<Layanan> pemeriksaPkc = layananService.findLayananByPemeriksaPkcIsNotNull(account.getLokasi());

                for (Layanan data : pemeriksaPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaPkc()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KEPALA_SEKSI_P2:
                List<Layanan> kepSeksiP2 = layananService.findLayananByKepSeksiP2IsNotNull(account.getLokasi());

                for (Layanan data : kepSeksiP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiP2()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KANWIL_KEPALA_BIDANG_P2:
                List<Layanan> kepBidangP2Kanwil = layananService.findLayananByKepBidangP2KanwilIsNotNull();

                for (Layanan data : kepBidangP2Kanwil) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepBidangP2Kanwil()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KEPALA_SEKSI_PERBEND:
                List<Layanan> kepSeksiPerbend = layananService.findLayananByKepSeksiPerbendIsNotNull(account.getLokasi());

                for (Layanan data : kepSeksiPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPerbend()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KEPALA_SEKSI_PKC:
                List<Layanan> kepSeksiPkc = layananService.findLayananByKepSeksiPkcIsNotNull(account.getLokasi());

                for (Layanan data : kepSeksiPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPkc()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_P2:
                List<Layanan> kepSubSeksiP2 = layananService.findLayananByKepSubSeksiP2IsNotNull(account.getLokasi());

                for (Layanan data : kepSubSeksiP2) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiP2()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KANWIL_KEPALA_SEKSI_INTELIJEN:
                List<Layanan> kepSeksiIntelijen = layananService.findLayananByKepSeksiIntelijenIsNotNull();

                for (Layanan data : kepSeksiIntelijen) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiIntelijenKanwil()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_PERBEND:
                List<Layanan> kepSubSeksiPerbend = layananService.findLayananByKepSubSeksiPerbendIsNotNull(account.getLokasi());

                for (Layanan data : kepSubSeksiPerbend) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiPerbend()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KEPALA_SUB_SEKSI_PKC:
                List<Layanan> kepSubSeksiPkc = layananService.findLayananByKepSubSeksiPkcIsNotNull(account.getLokasi());

                for (Layanan data : kepSubSeksiPkc) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSubSeksiPkc()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KANWIL_KEPALA_BIDANG_FASILITAS:
                List<Layanan> kepBidFasilitas = layananService.findLayananByKepBidangFasilitasKanwilIsNotNull();

                for (Layanan data : kepBidFasilitas) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepBidangFasilitasKanwil()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KANWIL_KEPALA_SEKSI_PF:
                List<Layanan> kepSeksiPf = layananService.findLayananByKepSeksiPfKanwilIsNotNull();

                for (Layanan data : kepSeksiPf) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPfKanwil()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KANWIL_KEPALA_BIDANG_PKC:
                List<Layanan> kepBidPkc = layananService.findLayananByKepBidPKCKanwilIsNotNull();

                for(Layanan data : kepBidPkc) {
                    if(Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepBidPkcKanwil()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KANWIL_KEPALA_SEKSI_PKC:
                List<Layanan> kepSiPkc = layananService.findByLayananKepSeksiPKCKanwilIsNotNull();

                for(Layanan data : kepSiPkc) {
                    if(Integer.toString(account.getId()).equals(splitStringWithColon(data.getKepSeksiPkcKanwil()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KANWIL_PEMERIKSA_DOKUMEN:
                List<Layanan> pemeriksaDokumen = layananService.findLayananByPemeriksaDokumenKanwilIsNotNull();

                for (Layanan data : pemeriksaDokumen) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaDokumenKanwil()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
            case KANWIL_PEMERIKSA_PKC:
                List<Layanan> pemeriksaPkcKanwil = layananService.findLayananByPemeriksaPkcKanwilIsNotNull();

                for (Layanan data : pemeriksaPkcKanwil) {
                    if (Integer.toString(account.getId()).equals(splitStringWithColon(data.getPemeriksaPkcKanwil()).getAccountId())) {
                        responses.add(setDataLayananToResponse(data, role));
                    }
                }

                break;
        }

        return responses;
    }

    public List<Account> getNextPic(Account account, Layanan layanan) {
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
                if (isKPOrTPS(layanan)) response = accountService.getAccountList(roleService.getRole(KANWIL_KEPALA_BIDANG_PKC));
                else response = accountService.getAccountList(roleService.getRole(KANWIL_KEPALA_BIDANG_FASILITAS));
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
                break;
            case KANWIL_KEPALA_BIDANG_PKC:
                response = accountService.getAccountList(roleService.getRole(KANWIL_KEPALA_SEKSI_PKC));
                break;
            case KANWIL_KEPALA_SEKSI_PKC:
                response = accountService.getAccountList(roleService.getRole(KANWIL_PEMERIKSA_PKC));
                break;
        }

        return response;
    }

    private LayananResponse setDataLayananToResponse(Layanan layanan, Role role) {
        LayananResponse response = new LayananResponse();
        response.setId(Integer.toString(layanan.getId()));
        response.setNomor(layanan.getNomor());
        response.setTanggalRequest(layanan.getTanggal().toString());
        response.setNamaPerusahaan(layanan.getPemohonon().getPerusahaan().getNama());
        response.setJenisPerusahaan(layanan.getPemohonon().getPerusahaan().getJenis().getKeterangan());
        response.setLayanan(layanan.getSubLayanan().getKeterangan());
        response.setDataLayanan(layanan);

        if (role.getId() == PENERIMA_DOKUMEN) {
            if (layanan.getPenerima() != null) {
                if (!layanan.getPenerima().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPenerima());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPenerima(account.getPribadi().getNama());
                    response.setTanggalPenerima(status.getTanggal());
                }
            }
        } else if (role.getId() == KANWIL_PENERIMA_DOKUMEN) {
            if (layanan.getPenerimaKanwil() != null) {
                if (!layanan.getPenerimaKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPenerimaKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPenerima(account.getPribadi().getNama());
                    response.setTanggalPenerima(status.getTanggal());
                }
            }
        } else if (role.getId() == KEPALA_KANTOR) {
            if (layanan.getKepKantor() != null) {
                if (!layanan.getKepKantor().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepKantor());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepKantor(account.getPribadi().getNama());
                    response.setTanggalKepKantor(status.getTanggal());
                }
            }

            if (layanan.getKepSeksiPkc() != null) {
                if (!layanan.getKepSeksiPkc().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSeksiPkc());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSeksi(status.getTanggal());
                }
            }

            if (layanan.getKepSubSeksiPkc() != null) {
                if (!layanan.getKepSubSeksiPkc().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSubSeksiPkc());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSubSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSubSeksi(status.getTanggal());
                }
            }

            if (layanan.getPemeriksaPkc() != null) {
                if (!layanan.getPemeriksaPkc().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPemeriksaPkc());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPemeriksa(account.getPribadi().getNama());
                    response.setTanggalPemeriksa(status.getTanggal());
                }
            }

            if (layanan.getPenerima() != null) {
                if (!layanan.getPenerima().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPenerima());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPenerima(account.getPribadi().getNama());
                    response.setTanggalPenerima(status.getTanggal());
                }
            }
        } else if (role.getId() == KEPALA_SEKSI_PKC
            || role.getId() == KEPALA_SUB_SEKSI_PKC
            || role.getId() == PEMERIKSA_PKC) {
            if (layanan.getKepKantor() != null) {
                if (!layanan.getKepKantor().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepKantor());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepKantor(account.getPribadi().getNama());
                    response.setTanggalKepKantor(status.getTanggal());
                }
            }

            if (layanan.getKepSeksiPkc() != null) {
                if (!layanan.getKepSeksiPkc().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSeksiPkc());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSeksi(status.getTanggal());
                }
            }

            if (layanan.getKepSubSeksiPkc() != null) {
                if (!layanan.getKepSubSeksiPkc().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSubSeksiPkc());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSubSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSubSeksi(status.getTanggal());
                }
            }

            if (layanan.getPemeriksaPkc() != null) {
                if (!layanan.getPemeriksaPkc().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPemeriksaPkc());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPemeriksa(account.getPribadi().getNama());
                    response.setTanggalPemeriksa(status.getTanggal());
                }
            }

            if (layanan.getPenerima() != null) {
                if (!layanan.getPenerima().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPenerima());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPenerima(account.getPribadi().getNama());
                    response.setTanggalPenerima(status.getTanggal());
                }
            }
        } else if (role.getId() == KEPALA_SEKSI_P2
                || role.getId() == KEPALA_SUB_SEKSI_P2
                || role.getId() == PEMERIKSA_P2) {
            if (layanan.getKepKantor() != null) {
                if (!layanan.getKepKantor().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepKantor());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepKantor(account.getPribadi().getNama());
                    response.setTanggalKepKantor(status.getTanggal());
                }
            }

            if (layanan.getKepSeksiP2() != null) {
                if (!layanan.getKepSeksiP2().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSeksiP2());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSeksi(status.getTanggal());
                }
            }

            if (layanan.getKepSubSeksiP2() != null) {
                if (!layanan.getKepSubSeksiP2().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSubSeksiP2());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSubSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSubSeksi(status.getTanggal());
                }
            }

            if (layanan.getPemeriksaPkc() != null) {
                if (!layanan.getPemeriksaPkc().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPemeriksaPkc());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPemeriksa(account.getPribadi().getNama());
                    response.setTanggalPemeriksa(status.getTanggal());
                }
            }

            if (layanan.getPenerima() != null) {
                if (!layanan.getPenerima().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPenerima());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPenerima(account.getPribadi().getNama());
                    response.setTanggalPenerima(status.getTanggal());
                }
            }
        } else if (role.getId() == KEPALA_SEKSI_PERBEND
                || role.getId() == KEPALA_SUB_SEKSI_PERBEND
                || role.getId() == PEMERIKSA_PERBEND) {
            if (layanan.getKepKantor() != null) {
                if (!layanan.getKepKantor().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepKantor());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepKantor(account.getPribadi().getNama());
                    response.setTanggalKepKantor(status.getTanggal());
                }
            }

            if (layanan.getKepSeksiPerbend() != null) {
                if (!layanan.getKepSeksiPerbend().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSeksiPerbend());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSeksi(status.getTanggal());
                }
            }

            if (layanan.getKepSubSeksiPerbend() != null) {
                if (!layanan.getKepSubSeksiPerbend().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSubSeksiPerbend());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSubSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSubSeksi(status.getTanggal());
                }
            }

            if (layanan.getPemeriksaPerbend() != null) {
                if (!layanan.getPemeriksaPerbend().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPemeriksaPerbend());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPemeriksa(account.getPribadi().getNama());
                    response.setTanggalPemeriksa(status.getTanggal());
                }
            }

            if (layanan.getPenerima() != null) {
                if (!layanan.getPenerima().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPenerima());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPenerima(account.getPribadi().getNama());
                    response.setTanggalPenerima(status.getTanggal());
                }
            }
        } else if (role.getId() == KANWIL_KEPALA_KANTOR) {
            if (layanan.getKepKantorKanwil() != null) {
                if (!layanan.getKepKantorKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepKantorKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepKantor(account.getPribadi().getNama());
                    response.setTanggalKepKantor(status.getTanggal());
                }
            }

            if (layanan.getKepBidangFasilitasKanwil() != null) {
                if (!layanan.getKepBidangFasilitasKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepBidangFasilitasKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepBidang(account.getPribadi().getNama());
                    response.setTanggalKepBidang(status.getTanggal());
                }
            }

            if (layanan.getKepBidPkcKanwil() != null) {
                if (!layanan.getKepBidPkcKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepBidPkcKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepBidang(account.getPribadi().getNama());
                    response.setTanggalKepBidang(status.getTanggal());
                }
            }

            if (layanan.getKepSeksiPfKanwil() != null) {
                if (!layanan.getKepSeksiPfKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSeksiPfKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSeksi(status.getTanggal());
                }
            }

            if (layanan.getKepSeksiPkcKanwil() != null) {
                if (!layanan.getKepSeksiPkcKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSeksiPkcKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSeksi(status.getTanggal());
                }
            }

            if (layanan.getPemeriksaDokumenKanwil() != null) {
                if (!layanan.getPemeriksaDokumenKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPemeriksaDokumenKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPemeriksa(account.getPribadi().getNama());
                    response.setTanggalPemeriksa(status.getTanggal());
                }
            }

            if (layanan.getPemeriksaPkcKanwil() != null) {
                if (!layanan.getPemeriksaPkcKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPemeriksaPkcKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPemeriksa(account.getPribadi().getNama());
                    response.setTanggalPemeriksa(status.getTanggal());
                }
            }

            if (layanan.getPenerimaKanwil() != null) {
                if (!layanan.getPenerimaKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPenerimaKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPenerima(account.getPribadi().getNama());
                    response.setTanggalPenerima(status.getTanggal());
                }
            }
        } else if (role.getId() == KANWIL_KEPALA_BIDANG_FASILITAS
            || role.getId() == KANWIL_KEPALA_SEKSI_PF
            || role.getId() == KANWIL_PEMERIKSA_DOKUMEN) {
            if (layanan.getKepKantorKanwil() != null) {
                if (!layanan.getKepKantorKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepKantorKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepKantor(account.getPribadi().getNama());
                    response.setTanggalKepKantor(status.getTanggal());
                }
            }

            if (layanan.getPenerimaKanwil() != null) {
                if (!layanan.getPenerimaKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPenerimaKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPenerima(account.getPribadi().getNama());
                    response.setTanggalPenerima(status.getTanggal());
                }
            }

            if (layanan.getKepBidangFasilitasKanwil() != null) {
                if (!layanan.getKepBidangFasilitasKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepBidangFasilitasKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepBidang(account.getPribadi().getNama());
                    response.setTanggalKepBidang(status.getTanggal());
                }
            }

            if (layanan.getKepSeksiPfKanwil() != null) {
                if (!layanan.getKepSeksiPfKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSeksiPfKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSeksi(status.getTanggal());
                }
            }

            if (layanan.getPemeriksaDokumenKanwil() != null) {
                if (!layanan.getPemeriksaDokumenKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPemeriksaDokumenKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPemeriksa(account.getPribadi().getNama());
                    response.setTanggalPemeriksa(status.getTanggal());
                }
            }
        } else if (role.getId() == KANWIL_KEPALA_BIDANG_P2
                || role.getId() == KANWIL_KEPALA_SEKSI_INTELIJEN
                || role.getId() == KANWIL_PEMERIKSA_P2) {
            if (layanan.getKepKantorKanwil() != null) {
                if (!layanan.getKepKantorKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepKantorKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepKantor(account.getPribadi().getNama());
                    response.setTanggalKepKantor(status.getTanggal());
                }
            }

            if (layanan.getPenerimaKanwil() != null) {
                if (!layanan.getPenerimaKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPenerimaKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPenerima(account.getPribadi().getNama());
                    response.setTanggalPenerima(status.getTanggal());
                }
            }

            if (layanan.getKepBidangP2Kanwil() != null) {
                if (!layanan.getKepBidangP2Kanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepBidangP2Kanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepBidang(account.getPribadi().getNama());
                    response.setTanggalKepBidang(status.getTanggal());
                }
            }

            if (layanan.getKepSeksiIntelijenKanwil() != null) {
                if (!layanan.getKepSeksiIntelijenKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSeksiIntelijenKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSeksi(status.getTanggal());
                }
            }

            if (layanan.getPemeriksaP2Kanwil() != null) {
                if (!layanan.getPemeriksaP2Kanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPemeriksaP2Kanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPemeriksa(account.getPribadi().getNama());
                    response.setTanggalPemeriksa(status.getTanggal());
                }
            }
        } else if (role.getId() == KANWIL_KEPALA_BIDANG_PKC
                || role.getId() == KANWIL_KEPALA_SEKSI_PKC
                || role.getId() == KANWIL_PEMERIKSA_PKC) {
            if (layanan.getKepKantorKanwil() != null) {
                if (!layanan.getKepKantorKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepKantorKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepKantor(account.getPribadi().getNama());
                    response.setTanggalKepKantor(status.getTanggal());
                }
            }

            if (layanan.getPenerimaKanwil() != null) {
                if (!layanan.getPenerimaKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPenerimaKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPenerima(account.getPribadi().getNama());
                    response.setTanggalPenerima(status.getTanggal());
                }
            }

            if (layanan.getKepBidPkcKanwil() != null) {
                if (!layanan.getKepBidPkcKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepBidPkcKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepBidang(account.getPribadi().getNama());
                    response.setTanggalKepBidang(status.getTanggal());
                }
            }

            if (layanan.getKepSeksiPkcKanwil() != null) {
                if (!layanan.getKepSeksiPkcKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getKepSeksiPkcKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setKepSeksi(account.getPribadi().getNama());
                    response.setTanggalKepSeksi(status.getTanggal());
                }
            }

            if (layanan.getPemeriksaPkcKanwil() != null) {
                if (!layanan.getPemeriksaPkcKanwil().isEmpty()) {
                    StatusLayanan status = splitStringWithColon(layanan.getPemeriksaPkcKanwil());
                    Account account = accountService.findById(status.getAccountId());

                    response.setPemeriksa(account.getPribadi().getNama());
                    response.setTanggalPemeriksa(status.getTanggal());
                }
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

        if (layanan.getProgress() == ON_BATCH_1_KANWIL
            || layanan.getProgress() == ON_BATCH_2_KANWIL) model.put("jenis_kppbc", "KANWIL");
        else {
            if (layanan.getLokasi() == TANGERANG) model.put("jenis_kppbc", "A TANGERANG");
            else if (layanan.getLokasi() == MERAK) model.put("jenis_kppbc", "MERAK");
        }

        List<Dokumen> dokumen = new ArrayList<>();
        List<Dokumen> docs = dokumenService.findByLayanan(layanan);

        if (type == EMAIL_PENERIMAAN_KPPBC) {
            for (Dokumen data : docs) {
                if (data.getJenisDokumen().getRole() != null) {
                    if (data.getJenisDokumen().getId() == SURAT_REKOMENDASI) dokumen.add(data);
                }
            }

            if (!emailService.sendMail(request, dokumen)) result = FAILED;
        } else if (type == EMAIL_PENERIMAAN_KANWIL) {
            for (Dokumen data : docs) {
                if (data.getJenisDokumen().getRole() != null) {
                    if (data.getJenisDokumen().getId() == SKEP_PEMERIKSA_DOKUMEN
                            || data.getJenisDokumen().getId() == SKEP_PEMERIKSA_PKC) dokumen.add(data);
                }
            }

            if (!emailService.sendMail(request, dokumen)) result = FAILED;
        } else if (type == EMAIL_PENOLAKAN){
            for (Dokumen data : docs) {
                if (data.getJenisDokumen().getRole() != null) {
                    if (data.getJenisDokumen().getId() == SURAT_PENGEMBALIAN_BERKAS
                            || data.getJenisDokumen().getId() == SURAT_PENOLAKAN_PEMERIKSA_PKC) dokumen.add(data);
                }
            }

            if (dokumen.size() > 0) {
                if (!emailService.sendMail(request, dokumen)) result = FAILED;
            } else {
                if (!emailService.sendMail(request)) result = FAILED;
            }

        } else if (type == EMAIL_UNDANGAN) {
            for (Dokumen data : docs) {
                if (data.getJenisDokumen().getRole() != null) {
                    if (data.getJenisDokumen().getId() == UNDANGAN_PEMAPARAN) dokumen.add(data);
                }
            }

            if (!emailService.sendMail(request, dokumen)) result = FAILED;
        }

        return result;
    }

    private boolean isKPOrTPS(Layanan layanan) {
        return layanan.getSubLayanan().getLayanan().getPenimbunan() != null
                || layanan.getSubLayanan().getLayanan().getPengelola() != null;
    }

    private boolean isTPBKITEPerizinanBaru(Layanan layanan) {
        if (layanan.getSubLayanan().getLayanan().getPerusahaan() != null
        || layanan.getSubLayanan().getLayanan().getFasilitas() != null) {
            return layanan.getSubLayanan().getKeterangan().equals("Perizinan Baru");
        } else return false;
    }

    private boolean isTPBPencabutan(Layanan layanan) {
        if (layanan.getSubLayanan().getLayanan().getPerusahaan() != null) {
            return layanan.getSubLayanan().getKeterangan().equals("Pencabutan Izin");
        } else return false;
    }

    private boolean isTPBPerubahanLokasi(Layanan layanan) {
        boolean result = false;

        if (layanan.getSubLayanan().getLayanan().getPerusahaan() != null) {
             if (layanan.getSubLayanan().getKeterangan().contains("lokasi")) {
                 result = true;
             }
        }

        return result;
    }

    private boolean isTPBPerubahanNonLokasiKITEPerubahanOrPencabutan(Layanan layanan) {
        boolean result = false;

        if (layanan.getSubLayanan().getLayanan().getPerusahaan() != null) {
            if (layanan.getSubLayanan().getKeterangan().contains("Perubahan"))
                if (!layanan.getSubLayanan().getKeterangan().contains("lokasi")) {
                    result = true;
                }
        }

        if (layanan.getSubLayanan().getLayanan().getFasilitas() != null) {
            if (layanan.getSubLayanan().getKeterangan().contains("Perubahan")
                    || layanan.getSubLayanan().getKeterangan().contains("Pencabutan")){
                result = true;
            }
        }

        return result;
    }

    private boolean checkDoc(int role, int status, Layanan layanan) {
        boolean result = false;

        switch (role) {
            case PEMERIKSA_P2:
                if (status == ACCEPTED) {
                    if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(NOTA_DINAS), layanan)){
                        result = true;
                    }
                } else result = true;

                break;
            case PEMERIKSA_PERBEND:
                if (status == ACCEPTED) {
                    if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(NOTA_DINAS_TAGIHAN), layanan)){
                        result = true;
                    }
                } else result = true;

                break;
            case PEMERIKSA_PKC:
                if (status == ACCEPTED) {
                    if (isTPBPencabutan(layanan)) {
                        if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(HASIL_PEMERIKSAAN_SEDERHANA), layanan)
                                && dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(NOTA_DINAS), layanan)
                                && dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(SURAT_REKOMENDASI), layanan)){
                            result = true;
                        }
                    } else {
                        if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(BA_PEMERIKSAAN_LOKASI), layanan)
                                && dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(NOTA_DINAS), layanan)
                                && dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(SURAT_REKOMENDASI), layanan)){
                            result = true;
                        }
                    }
                } else {
                    if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(SURAT_PENGEMBALIAN_BERKAS), layanan)){
                        result = true;
                    }
                }

                break;
            case KANWIL_PEMERIKSA_P2:
                if (status == ACCEPTED) {
                    if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(NOTA_DINAS_PROFIL_PEMERIKSA_P2), layanan)){
                        result = true;
                    }
                } else result = true;

                break;
            case KANWIL_PEMERIKSA_PKC:
                if (status == ACCEPTED) {
                    if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(NOTA_DINAS_PEMERIKSA_PKC), layanan)
                            && dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(SKEP_PEMERIKSA_PKC), layanan)){
                        result = true;
                    }
                } else {
                    if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(SURAT_PENOLAKAN_PEMERIKSA_PKC), layanan)){
                        result = true;
                    }
                }

                break;
            case KANWIL_PEMERIKSA_DOKUMEN:
                if (isTPBKITEPerizinanBaru(layanan)) {
                    if (layanan.getProgress() == ON_BATCH_2_KANWIL) {
                        if (status == ACCEPTED) {
                            if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(UNDANGAN_PEMAPARAN), layanan)
                                    && dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(NOTA_DINAS_UNDANGAN_PEMAPARAN), layanan)){
                                result = true;
                            }
                        } else {
                            if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(SURAT_PENOLAKAN_PEMERIKSA_DOKUMEN), layanan)){
                                result = true;
                            }
                        }
                    } else if (layanan.getProgress() == ON_BATCH_3_KANWIL) {
                        if (status == ACCEPTED) {
                            if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(BA_PEMAPARAN), layanan)
                                    && dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(SKEP_PEMERIKSA_DOKUMEN), layanan)){
                                result = true;
                            }
                        }
                    }
                } else {
                    if (status == ACCEPTED) {
                        if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(TELAAH), layanan)
                                && dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(NOTA_DINAS_PEMERIKSA_DOKUMEN), layanan)
                                && dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(SKEP_PEMERIKSA_DOKUMEN), layanan)){
                            result = true;
                        }
                    } else {
                        if (dokumenService.isDocumentExist(jenisDokumenService.getJenisDokumen(SURAT_PENOLAKAN_PEMERIKSA_DOKUMEN), layanan)){
                            result = true;
                        }
                    }
                }

                break;
        }

        return result;
    }
}
