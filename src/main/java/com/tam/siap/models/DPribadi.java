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
	@JoinColumn(name = "account", referencedColumnName = "id")
	private Account account;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "j_identitas", referencedColumnName = "id")
	private JIdentitas jenis;

	@Column(name = "gambar")
	private String gambar;

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

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
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
}
