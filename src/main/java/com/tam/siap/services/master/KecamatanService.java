package com.tam.siap.services.master;

import com.tam.siap.models.Kabupaten;
import com.tam.siap.models.Kecamatan;
import com.tam.siap.repos.KecamatanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KecamatanService {

    @Autowired
    KecamatanRepository kecamatanRepository;

    public List<Kecamatan> findAll() {
        return kecamatanRepository.findAll();
    }

    public List<Kecamatan> getKecamatanList(Kabupaten kabupaten) {
        return kecamatanRepository.findByKabupaten(kabupaten);
    }
}
