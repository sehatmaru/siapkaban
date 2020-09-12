package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.DataPerusahaanService;
import com.tam.siap.services.master.DataPribadiService;
import com.tam.siap.utils.TamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.tam.siap.utils.refs.Status.FAILED;
import static com.tam.siap.utils.refs.Status.SUCCESS;

@Service
public class AuthBEService {

    @Autowired
    AccountService accountService;

    @Autowired
    DataPribadiService dataPribadiService;

    @Autowired
    DataPerusahaanService dataPerusahaanService;

    public LoginResponse login(String username, String password){
        LoginResponse response = new LoginResponse();
        response.setCode(FAILED);

        if (accountService.isAccountExist(username)){
            if (accountService.isAccountActive(username)) {
                Account account = accountService.findByUsername(username);

                if (password.equals(TamUtils.decrypt(account.getPassword()))) {
                    response.setCode(SUCCESS);
                    response.setAccount(account);
                }
            }
        }

        return response;
    }
}
