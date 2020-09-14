package com.tam.siap.repos;

import com.tam.siap.models.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface LayananRepository extends JpaRepository<Layanan, String>{

    List<Layanan> findAll();

    Layanan findById(int id);

    Layanan findByNomor(String nomor);

    Layanan findByPemohononAndSubLayananAndTanggal(Account account, SJLayanan subLayanan, Date tanggal);

    List<Layanan> findByPemohononOrderByTanggalDesc(Account account);

    List<Layanan> findByPenerimaIsNullAndLokasiOrderByTanggalDesc(int lokasi);

    List<Layanan> findByPenerimaKanwilIsNullAndProgressOrderByTanggalDesc(int progress);

    List<Layanan> findByPenerimaIsNotNullAndLokasiOrderByTanggalDesc(int lokasi);

    List<Layanan> findByPemeriksaP2IsNotNullAndLokasiOrderByTanggalDesc(int lokasi);

    List<Layanan> findByPemeriksaP2KanwilIsNotNullOrderByTanggalDesc();

    List<Layanan> findByPemeriksaPerbendIsNotNullAndLokasiOrderByTanggalDesc(int lokasi);

    List<Layanan> findByPemeriksaPkcIsNotNullAndLokasiOrderByTanggalDesc(int lokasi);

    List<Layanan> findByKepSeksiP2IsNotNullAndLokasiOrderByTanggalDesc(int lokasi);

    List<Layanan> findByKepBidangP2KanwilIsNotNullOrderByTanggalDesc();

    List<Layanan> findByKepSeksiPerbendIsNotNullAndLokasiOrderByTanggalDesc(int lokasi);

    List<Layanan> findByKepSeksiPkcIsNotNullAndLokasiOrderByTanggalDesc(int lokasi);

    List<Layanan> findByKepSubSeksiP2IsNotNullAndLokasiOrderByTanggalDesc(int lokasi);

    List<Layanan> findByKepSeksiIntelijenKanwilIsNotNullOrderByTanggalDesc();

    List<Layanan> findByKepSubSeksiPerbendIsNotNullAndLokasiOrderByTanggalDesc(int lokasi);

    List<Layanan> findByKepSubSeksiPkcIsNotNullAndLokasiOrderByTanggalDesc(int lokasi);

    List<Layanan> findByKepKantorIsNotNullAndLokasiOrderByTanggalDesc(int lokasi);

    List<Layanan> findByKepKantorKanwilIsNotNullOrderByTanggalDesc();

    List<Layanan> findByKepBidangFasilitasKanwilIsNotNullOrderByTanggalDesc();

    List<Layanan> findByKepSeksiPfKanwilIsNotNullOrderByTanggalDesc();

    List<Layanan> findByPemeriksaDokumenKanwilIsNotNullOrderByTanggalDesc();

    List<Layanan> findByPenerimaKanwilIsNotNullOrderByTanggalDesc();

    List<Layanan> findByKepBidPkcKanwilIsNotNullOrderByTanggalDesc();

    List<Layanan> findByKepSeksiPkcKanwilIsNotNullOrderByTanggalDesc();

}
