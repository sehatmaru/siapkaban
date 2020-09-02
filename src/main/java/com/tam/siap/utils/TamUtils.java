package com.tam.siap.utils;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.JAXBException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;

import com.tam.siap.models.StatusLayanan;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.poi.xwpf.converter.core.FileURIResolver;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.tika.exception.TikaException;
import org.apache.tika.io.TikaInputStream;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.AutoDetectParser;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.Parser;
import org.apache.tomcat.util.codec.binary.Base64;
import org.docx4j.Docx4J;
import org.docx4j.Docx4jProperties;
import org.docx4j.XmlUtils;
import org.docx4j.convert.in.xhtml.XHTMLImporterImpl;
import org.docx4j.convert.out.ConversionFeatures;
import org.docx4j.convert.out.HTMLSettings;
import org.docx4j.convert.out.html.AbstractHtmlExporter;
import org.docx4j.convert.out.html.HtmlExporterNG2;
import org.docx4j.convert.out.html.SdtToListSdtTagHandler;
import org.docx4j.convert.out.html.SdtWriter;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.openpackaging.exceptions.InvalidFormatException;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.openpackaging.parts.WordprocessingML.NumberingDefinitionsPart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;

import com.tam.siap.models.StatusLayanan;
import com.tam.siap.models.responses.LoginResponse;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.dialog.Dialog;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.icon.Icon;
import com.vaadin.flow.component.icon.VaadinIcon;
import com.vaadin.flow.component.orderedlayout.FlexComponent;
import com.vaadin.flow.component.orderedlayout.FlexComponent.Alignment;
import com.vaadin.flow.component.orderedlayout.FlexComponent.JustifyContentMode;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import com.vaadin.flow.server.VaadinSession;
import org.xml.sax.SAXException;


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

	public static String fetchStringWithColon(String one, String two, String three, String four) {
		return one + ";" + two + ";" + three + ";" + four;
	}

	public static String fetchStringWithColon(StatusLayanan status) {
		return status.getAccountId() + ";" + status.getTanggal() + ";" + status.getStatus() + ";" + status.getCatatan();
	}

	public static StatusLayanan splitStringWithColon(String data) {
		String[] datas = data.split(";");
		StatusLayanan result = new StatusLayanan();

		result.setAccountId(datas[0]);
		if (datas.length > 1){
			result.setTanggal(datas[1]);

			if (datas.length > 2) {
				result.setStatus(datas[2]);

				if (datas.length > 3) result.setCatatan(datas[3]);
			}
		}

		return result;
	}

	public static String getRandomNumber() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);

		return String.format("%06d", number);
	}


	public static void docToHTML() throws IOException, TikaException, SAXException, TransformerConfigurationException {


		InputStream input = TikaInputStream.get(new File("D:\\siapKabanDev\\src\\main\\resources\\report\\NOTA DINAS.doc"));


		//Parser parser = new AutoDetectParser();
		//Parser parser = new AutoDetectParser();
		AutoDetectParser parser = new AutoDetectParser();

		StringWriter sw = new StringWriter();
		SAXTransformerFactory factory = (SAXTransformerFactory)
				SAXTransformerFactory.newInstance();
		TransformerHandler handler = factory.newTransformerHandler();
		handler.getTransformer().setOutputProperty(OutputKeys.METHOD, "html");
		handler.getTransformer().setOutputProperty(OutputKeys.INDENT, "yes");
		handler.setResult(new StreamResult(sw));


		try {
			Metadata metadata = new Metadata();
			parser.parse(input, handler, metadata, new ParseContext());
			String xml = sw.toString();
			System.out.print("tika : "+xml);
			OutputStream os = new java.io.FileOutputStream("D:\\siapKabanDev\\src\\main\\resources\\report\\NotaDinas.html");
		} finally {
			input.close();
		}
	}
	/*
	public static void docxToHTML() throws IOException {
		InputStream in= new FileInputStream(new File("D:\\siapKabanDev\\src\\main\\resources\\report\\NOTA DINAS.docx"));
	//	XWPFDocument document = new XWPFDocument(in);
		XWPFDocument document = new XWPFDocument(in);


		XHTMLOptions options = XHTMLOptions.create().URIResolver(new FileURIResolver(new File("word/media")));

		OutputStream out = new ByteArrayOutputStream();


		XHTMLConverter.getInstance().convert(document, out, options);
		String html=out.toString();
		System.out.println(html);
	}


	 */

	public static void docxToHTML() throws FileNotFoundException, Docx4JException {
		String dir;
		String inputfilepath;
		inputfilepath = "Contoh Surat Undangan Peresmian Kantor.docx";
		dir = "D:\\siapKabanDev\\src\\main\\resources\\report\\docx\\";

		Docx4jProperties.setProperty("docx4j.Convert.Out.HTML.OutputMethodXML", true);



		System.out.println(inputfilepath);
		WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.load(new java.io.File(dir+inputfilepath));

		// XHTML export
		AbstractHtmlExporter exporter = new HtmlExporterNG2();
		AbstractHtmlExporter.HtmlSettings htmlSettings = new AbstractHtmlExporter.HtmlSettings();

		htmlSettings.setWmlPackage(wordMLPackage);

		htmlSettings.setImageDirPath(dir + inputfilepath + "_files");
		htmlSettings.setImageTargetUri(dir + inputfilepath + "_files");

		// list numbering:  depending on whether you want list numbering hardcoded, or done using <li>.
		boolean nestLists = true;
		if (nestLists) {
			SdtWriter.registerTagHandler("HTML_ELEMENT", new SdtToListSdtTagHandler());
		} else {
			htmlSettings.getFeatures().remove(ConversionFeatures.PP_HTML_COLLECT_LISTS);
		} // must do one or the other


		String htmlFilePath = dir + "/resultDocxToXhtml.html";
		OutputStream os = new java.io.FileOutputStream(htmlFilePath);

//		javax.xml.transform.stream.StreamResult result = new javax.xml.transform.stream.StreamResult(os);
//		exporter.html(wordMLPackage, result, htmlSettings);
//		os.flush();
//		os.close();


		Docx4J.toHTML(htmlSettings, os, Docx4J.FLAG_NONE);

	}

	public static void xhtmlToDocx() throws IOException, Docx4JException, JAXBException {
		String dir;
		dir = "D:\\siapKabanDev\\src\\main\\resources\\report\\html";

		String htmlFilePath = dir + "/Contoh Surat Undangan Peresmian Kantor.html";
		String stringFromFile = FileUtils.readFileToString(new File(htmlFilePath), "UTF-8");


		WordprocessingMLPackage docxOut = WordprocessingMLPackage.createPackage();


		XHTMLImporterImpl XHTMLImporter = new XHTMLImporterImpl(docxOut);
		//XHTMLImporter.setHyperlinkStyle("Hyperlink");

		docxOut.getMainDocumentPart().getContent().addAll(
				XHTMLImporter.convert(stringFromFile, null) );

		System.out.println(XmlUtils.marshaltoString(docxOut
				.getMainDocumentPart().getJaxbElement(), true, true));

		docxOut.save(new java.io.File(dir + "/resultHtmlToDocx.docx") );

	}


}
