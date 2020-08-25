package com.tam.siap.models.responses;

import com.tam.siap.models.Dokumen;

import java.io.File;

public class ViewDokumenResponse {

    private Dokumen dokumen;
    private File file;

    public ViewDokumenResponse() {
    }

    public ViewDokumenResponse(Dokumen dokumen, File file) {
        this.dokumen = dokumen;
        this.file = file;
    }

    public Dokumen getDokumen() {
        return dokumen;
    }

    public void setDokumen(Dokumen dokumen) {
        this.dokumen = dokumen;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }
}
