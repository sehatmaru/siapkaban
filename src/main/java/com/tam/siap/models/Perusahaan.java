package com.tam.siap.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "po_perusahaan")
public class Perusahaan implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	private Long id;

	@Column(name = "npwpperusahaan")
	private String npwpperusahaan;

	@Column(name = "namaperusahaan")
	private String namaperusahaan;

	@Column(name = "jenisperusahaanid")
	private Long jenisperusahaanid;

	@Column(name = "alamat")
	private String alamat;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "jenisperusahaanid", referencedColumnName = "id", insertable = false, updatable = false, nullable = true)
	private JenisPerusahaan jenisPerusahaan;

	@Column(name = "picstafid")
	private Long picstafid;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "picstafid", referencedColumnName = "id", insertable = false, updatable = false, nullable = true)
	private Pic picStaff;

	public Perusahaan(long id, String npwpperusahaan, String namaperusahaan, Long jenisperusahaanid, String alamat) {
		super();
		this.id = id;
		this.npwpperusahaan = npwpperusahaan;
		this.namaperusahaan = namaperusahaan;
		this.jenisperusahaanid = jenisperusahaanid;
		this.alamat = alamat;
	}

	public Perusahaan() {
		super();
	}

	public String getNpwpperusahaan() {
		return npwpperusahaan;
	}

	public String getNamaperusahaan() {
		return namaperusahaan;
	}

	public String getAlamat() {
		return alamat;
	}

	public JenisPerusahaan getJenisPerusahaan() {
		return jenisPerusahaan;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNpwpperusahaan(String npwpperusahaan) {
		this.npwpperusahaan = npwpperusahaan;
	}

	public void setNamaperusahaan(String namaperusahaan) {
		this.namaperusahaan = namaperusahaan;
	}

	public Long getJenisperusahaanid() {
		return jenisperusahaanid;
	}

	public void setJenisperusahaanid(Long jenisperusahaanid) {
		this.jenisperusahaanid = jenisperusahaanid;
	}

	public void setAlamat(String alamat) {
		this.alamat = alamat;
	}

	public void setJenisPerusahaan(JenisPerusahaan jenisPerusahaan) {
		this.jenisPerusahaan = jenisPerusahaan;
	}

	public Long getPicstafid() {
		return picstafid;
	}

	public Pic getPicStaff() {
		return picStaff;
	}

	public void setPicstafid(Long picstafid) {
		this.picstafid = picstafid;
	}

	public void setPicStaff(Pic picStaff) {
		this.picStaff = picStaff;
	}

}
