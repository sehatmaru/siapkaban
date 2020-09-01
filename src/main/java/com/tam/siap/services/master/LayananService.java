package com.tam.siap.services.master;

import com.tam.siap.models.Account;
import com.tam.siap.models.Layanan;
import com.tam.siap.models.SJLayanan;
import com.tam.siap.repos.LayananRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class LayananService {

    @Autowired
    LayananRepository layananRepository;

    public List<Layanan> getAllLayanan(){
        return layananRepository.findAll();
    }

    public boolean isLayananExist(Account account, SJLayanan subLayanan, Date tanggal) {
        return layananRepository.findByPemohononAndSubLayananAndTanggal(account, subLayanan, tanggal) != null;
    }

    public boolean isLayananExist(String nomor) {
        return layananRepository.findByNomor(nomor) != null;
    }

    public Layanan findLayananById(int id) {
        return layananRepository.findById(id);
    }

    public Layanan findLayananByNomor(String nomor) {
        return layananRepository.findByNomor(nomor);
    }

    public void save(Layanan layanan){
        layananRepository.save(layanan);
    }

    public void flush(){
        layananRepository.flush();
    }

    public List<Layanan> findLayananByPemohon(Account account) {
        return layananRepository.findByPemohonon(account);
    }

    public List<Layanan> findLayananByPenerimaIsNull(int lokasi) {
        return layananRepository.findByPenerimaIsNullAndLokasi(lokasi);
    }

    public List<Layanan> findLayananByPenerimaIsNotNull(int lokasi) {
        return layananRepository.findByPenerimaIsNotNullAndLokasi(lokasi);
    }

    public List<Layanan> findLayananByKepKantorIsNotNull(int lokasi) {
        return layananRepository.findByKepKantorIsNotNullAndLokasi(lokasi);
    }

    public List<Layanan> findLayananByPemeriksaP2IsNotNull(int lokasi) {
        return layananRepository.findByPemeriksaP2IsNotNullAndLokasi(lokasi);
    }

    public List<Layanan> findLayananByPemeriksaPerbendIsNotNull(int lokasi) {
        return layananRepository.findByPemeriksaPerbendIsNotNullAndLokasi(lokasi);
    }

    public List<Layanan> findLayananByPemeriksaPkcIsNotNull(int lokasi) {
        return layananRepository.findByPemeriksaPkcIsNotNullAndLokasi(lokasi);
    }

    public List<Layanan> findLayananByKepSeksiP2IsNotNull(int lokasi) {
        return layananRepository.findByKepSeksiP2IsNotNullAndLokasi(lokasi);
    }

    public List<Layanan> findLayananByKepSeksiPerbendIsNotNull(int lokasi) {
        return layananRepository.findByKepSeksiPerbendIsNotNullAndLokasi(lokasi);
    }

    public List<Layanan> findLayananByKepSeksiPkcIsNotNull(int lokasi) {
        return layananRepository.findByKepSeksiPkcIsNotNullAndLokasi(lokasi);
    }

    public List<Layanan> findLayananByKepSubSeksiP2IsNotNull(int lokasi) {
        return layananRepository.findByKepSubSeksiP2IsNotNullAndLokasi(lokasi);
    }

    public List<Layanan> findLayananByKepSubSeksiPerbendIsNotNull(int lokasi) {
        return layananRepository.findByKepSubSeksiPerbendIsNotNullAndLokasi(lokasi);
    }

    public List<Layanan> findLayananByKepSubSeksiPkcIsNotNull(int lokasi) {
        return layananRepository.findByKepSubSeksiPkcIsNotNullAndLokasi(lokasi);
    }
}
