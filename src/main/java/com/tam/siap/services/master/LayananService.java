package com.tam.siap.services.master;

import com.tam.siap.models.Account;
import com.tam.siap.models.Layanan;
import com.tam.siap.models.SJLayanan;
import com.tam.siap.repos.LayananRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LayananService {

    @Autowired
    LayananRepository layananRepository;

    public List<Layanan> getAllLayanan(){
        return layananRepository.findAll();
    }

    public boolean isLayananExist(Account account, SJLayanan subLayanan, String tanggal) {
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

    public List<Layanan> findLayananByPenerimaIsNull() {
        return layananRepository.findByPenerimaIsNull();
    }

    public List<Layanan> findLayananByPenerimaIsNotNull() {
        return layananRepository.findByPenerimaIsNotNull();
    }

    public List<Layanan> findLayananByKepKantorIsNotNull() {
        return layananRepository.findByKepKantorIsNotNull();
    }

    public List<Layanan> findLayananByPemeriksaP2IsNotNull() {
        return layananRepository.findByPemeriksaP2IsNotNull();
    }

    public List<Layanan> findLayananByPemeriksaPerbendIsNotNull() {
        return layananRepository.findByPemeriksaPerbendIsNotNull();
    }

    public List<Layanan> findLayananByPemeriksaPkcIsNotNull() {
        return layananRepository.findByPemeriksaPkcIsNotNull();
    }

    public List<Layanan> findLayananByKepSeksiP2IsNotNull() {
        return layananRepository.findByKepSeksiP2IsNotNull();
    }

    public List<Layanan> findLayananByKepSeksiPerbendIsNotNull() {
        return layananRepository.findByKepSeksiPerbendIsNotNull();
    }

    public List<Layanan> findLayananByKepSeksiPkcIsNotNull() {
        return layananRepository.findByKepSeksiPkcIsNotNull();
    }

    public List<Layanan> findLayananByKepSubSeksiP2IsNotNull() {
        return layananRepository.findByKepSubSeksiP2IsNotNull();
    }

    public List<Layanan> findLayananByKepSubSeksiPerbendIsNotNull() {
        return layananRepository.findByKepSubSeksiPerbendIsNotNull();
    }

    public List<Layanan> findLayananByKepSubSeksiPkcIsNotNull() {
        return layananRepository.findByKepSubSeksiPkcIsNotNull();
    }
}
