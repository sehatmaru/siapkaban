package com.tam.siap.services.master;

import com.tam.siap.models.JLayanan;
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
}
