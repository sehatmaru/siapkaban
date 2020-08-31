package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Builder
@DynamicUpdate
@Table(name="kecamatan", schema = "public")
public class Kecamatan {

	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="keterangan")
	private String keterangan;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "kabupaten", referencedColumnName = "id")
	private Kabupaten kabupaten;

	public Kecamatan() {
	}

	public Kecamatan(String keterangan, Kabupaten kabupaten) {
		this.keterangan = keterangan;
		this.kabupaten = kabupaten;
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

	public Kabupaten getKabupaten() {
		return kabupaten;
	}

	public void setKabupaten(Kabupaten kabupaten) {
		this.kabupaten = kabupaten;
	}
}
