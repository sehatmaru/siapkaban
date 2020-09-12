package com.tam.siap.services.master;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPribadi;
import com.tam.siap.repos.DPribadiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DataPribadiService {

    @Autowired
    DPribadiRepository dPribadiRepository;

//    public boolean isDataPribadiExist(Account account) {
//        return dPribadiRepository.findByAccount(account) != null;
//    }

    public boolean isDataPribadiExist(int id) {
        return dPribadiRepository.findById(id) != null;
    }
//
//    public DPribadi findDataPribadiByAccount(Account account) {
//        return dPribadiRepository.findByAccount(account);
//    }

    public DPribadi findDataPribadiById(int id){
        return dPribadiRepository.findById(id);
    }

    public void save(DPribadi dPribadi){
        dPribadiRepository.save(dPribadi);
    }
}
