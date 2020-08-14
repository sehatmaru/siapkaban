package com.tam.siap.services.master;

import com.tam.siap.models.*;
import com.tam.siap.repos.LayananRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LayananService {

    @Autowired
    LayananRepository layananRepository;

    public List<Layanan> getAllLayanan(){
        return layananRepository.findAll();
    }

    public List<JLayanan> findLayanan(JPerusahaan perusahaan){
        List<JLayanan> layanan = new ArrayList<>();
        List<Layanan> layanans = layananRepository.findByPerusahaan(perusahaan);

        for (Layanan layanan0 : layanans) {
            layanan.add(layanan0.getLayanan());
        }

        return layanan;
    }

    public List<SJLayanan> findSubLayanan(JPerusahaan perusahaan, JLayanan layanan){
        List<SJLayanan> subLayanan = new ArrayList<>();
        List<Layanan> layanans = layananRepository.findByPerusahaanAndLayananOrderById(perusahaan, layanan);

        for (Layanan layanan0 : layanans) {
            subLayanan.add(layanan0.getSubJenisLayanan());
        }

        return subLayanan;
    }

    //kite
    public List<JFasilitas> findFasilitas(JPerusahaan perusahaan){
        List<JFasilitas> fasilitas = new ArrayList<>();
        List<Layanan> layanans = layananRepository.findByPerusahaan(perusahaan);

        for (Layanan layanan : layanans) {
            fasilitas.add(layanan.getFasilitas());
        }

        return fasilitas;
    }

    public List<JLayanan> findLayanan(JPerusahaan perusahaan, JFasilitas fasilitas){
        List<JLayanan> layanan = new ArrayList<>();
        List<Layanan> layanans = layananRepository.findByPerusahaanAndFasilitasOrderById(perusahaan, fasilitas);

        for (Layanan layanan0 : layanans) {
            layanan.add(layanan0.getLayanan());
        }

        return layanan;
    }

    public List<SJLayanan> findSubLayanan(JPerusahaan perusahaan, JFasilitas fasilitas, JLayanan layanan){
        List<SJLayanan> subLayanan = new ArrayList<>();
        List<Layanan> layanans = layananRepository.findByPerusahaanAndFasilitasAndLayananOrderById(perusahaan, fasilitas, layanan);

        for (Layanan layanan0 : layanans) {
            subLayanan.add(layanan0.getSubJenisLayanan());
        }

        return subLayanan;
    }

    //kawasan pabean
    public List<JPengelola> findPengelola(JPerusahaan perusahaan){
        List<JPengelola> pengelolas = new ArrayList<>();
        List<Layanan> layanans = layananRepository.findByPerusahaan(perusahaan);

        for (Layanan layanan : layanans) {
            pengelolas.add(layanan.getPengelola());
        }

        return pengelolas;
    }

    public List<JLayanan> findLayanan(JPerusahaan perusahaan, JPengelola pengelola){
        List<JLayanan> layanan = new ArrayList<>();
        List<Layanan> layanans = layananRepository.findByPerusahaanAndPengelolaOrderById(perusahaan, pengelola);

        for (Layanan layanan0 : layanans) {
            layanan.add(layanan0.getLayanan());
        }

        return layanan;
    }

    public List<SJLayanan> findSubLayanan(JPerusahaan perusahaan, JPengelola pengelola, JLayanan layanan){
        List<SJLayanan> subLayanan = new ArrayList<>();
        List<Layanan> layanans = layananRepository.findByPerusahaanAndPengelolaAndLayananOrderById(perusahaan, pengelola, layanan);

        for (Layanan layanan0 : layanans) {
            subLayanan.add(layanan0.getSubJenisLayanan());
        }

        return subLayanan;
    }

    //tps
    public List<JPenimbunan> findPenimbunan(JPerusahaan perusahaan){
        List<JPenimbunan> penimbunans = new ArrayList<>();
        List<Layanan> layanans = layananRepository.findByPerusahaan(perusahaan);

        for (Layanan layanan : layanans) {
            penimbunans.add(layanan.getPenimbunan());
        }

        return penimbunans;
    }

    public List<JLayanan> findLayanan(JPerusahaan perusahaan, JPenimbunan pengelola){
        List<JLayanan> layanan = new ArrayList<>();
        List<Layanan> layanans = layananRepository.findByPerusahaanAndPenimbunanOrderById(perusahaan, pengelola);

        for (Layanan layanan0 : layanans) {
            layanan.add(layanan0.getLayanan());
        }

        return layanan;
    }

    public List<SJLayanan> findSubLayanan(JPerusahaan perusahaan, JPenimbunan pengelola, JLayanan layanan){
        List<SJLayanan> subLayanan = new ArrayList<>();
        List<Layanan> layanans = layananRepository.findByPerusahaanAndPenimbunanAndLayananOrderById(perusahaan, pengelola, layanan);

        for (Layanan layanan0 : layanans) {
            subLayanan.add(layanan0.getSubJenisLayanan());
        }

        return subLayanan;
    }
}
