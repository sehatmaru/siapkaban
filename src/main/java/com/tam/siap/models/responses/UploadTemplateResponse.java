package com.tam.siap.models.responses;

import java.io.File;

public class UploadTemplateResponse {

    private int status;
    private File file;

    public UploadTemplateResponse(int status, File file) {
        this.status = status;
        this.file = file;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }
}
