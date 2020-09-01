package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Builder
@Entity
@Table(name = "jenis_dokumen", schema = "public")
@DynamicUpdate
public class JDokumen {

	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="keterangan")
	private String keterangan;

	@Column(name = "deskripsi_dokumen")
	private String deskripsi;

	public String getDeskripsi() {
		return deskripsi;
	}

	public void setDeskripsi(String deskripsi) {
		this.deskripsi = deskripsi;
	}

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "id_sub_jenis_layanan", referencedColumnName = "id")
	private SJLayanan subLayanan;

	public SJLayanan getSubLayanan() {
		return subLayanan;
	}

	public void setSubLayanan(SJLayanan subLayanan) {
		this.subLayanan = subLayanan;
	}

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "role", referencedColumnName = "id")
	private Role role;

	@Column(name = "status")
	private int status;

	public JDokumen() {
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "JDokumen{" +
				"id=" + id +
				", keterangan='" + keterangan + '\'' +
				", deskripsi='" + deskripsi + '\'' +
				", subLayanan=" + subLayanan +
				", role=" + role +
				", status=" + status +
				'}';
	}
}
