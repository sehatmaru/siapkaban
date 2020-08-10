package com.tam.siap.models;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="po_role")
public class Role {
	
	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="kode")
	private String kode;
	
	@Column(name="nama")
	private String nama;

	
	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}

	public String getKode() {
		return kode;
	}

	public String getNama() {
		return nama;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setKode(String kode) {
		this.kode = kode;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}
	
	
	

}
