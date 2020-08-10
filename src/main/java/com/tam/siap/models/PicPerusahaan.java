package com.tam.siap.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="po_pic_perusahaan")
public class PicPerusahaan implements Serializable{
	
	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name="namapic")
	private String nama;
	
	@Column(name="jabatan")
	private String jabatan;

	@Column(name="email")
	private String email;

	@Column(name="handphone")
	private String handphone;
	
	@Column(name="ktp")
	private String ktp;
	
	@Column(name="password")
	private String password;
	
	@Column(name="perusahaanid")
	private Long perusahaanid;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="perusahaanid", referencedColumnName="id", insertable = false, updatable = false, nullable=true)
	private Perusahaan perusahaan;

	public PicPerusahaan() {
		super();
	}

	public PicPerusahaan(String nama, String jabatan, String email, String handphone, String ktp,
			Long perusahaanid, String password) {
		super();
		this.nama = nama;
		this.jabatan = jabatan;
		this.email = email;
		this.handphone = handphone;
		this.ktp = ktp;
		this.perusahaanid = perusahaanid;
		this.password = password;
	}

	public long getId() {
		return id;
	}

	public String getNama() {
		return nama;
	}

	public String getJabatan() {
		return jabatan;
	}

	public String getEmail() {
		return email;
	}

	public String getHandphone() {
		return handphone;
	}

	public String getKtp() {
		return ktp;
	}

	public Long getPerusahaanid() {
		return perusahaanid;
	}

	public Perusahaan getPerusahaan() {
		return perusahaan;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public void setJabatan(String jabatan) {
		this.jabatan = jabatan;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setHandphone(String handphone) {
		this.handphone = handphone;
	}

	public void setKtp(String ktp) {
		this.ktp = ktp;
	}

	public void setPerusahaanid(Long perusahaanid) {
		this.perusahaanid = perusahaanid;
	}

	public void setPerusahaan(Perusahaan perusahaan) {
		this.perusahaan = perusahaan;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	

}
