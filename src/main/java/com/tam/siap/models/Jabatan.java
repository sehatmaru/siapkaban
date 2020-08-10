package com.tam.siap.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="po_jabatan")
public class Jabatan {
	
	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="nama")
	private String nama;
	
	@Column(name="bidangid")
	private Long bidangid;
	
	@Column(name="parentid")
	private Long parentid;
	

	@Column(name="jenisjabatanid")
	private Long jenisjabatanid;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="bidangid", referencedColumnName="id", insertable = false, updatable = false, nullable=true)
	private Bidang bidang;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="jenisjabatanid", referencedColumnName="id", insertable = false, updatable = false, nullable=true)
	private JenisJabatan JenisJabatan;
	

	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="parentid", referencedColumnName="id", insertable = false, updatable = false, nullable=true)
	private Jabatan JabatanSuperior;
	
	@Transient
	private String hierarkiJabatan;
	
	
	
	public Jabatan(Long id, String nama, Long bidangid, Bidang bidang, Long parentid) {
		super();
		this.id = id;
		this.nama = nama;
		this.bidangid = bidangid;
		this.bidang = bidang;
		this.parentid=parentid;
	}

	public Jabatan() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}

	public String getNama() {
		return nama;
	}

	
	public Bidang getBidang() {
		return bidang;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}



	public Long getBidangid() {
		return bidangid;
	}

	public void setBidangid(Long bidangid) {
		this.bidangid = bidangid;
	}

	public void setBidang(Bidang bidang) {
		this.bidang = bidang;
	}

	public Long getParentid() {
		return parentid;
	}

	public void setParentid(Long parentid) {
		this.parentid = parentid;
	}

	public Long getJenisjabatanid() {
		return jenisjabatanid;
	}

	public void setJenisjabatanid(Long jenisjabatanid) {
		this.jenisjabatanid = jenisjabatanid;
	}

	public JenisJabatan getJenisJabatan() {
		return JenisJabatan;
	}

	public Jabatan getJabatanSuperior() {
		return JabatanSuperior;
	}

	public void setJenisJabatan(JenisJabatan jenisJabatan) {
		JenisJabatan = jenisJabatan;
	}

	public void setJabatanSuperior(Jabatan jabatanSuperior) {
		JabatanSuperior = jabatanSuperior;
	}

	public String getHierarkiJabatan() {
		String dscp = "";
		dscp = recursiveDscp(this, dscp);
		return dscp;
	}

	public void setHierarkiJabatan(String hierarkiJabatan) {
		this.hierarkiJabatan = hierarkiJabatan;
	}
	
	public String recursiveDscp(Jabatan jabatan, String strVal) {
		strVal += " - " + jabatan.getNama();
		if (jabatan != null && jabatan.getJabatanSuperior() != null && jabatan.getParentid() != null) {
			return recursiveDscp(jabatan.getJabatanSuperior(), strVal);
		}
		return strVal;
	}
	
	

}
