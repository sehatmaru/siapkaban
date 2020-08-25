package com.tam.siap.models;

public class StatusLayanan {
    private String accountId;
    private String tanggal;
    private String status;
    private String catatan;

    public StatusLayanan() {
    }

    public StatusLayanan(String accountId, String tanggal, String status, String catatan) {
        this.accountId = accountId;
        this.tanggal = tanggal;
        this.status = status;
        this.catatan = catatan;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getTanggal() {
        return tanggal;
    }

    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCatatan() {
        return catatan;
    }

    public void setCatatan(String catatan) {
        this.catatan = catatan;
    }
}
