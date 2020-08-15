package com.tam.siap.utils;

import java.io.File;
import java.io.IOException;
import java.nio.file.StandardCopyOption;
import java.util.Random;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;

import com.tam.siap.models.responses.LoginResponse;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.orderedlayout.FlexComponent;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import com.vaadin.flow.server.VaadinSession;

public class TamUtils {
	
	@Autowired
	private static Environment env;

	public static final String SESSION_USERNAME = "username";
	public static final String LOGIN_RESPONSE = "logrespon";

	public static char[] generatePassword(int length) {
		String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
		String specialCharacters = "!@#$";
		String numbers = "1234567890";
		String combinedChars = capitalCaseLetters + lowerCaseLetters + specialCharacters + numbers;
		Random random = new Random();
		char[] password = new char[length];

		password[0] = lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
		password[1] = capitalCaseLetters.charAt(random.nextInt(capitalCaseLetters.length()));
		password[2] = specialCharacters.charAt(random.nextInt(specialCharacters.length()));
		password[3] = numbers.charAt(random.nextInt(numbers.length()));

		for (int i = 4; i < length; i++) {
			password[i] = combinedChars.charAt(random.nextInt(combinedChars.length()));
		}
		return password;
	}

	public static VerticalLayout setCustomHerader(String text) {
		Label head1 = new Label();
		head1.getElement().setProperty("innerHTML", "<center><strong>" + text + "</strong></center>");
		VerticalLayout headerContent = new VerticalLayout();
		headerContent.setSizeFull();
		headerContent.setPadding(false);
		headerContent.setSpacing(false);
		headerContent.setMargin(false);
		headerContent.add(head1);
		headerContent.setHorizontalComponentAlignment(FlexComponent.Alignment.CENTER, head1);
		return headerContent;
	}

	public static FormLayout setInlinetext(Component comp, String text) {
		FormLayout fl = new FormLayout();
		fl.addFormItem(comp, text);
		fl.setWidthFull();
		return fl;
	}

	public static void setSession(LoginResponse response) {
		VaadinSession.getCurrent().setAttribute(SESSION_USERNAME, response.getAccount().getUsername());
		VaadinSession.getCurrent().setAttribute(LOGIN_RESPONSE, response);
	}

	public static boolean isAuthenticated() {
		return VaadinSession.getCurrent().getAttribute(SESSION_USERNAME) != null;
	}
	
	public static LoginResponse getLoginResponse() {
		return (LoginResponse) VaadinSession.getCurrent().getAttribute(LOGIN_RESPONSE);
	}
	
	public static void saveDoc(MemoryBuffer mem,String filename,String folderid, long subjenislayananid) throws IOException {

		String filaPath = env.getProperty("layanan.document.path") + "\\" + folderid;
		//String filenamePath = filaPath + "\\" + filename;
		saveDocToServer(mem,filaPath,filename);
	}
	
	public static void saveImage(MemoryBuffer mem,String filaPath,String filename) throws IOException {

		//String filaPath = env.getProperty("layanan.images.path") + "\\" + filename;
		//String filenamePath = filaPath + "\\" + filename;
		saveDocToServer(mem,filaPath,filename);
	}

	public static boolean saveDocToServer(MemoryBuffer mem, String filepath, String filename) throws IOException {
		// InputStream initialStream = new FileInputStream(new
		// File("src/main/resources/sample.txt"));
		boolean ok = true;
		File dir = new File(filepath);
		if (!dir.exists())
			dir.mkdirs();

		File targetFile = new File(filepath + "\\" + filename);

		java.nio.file.Files.copy(mem.getInputStream(), targetFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

		IOUtils.closeQuietly(mem.getInputStream());
		// System.out.println("File saved in : "+targetFile.getAbsolutePath());
		filepath = targetFile.getAbsolutePath();
		return ok;
	}

}
