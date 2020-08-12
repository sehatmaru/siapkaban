package com.tam.siap.models.responses;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.models.DPribadi;

public class AccountListResponse {

    private Account account;
    private DPribadi dataPribadi;
    private DPerusahaan dataPerusahaan;

    @Override
    public String toString() {
        return "AccountListResponse{" +
                ", account=" + account +
                ", dataPribadi=" + dataPribadi +
                ", dataPerusahaan=" + dataPerusahaan +
                '}';
    }

    public AccountListResponse() {
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
