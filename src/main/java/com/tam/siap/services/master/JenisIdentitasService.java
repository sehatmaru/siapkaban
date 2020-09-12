package com.tam.siap.services.master;

import com.tam.siap.models.JIdentitas;
import com.tam.siap.repos.JIdentitasRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JenisIdentitasService {

    @Autowired
    JIdentitasRepository jIdentitasRepository;

    public List<JIdentitas> findAllJenisIdentitas(){
        return jIdentitasRepository.findAll();
    }

    public JIdentitas getJenisIdentitas(int id){ return jIdentitasRepository.findById(id); }

}
