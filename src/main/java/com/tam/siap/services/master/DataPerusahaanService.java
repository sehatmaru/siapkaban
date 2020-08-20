package com.tam.siap.services.master;

import com.tam.siap.models.DPerusahaan;
import com.tam.siap.repos.DPerusahaanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.tam.siap.utils.refs.Status.*;

@Service
public class DataPerusahaanService {

    @Autowired
    DPerusahaanRepository dPerusahaanRepository;

    public boolean isDataPerusahaanActive(String npwp) {
        return dPerusahaanRepository.findByNpwpAndStatus(npwp, ACTIVE) != null;
    }

    public boolean isDataPerusahaanPending(String npwp) {
        return dPerusahaanRepository.findByNpwpAndStatus(npwp, PENDING) != null;
    }

    public boolean isDataPerusahaanRejected(String npwp) {
        return dPerusahaanRepository.findByNpwpAndStatus(npwp, REJECTED) != null;
    }

    public boolean isDataPerusahaanInactive(String npwp) {
        return dPerusahaanRepository.findByNpwpAndStatus(npwp, INACTIVE) != null;
    }
//
//    public DPerusahaan findDataPerusahaanByAccount(Account account) {
//        return dPerusahaanRepository.findByAccount(account);
//    }

    public DPerusahaan findDataPerusahaanById(int id){
        return dPerusahaanRepository.findById(id);
    }

    public boolean isDataPerusahaanExist(int id) {
        return dPerusahaanRepository.findById(id) != null;
    }

    public boolean isDataPerusahaanExist(String npwp) {
        return dPerusahaanRepository.findByNpwp(npwp) != null;
    }

    public void save(DPerusahaan dPerusahaan){
        dPerusahaanRepository.save(dPerusahaan);
    }
}
