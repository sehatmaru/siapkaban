package com.tam.siap.services.master;

import com.tam.siap.models.JPerusahaan;
import com.tam.siap.repos.JPerusahaanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JenisPerusahaanService {

    @Autowired
    JPerusahaanRepository jPerusahaanRepository;

    public List<JPerusahaan> findAllJenisPerusahaan(){
        return jPerusahaanRepository.findAll();
    }

    public JPerusahaan getJenisPerusahaan(int id){ return jPerusahaanRepository.findById(id); }

}
