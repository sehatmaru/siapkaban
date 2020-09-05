package com.tam.siap.services;

import com.tam.siap.models.request.EmailRequestDto;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import static com.tam.siap.utils.refs.JenisEmail.EMAIL_ACCOUNT;
import static com.tam.siap.utils.refs.JenisEmail.EMAIL_REGISTRASI;

@Service
public class EmailService {

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    Configuration configuration;

    @Autowired
    private Environment env;

    public boolean sendMail(EmailRequestDto request) {
        boolean result = false;

        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                    StandardCharsets.UTF_8.name());

            Template template;

            if (request.getType() == EMAIL_REGISTRASI) {
                template = configuration.getTemplate("email_file.ftl");
            } else if (request.getType() == EMAIL_ACCOUNT) {
                template = configuration.getTemplate("email_account.ftl");
            } else {
                template = configuration.getTemplate("email_penolakan.ftl");
            }

            String html = null;
            if (template != null) {
                html = FreeMarkerTemplateUtils.processTemplateIntoString(template, request.getModel());
            }

            helper.setTo(request.getTo());
            helper.setFrom(request.getFrom());
            helper.setSubject(request.getSubject());
            if (html != null) {
                helper.setText(html, true);
            }

            if (request.getType() == EMAIL_REGISTRASI) {
                String reportDir = env.getProperty("layanan.document.path") + "\\" + request.getUsername() + "\\RegisterForm.pdf";
                File report = new File(reportDir);
                helper.addAttachment(request.getUsername() + "_form.pdf", report);
            }

            mailSender.send(message);

            result = true;
        } catch (MessagingException | IOException | TemplateException e) {
            e.printStackTrace();
        }

        return result;
    }
}
