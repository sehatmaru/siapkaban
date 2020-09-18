package com.tam.siap.models.responses;

public class UploadTemplateResponse {

    private int status;
    private String html;

    public UploadTemplateResponse(int status, String html) {
        this.status = status;
        this.html = html;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getHtml() {
        return html;
    }

    public void setHtml(String html) {
        this.html = html;
    }
}
