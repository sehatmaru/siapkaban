package com.tam.siap.services;

import com.tam.siap.models.*;
import com.tam.siap.services.master.DataPerusahaanService;
import com.tam.siap.services.master.DataPribadiService;
import com.tam.siap.services.master.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.tam.siap.utils.refs.Status.*;

@Service
public class RegisterService {

    @Autowired
    AccountService accountService;

    @Autowired
    DataPerusahaanService dataPerusahaanService;

    @Autowired
    DataPribadiService dataPribadiService;

    public int register(Account account, DPribadi dPribadi, DPerusahaan dPerusahaan){
        int result = FAILED;

        if (!accountService.isAccountExist(account.getUsername(), account.getRole())){
            if (addUser(account) == SUCCESS){
                if (addDataPribadi(account.getUsername(), dPribadi) == SUCCESS){
                    if (addDataPerusahaan(account.getUsername(), dPerusahaan) == SUCCESS) result = SUCCESS;
                }
            }
        }

        return result;
    }

    private int addUser(Account account){
        account.setStatus(INACTIVE);

        accountService.save(account);

        if (accountService.isAccountExist(account.getUsername(), account.getRole())) return SUCCESS;
        else return FAILED;
    }

    private int addDataPribadi(String username, DPribadi dPribadi){
        Account account = accountService.findByUsername(username);
        dPribadi.setAccount(account);

        dataPribadiService.save(dPribadi);

        if (dataPribadiService.isDataPribadiExist(account)) return SUCCESS;
        else return FAILED;
    }

    private int addDataPerusahaan(String username, DPerusahaan dPerusahaan){
        Account account = accountService.findByUsername(username);
        dPerusahaan.setAccount(account);

        dataPerusahaanService.save(dPerusahaan);

        if (dataPerusahaanService.isDataPerusahaanExist(account)) return SUCCESS;
        else return FAILED;
    }
}
