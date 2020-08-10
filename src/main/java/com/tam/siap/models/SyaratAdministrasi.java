package com.tam.siap.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="app_syaratadministrasi")
public class SyaratAdministrasi {

	@Id
	@Column(name="id")
	private long id;
	
	@Column(name="subjenislayananid")
	private long subjenislayananid;
	
	@Column(name="dscp")
	private String dscp;
	
	@Column(name="seq")
	private int seq;
	

	public SyaratAdministrasi() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public SyaratAdministrasi(long id, long subjenislayananid, String dscp, int seq) {
		super();
		this.id = id;
		this.subjenislayananid = subjenislayananid;
		this.dscp = dscp;
		this.seq = seq;
	}


	public long getId() {
		return id;
	}

	public long getSubjenislayananid() {
		return subjenislayananid;
	}

	public String getDscp() {
		return dscp;
	}

	public int getSeq() {
		return seq;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setSubjenislayananid(long subjenislayananid) {
		this.subjenislayananid = subjenislayananid;
	}

	public void setDscp(String dscp) {
		this.dscp = dscp;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	
	
	
}
