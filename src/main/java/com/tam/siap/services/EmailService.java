package com.tam.siap.services;

import com.tam.siap.models.request.EmailRequestDto;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

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

            Template template = configuration.getTemplate(request.getType());

            String html = FreeMarkerTemplateUtils.processTemplateIntoString(template, request.getModel());

            helper.setTo(request.getTo());
            helper.setFrom(request.getFrom());
            helper.setSubject(request.getSubject());
            helper.setText(html, true);

            if (request.getType().equals("email_file.ftl")) {
                String reportDir = env.getProperty("layanan.generated.report.path") + "/" + request.getUsername() + "/RegisterForm.pdf";
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
