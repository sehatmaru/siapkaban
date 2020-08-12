package com.tam.siap.utils.refs;

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
	ROLE_PIC_KEPALA_KANTOR("pickepalakantor", "Pic Kepala Kantor");
 
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
