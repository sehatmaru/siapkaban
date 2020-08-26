package com.tam.siap.models.responses;

import com.tam.siap.models.Account;
import com.tam.siap.models.Dokumen;
import com.tam.siap.models.Layanan;
import com.tam.siap.models.SJLayanan;

import java.util.List;

public class LayananResponse {

    private Account account;
    private SJLayanan sjLayanan;
    private Layanan layanan;
    private Dokumen dokumen;

    public LayananResponse() {

    }

    public LayananResponse(Account account, SJLayanan sjLayanan, Layanan layanan, Dokumen dokumen) {
        this.account = account;
        this.sjLayanan = sjLayanan;
        this.layanan = layanan;
        this.dokumen = dokumen;
    }

    @Override
    public String toString() {
        return "LayananResponse{" +
                "account=" + account +
                ", sjLayanan=" + sjLayanan +
                ", layanan=" + layanan +
                ", dokumen=" + dokumen +
                '}';
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public SJLayanan getSjLayanan() {
        return sjLayanan;
    }

    public void setSjLayanan(SJLayanan sjLayanan) {
        this.sjLayanan = sjLayanan;
    }

    public Layanan getLayanan() {
        return layanan;
    }

    public void setLayanan(Layanan layanan) {
        this.layanan = layanan;
    }

    public Dokumen getDokumen() {
        return dokumen;
    }

    public void setDokumen(Dokumen dokumen) {
        this.dokumen = dokumen;
    }
}
