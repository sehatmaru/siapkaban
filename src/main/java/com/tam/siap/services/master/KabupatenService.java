package com.tam.siap.services.master;

import com.tam.siap.models.Kabupaten;
import com.tam.siap.repos.KabupatenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KabupatenService {

    @Autowired
    KabupatenRepository kabupatenRepository;

    public List<Kabupaten> findAll() {
        return kabupatenRepository.findAll();
    }
}
