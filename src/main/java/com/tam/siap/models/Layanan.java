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
}
