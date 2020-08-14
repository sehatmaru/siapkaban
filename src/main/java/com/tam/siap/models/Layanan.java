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
	@JoinColumn(name = "j_perusahaan", referencedColumnName = "id")
	private JPerusahaan perusahaan;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "j_layanan", referencedColumnName = "id")
	private JLayanan layanan;

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "s_j_layanan", referencedColumnName = "id")
	private SJLayanan subJenisLayanan;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "j_fasilitas", referencedColumnName = "id")
    private JFasilitas fasilitas;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "j_pengelola", referencedColumnName = "id")
    private JPengelola pengelola;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "j_penimbunan", referencedColumnName = "id")
    private JPenimbunan penimbunan;

	public Layanan() {
	}

    public Layanan(JPerusahaan perusahaan, JLayanan layanan, SJLayanan subJenisLayanan, JFasilitas fasilitas, JPengelola pengelola, JPenimbunan penimbunan) {
        this.perusahaan = perusahaan;
        this.layanan = layanan;
        this.subJenisLayanan = subJenisLayanan;
        this.fasilitas = fasilitas;
        this.pengelola = pengelola;
        this.penimbunan = penimbunan;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public JPerusahaan getPerusahaan() {
        return perusahaan;
    }

    public void setPerusahaan(JPerusahaan perusahaan) {
        this.perusahaan = perusahaan;
    }

    public JLayanan getLayanan() {
        return layanan;
    }

    public void setLayanan(JLayanan layanan) {
        this.layanan = layanan;
    }

    public SJLayanan getSubJenisLayanan() {
        return subJenisLayanan;
    }

    public void setSubJenisLayanan(SJLayanan subJenisLayanan) {
        this.subJenisLayanan = subJenisLayanan;
    }

    public JFasilitas getFasilitas() {
        return fasilitas;
    }

    public void setFasilitas(JFasilitas fasilitas) {
        this.fasilitas = fasilitas;
    }

    public JPengelola getPengelola() {
        return pengelola;
    }

    public void setPengelola(JPengelola pengelola) {
        this.pengelola = pengelola;
    }

    public JPenimbunan getPenimbunan() {
        return penimbunan;
    }

    public void setPenimbunan(JPenimbunan penimbunan) {
        this.penimbunan = penimbunan;
    }
}
