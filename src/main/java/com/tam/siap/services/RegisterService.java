package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.models.DPribadi;
import com.tam.siap.models.request.EmailRequestDto;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.DataPerusahaanService;
import com.tam.siap.services.master.DataPribadiService;
import com.tam.siap.utils.EmailSMTP;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
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

    DocumentPrinter documentPrinter = new DocumentPrinter();

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private Configuration configuration;

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

                        EmailSMTP emailSMTP = new EmailSMTP();
                        emailSMTP.sendEmail(subject, content, to);
                        result = SUCCESS;
                    }
                }
            }
        }

        return result;
    }

    public String sendMail(EmailRequestDto request, Map<String, String> model) {

        String response;
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
            response = "Email has been sent to :" + request.getTo();
        } catch (MessagingException | IOException | TemplateException e) {
            response = "Email send failure to :" + request.getTo() + ", messaging = " + e.toString();
        }
        return response;
    }

    public void printPdf(){
//        DPribadi dPribadi = dataPribadiService.findDataPribadiById(16);
//        DPerusahaan dPerusahaan = dataPerusahaanService.findDataPerusahaanById(9);
//
//        List<Object> objList = new ArrayList<>();
//        objList.add(0,dPribadi.getNama());
//        objList.add(1,dPribadi.getNomor());
//        objList.add(2,dPribadi.getJabatan());
//        objList.add(3, dPribadi.getTelepon());
//        objList.add(4, dPribadi.getEmail());
//        objList.add(dPribadi.getJenis());
//        objList.add(5, dPerusahaan.getNama());
//        objList.add(6, dPerusahaan.getNpwp());
//        objList.add(7, dPerusahaan.getAlamat());
//        objList.add(8, dPerusahaan.getTelepon());
//        objList.add(9, dPerusahaan.getEmail());
//        objList.add(10, dPerusahaan.getJenis());

        documentPrinter.printRegisForm(0,"pdf");
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
