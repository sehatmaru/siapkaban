package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.models.DPribadi;
import com.tam.siap.models.request.EmailRequestDto;
import com.tam.siap.models.request.InsertPegawaiRequest;
import com.tam.siap.services.master.*;
import net.sf.jasperreports.engine.JRException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

import static com.tam.siap.utils.TamUtils.encrypt;
import static com.tam.siap.utils.refs.Status.*;

@Service
public class RegisterService {

    @Autowired
    AccountService accountService;

    @Autowired
    DataPerusahaanService dataPerusahaanService;

    @Autowired
    DataPribadiService dataPribadiService;

    @Autowired
    EmailService emailService;

    @Autowired
    ExportingService exportingService;

    @Autowired
    RoleService roleService;

    @Autowired
    JenisIdentitasService jenisIdentitasService;

    public int register(Account account, DPribadi dPribadi, DPerusahaan dPerusahaan){
        int result = FAILED;

        if (!accountService.isAccountExist(account.getUsername(), account.getRole())) {
            if (!dataPerusahaanService.isDataPerusahaanExist(dPerusahaan.getNpwp())) {
                if (addDataPribadi(dPribadi) == SUCCESS) {
                    if (addDataPerusahaan(dPerusahaan) == SUCCESS) {
                        if (addUser(account, dPribadi, dPerusahaan) == SUCCESS) {
                            try {
                                exportingService.print(account);
                            } catch (JRException e) {
                                e.printStackTrace();
                            } catch (FileNotFoundException e) {
                                e.printStackTrace();
                            }

                            Map<String, String> model = new HashMap<>();
                            model.put("nama", account.getPribadi().getNama());
                            model.put("nomor", account.getPribadi().getNomor());

                            EmailRequestDto request = new EmailRequestDto(
                                    "siapkaban@gmail.com",
                                    dPribadi.getEmail(),
                                    "Dokumen Pendaftaran",
                                    "email_file.ftl",
                                    account.getUsername(),
                                    model
                            );

                            if (emailService.sendMail(request)) result = SUCCESS;
                        }
                    }
                }
            }
        }

        return result;
    }

    public void insertPegawai(InsertPegawaiRequest request){
        Account account = new Account();
        account.setUsername(request.getNip());
        account.setPassword(encrypt("siapkaban123"));
        account.setStatus(ACTIVE);
        account.setRole(roleService.getRole(request.getRole()));
        account.setLokasi(request.getLokasi());

        DPribadi pribadi = new DPribadi();
        pribadi.setNama(request.getNama());
        pribadi.setNomor(request.getNip());
        pribadi.setJabatan(request.getJabatan());
        pribadi.setJenis(jenisIdentitasService.getJenisIdentitas(6));
        pribadi.setEselon2(request.getEselon2());
        pribadi.setEselon3(request.getEselon3());
        pribadi.setEselon4(request.getEselon4());


        if (addDataPribadi(pribadi) == SUCCESS) addUser(account, pribadi);
    }

    private int addUser(Account account, DPribadi pribadi){
        account.setPribadi(pribadi);

        accountService.save(account);

        if (accountService.isAccountExist(account.getUsername(), account.getRole())) return SUCCESS;
        else return FAILED;
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
