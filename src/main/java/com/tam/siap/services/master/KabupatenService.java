package com.tam.siap.services.master;

import com.tam.siap.models.Dokumen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KabupatenService {

    @Autowired
    KabupatenService kabupatenService;

    public List<Dokumen> findAll() {
        return kabupatenService.findAll();
    }
}
