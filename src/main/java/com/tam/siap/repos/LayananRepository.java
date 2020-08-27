package com.tam.siap.repos;

import com.tam.siap.models.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LayananRepository extends JpaRepository<Layanan, String>{

    List<Layanan> findAll();

    Layanan findById(int id);

    Layanan findByNomor(String nomor);

    Layanan findByPemohononAndSubLayananAndTanggal(Account account, SJLayanan subLayanan, String tanggal);

    List<Layanan> findByPenerimaIsNull();

    List<Layanan> findByPenerimaIsNotNull();

    List<Layanan> findByPemeriksaP2IsNotNull();

    List<Layanan> findByPemeriksaPerbendIsNotNull();

    List<Layanan> findByPemeriksaPkcIsNotNull();

    List<Layanan> findByKepSeksiP2IsNotNull();

    List<Layanan> findByKepSeksiPerbendIsNotNull();

    List<Layanan> findByKepSeksiPkcIsNotNull();

    List<Layanan> findByKepSubSeksiP2IsNotNull();

    List<Layanan> findByKepSubSeksiPerbendIsNotNull();

    List<Layanan> findByKepSubSeksiPkcIsNotNull();

    List<Layanan> findByKepKantorIsNotNull();

}
