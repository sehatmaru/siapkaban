package com.tam.siap.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="po_kppbc")
public class KPPBeaCukai  {

	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="nama")
	private String nama;

	public KPPBeaCukai() {
		super();
		// TODO Auto-generated constructor stub
	}

	public KPPBeaCukai(Long id, String nama) {
		super();
		this.id = id;
		this.nama = nama;
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

	
	
}
