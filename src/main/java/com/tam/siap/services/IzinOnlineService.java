package com.tam.siap.services;

import com.tam.siap.models.Dokumen;
import com.tam.siap.models.JDokumen;
import com.tam.siap.models.Layanan;
import com.tam.siap.models.SJLayanan;
import com.tam.siap.models.responses.DokumenListResponse;
import com.tam.siap.services.master.DokumenService;
import com.tam.siap.services.master.JenisDokumenService;
import com.tam.siap.services.master.LayananService;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.tam.siap.utils.refs.JenisDokumen.*;
import static com.tam.siap.utils.refs.Status.FAILED;
import static com.tam.siap.utils.refs.Status.SUCCESS;

@Service
public class IzinOnlineService {

    @Autowired
    JenisDokumenService jenisDokumenService;

    @Autowired
    DokumenService dokumenService;

    @Autowired
    UploadService uploadService;

    @Autowired
    LayananService layananService;

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

    public int submit(MemoryBuffer memoryBuffer, Layanan layanan, List<Dokumen> dokumen) {
        int result = FAILED;

        uploadDoc(memoryBuffer, dokumen);
        layananService.save(layanan);

        if (layananService.isLayananExist(layanan.getPemohonon(), layanan.getSubLayanan(), layanan.getTanggal())) result = SUCCESS;

        return result;
    }

    public void uploadDoc(MemoryBuffer memoryBuffer, List<Dokumen> dokumen) {
        for (Dokumen dokuman : dokumen) {
            if (saveDB(dokuman)) {
                uploadService.saveFile(
                        memoryBuffer,
                        dokuman.getNamaDokumen(),
                        dokuman.getPemohon().getUsername(),
                        dokuman.getJenisDokumen());
            }
        }
    }

    private boolean saveDB(Dokumen dokumen){
        dokumenService.save(dokumen);

        return dokumenService.isDocumentExist(dokumen.getNamaDokumen());
    }
}
