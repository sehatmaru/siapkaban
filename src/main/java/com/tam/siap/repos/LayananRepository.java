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

    List<Layanan> findByPemohonon(Account account);

    List<Layanan> findByPenerimaIsNullAndLokasi(int lokasi);

    List<Layanan> findByPenerimaIsNotNullAndLokasi(int lokasi);

    List<Layanan> findByPemeriksaP2IsNotNullAndLokasi(int lokasi);

    List<Layanan> findByPemeriksaPerbendIsNotNullAndLokasi(int lokasi);

    List<Layanan> findByPemeriksaPkcIsNotNullAndLokasi(int lokasi);

    List<Layanan> findByKepSeksiP2IsNotNullAndLokasi(int lokasi);

    List<Layanan> findByKepSeksiPerbendIsNotNullAndLokasi(int lokasi);

    List<Layanan> findByKepSeksiPkcIsNotNullAndLokasi(int lokasi);

    List<Layanan> findByKepSubSeksiP2IsNotNullAndLokasi(int lokasi);

    List<Layanan> findByKepSubSeksiPerbendIsNotNullAndLokasi(int lokasi);

    List<Layanan> findByKepSubSeksiPkcIsNotNullAndLokasi(int lokasi);

    List<Layanan> findByKepKantorIsNotNullAndLokasi(int lokasi);

}
