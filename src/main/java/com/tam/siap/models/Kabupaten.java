package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Builder
@DynamicUpdate
@Table(name="kabupaten", schema = "public")
public class Kabupaten {

	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="keterangan")
	private String keterangan;

	@Column(name="j_lokasi")
	private int lokasi;

	public Kabupaten() {
	}

	public Kabupaten(String keterangan, int lokasi) {
		this.keterangan = keterangan;
		this.lokasi = lokasi;
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

	public int getLokasi() {
		return lokasi;
	}

	public void setLokasi(int lokasi) {
		this.lokasi = lokasi;
	}
}
