package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Builder
@Entity
@Table(name = "jenis_penimbunan", schema = "public")
@DynamicUpdate
public class JPenimbunan {

	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="keterangan")
	private String keterangan;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "id_jenis_perusahaan", referencedColumnName = "id")
	private JPerusahaan perusahaan;

	public JPerusahaan getPerusahaan() {
		return perusahaan;
	}

	public void setPerusahaan(JPerusahaan perusahaan) {
		this.perusahaan = perusahaan;
	}

	public JPenimbunan() {
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
}
