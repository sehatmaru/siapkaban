package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.DataPerusahaanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.tam.siap.utils.refs.Status.*;

@Service
public class ProfileService {

    @Autowired
    AccountService accountService;

    @Autowired
    DataPerusahaanService dataPerusahaanService;

    public int setAccountVerified(String username) {
        int result = FAILED;

        if (accountService.isAccountExist(username)) {
            Account account = accountService.findByUsername(username);
            account.setStatus(ACTIVE);

            if (dataPerusahaanService.isDataPerusahaanExist(account)) {
                DPerusahaan dPerusahaan = dataPerusahaanService.findDataPerusahaanByAccount(account);
                dPerusahaan.setStatus(ACTIVE);

                accountService.save(account);
                dataPerusahaanService.save(dPerusahaan);

                if (accountService.isAccountActive(username) &&
                        dataPerusahaanService.isDataPerusahaanExist(account)) result = SUCCESS;
            }
        }

        return result;
    }
}
