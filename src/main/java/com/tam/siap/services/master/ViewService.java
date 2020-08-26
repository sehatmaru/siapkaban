package com.tam.siap.services.master;

import com.tam.siap.models.Layanan;
import com.tam.siap.models.responses.LayananResponse;
import com.tam.siap.repos.DataViewRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ViewService {

    @Autowired
    DataViewRepos dataViewRepos;

    public void findData(Layanan layanan){
        dataViewRepos.findAll();
    }
}
