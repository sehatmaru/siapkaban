package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;

@Entity
@Builder
@DynamicUpdate
@Table(name="layanan", schema = "public")
public class Layanan {

	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "pemohon", referencedColumnName = "id")
	private Account pemohonon;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "s_j_layanan", referencedColumnName = "id")
	private SJLayanan subLayanan;

	@Column(name = "penerima")
	private String penerima;

    @Column(name = "pemeriksa_p2")
    private String pemeriksaP2;

    @Column(name = "pemeriksa_perbend")
    private String pemeriksaPerbend;

    @Column(name = "pemeriksa_pkc")
    private String pemeriksaPkc;

    @Column(name = "k_seksi_p2")
    private String kepSeksiP2;

    @Column(name = "k_seksi_perbend")
    private String kepSeksiPerbend;

    @Column(name = "k_seksi_pkc")
    private String kepSeksiPkc;

    @Column(name = "k_s_seksi_p2")
    private String kepSubSeksiP2;

    @Column(name = "k_s_seksi_perbend")
    private String kepSubSeksiPerbend;

    @Column(name = "k_s_seksi_pkc")
    private String kepSubSeksiPkc;

    @Column(name = "k_kantor")
    private String kepKantor;

    @Column(name = "status")
    private int status;

    @Column(name = "nomor")
    private String nomor;

    @Column(name = "tanggal")
    private Date tanggal;

    @Column(name = "j_lokasi")
    private int lokasi;

	public Layanan() {
	}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getPemohonon() {
        return pemohonon;
    }

    public void setPemohonon(Account pemohonon) {
        this.pemohonon = pemohonon;
    }

    public SJLayanan getSubLayanan() {
        return subLayanan;
    }

    public void setSubLayanan(SJLayanan subLayanan) {
        this.subLayanan = subLayanan;
    }

    public String getPenerima() {
        return penerima;
    }

    public void setPenerima(String penerima) {
        this.penerima = penerima;
    }

    public String getPemeriksaP2() {
        return pemeriksaP2;
    }

    public void setPemeriksaP2(String pemeriksaP2) {
        this.pemeriksaP2 = pemeriksaP2;
    }

    public String getPemeriksaPerbend() {
        return pemeriksaPerbend;
    }

    public void setPemeriksaPerbend(String pemeriksaPerbend) {
        this.pemeriksaPerbend = pemeriksaPerbend;
    }

    public String getPemeriksaPkc() {
        return pemeriksaPkc;
    }

    public void setPemeriksaPkc(String pemeriksaPkc) {
        this.pemeriksaPkc = pemeriksaPkc;
    }

    public String getKepSeksiP2() {
        return kepSeksiP2;
    }

    public void setKepSeksiP2(String kepSeksiP2) {
        this.kepSeksiP2 = kepSeksiP2;
    }

    public String getKepSeksiPerbend() {
        return kepSeksiPerbend;
    }

    public void setKepSeksiPerbend(String kepSeksiPerbend) {
        this.kepSeksiPerbend = kepSeksiPerbend;
    }

    public String getKepSeksiPkc() {
        return kepSeksiPkc;
    }

    public void setKepSeksiPkc(String kepSeksiPkc) {
        this.kepSeksiPkc = kepSeksiPkc;
    }

    public String getKepSubSeksiP2() {
        return kepSubSeksiP2;
    }

    public void setKepSubSeksiP2(String kepSubSeksiP2) {
        this.kepSubSeksiP2 = kepSubSeksiP2;
    }

    public String getKepSubSeksiPerbend() {
        return kepSubSeksiPerbend;
    }

    public void setKepSubSeksiPerbend(String kepSubSeksiPerbend) {
        this.kepSubSeksiPerbend = kepSubSeksiPerbend;
    }

    public String getKepSubSeksiPkc() {
        return kepSubSeksiPkc;
    }

    public void setKepSubSeksiPkc(String kepSubSeksiPkc) {
        this.kepSubSeksiPkc = kepSubSeksiPkc;
    }

    public String getKepKantor() {
        return kepKantor;
    }

    public void setKepKantor(String kepKantor) {
        this.kepKantor = kepKantor;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getNomor() {
        return nomor;
    }

    public void setNomor(String nomor) {
        this.nomor = nomor;
    }

    public Date getTanggal() {
        return tanggal;
    }

    public void setTanggal(Date tanggal) {
        this.tanggal = tanggal;
    }

    public int getLokasi() {
        return lokasi;
    }

    public void setLokasi(int lokasi) {
        this.lokasi = lokasi;
    }
}
