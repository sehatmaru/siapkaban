package com.tam.siap.services;

import com.tam.siap.document.DocumentPrinter;
import com.tam.siap.models.*;
import com.tam.siap.services.master.DataPerusahaanService;
import com.tam.siap.services.master.DataPribadiService;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.utils.EmailSMTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.tam.siap.utils.refs.Status.*;

@Service
public class RegisterService {

    @Autowired
    AccountService accountService;

    @Autowired
    DataPerusahaanService dataPerusahaanService;

    @Autowired
    DataPribadiService dataPribadiService;

    public int register(Account account, DPribadi dPribadi, DPerusahaan dPerusahaan){
        int result = FAILED;
        int id = 1;
        String dokumen = "REGISTER_FORM";
        String subject = "Pendaftaran Berhasil";
        String content = "Terima kasih telah mendaftar";
        String to = "maruzhaky@gmail.com";

        if (!accountService.isAccountExist(account.getUsername(), account.getRole())){
            if (addDataPribadi(dPribadi) == SUCCESS){
                if (addDataPerusahaan(dPerusahaan) == SUCCESS){
                    if (addUser(account, dPribadi, dPerusahaan) == SUCCESS) {
                        EmailSMTP emailSMTP = new EmailSMTP();
                        emailSMTP.sendEmail(subject, content, to);
                        result = SUCCESS;
                    };
                }
            }
        }

        return result;
    }

    private int addUser(Account account, DPribadi pribadi, DPerusahaan perusahaan){
        account.setStatus(PENDING);
        account.setPribadi(pribadi);
        account.setPerusahaan(perusahaan);

        accountService.save(account);

        if (accountService.isAccountExist(account.getUsername(), account.getRole())) return SUCCESS;
        else return FAILED;
    }

    private int addDataPribadi(DPribadi dPribadi){
        dataPribadiService.save(dPribadi);

        if (dataPribadiService.isDataPribadiExist(dPribadi.getId())) return SUCCESS;
        else return FAILED;
    }

    private int addDataPerusahaan(DPerusahaan dPerusahaan){
        dPerusahaan.setStatus(PENDING);

        dataPerusahaanService.save(dPerusahaan);

        if (dataPerusahaanService.isDataPerusahaanExist(dPerusahaan.getId())) return SUCCESS;
        else return FAILED;
    }

}
