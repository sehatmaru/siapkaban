package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.DataPerusahaanService;
import com.tam.siap.services.master.DataPribadiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.tam.siap.utils.refs.Status.FAILED;
import static com.tam.siap.utils.refs.Status.SUCCESS;

@Service
public class AuthService {

    @Autowired
    AccountService accountService;

    @Autowired
    DataPribadiService dataPribadiService;

    @Autowired
    DataPerusahaanService dataPerusahaanService;

    public LoginResponse login(String username, String password){
        LoginResponse response = new LoginResponse();
        response.setCode(FAILED);

        if (accountService.isAccountExist(username, password)){
            if (accountService.isAccountActive(username)) {
                Account account = accountService.findByUsername(username);

                response.setCode(SUCCESS);
                response.setAccount(account);
                response.setDataPribadi(dataPribadiService.findDataPribadiByAccount(account));
                response.setDataPerusahaan(dataPerusahaanService.findDataPerusahaanByAccount(account));
            }
        }

        return response;
    }
}
