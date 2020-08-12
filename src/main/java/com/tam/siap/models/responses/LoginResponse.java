package com.tam.siap.models.responses;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.models.DPribadi;

public class LoginResponse {

    private int code;
    private Account account;
    private DPribadi dataPribadi;
    private DPerusahaan dataPerusahaan;

    @Override
    public String toString() {
        return "LoginResponse{" +
                "code=" + code +
                ", account=" + account +
                ", dataPribadi=" + dataPribadi +
                ", dataPerusahaan=" + dataPerusahaan +
                '}';
    }

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

    public DPribadi getDataPribadi() {
        return dataPribadi;
    }

    public void setDataPribadi(DPribadi dataPribadi) {
        this.dataPribadi = dataPribadi;
    }

    public DPerusahaan getDataPerusahaan() {
        return dataPerusahaan;
    }

    public void setDataPerusahaan(DPerusahaan dataPerusahaan) {
        this.dataPerusahaan = dataPerusahaan;
    }
}
