package com.tam.siap.services.master;

import com.tam.siap.models.*;
import com.tam.siap.repos.JLayananRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JenisLayananService {

    @Autowired
    JLayananRepository layananRepository;

    public List<JLayanan> findAllJenisLayanan(){
        return layananRepository.findAll();
    }

    public JLayanan getJenisLayanan(int id){ return layananRepository.findById(id); }

    public List<JLayanan> findJenisLayanan(JPerusahaan perusahaan) {
        return layananRepository.findByPerusahaan(perusahaan);
    }

    public List<JLayanan> findJenisLayanan(JFasilitas fasilitas) {
        return layananRepository.findByFasilitas(fasilitas);
    }

    public List<JLayanan> findJenisLayanan(JPengelola pengelola) {
        return layananRepository.findByPengelola(pengelola);
    }

    public List<JLayanan> findJenisLayanan(JPenimbunan penimbunan) {
        return layananRepository.findByPenimbunan(penimbunan);
    }
}
