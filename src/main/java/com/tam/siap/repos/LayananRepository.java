package com.tam.siap.repos;

import com.tam.siap.models.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LayananRepository extends JpaRepository<Layanan, String>{

    List<Layanan> findAll();

    Layanan findById(int id);

    List<Layanan> findByPerusahaan(JPerusahaan perusahaan);

    List<Layanan> findByPerusahaanAndLayananOrderById(JPerusahaan perusahaan, JLayanan layanan);

    List<Layanan> findByPerusahaanAndLayananAndSubJenisLayananOrderById(JPerusahaan perusahaan, JLayanan layanan, SJLayanan subJenisLayanan);

    List<Layanan> findByPerusahaanAndFasilitasOrderById(JPerusahaan perusahaan, JFasilitas fasilitas);

    List<Layanan> findByPerusahaanAndFasilitasAndLayananOrderById(JPerusahaan perusahaan, JFasilitas fasilitas, JLayanan layanan);

    List<Layanan> findByPerusahaanAndFasilitasAndLayananAndSubJenisLayananOrderById(JPerusahaan perusahaan, JFasilitas fasilitas, JLayanan layanan, SJLayanan subJenisLayanan);

    List<Layanan> findByPerusahaanAndPengelolaOrderById(JPerusahaan perusahaan, JPengelola pengelola);

    List<Layanan> findByPerusahaanAndPengelolaAndLayananOrderById(JPerusahaan perusahaan, JPengelola pengelola, JLayanan layanan);

    List<Layanan> findByPerusahaanAndPengelolaAndLayananAndSubJenisLayananOrderById(JPerusahaan perusahaan, JPengelola pengelola, JLayanan layanan, SJLayanan subJenisLayanan);

    List<Layanan> findByPerusahaanAndPenimbunanOrderById(JPerusahaan perusahaan, JPenimbunan pengelola);

    List<Layanan> findByPerusahaanAndPenimbunanAndLayananOrderById(JPerusahaan perusahaan, JPenimbunan pengelola, JLayanan layanan);

    List<Layanan> findByPerusahaanAndPenimbunanAndLayananAndSubJenisLayananOrderById(JPerusahaan perusahaan, JPenimbunan pengelola, JLayanan layanan, SJLayanan subJenisLayanan);

}
