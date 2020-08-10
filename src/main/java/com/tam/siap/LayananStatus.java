package com.tam.siap;

public enum LayananStatus {

	/*
	 * public static final String STATUS_BARU = "baru"; public static final String
	 * STATUS_DISPOSISI_STAFF = "disposisistaf"; public static final String
	 * STATUS_DISPOSISI_KEPALA_SEKSI = "disposisikepalaseksi"; public static final
	 * String STATUS_DISPOSISI_KEPALA_BIDANG = "disposisikepalabidang"; public
	 * static final String STATUS_DISPOSISI_KEPALA_KANTOR = "disposisikepalakantor";
	 */

	STATUS_BARU("baru", "Baru"), STATUS_DISPOSISI_STAFF("disposisistaf", "Disposisi Staf"),
	STATUS_DISPOSISI_KEPALA_SEKSI("disposisikepalaseksi", "Disposisi Kepala Seksi"),
	STATUS_DISPOSISI_KEPALA_BIDANG("disposisikepalabidang", "Disposisi Kepala Bidang"),
	STATUS_DISPOSISI_KEPALA_KANTOR("disposisikepalakantor", "Disposisi Kepala Kantor"), 
	SETUJU("setuju", "Di setujui"),TOLAK("tolak", "Ditolak");

	private String key;
	private String label;

	LayananStatus(String key, String label) {
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
