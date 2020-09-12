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
        return layananRepository.findByPemohononOrderByTanggalDesc(account);
    }

    public List<Layanan> findLayananByPenerimaIsNull(int lokasi) {
        return layananRepository.findByPenerimaIsNullAndLokasiOrderByTanggalDesc(lokasi);
    }

    public List<Layanan> findLayananByPenerimaKanwilIsNullAndStatus(int status) {
        return layananRepository.findByPenerimaKanwilIsNullAndStatusOrderByTanggalDesc(status);
    }

    public List<Layanan> findLayananByPenerimaIsNotNull(int lokasi) {
        return layananRepository.findByPenerimaIsNotNullAndLokasiOrderByTanggalDesc(lokasi);
    }

    public List<Layanan> findLayananByKepKantorIsNotNull(int lokasi) {
        return layananRepository.findByKepKantorIsNotNullAndLokasiOrderByTanggalDesc(lokasi);
    }

    public List<Layanan> findLayananByPemeriksaP2IsNotNull(int lokasi) {
        return layananRepository.findByPemeriksaP2IsNotNullAndLokasiOrderByTanggalDesc(lokasi);
    }

    public List<Layanan> findLayananByPemeriksaP2KanwilIsNotNull() {
        return layananRepository.findByPemeriksaP2KanwilIsNotNullOrderByTanggalDesc();
    }

    public List<Layanan> findLayananByPemeriksaPerbendIsNotNull(int lokasi) {
        return layananRepository.findByPemeriksaPerbendIsNotNullAndLokasiOrderByTanggalDesc(lokasi);
    }

    public List<Layanan> findLayananByPemeriksaPkcIsNotNull(int lokasi) {
        return layananRepository.findByPemeriksaPkcIsNotNullAndLokasiOrderByTanggalDesc(lokasi);
    }

    public List<Layanan> findLayananByKepSeksiP2IsNotNull(int lokasi) {
        return layananRepository.findByKepSeksiP2IsNotNullAndLokasiOrderByTanggalDesc(lokasi);
    }

    public List<Layanan> findLayananByKepBidangP2KanwilIsNotNull () {
        return layananRepository.findByKepBidangP2KanwilIsNotNullOrderByTanggalDesc();
    }

    public List<Layanan> findLayananByKepSeksiPerbendIsNotNull(int lokasi) {
        return layananRepository.findByKepSeksiPerbendIsNotNullAndLokasiOrderByTanggalDesc(lokasi);
    }

    public List<Layanan> findLayananByKepSeksiPkcIsNotNull(int lokasi) {
        return layananRepository.findByKepSeksiPkcIsNotNullAndLokasiOrderByTanggalDesc(lokasi);
    }

    public List<Layanan> findLayananByKepSubSeksiP2IsNotNull(int lokasi) {
        return layananRepository.findByKepSubSeksiP2IsNotNullAndLokasiOrderByTanggalDesc(lokasi);
    }

    public List<Layanan> findLayananByKepSeksiIntelijenIsNotNull() {
        return layananRepository.findByKepSeksiIntelijenKanwilIsNotNullOrderByTanggalDesc();
    }

    public List<Layanan> findLayananByKepSubSeksiPerbendIsNotNull(int lokasi) {
        return layananRepository.findByKepSubSeksiPerbendIsNotNullAndLokasiOrderByTanggalDesc(lokasi);
    }

    public List<Layanan> findLayananByKepSubSeksiPkcIsNotNull(int lokasi) {
        return layananRepository.findByKepSubSeksiPkcIsNotNullAndLokasiOrderByTanggalDesc(lokasi);
    }

    public List<Layanan> findLayananByKepBidangFasilitasKanwilIsNotNull() {
        return layananRepository.findByKepBidangFasilitasKanwilIsNotNullOrderByTanggalDesc();
    }

    public List<Layanan> findLayananByKepSeksiPfKanwilIsNotNull() {
        return layananRepository.findByKepSeksiPfKanwilIsNotNullOrderByTanggalDesc();
    }

    public List<Layanan> findLayananByKepBidPKCKanwilIsNotNull() {
        return layananRepository.findByKepBidPkcKanwilIsNotNullOrderByTanggalDesc();
    }

    public List<Layanan> findLayananByPemeriksaDokumenKanwilIsNotNull() {
        return layananRepository.findByPemeriksaDokumenKanwilIsNotNullOrderByTanggalDesc();
    }

    public List<Layanan> findByLayananKepSeksiPKCKanwilIsNotNull() {
        return layananRepository.findByKepSeksiPkcKanwilIsNotNullOrderByTanggalDesc();
    }
}
