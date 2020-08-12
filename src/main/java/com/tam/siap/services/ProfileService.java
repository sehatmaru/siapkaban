package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPribadi;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.DataPribadiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.tam.siap.utils.refs.Status.FAILED;
import static com.tam.siap.utils.refs.Status.SUCCESS;

@Service
public class ProfileService {

    @Autowired
    AccountService accountService;

    @Autowired
    DataPribadiService dataPribadiService;

    public int updateProfile(DPribadi data) {
        int result = FAILED;

        if (accountService.isAccountExist(data.getAccount().getUsername())) {
            Account account = accountService.findByUsername(data.getAccount().getUsername());

            if (dataPribadiService.isDataPribadiExist(account)){
                dataPribadiService.save(data);
                result = SUCCESS;
            }
        }

        return result;
    }
}
