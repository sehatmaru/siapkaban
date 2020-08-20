package com.tam.siap.services.master;

import com.tam.siap.models.Account;
import com.tam.siap.models.Dokumen;
import com.tam.siap.repos.DokumenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DokumenService {

    @Autowired
    DokumenRepository dokumenRepository;

    public boolean isDocumentExist(Account account) {
        return dokumenRepository.findByPemohon(account) != null;
    }

    public boolean isDocumentExist(String namaDokumen, int status) {
        return dokumenRepository.findByNamaDokumenAndStatus(namaDokumen, status) != null;
    }

    public boolean isDocumentExist(String namaDokumen) {
        return dokumenRepository.findByNamaDokumen(namaDokumen) != null;
    }

    public void save(Dokumen dokumen){
        dokumenRepository.save(dokumen);
    }

}
