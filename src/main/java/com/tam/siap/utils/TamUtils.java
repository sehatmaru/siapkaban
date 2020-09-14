package com.tam.siap.utils;

import com.tam.siap.models.StatusLayanan;
import com.tam.siap.models.responses.LoginResponse;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.orderedlayout.FlexComponent;
import com.vaadin.flow.component.orderedlayout.FlexComponent.Alignment;
import com.vaadin.flow.component.orderedlayout.FlexComponent.JustifyContentMode;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import com.vaadin.flow.server.VaadinSession;
import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class TamUtils {

	@Autowired
	private static Environment env;

	public static final String SESSION_USERNAME = "username";
	public static final String LOGIN_RESPONSE = "logrespon";
	private static final String key = "aesEncryptionKey";
	private static final String initVector = "encryptionIntVec";

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
		head1.getElement().setProperty("innerHTML",
				"<center style='font-size:12px;'><strong>" + text + "</strong></center>");
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

	public static HorizontalLayout setInlinetext2(Component comp, String text) {
		HorizontalLayout fl = new HorizontalLayout();
		fl.setAlignItems(Alignment.CENTER);
		fl.setJustifyContentMode(JustifyContentMode.END);
		fl.setSpacing(false);
		//String txt2 = text;
//		HorizontalLayout hl = new HorizontalLayout();
		//Icon logoV = new Icon(VaadinIcon.QUESTION_CIRCLE);
//		logoV.getStyle().set("cursor", "pointer");
//		logoV.getElement().setAttribute("style", "cursor:pointer;width:10px;height:10px");
//		logoV.addClickListener(new ComponentEventListener<ClickEvent<Icon>>() {
//
//			@Override
//			public void onComponentEvent(ClickEvent<Icon> event) {
//				// TODO Auto-generated method stub
//				Dialog d = new Dialog();
//				d.add(txt2);
//				d.open();
//			}
//		});
//		hl.setAlignItems(Alignment.CENTER);
//		hl.setJustifyContentMode(JustifyContentMode.END);
		int ll = text.length() > 100 ? 100 : text.length();
		text = text.substring(0, ll);
		Label lbl = new Label(text);
		lbl.setWidthFull();
		lbl.getElement().setAttribute("style", "width:100%;text-align: justify;text-justify: inter-word;font-size:14px");
		//hl.add(logoV);
//		hl.add(lbl);
//		hl.setWidthFull();
		//fl.addFormItem(comp, hl);
		comp.getElement().setAttribute("style", "margin:0 10px 0 5px");
		fl.add(lbl,comp);
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

	public static String encrypt(String value) {
		try {
			IvParameterSpec iv = new IvParameterSpec(initVector.getBytes(StandardCharsets.UTF_8));
			SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "AES");

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
			cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);

			byte[] encrypted = cipher.doFinal(value.getBytes());
			return Base64.encodeBase64String(encrypted);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public static String decrypt(String encrypted) {
		try {
			IvParameterSpec iv = new IvParameterSpec(initVector.getBytes(StandardCharsets.UTF_8));
			SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "AES");

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
			cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
			byte[] original = cipher.doFinal(Base64.decodeBase64(encrypted));

			return new String(original);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return null;
	}

	public static void saveDoc(MemoryBuffer mem, String filename, String folderid, long subjenislayananid)
			throws IOException {

		String filaPath = env.getProperty("layanan.document.path") + "\\" + folderid;
		// String filenamePath = filaPath + "\\" + filename;
		saveDocToServer(mem, filaPath, filename);
	}

	public static void saveImage(MemoryBuffer mem, String filaPath, String filename) throws IOException {

		// String filaPath = env.getProperty("layanan.images.path") + "\\" + filename;
		// String filenamePath = filaPath + "\\" + filename;
		saveDocToServer(mem, filaPath, filename);
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

	public static <T> List<T> convertArrayToList(T array[]) {
		List<T> list = new ArrayList<>();
		Collections.addAll(list, array);
		return list;
	}

	public static boolean createDir(String dir) {
		File folder = new File(dir);

		if (!folder.exists()) {
			return folder.mkdirs();
		} else
			return false;
	}

	public static String fetchStringWithColon(String one, String two, String three, String four, String five) {
		return one + ";" + two + ";" + three + ";" + four + ";" + five;
	}

	public static String fetchStringWithColon(StatusLayanan status) {
		return status.getAccountId() + ";" + status.getTanggal() + ";" + status.getProgress() + ";" + status.getStatus() + ";" + status.getCatatan();
	}

	public static StatusLayanan splitStringWithColon(String data) {
		String[] datas = data.split(";");
		StatusLayanan result = new StatusLayanan();

		result.setAccountId(datas[0]);
		if (datas.length > 1){
			result.setTanggal(datas[1]);

			if (datas.length > 2) {
				result.setProgress(datas[2]);

				if (datas.length > 3) {
					result.setStatus(datas[3]);

					if (datas.length > 4) result.setCatatan(datas[4]);
				}
			}
		}

		return result;
	}

	public static String getRandomNumber() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);

		return String.format("%06d", number);
	}
}
