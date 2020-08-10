package com.tam.siap.models;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tam.siap.LayananStatus;

@Entity
@Table(name = "po_layanan")
public class Layanan implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	private long id;

	@Column(name = "npwpperusahaan")
	private String npwpperusahaan;

	@Column(name = "namaperusahaan")
	private String namaperusahaan;

	@Column(name = "jenisperushaanid")
	private Long jenisperushaanid;

	@Column(name = "alamat")
	private String alamat;

	@Column(name = "namapic")
	private String nama;

	@Column(name = "jabatan")
	private String jabatan;

	@Column(name = "email")
	private String email;

	@Column(name = "handphone")
	private String handphone;

	@Column(name = "jenislayananid")
	private Long jenislayananid;

	@Column(name = "nomor")
	private String nomor;

	@Column(name = "tanggal")
	private Date tanggal;

	@Column(name = "fasilitas")
	private String fasilitas;

	@Column(name = "janjilayanan")
	private String janjilayanan;

	@Column(name = "penerimadok")
	private String penerimadok;

	@Column(name = "penerimadokid")
	private Long penerimadokid;

	@Column(name = "picstafid")
	private Long picstafid;

	@Column(name = "pickplseksiid")
	private Long pickplseksiid;

	@Column(name = "pickplbidangid")
	private Long pickplbidangid;

	@Column(name = "pickplkantorid")
	private Long pickplkantorid;

	@Column(name = "ket")
	private String ket;

	@Column(name = "perusahaanid")
	private Long perusahaanid;

	@Column(name = "status")
	private String status;

	@Column(name = "tglpendok")
	private Date tglpendok;

	@Column(name = "tglstaff")
	private Date tglstaff;

	@Column(name = "tglkplseksi")
	private Date tglkplseksi;

	@Column(name = "tglkplkantor")
	private Date tglkplkantor;

	@Column(name = "tglkplbidang")
	private Date tglkplbidang;

	@Transient
	private String lbljenisperusahaan;

	@Transient
	private String lbjjenislayanan;

	@Transient
	private String lblsubjenislayanan;

	@Transient
	private String lbjanjilayanan;

	@Transient
	private String lblpenerimadokumen;

	@Transient
	private String lblpicstaff;

	@Transient
	private String lblkepalaseksi;

	@Transient
	private String lblkepalabidang;

	@Transient
	private String lblkepalakantor;

	@Transient
	private String lblstatus;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "perusahaanid", referencedColumnName = "id", insertable = false, updatable = false, nullable = true)
	private Perusahaan perusahaan;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "jenisperushaanid", referencedColumnName = "id", insertable = false, updatable = false, nullable = true)
	private JenisPerusahaan jenisPerusahaan;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "jenislayananid", referencedColumnName = "id", insertable = false, updatable = false, nullable = true)
	private JenisLayanan jenisLayanan;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "po_sub_jenis_layanan", joinColumns = @JoinColumn(name = "layananid", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "subjenislayananid", referencedColumnName = "id"))
	@OrderBy
	@JsonIgnore
	private Set<SubJenisLayanan> subJenisLayanan;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "picstafid", referencedColumnName = "id", insertable = false, updatable = false, nullable = true)
	private Pic picstaf;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "pickplseksiid", referencedColumnName = "id", insertable = false, updatable = false, nullable = true)
	private Pic pickplseksi;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "pickplbidangid", referencedColumnName = "id", insertable = false, updatable = false, nullable = true)
	private Pic pickplbidang;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "pickplkantorid", referencedColumnName = "id", insertable = false, updatable = false, nullable = true)
	private Pic pickplkantor;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "penerimadokid", referencedColumnName = "id", insertable = false, updatable = false, nullable = true)
	private Pic penerimadokumen;

	public Layanan() {

	}

	public Layanan(long id, String npwpperusahaan, String namaperusahaan, Long jenisperushaanid, String alamat,
			String nama, String jabatan, String email, String handphone, Long jenislayananid, String nomor,
			Date tanggal, String fasilitas, String janjilayanan, String penerimadok, Long picstafid, Long pickplseksiid,
			Long pickplbidangid, Long pickplkantorid, String ket, String status, Date tglpendok, Date tglstaff,
			Date tglkplseksi, Date tglkplkantor, Date tglkplbidang) {
		super();
		this.id = id;
		this.npwpperusahaan = npwpperusahaan;
		this.namaperusahaan = namaperusahaan;
		this.jenisperushaanid = jenisperushaanid;
		this.alamat = alamat;
		this.nama = nama;
		this.jabatan = jabatan;
		this.email = email;
		this.handphone = handphone;
		this.jenislayananid = jenislayananid;
		this.nomor = nomor;
		this.tanggal = tanggal;
		this.fasilitas = fasilitas;
		this.janjilayanan = janjilayanan;
		this.penerimadok = penerimadok;
		this.picstafid = picstafid;
		this.pickplseksiid = pickplseksiid;
		this.pickplbidangid = pickplbidangid;
		this.pickplkantorid = pickplkantorid;
		this.ket = ket;
		this.status = status;
		this.tglpendok = tglpendok;
		this.tglstaff = tglstaff;
		this.tglkplseksi = tglkplseksi;
		this.tglkplkantor = tglkplkantor;
		this.tglkplbidang = tglkplbidang;
	}

	public long getId() {
		return id;
	}

	public String getNpwpperusahaan() {
		return npwpperusahaan;
	}

	public String getNamaperusahaan() {
		return namaperusahaan;
	}

	public Long getJenisperushaanid() {
		return jenisperushaanid;
	}

	public String getAlamat() {
		return alamat;
	}

	public String getNama() {
		return nama;
	}

	public String getJabatan() {
		return jabatan;
	}

	public String getEmail() {
		return email;
	}

	public String getHandphone() {
		return handphone;
	}

	public Long getJenislayananid() {
		return jenislayananid;
	}

	public String getNomor() {
		return nomor;
	}

	public Date getTanggal() {
		return tanggal;
	}

	public String getFasilitas() {
		return fasilitas;
	}

	public String getJanjilayanan() {
		return janjilayanan;
	}

	public String getPenerimadok() {
		return penerimadok;
	}

	public Long getPicstafid() {
		return picstafid;
	}

	public Long getPickplseksiid() {
		return pickplseksiid;
	}

	public Long getPickplbidangid() {
		return pickplbidangid;
	}

	public Long getPickplkantorid() {
		return pickplkantorid;
	}

	public String getKet() {
		return ket;
	}

	public JenisPerusahaan getJenisPerusahaan() {
		return jenisPerusahaan;
	}

	public JenisLayanan getJenisLayanan() {
		return jenisLayanan;
	}

	public Pic getPicstaf() {
		return picstaf;
	}

	public Pic getPickplseksi() {
		return pickplseksi;
	}

	public Pic getPickplbidang() {
		return pickplbidang;
	}

	public Pic getPickplkantor() {
		return pickplkantor;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setNpwpperusahaan(String npwpperusahaan) {
		this.npwpperusahaan = npwpperusahaan;
	}

	public void setNamaperusahaan(String namaperusahaan) {
		this.namaperusahaan = namaperusahaan;
	}

	public void setJenisperushaanid(Long jenisperushaanid) {
		this.jenisperushaanid = jenisperushaanid;
	}

	public void setAlamat(String alamat) {
		this.alamat = alamat;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public void setJabatan(String jabatan) {
		this.jabatan = jabatan;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setHandphone(String handphone) {
		this.handphone = handphone;
	}

	public void setJenislayananid(Long jenislayananid) {
		this.jenislayananid = jenislayananid;
	}

	public void setNomor(String nomor) {
		this.nomor = nomor;
	}

	public void setTanggal(Date tanggal) {
		this.tanggal = tanggal;
	}

	public void setFasilitas(String fasilitas) {
		this.fasilitas = fasilitas;
	}

	public void setJanjilayanan(String janjilayanan) {
		this.janjilayanan = janjilayanan;
	}

	public void setPenerimadok(String penerimadok) {
		this.penerimadok = penerimadok;
	}

	public void setPicstafid(Long picstafid) {
		this.picstafid = picstafid;
	}

	public void setPickplseksiid(Long pickplseksiid) {
		this.pickplseksiid = pickplseksiid;
	}

	public void setPickplbidangid(Long pickplbidangid) {
		this.pickplbidangid = pickplbidangid;
	}

	public void setPickplkantorid(Long pickplkantorid) {
		this.pickplkantorid = pickplkantorid;
	}

	public void setKet(String ket) {
		this.ket = ket;
	}

	public void setJenisPerusahaan(JenisPerusahaan jenisPerusahaan) {
		this.jenisPerusahaan = jenisPerusahaan;
	}

	public void setJenisLayanan(JenisLayanan jenisLayanan) {
		this.jenisLayanan = jenisLayanan;
	}

	public void setPicstaf(Pic picstaf) {
		this.picstaf = picstaf;
	}

	public void setPickplseksi(Pic pickplseksi) {
		this.pickplseksi = pickplseksi;
	}

	public void setPickplbidang(Pic pickplbidang) {
		this.pickplbidang = pickplbidang;
	}

	public void setPickplkantor(Pic pickplkantor) {
		this.pickplkantor = pickplkantor;
	}

	public Set<SubJenisLayanan> getSubJenisLayanan() {
		return subJenisLayanan;
	}

	public void setSubJenisLayanan(Set<SubJenisLayanan> subJenisLayanan) {
		this.subJenisLayanan = subJenisLayanan;
	}

	public Long getPerusahaanid() {
		return perusahaanid;
	}

	public void setPerusahaanid(Long perusahaanid) {
		this.perusahaanid = perusahaanid;
	}

	public String getLbljenisperusahaan() {
		return getJenisPerusahaan().getDscp();
	}

	public String getLbjjenislayanan() {
		return getJenisLayanan().getDscp();
	}

	public String getLbjanjilayanan() {
		try {
			SubJenisLayanan[] sub = getSubJenisLayanan().toArray(new SubJenisLayanan[getSubJenisLayanan().size()]);
			if (sub != null && sub.length > 0) {
				return sub[0].getJanjilayanan();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "";
	}

	public String getLblpicstaff() {
		return getPicstaf() != null ? getPicstaf().getNama() : "";
	}

	public String getLblkepalaseksi() {
		return getPickplseksi() != null ? getPickplseksi().getNama() : "";
	}

	public String getLblkepalabidang() {
		return getPickplbidang() != null ? getPickplbidang().getNama() : "";
	}

	public String getLblkepalakantor() {
		return getPickplkantor() != null ? getPickplkantor().getNama() : "";
	}

	public void setLbljenisperusahaan(String lbljenisperusahaan) {
		this.lbljenisperusahaan = lbljenisperusahaan;
	}

	public void setLbjjenislayanan(String lbjjenislayanan) {
		this.lbjjenislayanan = lbjjenislayanan;
	}

	public void setLbjanjilayanan(String lbjanjilayanan) {
		this.lbjanjilayanan = lbjanjilayanan;
	}

	public void setLblpicstaff(String lblpicstaff) {
		this.lblpicstaff = lblpicstaff;
	}

	public void setLblkepalaseksi(String lblkepalaseksi) {
		this.lblkepalaseksi = lblkepalaseksi;
	}

	public void setLblkepalabidang(String lblkepalabidang) {
		this.lblkepalabidang = lblkepalabidang;
	}

	public void setLblkepalakantor(String lblkepalakantor) {
		this.lblkepalakantor = lblkepalakantor;
	}

	public String getLblsubjenislayanan() {
		try {
			SubJenisLayanan[] sub = getSubJenisLayanan().toArray(new SubJenisLayanan[getSubJenisLayanan().size()]);
			if (sub != null && sub.length > 0) {
				return sub[0].getDscp();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "";
	}

	public void setLblsubjenislayanan(String lblsubjenislayanan) {
		this.lblsubjenislayanan = lblsubjenislayanan;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLblstatus() {
		String status = getStatus();
		if (LayananStatus.STATUS_BARU.getKey().equals(status)) {
			status = LayananStatus.STATUS_BARU.getLabel();
		} else if (LayananStatus.STATUS_DISPOSISI_STAFF.getKey().equals(status)) {
			status = LayananStatus.STATUS_DISPOSISI_STAFF.getLabel();
		} else if (LayananStatus.STATUS_DISPOSISI_KEPALA_SEKSI.getKey().equals(status)) {
			status = LayananStatus.STATUS_DISPOSISI_KEPALA_SEKSI.getLabel();
		} else if (LayananStatus.STATUS_DISPOSISI_KEPALA_BIDANG.getKey().equals(status)) {
			status = LayananStatus.STATUS_DISPOSISI_KEPALA_BIDANG.getLabel();
		} else if (LayananStatus.STATUS_DISPOSISI_KEPALA_KANTOR.getKey().equals(status)) {
			status = LayananStatus.STATUS_DISPOSISI_KEPALA_KANTOR.getLabel();
		}
		return status;
	}

	public void setLblstatus(String lblstatus) {
		this.lblstatus = lblstatus;
	}

	public Long getPenerimadokid() {
		return penerimadokid;
	}

	public Pic getPenerimadokumen() {
		return penerimadokumen;
	}

	public void setPenerimadokid(Long penerimadokid) {
		this.penerimadokid = penerimadokid;
	}

	public void setPenerimadokumen(Pic penerimadokumen) {
		this.penerimadokumen = penerimadokumen;
	}

	public String getLblpenerimadokumen() {
		try {
			Pic p = getPenerimadokumen();
			if (p != null) {
				return p.getNama();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "";
	}

	public void setLblpenerimadokumen(String lblpenerimadokumen) {
		this.lblpenerimadokumen = lblpenerimadokumen;
	}

	public Perusahaan getPerusahaan() {
		return perusahaan;
	}

	public void setPerusahaan(Perusahaan perusahaan) {
		this.perusahaan = perusahaan;
	}

	public Date getTglpendok() {
		return tglpendok;
	}

	public void setTglpendok(Date tglpendok) {
		this.tglpendok = tglpendok;
	}

	public Date getTglstaff() {
		return tglstaff;
	}

	public void setTglstaff(Date tglstaff) {
		this.tglstaff = tglstaff;
	}

	public Date getTglkplseksi() {
		return tglkplseksi;
	}

	public void setTglkplseksi(Date tglkplseksi) {
		this.tglkplseksi = tglkplseksi;
	}

	public Date getTglkplkantor() {
		return tglkplkantor;
	}

	public void setTglkplkantor(Date tglkplkantor) {
		this.tglkplkantor = tglkplkantor;
	}

	public Date getTglkplbidang() {
		return tglkplbidang;
	}

	public void setTglkplbidang(Date tglkplbidang) {
		this.tglkplbidang = tglkplbidang;
	}

}
