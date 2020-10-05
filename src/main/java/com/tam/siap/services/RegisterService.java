package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.models.DPribadi;
import com.tam.siap.models.JPerusahaan;
import com.tam.siap.models.request.EmailRequestDto;
import com.tam.siap.models.request.InsertPegawaiRequest;
import com.tam.siap.services.master.*;
import net.sf.jasperreports.engine.JRException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.List;
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
            if (!isDataPerusahaanExist(dPerusahaan.getNpwp(), dPerusahaan.getJenis())) {
                if (addDataPribadi(dPribadi) == SUCCESS) {
                    if (addDataPerusahaan(dPerusahaan) == SUCCESS) {
                        if (addUser(account, dPribadi, dPerusahaan) == SUCCESS) {
                            result = sendEmail(account, dPribadi);
                        }
                    }
                }
            } else {
                if (addDataPribadi(dPribadi) == SUCCESS) {
                    updateDataPerusahaan(dPerusahaan);

                    if (addUser(account, dPribadi, getPerusahaan(dPerusahaan.getNpwp())) == SUCCESS) {
                        result = sendEmail(account, dPribadi);
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

    private void addUser(Account account, DPribadi pribadi){
        account.setPribadi(pribadi);

        accountService.save(account);
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

    private void updateDataPerusahaan(DPerusahaan dPerusahaan){
        DPerusahaan existPerusahaan = getPerusahaan(dPerusahaan.getNpwp());
        existPerusahaan.setNpwp(dPerusahaan.getNpwp());
        existPerusahaan.setNama(dPerusahaan.getNama());
        existPerusahaan.setPenanggungJawab(dPerusahaan.getPenanggungJawab());
        existPerusahaan.setJenis(dPerusahaan.getJenis());
        existPerusahaan.setKabupaten(dPerusahaan.getKabupaten());
        existPerusahaan.setKecamatan(dPerusahaan.getKecamatan());
        existPerusahaan.setAlamat(dPerusahaan.getAlamat());
        existPerusahaan.setTelepon(dPerusahaan.getTelepon());
        existPerusahaan.setEmail(dPerusahaan.getEmail());

        dataPerusahaanService.save(existPerusahaan);
    }

    private int sendEmail(Account account, DPribadi dPribadi) {
        int result = FAILED;

        try {
            exportingService.print(account);
        } catch (JRException | FileNotFoundException e) {
            e.printStackTrace();
        }

        Map<String, String> model = new HashMap<>();
        model.put("nama", account.getPribadi().getNama());
        model.put("nomor", account.getPribadi().getNomor());

        EmailRequestDto request = new EmailRequestDto(
                "siapkaban@gmail.com",
                dPribadi.getEmail(),
                "Dokumen Pendaftaran",
                1,
                account.getUsername(),
                model
        );

        if (emailService.sendMail(request)) result = SUCCESS;

        return result;
    }

    private boolean isDataPerusahaanExist(String npwp, JPerusahaan perusahaan) {
        boolean result = false;

        List<DPerusahaan> perusahaans = dataPerusahaanService.findDataPerusahaanByJenisPerusahaan(perusahaan);

        for (DPerusahaan data : perusahaans) {
            if (data.getNpwp().replaceAll("[^a-zA-Z0-9]", "").equals(npwp)) {
                result = true;
                break;
            }
        }

        return result ;
    }

    public DPerusahaan findPerusahaan(String npwp, JPerusahaan perusahaan) {
        DPerusahaan result = null;

        List<DPerusahaan> perusahaans = dataPerusahaanService.findDataPerusahaanByJenisPerusahaan(perusahaan);

        for (DPerusahaan data : perusahaans) {
            if (data.getNpwp().replaceAll("[^a-zA-Z0-9]", "").equals(npwp)) {
                result = data;
                break;
            }
        }

        return result;
    }

    private DPerusahaan getPerusahaan(String npwp) {
        DPerusahaan result = new DPerusahaan();
        List<DPerusahaan> perusahaans = dataPerusahaanService.findAll();

        for (DPerusahaan data : perusahaans) {
            if (data.getNpwp().replaceAll("[^a-zA-Z0-9]", "").equals(npwp)) {
                result = data;
            }
        }

        return result;
    }

}
