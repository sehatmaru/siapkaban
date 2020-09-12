package com.tam.siap.models.request;

public class InsertPegawaiRequest {

    private String nama;
    private String nip;
    private String eselon2;
    private String eselon3;
    private String eselon4;
    private String jabatan;
    private int role;
    private int lokasi;

    public InsertPegawaiRequest(String nama, String nip, String eselon2, String eselon3, String eselon4, String jabatan, int role, int lokasi) {
        this.nama = nama;
        this.nip = nip;
        this.eselon2 = eselon2;
        this.eselon3 = eselon3;
        this.eselon4 = eselon4;
        this.jabatan = jabatan;
        this.role = role;
        this.lokasi = lokasi;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getNip() {
        return nip;
    }

    public void setNip(String nip) {
        this.nip = nip;
    }

    public String getEselon2() {
        return eselon2;
    }

    public void setEselon2(String eselon2) {
        this.eselon2 = eselon2;
    }

    public String getEselon3() {
        return eselon3;
    }

    public void setEselon3(String eselon3) {
        this.eselon3 = eselon3;
    }

    public String getEselon4() {
        return eselon4;
    }

    public void setEselon4(String eselon4) {
        this.eselon4 = eselon4;
    }

    public String getJabatan() {
        return jabatan;
    }

    public void setJabatan(String jabatan) {
        this.jabatan = jabatan;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getLokasi() {
        return lokasi;
    }

    public void setLokasi(int lokasi) {
        this.lokasi = lokasi;
    }
}
