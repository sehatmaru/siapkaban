package com.tam.siap.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="po_dokumen")
public class Dokumen {

	@Id
	@Column(name="id")
	private long id;
	
	@Column(name="layananid")
	private Long layananid;
	
	@Column(name="syaratadministrasiid")
	private long syaratadministrasiid;
	
	@Column(name="fullpath")
	private String fullpath;
	
	@Column(name="seq")
	private int seq;
	
	@Column(name="filename")
	private String filename;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="syaratadministrasiid", referencedColumnName="id", insertable = false, updatable = false, nullable=true)
	private SyaratAdministrasi syaratAdministrasi;

	public Dokumen() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Dokumen(long id, Long layananid, long syaratadministrasiid, String fullpath, String filename, int seq) {
		super();
		this.id = id;
		this.layananid = layananid;
		this.syaratadministrasiid = syaratadministrasiid;
		this.fullpath = fullpath;
		this.filename = filename;
		this.seq = seq;
	}


	public long getId() {
		return id;
	}

	public Long getLayananid() {
		return layananid;
	}

	public long getSyaratadministrasiid() {
		return syaratadministrasiid;
	}

	public String getFullpath() {
		return fullpath;
	}

	public String getFilename() {
		return filename;
	}

	public SyaratAdministrasi getSyaratAdministrasi() {
		return syaratAdministrasi;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setLayananid(Long layananid) {
		this.layananid = layananid;
	}

	public void setSyaratadministrasiid(long syaratadministrasiid) {
		this.syaratadministrasiid = syaratadministrasiid;
	}

	public void setFullpath(String fullpath) {
		this.fullpath = fullpath;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public void setSyaratAdministrasi(SyaratAdministrasi syaratAdministrasi) {
		this.syaratAdministrasi = syaratAdministrasi;
	}


	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	
}
