package com.tam.siap.repos;

import com.tam.siap.models.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JLayananRepository extends JpaRepository<JLayanan, String>{

    List<JLayanan> findAll();

    JLayanan findById(int id);

    List<JLayanan> findByPerusahaan(JPerusahaan perusahaan);

    List<JLayanan> findByFasilitas(JFasilitas fasilitas);

    List<JLayanan> findByPengelola(JPengelola pengelola);

    List<JLayanan> findByPenimbunan(JPenimbunan penimbunan);
}
