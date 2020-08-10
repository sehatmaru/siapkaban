package com.tam.siap.models;

public class ModelStatusLayanan {

	private String nomor;
	private String tanggal;
	private String jenislayanan;
	private String fasilitas;
	private String janjilayanan;
	private String penerimadok;
	private String picstaf;
	private String pickplseksi;
	private String pickplbidang;
	private String pickplkantor;
	private String ket;
	private String namapt;

	public ModelStatusLayanan(String nomor, String tanggal, String jenislayanan, String fasilitas, String janjilayanan,
			String penerimadok, String picstaf, String pickplseksi, String pickplbidang, String pickplkantor,
			String ket, String namapt) {
		super();
		this.nomor = nomor;
		this.tanggal = tanggal;
		this.jenislayanan = jenislayanan;
		this.fasilitas = fasilitas;
		this.janjilayanan = janjilayanan;
		this.penerimadok = penerimadok;
		this.picstaf = picstaf;
		this.pickplseksi = pickplseksi;
		this.pickplbidang = pickplbidang;
		this.pickplkantor = pickplkantor;
		this.ket = ket;
		this.namapt = namapt;
	}

	public String getNomor() {
		return nomor;
	}

	public void setNomor(String nomor) {
		this.nomor = nomor;
	}

	public String getTanggal() {
		return tanggal;
	}

	public void setTanggal(String tanggal) {
		this.tanggal = tanggal;
	}

	public String getJenislayanan() {
		return jenislayanan;
	}

	public void setJenislayanan(String jenislayanan) {
		this.jenislayanan = jenislayanan;
	}

	public String getFasilitas() {
		return fasilitas;
	}

	public void setFasilitas(String fasilitas) {
		this.fasilitas = fasilitas;
	}

	public String getJanjilayanan() {
		return janjilayanan;
	}

	public void setJanjilayanan(String janjilayanan) {
		this.janjilayanan = janjilayanan;
	}

	public String getPenerimadok() {
		return penerimadok;
	}

	public void setPenerimadok(String penerimadok) {
		this.penerimadok = penerimadok;
	}

	public String getPicstaf() {
		return picstaf;
	}

	public void setPicstaf(String picstaf) {
		this.picstaf = picstaf;
	}

	public String getPickplseksi() {
		return pickplseksi;
	}

	public void setPickplseksi(String pickplseksi) {
		this.pickplseksi = pickplseksi;
	}

	public String getPickplbidang() {
		return pickplbidang;
	}

	public void setPickplbidang(String pickplbidang) {
		this.pickplbidang = pickplbidang;
	}

	public String getPickplkantor() {
		return pickplkantor;
	}

	public void setPickplkantor(String pickplkantor) {
		this.pickplkantor = pickplkantor;
	}

	public String getKet() {
		return ket;
	}

	public void setKet(String ket) {
		this.ket = ket;
	}

	public String getNamapt() {
		return namapt;
	}

	public void setNamapt(String namapt) {
		this.namapt = namapt;
	}

}
