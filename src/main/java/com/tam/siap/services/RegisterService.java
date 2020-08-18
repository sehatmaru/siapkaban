package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.models.DPribadi;
import com.tam.siap.models.request.EmailRequestDto;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.DataPerusahaanService;
import com.tam.siap.services.master.DataPribadiService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import net.sf.jasperreports.engine.JRException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

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
    public int register(Account account, DPribadi dPribadi, DPerusahaan dPerusahaan){
        int result = FAILED;

        if (!accountService.isAccountExist(account.getUsername(), account.getRole())) {
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
