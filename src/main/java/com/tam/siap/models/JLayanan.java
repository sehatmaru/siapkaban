package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Builder
@Entity
@Table(name = "jenis_layanan", schema = "public")
@DynamicUpdate
public class JLayanan {

	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="keterangan")
	private String keterangan;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "id_jenis_perusahaan", referencedColumnName = "id")
	private JPerusahaan perusahaan;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "id_jenis_fasilitas", referencedColumnName = "id")
	private JFasilitas fasilitas;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "id_jenis_pengelola", referencedColumnName = "id")
	private JPengelola pengelola;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "id_jenis_penimbunan", referencedColumnName = "id")
	private JPenimbunan penimbunan;

	public JLayanan() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JPerusahaan getPerusahaan() {
		return perusahaan;
	}

	public void setPerusahaan(JPerusahaan perusahaan) {
		this.perusahaan = perusahaan;
	}

	public JFasilitas getFasilitas() {
		return fasilitas;
	}

	public void setFasilitas(JFasilitas fasilitas) {
		this.fasilitas = fasilitas;
	}

	public JPengelola getPengelola() {
		return pengelola;
	}

	public void setPengelola(JPengelola pengelola) {
		this.pengelola = pengelola;
	}

	public JPenimbunan getPenimbunan() {
		return penimbunan;
	}

	public void setPenimbunan(JPenimbunan penimbunan) {
		this.penimbunan = penimbunan;
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
