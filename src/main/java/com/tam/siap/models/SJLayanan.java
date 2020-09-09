package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Builder
@Entity
@Table(name = "sub_jenis_layanan", schema = "public")
@DynamicUpdate
public class SJLayanan {

	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="keterangan")
	private String keterangan;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "id_jenis_layanan", referencedColumnName = "id")
	private JLayanan layanan;

	public JLayanan getLayanan() {
		return layanan;
	}

	@Column(name="pengawas")
	private int pengawas;

	public void setLayanan(JLayanan layanan) {
		this.layanan = layanan;
	}

	public SJLayanan() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getKeterangan() {
		return keterangan;
	}

	public void setKeterangan(String keterangan) {
		this.keterangan = keterangan;
	}

	public int getPengawas() {
		return pengawas;
	}

	public void setPengawas(int pengawas) {
		this.pengawas = pengawas;
	}
}
