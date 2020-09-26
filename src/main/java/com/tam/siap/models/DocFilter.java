package com.tam.siap.models;

import java.io.File;

public class DocFilter {

    private JDokumen jenisDokumen;
    private File file;
    private int status;

    public DocFilter(JDokumen jenisDokumen, File file, int status) {
        this.jenisDokumen = jenisDokumen;
        this.file = file;
        this.status = status;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public JDokumen getJenisDokumen() {
        return jenisDokumen;
    }

    public void setJenisDokumen(JDokumen jenisDokumen) {
        this.jenisDokumen = jenisDokumen;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
