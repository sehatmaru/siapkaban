package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Builder
@Entity
@Table(name = "data_perusahaan", schema = "public")
@DynamicUpdate
public class DPerusahaan {

	@Id
	@Column(name = "id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "nama")
	private String nama;

	@Column(name = "npwp")
	private String npwp;

	@Column(name = "alamat")
	private String alamat;

	@Column(name = "telepon")
	private String telepon;

	@Column(name = "email")
	private String email;

	@Column(name = "status")
	private int status;

	@Column(name = "komoditi_utama")
	private String komoditi;

	@Column(name = "no_skep")
	private String nomorSkep;

	@Column(name = "tgl_skep")
	private String tanggalSkep;

	@Column(name = "penanggung_jawab")
	private String penanggungJawab;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "j_perusahaan", referencedColumnName = "id")
	private JPerusahaan jenis;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "kecamatan", referencedColumnName = "id")
	private Kecamatan kecamatan;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "kabupaten", referencedColumnName = "id")
	private Kabupaten kabupaten;

	public DPerusahaan() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNama() {
		return nama;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public String getNpwp() {
		return npwp;
	}

	public void setNpwp(String npwp) {
		this.npwp = npwp;
	}

	public String getAlamat() {
		return alamat;
	}

	public void setAlamat(String alamat) {
		this.alamat = alamat;
	}

	public String getTelepon() {
		return telepon;
	}

	public void setTelepon(String telepon) {
		this.telepon = telepon;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public JPerusahaan getJenis() {
		return jenis;
	}

	public void setJenis(JPerusahaan jenis) {
		this.jenis = jenis;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getKomoditi() {
		return komoditi;
	}

	public void setKomoditi(String komoditi) {
		this.komoditi = komoditi;
	}

	public String getNomorSkep() {
		return nomorSkep;
	}

	public void setNomorSkep(String nomorSkep) {
		this.nomorSkep = nomorSkep;
	}

	public String getTanggalSkep() {
		return tanggalSkep;
	}

	public void setTanggalSkep(String tanggalSkep) {
		this.tanggalSkep = tanggalSkep;
	}

	public String getPenanggungJawab() {
		return penanggungJawab;
	}

	public void setPenanggungJawab(String penanggungJawab) {
		this.penanggungJawab = penanggungJawab;
	}

	public Kecamatan getKecamatan() {
		return kecamatan;
	}

	public void setKecamatan(Kecamatan kecamatan) {
		this.kecamatan = kecamatan;
	}

	public Kabupaten getKabupaten() {
		return kabupaten;
	}

	public void setKabupaten(Kabupaten kabupaten) {
		this.kabupaten = kabupaten;
	}

	public DPerusahaan(String nama, String npwp, String alamat, String telepon, String email, JPerusahaan jenis,
					   String penanggungJawab, Kecamatan kecamatan, Kabupaten kabupaten) {
		this.nama = nama;
		this.npwp = npwp;
		this.alamat = alamat;
		this.telepon = telepon;
		this.email = email;
		this.jenis = jenis;
		this.penanggungJawab = penanggungJawab;
		this.kecamatan = kecamatan;
		this.kabupaten = kabupaten;
	}
}
