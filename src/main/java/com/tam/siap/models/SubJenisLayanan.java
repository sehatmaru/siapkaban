package com.tam.siap.models;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="po_subjenislayanan")
public class SubJenisLayanan implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id")
	private long id;
	
	@Column(name="code")
	private String code;
	
	@Column(name="dscp")
	private String dscp;
	
	@Column(name="janjilayanan")
	private String janjilayanan;
	
	@Column(name="jenislayananid")
	private Long jenislayananid;
	
	@Column(name="jenisperusahaanid")
	private Long jenisperusahaanid;
	
	
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="jenislayananid", referencedColumnName="id", insertable = false, updatable = false, nullable=true)
	private JenisLayanan jenisLayanan;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="jenisperusahaanid", referencedColumnName="id", insertable = false, updatable = false, nullable=true)
	private JenisPerusahaan jenisPerusahaan;
	
	public SubJenisLayanan() {
		
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDscp() {
		return dscp;
	}

	public void setDscp(String dscp) {
		this.dscp = dscp;
	}

	public Long getJenislayananid() {
		return jenislayananid;
	}

	public void setJenislayananid(Long jenislayananid) {
		this.jenislayananid = jenislayananid;
	}

	public String getJanjilayanan() {
		return janjilayanan;
	}

	public void setJanjilayanan(String janjilayanan) {
		this.janjilayanan = janjilayanan;
	}
	
	
	
	

}
