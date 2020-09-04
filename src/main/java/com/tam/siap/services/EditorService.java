package com.tam.siap.services;

import com.tam.siap.models.JDokumen;
import com.tam.siap.models.Layanan;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import org.apache.commons.io.FileUtils;
import org.docx4j.Docx4J;
import org.docx4j.Docx4jProperties;
import org.docx4j.convert.in.xhtml.XHTMLImporterImpl;
import org.docx4j.convert.out.html.AbstractHtmlExporter;
import org.docx4j.convert.out.html.SdtToListSdtTagHandler;
import org.docx4j.convert.out.html.SdtWriter;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.io.*;

import static com.tam.siap.utils.TamUtils.createDir;
import static com.tam.siap.utils.refs.JenisLokasi.TANGERANG;

@Service
public class EditorService {

    @Autowired
    Environment environment;

    @Autowired
    UploadService uploadService;

    public String htmlToDocx(Layanan layanan, JDokumen jDokumen, String html) {
        try {
            String reportPath = environment.getProperty("layanan.document.path");

            WordprocessingMLPackage docxOut = WordprocessingMLPackage.createPackage();

            XHTMLImporterImpl XHTMLImporter = new XHTMLImporterImpl(docxOut);

            docxOut.getMainDocumentPart().getContent().addAll(
                    XHTMLImporter.convert(html, null) );

            String path = reportPath
                    + "/" + layanan.getPemohonon().getUsername()
                    + "/" + layanan.getNomor()
                    + "/hasil";

            createDir(path);
            String file = path + "/" + jDokumen.getKeterangan() + ".docx";
//windows            String path = reportPath + "\\" + layanan.getPemohonon().getId() + "\\" + layanan.getNomor() + "\\hasil\\" + jDokumen.getDeskripsi() + ".docx";

            docxOut.save(new File(file));

            return file;
        } catch (Docx4JException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void docxToHTML(String filename) {
        try {
            String reportPath = environment.getProperty("layanan.document.path");

            String path = reportPath + "/template";

            String fileDocx = path + "/" + filename + ".docx";

            Docx4jProperties.setProperty("docx4j.Convert.Out.HTML.OutputMethodXML", true);

            WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.load(new java.io.File(fileDocx));
            AbstractHtmlExporter.HtmlSettings htmlSettings = new AbstractHtmlExporter.HtmlSettings();

            htmlSettings.setWmlPackage(wordMLPackage);
            htmlSettings.setImageDirPath(fileDocx + "_files");
            htmlSettings.setImageTargetUri(fileDocx + "_files");

            SdtWriter.registerTagHandler("HTML_ELEMENT", new SdtToListSdtTagHandler());
//            htmlSettings.getFeatures().remove(ConversionFeatures.PP_HTML_COLLECT_LISTS);

            String htmlFilePath = path + "/" + filename + ".html";

            OutputStream os = new FileOutputStream(htmlFilePath);

            Docx4J.toHTML(htmlSettings, os, Docx4J.FLAG_NONE);
        } catch (FileNotFoundException | Docx4JException e) {
            e.printStackTrace();
        }
    }

    public String docxToHTML(MemoryBuffer memoryBuffer, Layanan layanan, JDokumen dokumen) {
        try {
            String reportPath = environment.getProperty("layanan.document.path");

            String path = reportPath
                    + "/" + layanan.getPemohonon().getUsername()
                    + "/" + layanan.getNomor()
                    + "/hasil";
//windows            String path = reportPath + "\\" + layanan.getPemohonon().getUsername() + "\\" + layanan.getNomor() + "\\hasil";

            createDir(path);
            String fileDocx = path + "/" + dokumen.getKeterangan() + ".docx";
//windows            String fileDocx = path + "\\" + dokumen.getKeterangan() + ".docx";

            uploadService.saveFile(memoryBuffer, path, fileDocx);

            Docx4jProperties.setProperty("docx4j.Convert.Out.HTML.OutputMethodXML", true);

            WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.load(new java.io.File(fileDocx));
            AbstractHtmlExporter.HtmlSettings htmlSettings = new AbstractHtmlExporter.HtmlSettings();

            htmlSettings.setWmlPackage(wordMLPackage);
            htmlSettings.setImageDirPath(fileDocx + "_files");
            htmlSettings.setImageTargetUri(fileDocx + "_files");

            SdtWriter.registerTagHandler("HTML_ELEMENT", new SdtToListSdtTagHandler());
//            htmlSettings.getFeatures().remove(ConversionFeatures.PP_HTML_COLLECT_LISTS);

            String htmlFilePath = path + "/" + dokumen.getKeterangan() + ".html";
//windows            String htmlFilePath = path + "\\" + dokumen.getKeterangan() + ".html";

            OutputStream os = new FileOutputStream(htmlFilePath);

            Docx4J.toHTML(htmlSettings, os, Docx4J.FLAG_NONE);

            return htmlFilePath;
        } catch (FileNotFoundException | Docx4JException e) {
            e.printStackTrace();
            return null;
        }
    }

    public String htmlToString(Layanan layanan, JDokumen dokumen) {
        String reportPath = environment.getProperty("layanan.document.path");
        String file;

        System.out.println("jenis = " + dokumen.getId());

        if (layanan.getLokasi() == TANGERANG) file = reportPath + "/template/tangerang/" + dokumen.getId() + ".html";
//windows            if (layanan.getLokasi() == TANGERANG) file = reportPath + "\\template\\tangerang\\" + dokumen.getId() + ".html";
        else file = reportPath + "/template/merak/" + dokumen.getId() + ".html";
//windows            else file = reportPath + "\\template\\merak\\" + dokumen.getId() + ".html";

        return htmlToString(file);
    }

    public String htmlToString(String path) {
        try {
            return FileUtils.readFileToString(new File(path), "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public File getPath(Layanan layanan, JDokumen dokumen) {
        String reportPath = environment.getProperty("layanan.document.path");
        String file;

        if (layanan.getLokasi() == TANGERANG) file = reportPath + "/template/tangerang/" + dokumen.getId() + ".docx";
        else file = reportPath + "/template/merak/" + dokumen.getId() + ".docx";

        return new File(file);
    }

//    public void docToHTML() throws IOException, TikaException, SAXException, TransformerConfigurationException {
//        InputStream input = TikaInputStream.get(new File("D:\\siapKabanDev\\src\\main\\resources\\report\\NOTA DINAS.doc"));
//
//
//        //Parser parser = new AutoDetectParser();
//        //Parser parser = new AutoDetectParser();
//        AutoDetectParser parser = new AutoDetectParser();
//
//        StringWriter sw = new StringWriter();
//        SAXTransformerFactory factory = (SAXTransformerFactory)
//                SAXTransformerFactory.newInstance();
//        TransformerHandler handler = factory.newTransformerHandler();
//        handler.getTransformer().setOutputProperty(OutputKeys.METHOD, "html");
//        handler.getTransformer().setOutputProperty(OutputKeys.INDENT, "yes");
//        handler.setResult(new StreamResult(sw));
//
//
//        try {
//            Metadata metadata = new Metadata();
//            parser.parse(input, handler, metadata, new ParseContext());
//            String xml = sw.toString();
//            System.out.print("tika : "+xml);
//            OutputStream os = new java.io.FileOutputStream("D:\\siapKabanDev\\src\\main\\resources\\report\\NotaDinas.html");
//        } finally {
//            input.close();
//        }
//    }
}
