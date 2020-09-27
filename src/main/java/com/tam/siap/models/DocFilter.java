package com.tam.siap.models;

import java.io.File;

public class DocFilter {

    private JDokumen jenisDokumen;
    private File filePreview;
    private File fileDownload;
    private int status;

    public DocFilter(JDokumen jenisDokumen, File filePreview, File fileDownload, int status) {
        this.jenisDokumen = jenisDokumen;
        this.filePreview = filePreview;
        this.fileDownload = fileDownload;
        this.status = status;
    }

    public JDokumen getJenisDokumen() {
        return jenisDokumen;
    }

    public void setJenisDokumen(JDokumen jenisDokumen) {
        this.jenisDokumen = jenisDokumen;
    }

    public File getFilePreview() {
        return filePreview;
    }

    public void setFilePreview(File filePreview) {
        this.filePreview = filePreview;
    }

    public File getFileDownload() {
        return fileDownload;
    }

    public void setFileDownload(File fileDownload) {
        this.fileDownload = fileDownload;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
