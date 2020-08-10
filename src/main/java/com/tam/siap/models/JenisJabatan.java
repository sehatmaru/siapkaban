package com.tam.siap.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "po_jenisjabatan")
public class JenisJabatan {

	@Id
	@Column(name = "id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
//	

	@Column(name = "nama")
	private String nama;

	@Column(name = "jenispic")
	private String jenispic;

	public JenisJabatan() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JenisJabatan(Long id, String nama, String jenispic) {
		super();
		this.id = id;
		this.nama = nama;
		this.jenispic = jenispic;
	}

	public Long getId() {
		return id;
	}

	public String getNama() {
		return nama;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public String getJenispic() {
		return jenispic;
	}

	public void setJenispic(String jenispic) {
		this.jenispic = jenispic;
	}

}
