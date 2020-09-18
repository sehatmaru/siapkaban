package com.tam.siap.models;

import com.tam.siap.models.JDokumen;

public class DocFilter {

    private JDokumen jenisDokumen;
    private int status;

    public DocFilter(JDokumen jenisDokumen, int status) {
        this.jenisDokumen = jenisDokumen;
        this.status = status;
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
