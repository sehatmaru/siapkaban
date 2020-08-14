package com.tam.siap.services.master;

import com.tam.siap.models.SJLayanan;
import com.tam.siap.repos.SJLayananRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubJenisLayananService {

    @Autowired
    SJLayananRepository subJenisLayananRepository;

    public List<SJLayanan> findAllSubJenisLayanan(){
        return subJenisLayananRepository.findAll();
    }

    public SJLayanan getSubJenisLayanan(int id){ return subJenisLayananRepository.findById(id); }
}
