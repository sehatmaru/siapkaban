package com.tam.siap.services.master;

import com.tam.siap.models.JPenimbunan;
import com.tam.siap.repos.JPenimbunanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JenisPenimbunanService {

    @Autowired
    JPenimbunanRepository penimbunanRepository;

    public List<JPenimbunan> findAllJenisPenimbunan(){
        return penimbunanRepository.findAll();
    }

    public JPenimbunan getJenisPenimbunan(int id){ return penimbunanRepository.findById(id); }
}
