package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

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
    private String kSeksiP2;

    @Column(name = "k_seksi_perbend")
    private String kSeksiPerbend;

    @Column(name = "k_seksi_pkc")
    private String kSeksiPkc;

    @Column(name = "k_s_seksi_p2")
    private String ksSeksiP2;

    @Column(name = "k_s_seksi_perbend")
    private String ksSeksiPerbend;

    @Column(name = "k_s_seksi_pkc")
    private String ksSeksiPkc;

    @Column(name = "k_kantor")
    private String kKantor;

    @Column(name = "status")
    private int status;

    @Column(name = "nomor")
    private String nomor;

    @Column(name = "tanggal")
    private String tanggal;

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

    public String getkSeksiP2() {
        return kSeksiP2;
    }

    public void setkSeksiP2(String kSeksiP2) {
        this.kSeksiP2 = kSeksiP2;
    }

    public String getkSeksiPerbend() {
        return kSeksiPerbend;
    }

    public void setkSeksiPerbend(String kSeksiPerbend) {
        this.kSeksiPerbend = kSeksiPerbend;
    }

    public String getkSeksiPkc() {
        return kSeksiPkc;
    }

    public void setkSeksiPkc(String kSeksiPkc) {
        this.kSeksiPkc = kSeksiPkc;
    }

    public String getKsSeksiP2() {
        return ksSeksiP2;
    }

    public void setKsSeksiP2(String ksSeksiP2) {
        this.ksSeksiP2 = ksSeksiP2;
    }

    public String getKsSeksiPerbend() {
        return ksSeksiPerbend;
    }

    public void setKsSeksiPerbend(String ksSeksiPerbend) {
        this.ksSeksiPerbend = ksSeksiPerbend;
    }

    public String getKsSeksiPkc() {
        return ksSeksiPkc;
    }

    public void setKsSeksiPkc(String ksSeksiPkc) {
        this.ksSeksiPkc = ksSeksiPkc;
    }

    public String getkKantor() {
        return kKantor;
    }

    public void setkKantor(String kKantor) {
        this.kKantor = kKantor;
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

    public String getTanggal() {
        return tanggal;
    }

    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }
}
