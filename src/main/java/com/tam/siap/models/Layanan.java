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

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "penerima", referencedColumnName = "id")
	private Account penerima;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "pemeriksa", referencedColumnName = "id")
    private Account pemeriksa;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "k_seksi", referencedColumnName = "id")
    private Account kepalaSeksi;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "k_kantor", referencedColumnName = "id")
    private Account kepalaKantor;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "k_s_seksi", referencedColumnName = "id")
    private Account kepalaSubSeksi;

    @Column(name = "tgl_request")
    private String tanggal;

    @Column(name = "tgl_penerima")
    private String tanggalPenerima;

    @Column(name = "tgl_pemeriksa")
    private String tanggalPemeriksa;

    @Column(name = "tgl_k_seksi")
    private String tanggalKepalaSeksi;

    @Column(name = "tgl_k_s_seksi")
    private String tanggalKepalaSubSeksi;

    @Column(name = "tgl_k_kantor")
    private String tanggalKepalaKantor;

    @Column(name = "status")
    private int status;

    @Column(name = "status_penerima")
    private boolean statusPenerima;

    @Column(name = "status_pemeriksa")
    private boolean statusPemeriksa;

    @Column(name = "status_k_seksi")
    private boolean statusKepalaSeksi;

    @Column(name = "status_k_s_seksi")
    private boolean statusKepalaSubSeksi;

    @Column(name = "status_k_kantor")
    private boolean statusKepalaKantor;

    @Column(name = "nomor")
    private int nomor;

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

    public Account getPenerima() {
        return penerima;
    }

    public void setPenerima(Account penerima) {
        this.penerima = penerima;
    }

    public Account getPemeriksa() {
        return pemeriksa;
    }

    public void setPemeriksa(Account pemeriksa) {
        this.pemeriksa = pemeriksa;
    }

    public Account getKepalaSeksi() {
        return kepalaSeksi;
    }

    public void setKepalaSeksi(Account kepalaSeksi) {
        this.kepalaSeksi = kepalaSeksi;
    }

    public Account getKepalaKantor() {
        return kepalaKantor;
    }

    public void setKepalaKantor(Account kepalaKantor) {
        this.kepalaKantor = kepalaKantor;
    }

    public Account getKepalaSubSeksi() {
        return kepalaSubSeksi;
    }

    public void setKepalaSubSeksi(Account kepalaSubSeksi) {
        this.kepalaSubSeksi = kepalaSubSeksi;
    }

    public String getTanggal() {
        return tanggal;
    }

    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    public String getTanggalPenerima() {
        return tanggalPenerima;
    }

    public void setTanggalPenerima(String tanggalPenerima) {
        this.tanggalPenerima = tanggalPenerima;
    }

    public String getTanggalPemeriksa() {
        return tanggalPemeriksa;
    }

    public void setTanggalPemeriksa(String tanggalPemeriksa) {
        this.tanggalPemeriksa = tanggalPemeriksa;
    }

    public String getTanggalKepalaSeksi() {
        return tanggalKepalaSeksi;
    }

    public void setTanggalKepalaSeksi(String tanggalKepalaSeksi) {
        this.tanggalKepalaSeksi = tanggalKepalaSeksi;
    }

    public String getTanggalKepalaSubSeksi() {
        return tanggalKepalaSubSeksi;
    }

    public void setTanggalKepalaSubSeksi(String tanggalKepalaSubSeksi) {
        this.tanggalKepalaSubSeksi = tanggalKepalaSubSeksi;
    }

    public String getTanggalKepalaKantor() {
        return tanggalKepalaKantor;
    }

    public void setTanggalKepalaKantor(String tanggalKepalaKantor) {
        this.tanggalKepalaKantor = tanggalKepalaKantor;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public boolean isStatusPenerima() {
        return statusPenerima;
    }

    public void setStatusPenerima(boolean statusPenerima) {
        this.statusPenerima = statusPenerima;
    }

    public boolean isStatusPemeriksa() {
        return statusPemeriksa;
    }

    public void setStatusPemeriksa(boolean statusPemeriksa) {
        this.statusPemeriksa = statusPemeriksa;
    }

    public boolean isStatusKepalaSeksi() {
        return statusKepalaSeksi;
    }

    public void setStatusKepalaSeksi(boolean statusKepalaSeksi) {
        this.statusKepalaSeksi = statusKepalaSeksi;
    }

    public boolean isStatusKepalaSubSeksi() {
        return statusKepalaSubSeksi;
    }

    public void setStatusKepalaSubSeksi(boolean statusKepalaSubSeksi) {
        this.statusKepalaSubSeksi = statusKepalaSubSeksi;
    }

    public boolean isStatusKepalaKantor() {
        return statusKepalaKantor;
    }

    public void setStatusKepalaKantor(boolean statusKepalaKantor) {
        this.statusKepalaKantor = statusKepalaKantor;
    }

    public int getNomor() {
        return nomor;
    }

    public void setNomor(int nomor) {
        this.nomor = nomor;
    }
}
