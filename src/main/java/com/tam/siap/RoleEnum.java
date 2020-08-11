package com.tam.siap;

public enum RoleEnum {
	
	/*
	public static final String STATUS_BARU = "baru";
	public static final String STATUS_DISPOSISI_STAFF = "disposisistaf";
	public static final String STATUS_DISPOSISI_KEPALA_SEKSI = "disposisikepalaseksi";
	public static final String STATUS_DISPOSISI_KEPALA_BIDANG = "disposisikepalabidang";
	public static final String STATUS_DISPOSISI_KEPALA_KANTOR = "disposisikepalakantor";
	*/
	
	ROLE_PENERIMA_DOC("picpenerimadokumen", "Pic Penerima Dokumen"), 
	ROLE_PIC_STAFF("picstaff", "Pic Staf"), 
	ROLE_PIC_KEPALA_SEKSI("pickepalaseksi", "Pic Kepala Seksi"), 
	ROLE_PIC_KEPALA_BIDANG("pickepalabidang", "Pic Kepala Bidang"),
	ROLE_PIC_KEPALA_KANTOR("pickepalakantor", "Pic Kepala Kantor"),
	
	ROLE_PIC_STAFFP2("picstaffp2", "Pic Staf P2"), 
	ROLE_PIC_KEPALA_SEKSIP2("pickepalaseksip2", "Pic Kepala Seksi P2"), 
	ROLE_PIC_KEPALA_BIDANGP2("pickepalabidangp2", "Pic Kepala Bidang P2"),
	ROLE_PIC_KEPALA_KANTORP2("pickepalakantorp2", "Pic Kepala Kantor P2");
 
    private String key;
    private String label; 
 
    RoleEnum(String key, String label) {
        this.key = key;
        this.label = label;
    }
 
    public String getLabel() {
    	return label;
    }
    
    public String getKey() {
    	return key;
    }
	

}
