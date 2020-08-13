package com.tam.siap.models.responses;

import com.tam.siap.models.Account;

public class LoginResponse {

    private int code;
    private Account account;


    public LoginResponse() {
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}
