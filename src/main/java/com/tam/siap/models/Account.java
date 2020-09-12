package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Builder
@DynamicUpdate
@Table(name="account", schema = "public")
public class Account {

	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="username")
	private String username;

	@Column(name="password")
	private String password;

	@Column(name="status")
	private int status;

	@Column(name="j_lokasi")
	private int lokasi;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "role", referencedColumnName = "id")
	private Role role;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "d_perusahaan", referencedColumnName = "id")
	private DPerusahaan perusahaan;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "d_pribadi", referencedColumnName = "id")
	private DPribadi pribadi;

	public Account() {
	}

	public Account(String username, String password, Role role) {
		this.username = username;
		this.password = password;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Role getRole() {
		return role;
	}

	public DPerusahaan getPerusahaan() {
		return perusahaan;
	}

	public void setPerusahaan(DPerusahaan perusahaan) {
		this.perusahaan = perusahaan;
	}

	public DPribadi getPribadi() {
		return pribadi;
	}

	public void setPribadi(DPribadi pribadi) {
		this.pribadi = pribadi;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public int getLokasi() {
		return lokasi;
	}

	public void setLokasi(int lokasi) {
		this.lokasi = lokasi;
	}
}
