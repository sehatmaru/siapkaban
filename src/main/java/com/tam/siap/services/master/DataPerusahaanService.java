package com.tam.siap.services.master;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.repos.DPerusahaanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.tam.siap.utils.refs.Status.ACTIVE;

@Service
public class DataPerusahaanService {

    @Autowired
    DPerusahaanRepository dPerusahaanRepository;

    public boolean isDataPerusahaanExist(Account account) {
        return dPerusahaanRepository.findByAccount(account) != null;
    }

    public boolean isAccountActive(Account account) {
        return dPerusahaanRepository.findByAccountAndStatus(account, ACTIVE) != null;
    }

    public DPerusahaan findDataPerusahaanByAccount(Account account) {
        return dPerusahaanRepository.findByAccount(account);
    }

    public void save(DPerusahaan dPerusahaan){
        dPerusahaanRepository.save(dPerusahaan);
    }
}
