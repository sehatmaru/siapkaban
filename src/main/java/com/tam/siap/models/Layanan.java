package com.tam.siap.models;

import groovy.transform.builder.Builder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;

@Entity
@Builder
@DynamicUpdate
@Table(name = "layanan", schema = "public")
public class Layanan {

    @Id
    @Column(name = "id", columnDefinition = "serial")
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

    @Column(name = "kw_k_kantor")
    private String kepKantorKanwil;

    @Column(name = "kw_penerima")
    private String penerimaKanwil;

    @Column(name = "kw_pemeriksa_p2")
    private String pemeriksaP2Kanwil;

    @Column(name = "kw_k_s_intelijen")
    private String kepSeksiIntelijenKanwil;

    @Column(name = "kw_k_b_fasilitas")
    private String kepBidangFasilitasKanwil;

    @Column(name = "kw_k_b_p2")
    private String kepBidangP2Kanwil;

    @Column(name = "kw_k_s_pf")
    private String kepSeksiPfKanwil;

    @Column(name = "kw_pemeriksa_dokumen")
    private String pemeriksaDokumenKanwil;

    @Column(name = "kw_pemeriksa_pkc")
    private String pemeriksaPkcKanwil;

    @Column(name = "kw_k_b_pkc")
    private String kepBidPkcKanwil;

    @Column(name = "kw_k_s_pkc")
    private String kepSeksiPkcKanwil;

    @Column(name = "status")
    private int status;

    @Column(name = "nomor")
    private String nomor;

    @Column(name = "tanggal")
    private Date tanggal;

    @Column(name = "j_lokasi")
    private int lokasi;

    @Column(name = "progress")
    private int progress;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "perusahaan", referencedColumnName = "id")
    private JPerusahaan perusahaan;

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

    public String getKepKantorKanwil() {
        return kepKantorKanwil;
    }

    public void setKepKantorKanwil(String kepKantorKanwil) {
        this.kepKantorKanwil = kepKantorKanwil;
    }

    public String getPenerimaKanwil() {
        return penerimaKanwil;
    }

    public void setPenerimaKanwil(String penerimaKanwil) {
        this.penerimaKanwil = penerimaKanwil;
    }

    public String getPemeriksaP2Kanwil() {
        return pemeriksaP2Kanwil;
    }

    public void setPemeriksaP2Kanwil(String pemeriksaP2Kanwil) {
        this.pemeriksaP2Kanwil = pemeriksaP2Kanwil;
    }

    public String getKepSeksiIntelijenKanwil() {
        return kepSeksiIntelijenKanwil;
    }

    public void setKepSeksiIntelijenKanwil(String kepSeksiIntelijenKanwil) {
        this.kepSeksiIntelijenKanwil = kepSeksiIntelijenKanwil;
    }

    public String getKepBidangFasilitasKanwil() {
        return kepBidangFasilitasKanwil;
    }

    public void setKepBidangFasilitasKanwil(String kepBidangFasilitasKanwil) {
        this.kepBidangFasilitasKanwil = kepBidangFasilitasKanwil;
    }

    public String getKepBidangP2Kanwil() {
        return kepBidangP2Kanwil;
    }

    public void setKepBidangP2Kanwil(String kepBidangP2Kanwil) {
        this.kepBidangP2Kanwil = kepBidangP2Kanwil;
    }

    public String getKepSeksiPfKanwil() {
        return kepSeksiPfKanwil;
    }

    public void setKepSeksiPfKanwil(String kepSeksiPfKanwil) {
        this.kepSeksiPfKanwil = kepSeksiPfKanwil;
    }

    public String getPemeriksaDokumenKanwil() {
        return pemeriksaDokumenKanwil;
    }

    public void setPemeriksaDokumenKanwil(String pemeriksaDokumenKanwil) {
        this.pemeriksaDokumenKanwil = pemeriksaDokumenKanwil;
    }

    public String getPemeriksaPkcKanwil() {
        return pemeriksaPkcKanwil;
    }

    public void setPemeriksaPkcKanwil(String pemeriksaPkcKanwil) {
        this.pemeriksaPkcKanwil = pemeriksaPkcKanwil;
    }

    public String getKepBidPkcKanwil() {
        return kepBidPkcKanwil;
    }

    public void setKepBidPkcKanwil(String kepBidPkcKanwil) {
        this.kepBidPkcKanwil = kepBidPkcKanwil;
    }

    public String getKepSeksiPkcKanwil() {
        return kepSeksiPkcKanwil;
    }

    public void setKepSeksiPkcKanwil(String kepSeksiPkcKanwil) {
        this.kepSeksiPkcKanwil = kepSeksiPkcKanwil;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }

    public JPerusahaan getPerusahaan() {
        return perusahaan;
    }

    public void setPerusahaan(JPerusahaan perusahaan) {
        this.perusahaan = perusahaan;
    }
}