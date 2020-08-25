package com.tam.siap.services;

import com.tam.siap.models.*;
import com.tam.siap.models.responses.DokumenListResponse;
import com.tam.siap.models.responses.ViewDokumenResponse;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.DokumenService;
import com.tam.siap.services.master.JenisDokumenService;
import com.tam.siap.services.master.LayananService;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import static com.tam.siap.utils.TamUtils.fetchStringWithColon;
import static com.tam.siap.utils.refs.JenisDokumen.*;
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

        layanan.setStatus(ON_PROGRESS);
        layananService.save(layanan);
        layananService.flush();
        id = layanan.getId();
        uploadDoc(memoryBuffer, dokumen, id);

        if (layananService.isLayananExist(layanan.getPemohonon(), layanan.getSubLayanan(), layanan.getTanggal())) result = SUCCESS;

        return result;
    }

    public void uploadDoc(List<MemoryBuffer> memoryBuffer, List<Dokumen> dokumen, int id) {
        for (int i=0; i<dokumen.size(); i++) {
            dokumen.get(i).setPath(uploadService.saveFile(
                    memoryBuffer.get(i),
                    dokumen.get(i),
                    id));
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
            case 3 : layanan.setPenerima(status);
            case 4 : layanan.setPemeriksaP2(status);
            case 5 : layanan.setPemeriksaPerbend(status);
            case 6 : layanan.setPemeriksaPkc(status);
            case 7 : layanan.setkSeksiP2(status);
            case 8 : layanan.setkSeksiPerbend(status);
            case 9 : layanan.setkSeksiPkc(status);
            case 10 : layanan.setKsSeksiP2(status);
            case 11 : layanan.setKsSeksiPerbend(status);
            case 12 : layanan.setKsSeksiPkc(status);
            case 13 : layanan.setkKantor(status);
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
}
