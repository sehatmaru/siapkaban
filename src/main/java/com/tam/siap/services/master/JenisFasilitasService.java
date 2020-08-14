package com.tam.siap.services.master;

import com.tam.siap.models.JFasilitas;
import com.tam.siap.repos.JFasilitasRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JenisFasilitasService {

    @Autowired
    JFasilitasRepository fasilitasRepository;

    public List<JFasilitas> findAllJenisFasilitas(){
        return fasilitasRepository.findAll();
    }

    public JFasilitas getJenisFasilitas(int id){ return fasilitasRepository.findById(id); }
}
