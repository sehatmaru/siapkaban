package com.tam.siap.services.master;

import com.tam.siap.models.JPengelola;
import com.tam.siap.repos.JPengelolaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JenisPengelolaService {

    @Autowired
    JPengelolaRepository pengelolaRepository;

    public List<JPengelola> findAllJenisPengelola(){
        return pengelolaRepository.findAll();
    }

    public JPengelola getJenisPengelola(int id){ return pengelolaRepository.findById(id); }
}
