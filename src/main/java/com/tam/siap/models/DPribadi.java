package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Builder
@Entity
@Table(name = "data_pribadi", schema = "public")
@DynamicUpdate
public class DPribadi {

	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="nama")
	private String nama;

	@Column(name="n_identitas")
	private String nomor;

	@Column(name="jabatan")
	private String jabatan;

	@Column(name="telepon")
	private String telepon;

	@Column(name="email")
	private String email;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "j_identitas", referencedColumnName = "id")
	private JIdentitas jenis;

	@Column(name = "gambar")
	private String gambar;

	@Column(name = "eselon_2")
	private String eselon2;

	@Column(name = "eselon_3")
	private String eselon3;

	@Column(name = "eselon_4")
	private String eselon4;

	public DPribadi() {
	}

	public DPribadi(String nama, String nomor, String jabatan, String telepon, String email, JIdentitas jenis) {
		this.nama = nama;
		this.nomor = nomor;
		this.jabatan = jabatan;
		this.telepon = telepon;
		this.email = email;
		this.jenis = jenis;
	}

	public String getGambar() {
		return gambar;
	}

	public void setGambar(String gambar) {
		this.gambar = gambar;
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

	public String getNomor() {
		return nomor;
	}

	public void setNomor(String nomor) {
		this.nomor = nomor;
	}

	public String getJabatan() {
		return jabatan;
	}

	public void setJabatan(String jabatan) {
		this.jabatan = jabatan;
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

	public JIdentitas getJenis() {
		return jenis;
	}

	public void setJenis(JIdentitas jenis) {
		this.jenis = jenis;
	}

	public String getEselon2() {
		return eselon2;
	}

	public void setEselon2(String eselon2) {
		this.eselon2 = eselon2;
	}

	public String getEselon3() {
		return eselon3;
	}

	public void setEselon3(String eselon3) {
		this.eselon3 = eselon3;
	}

	public String getEselon4() {
		return eselon4;
	}

	public void setEselon4(String eselon4) {
		this.eselon4 = eselon4;
	}
}
