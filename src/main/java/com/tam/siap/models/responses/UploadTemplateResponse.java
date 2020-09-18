package com.tam.siap.models.responses;

public class UploadTemplateResponse {

    private int status;
    private String path;

    public UploadTemplateResponse(int status, String path) {
        this.status = status;
        this.path = path;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
