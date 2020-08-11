package com.tam.siap.models;

import javax.persistence.*;

@Entity
@Table(name="data_pribadi")
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

	@Column(name="user")
	private int user;

	@Column(name="j_identitas")
	private int jenis;

	public DPribadi(String nama, String nomor, String jabatan, String telepon, String email, int user, int jenis) {
		this.nama = nama;
		this.nomor = nomor;
		this.jabatan = jabatan;
		this.telepon = telepon;
		this.email = email;
		this.user = user;
		this.jenis = jenis;
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

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	public int getJenis() {
		return jenis;
	}

	public void setJenis(int jenis) {
		this.jenis = jenis;
	}
}