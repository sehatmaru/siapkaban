package com.tam.siap.models.responses;

import com.tam.siap.models.JDokumen;

import java.util.List;

public class DokumenListResponse {

    private List<JDokumen> permohonan;
    private List<JDokumen> persyaratan;
    private List<JDokumen> lainnya;

    public DokumenListResponse() {
    }

    public DokumenListResponse(List<JDokumen> permohonan, List<JDokumen> persyaratan, List<JDokumen> lainnya) {
        this.permohonan = permohonan;
        this.persyaratan = persyaratan;
        this.lainnya = lainnya;
    }

    public List<JDokumen> getPermohonan() {
        return permohonan;
    }

    public void setPermohonan(List<JDokumen> permohonan) {
        this.permohonan = permohonan;
    }

    public List<JDokumen> getPersyaratan() {
        return persyaratan;
    }

    public void setPersyaratan(List<JDokumen> persyaratan) {
        this.persyaratan = persyaratan;
    }

    public List<JDokumen> getLainnya() {
        return lainnya;
    }

    public void setLainnya(List<JDokumen> lainnya) {
        this.lainnya = lainnya;
    }
}
