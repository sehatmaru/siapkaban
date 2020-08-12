package com.tam.siap.services;

import com.tam.siap.services.master.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.tam.siap.utils.refs.Status.FAILED;
import static com.tam.siap.utils.refs.Status.SUCCESS;

@Service
public class LoginService {

    @Autowired
    AccountService accountService;

    public int login(String username, String password){
        int result = FAILED;

        if (accountService.isAccountExist(username, password)){
            if (accountService.isAccountActive(username)) result = SUCCESS;
        }

        return result;
    }
}
