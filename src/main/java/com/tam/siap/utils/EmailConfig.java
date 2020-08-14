package com.tam.siap.utils;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.SimpleMailMessage;

@Configuration
public class EmailConfig {
    @Bean
    public SimpleMailMessage emailTemplate() {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo("rentayustika@gmail.com");
        message.setFrom("lokasi.forgotpass@gmail.com");
        message.setSubject("Registrasi Berhasil");
        message.setText("Terima kasih sudah mendaftar");
        return message;
    }
}
