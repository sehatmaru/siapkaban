package com.tam.siap.models;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "po_pic")
public class Pic implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	private long id;

	@Column(name = "nama")
	private String nama;

	@Column(name = "nipuser")
	private String nipuser;

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "jabatanid")
	private Long jabatanid;

	@Column(name = "jenispic")
	private String jenispic;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "jabatanid", referencedColumnName = "id", insertable = false, updatable = false, nullable = true)
	private Jabatan jabatan;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "po_pic_role", joinColumns = @JoinColumn(name = "picid", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "roleid", referencedColumnName = "id"))
	@OrderBy
	@JsonIgnore
	private Set<Role> roles;

	public Pic() {

	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNama() {
		return nama;
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

	public String getNipuser() {
		return nipuser;
	}

	public void setNipuser(String nipuser) {
		this.nipuser = nipuser;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public Long getJabatanid() {
		return jabatanid;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setJabatanid(Long jabatanid) {
		this.jabatanid = jabatanid;
	}

	public Jabatan getJabatan() {
		return jabatan;
	}

	public void setJabatan(Jabatan jabatan) {
		this.jabatan = jabatan;
	}

	public String getFullPicDscp() {
		String dscp = "";
		dscp = recursiveDscp(getJabatan(), dscp);
		System.out.println(dscp);
		return getNama() + " | " + dscp;
	}

	public String recursiveDscp(Jabatan jabatan, String strVal) {
		strVal += " - " + jabatan.getNama();
		if (jabatan != null && jabatan.getJabatanSuperior() != null && jabatan.getParentid() != null) {
			return recursiveDscp(jabatan.getJabatanSuperior(), strVal);
		}
		return strVal;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

}
