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
}
