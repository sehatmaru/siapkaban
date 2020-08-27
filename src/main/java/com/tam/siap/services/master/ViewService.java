package com.tam.siap.services.master;

import com.tam.siap.models.Layanan;
import com.tam.siap.models.SJLayanan;
import com.tam.siap.repos.LayananRepository;
import com.tam.siap.models.responses.LayananResponse;
import com.tam.siap.repos.DataViewRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ViewService {

    @Autowired
    DataViewRepos dataViewRepos;

    @Autowired
    LayananRepository layananRepository;

    @Autowired
    LayananService layananService;

    @Autowired
    SubJenisLayananService subJenisLayananService;

    public void findData(Layanan layanan){
        dataViewRepos.findAll();
    }

    public List<Layanan> getAll(){
        return layananRepository.findAll();
    }

    public void dataLayanan(){
        Iterable<Layanan> layanans = layananService.getAllLayanan();
        List<Layanan> list = new ArrayList<>();
        for (Layanan layanan1 : layanans){
            list.add(layanan1);
        }

    }

    public void dataSjLayanan(){
        Iterable<SJLayanan> layanan = subJenisLayananService.findAllSubJenisLayanan();
        List<SJLayanan> list = new ArrayList<>();
        for (SJLayanan sjLayanan : layanan){
            list.add(sjLayanan);
        }

    }
}
