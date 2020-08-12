package com.tam.siap.services.master;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.repos.DPerusahaanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DataPerusahaanService {

    @Autowired
    DPerusahaanRepository dPerusahaanRepository;

    public boolean isDataPerusahaanExist(Account account) {
        return dPerusahaanRepository.findByAccount(account) != null;
    }

    public void save(DPerusahaan dPerusahaan){
        dPerusahaanRepository.save(dPerusahaan);
    }
}
