package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPribadi;
import com.tam.siap.models.request.EditProfileRequest;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.DataPribadiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.tam.siap.utils.refs.Status.FAILED;
import static com.tam.siap.utils.refs.Status.SUCCESS;

@Service
public class ProfileService {

    @Autowired
    AccountService accountService;

    @Autowired
    DataPribadiService dataPribadiService;

    public int updateProfile(EditProfileRequest edit) {
        int result = FAILED;

        if (accountService.isAccountExist(edit.getUsername())) {
          Account  account = accountService.findByUsername(edit.getUsername());
          account.setPassword(edit.getPassword());
            if (dataPribadiService.isDataPribadiExist(account.getPribadi().getId())){
                DPribadi data = dataPribadiService.findDataPribadiById(account.getPribadi().getId());
                data.setNama(edit.getNama());
                data.setNomor(edit.getNomor());
                data.setEmail(edit.getEmail());
                data.setGambar(edit.getGambar());

                accountService.save(account);
                dataPribadiService.save(data);
                result = SUCCESS;
            }
        }

        return result;
    }
}
