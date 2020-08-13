package com.tam.siap.models.request;

public class EditProfileRequest {

    private String nama;
    private String email;
    private String password;
    private String gambar;
    private String nomor;

    private String username;

    public EditProfileRequest() {

    }

    public EditProfileRequest(String nama, String email, String password, String gambar, String nomor, String username) {
        this.nama = nama;
        this.email = email;
        this.password = password;
        this.gambar = gambar;
        this.nomor = nomor;
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNama() {
        return nama;
    }

    public String setNama(String nama) {
        this.nama = nama;
        return nama;
    }

    public String getEmail() {
        return email;
    }

    public String setEmail(String email) {
        this.email = email;
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String setPassword(String password) {
        this.password = password;
        return password;
    }

    public String getGambar() {
        return gambar;
    }

    public String setGambar(String gambar) {
        this.gambar = gambar;
        return gambar;
    }

    public String getNomor() {
        return nomor;
    }

    public String setNomor(String nomor) {
        this.nomor = nomor;
        return nomor;
    }
}
