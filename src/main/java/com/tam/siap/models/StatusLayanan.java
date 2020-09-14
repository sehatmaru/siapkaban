package com.tam.siap.models;

public class StatusLayanan {
    private String accountId;
    private String tanggal;
    private String progress;
    private String status;
    private String catatan;
    private Account nextPic;

    public StatusLayanan() {
    }

    public StatusLayanan(String accountId, String tanggal, String progress, String status, String catatan, Account nextPic) {
        this.accountId = accountId;
        this.tanggal = tanggal;
        this.progress = progress;
        this.status = status;
        this.catatan = catatan;
        this.nextPic = nextPic;
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

    public Account getNextPic() {
        return nextPic;
    }

    public void setNextPic(Account nextPic) {
        this.nextPic = nextPic;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }
}
