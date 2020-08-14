package com.tam.siap.services;

import com.tam.siap.document.DocumentPrinter;
import com.tam.siap.models.*;
import com.tam.siap.services.master.DataPerusahaanService;
import com.tam.siap.services.master.DataPribadiService;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.utils.EmailSMTP;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

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

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    private Configuration configuration;

    public int register(Account account, DPribadi dPribadi, DPerusahaan dPerusahaan){
        int result = FAILED;
        int id = 1;
        String subject = "Pendaftaran Berhasil";
        String content = "Terima kasih telah mendaftar";
        String to = "rentayustika@gmail.com";
        String attachement = "src/main/resources/report/LembarDisposisiKepalaKantor.docx";

        if (!accountService.isAccountExist(account.getUsername(), account.getRole())) {
            if (addDataPribadi(dPribadi) == SUCCESS) {
                if (addDataPerusahaan(dPerusahaan) == SUCCESS) {
                    if (addUser(account, dPribadi, dPerusahaan) == SUCCESS) {
                        EmailRequestDto email = new EmailRequestDto("siapkaban@gmail.com", dPribadi.getEmail(), "Dokumen Pendaftaran", "Siapkaban");

                        Map<String, String> model = new HashMap<>();
                        model.put("name", email.getName());
                        model.put("value", "Test Email");

                        if (sendMail(email, model)) result = SUCCESS;
                    }
                }
            }
        }

        return result;
    }

    public boolean sendMail(EmailRequestDto request, Map<String, String> model) {
        boolean result = false;

        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                    StandardCharsets.UTF_8.name());

//            ClassPathResource pdf = new ClassPathResource("static/attachment.pdf");
//            ClassPathResource image = new ClassPathResource("static/asbnotebook.png");
            Template template = configuration.getTemplate("email.ftl");
            String html = FreeMarkerTemplateUtils.processTemplateIntoString(template, model);

            helper.setTo(request.getTo());
            helper.setFrom(request.getFrom());
            helper.setSubject(request.getSubject());
            helper.setText(html, true);
//            helper.addInline("asbnotebook", image);
//            helper.addAttachment("attachment.pdf", pdf);

            mailSender.send(message);
            result = true;
        } catch (MessagingException | IOException | TemplateException e) {
            e.printStackTrace();
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
