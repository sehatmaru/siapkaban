package com.tam.siap.services;

import com.tam.siap.document.DocumentPrinter;
import com.tam.siap.models.*;
import com.tam.siap.services.master.DataPerusahaanService;
import com.tam.siap.services.master.DataPribadiService;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.utils.EmailSMTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static com.tam.siap.utils.refs.Status.*;

@Service
public class RegisterService {

    @Autowired
    AccountService accountService;

    @Autowired
    DataPerusahaanService dataPerusahaanService;

    @Autowired
    DataPribadiService dataPribadiService;

    DocumentPrinter documentPrinter = new DocumentPrinter();

    public int register(Account account, DPribadi dPribadi, DPerusahaan dPerusahaan){
        int result = FAILED;
        int id = 1;
        String subject = "Pendaftaran Berhasil";
        String content = "Terima kasih telah mendaftar";
        String to = "rentayustika@gmail.com";
        String attachement = "src/main/resources/report/LembarDisposisiKepalaKantor.docx";

        if (!accountService.isAccountExist(account.getUsername(), account.getRole())){
            if (addDataPribadi(dPribadi) == SUCCESS){
                if (addDataPerusahaan(dPerusahaan) == SUCCESS){
                    if (addUser(account, dPribadi, dPerusahaan) == SUCCESS) {
                        List<Object> objList = new ArrayList<>();
                        objList.add(0,dPribadi.getNama());
                        objList.add(1,dPribadi.getNomor());
                        objList.add(2,dPribadi.getJabatan());
                        objList.add(3, dPribadi.getTelepon());
                        objList.add(4, dPribadi.getEmail());
                        objList.add(dPribadi.getJenis());
                        objList.add(5, dPerusahaan.getNama());
                        objList.add(6, dPerusahaan.getNpwp());
                        objList.add(7, dPerusahaan.getAlamat());
                        objList.add(8, dPerusahaan.getTelepon());
                        objList.add(9, dPerusahaan.getEmail());
                        objList.add(10, dPerusahaan.getJenis());

                        documentPrinter.printRegisForm(id,"pdf", objList);

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
