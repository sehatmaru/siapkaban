package com.tam.siap.utils;

import org.springframework.core.io.FileSystemResource;

import java.io.File;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSMTP {

	private String username = "lokasi.forgotpass@gmail.com";
	private String password = "Don'tforget!";
	private Session session;

	public EmailSMTP() {
		// TODO Auto-generated constructor stub
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true"); // TLS

		session = Session.getInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
	}

	public boolean sendEmail(String subject, String content, String to) {
		boolean result = false;
		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("Kaban"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(content);

			Transport.send(message);

			System.out.println("Email sent!");

			result = true;

		} catch (MessagingException e) {
			e.printStackTrace();
			result = false;
		}

		return result;
	}

}
