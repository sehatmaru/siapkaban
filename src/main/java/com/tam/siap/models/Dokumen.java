package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Builder
@DynamicUpdate
@Table(name="dokumen", schema = "public")
public class Dokumen {

	@Id
	@Column(name = "id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "nama_dokumen")
	private String namaDokumen;

	@Column(name = "path")
	private String path;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "jenis_dokumen", referencedColumnName = "id")
	private JDokumen jenisDokumen;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "pemohon", referencedColumnName = "id")
	private Account pemohon;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "layanan", referencedColumnName = "id")
	private Layanan layanan;

	@Column(name="status")
	private int status;

	public Dokumen() {
	}

	public Dokumen(String namaDokumen, String path, JDokumen jenisDokumen, Account pemohon, int status) {
		this.namaDokumen = namaDokumen;
		this.path = path;
		this.jenisDokumen = jenisDokumen;
		this.pemohon = pemohon;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNamaDokumen() {
		return namaDokumen;
	}

	public void setNamaDokumen(String namaDokumen) {
		this.namaDokumen = namaDokumen;
	}

	public String getPath() {
		return path;
	}

	public Layanan getLayanan() {
		return layanan;
	}

	public void setLayanan(Layanan layanan) {
		this.layanan = layanan;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public JDokumen getJenisDokumen() {
		return jenisDokumen;
	}

	public void setJenisDokumen(JDokumen jenisDokumen) {
		this.jenisDokumen = jenisDokumen;
	}

	public Account getPemohon() {
		return pemohon;
	}

	public void setPemohon(Account pemohon) {
		this.pemohon = pemohon;
	}
}
