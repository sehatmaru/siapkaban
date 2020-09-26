package com.tam.siap.services;

import com.tam.siap.models.JDokumen;
import com.tam.siap.models.Layanan;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import fr.opensagres.poi.xwpf.converter.pdf.PdfConverter;
import fr.opensagres.poi.xwpf.converter.pdf.PdfOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.io.*;

import static com.tam.siap.utils.TamUtils.createDir;
import static com.tam.siap.utils.refs.JenisLokasi.TANGERANG;
import static com.tam.siap.utils.refs.ProgressLayanan.ON_BATCH_2_KPPBC;

@Service
public class EditorService {

    @Autowired
    Environment environment;

    @Autowired
    UploadService uploadService;

//    public String htmlToDocx(Layanan layanan, JDokumen jDokumen, String html) {
//        try {
//            String reportPath = environment.getProperty("layanan.document.path");
//
//            WordprocessingMLPackage docxOut = WordprocessingMLPackage.createPackage();
//
//            XHTMLImporterImpl XHTMLImporter = new XHTMLImporterImpl(docxOut);
//
//            docxOut.getMainDocumentPart().getContent().addAll(
//                    XHTMLImporter.convert(htmlToXhtml(html).replace("&nbsp;", "&#160;"), null) );
//
//            String path = reportPath
//                    + "/" + layanan.getPemohonon().getUsername()
//                    + "/" + layanan.getNomor()
//                    + "/hasil";
//
//            createDir(path);
//            String file = path + "/" + jDokumen.getKeterangan() + ".docx";
//
//            docxOut.save(new File(file));
//
//            return file;
//        } catch (Docx4JException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//    public void docxToHTML(String filename) {
//        try {
//            String reportPath = environment.getProperty("layanan.document.path");
//
//            String path = reportPath + "/template";
//
//            String fileDocx = path + "/" + filename + ".docx";
//
//            Docx4jProperties.setProperty("docx4j.Convert.Out.HTML.OutputMethodXML", true);
//
//            WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.load(new java.io.File(fileDocx));
//            AbstractHtmlExporter.HtmlSettings htmlSettings = new AbstractHtmlExporter.HtmlSettings();
//
//            htmlSettings.setWmlPackage(wordMLPackage);
//            htmlSettings.setImageDirPath(fileDocx + "_files");
//            htmlSettings.setImageTargetUri(fileDocx + "_files");
//
//            SdtWriter.registerTagHandler("HTML_ELEMENT", new SdtToListSdtTagHandler());
////            htmlSettings.getFeatures().remove(ConversionFeatures.PP_HTML_COLLECT_LISTS);
//
//            String htmlFilePath = path + "/" + filename + ".html";
//
//            OutputStream os = new FileOutputStream(htmlFilePath);
//
//            Docx4J.toHTML(htmlSettings, os, Docx4J.FLAG_NONE);
//        } catch (FileNotFoundException | Docx4JException e) {
//            e.printStackTrace();
//        }
//    }
//
//    public String docxToHTML(MemoryBuffer memoryBuffer, Layanan layanan, JDokumen dokumen) {
//        try {
//            String reportPath = environment.getProperty("layanan.document.path");
//
//            String path = reportPath
//                    + "/" + layanan.getPemohonon().getUsername()
//                    + "/" + layanan.getNomor()
//                    + "/hasil";
//
//            createDir(path);
//            String fileDocx = path + "/" + dokumen.getKeterangan() + ".docx";
//
//            uploadService.saveFile(memoryBuffer, path, fileDocx);
//
//            Docx4jProperties.setProperty("docx4j.Convert.Out.HTML.OutputMethodXML", true);
//
//            WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.load(new File(fileDocx));
//            AbstractHtmlExporter.HtmlSettings htmlSettings = new AbstractHtmlExporter.HtmlSettings();
//
//            htmlSettings.setWmlPackage(wordMLPackage);
//            htmlSettings.setImageDirPath(fileDocx + "_files");
//            htmlSettings.setImageTargetUri(fileDocx + "_files");
//
//            SdtWriter.registerTagHandler("HTML_ELEMENT", new SdtToListSdtTagHandler());
//
//            String htmlFilePath = path + "\\" + dokumen.getKeterangan() + ".html";
//
//            OutputStream os = new FileOutputStream(htmlFilePath);
//
//            Docx4J.toHTML(htmlSettings, os, Docx4J.FLAG_NONE);
//
//            String urlPath = "";
//            if (reportPath != null) {
//                urlPath = reportPath.replace("\\", "+");
//            }
//
//            String baseUrl = environment.getProperty("project.base");
//
//            String folder = baseUrl + urlPath
//                    + "+" + layanan.getPemohonon().getUsername()
//                    + "+" + layanan.getNomor()
//                    + "+hasil" + "+" + dokumen.getKeterangan() + ".docx_files+";
//
//            String html = htmlToString(htmlFilePath);
//            String newHtml = html.replace(fileDocx + "_files/", folder);
//
//            FileOutputStream fooStream = new FileOutputStream(new File(htmlFilePath), false);
//            byte[] myBytes = newHtml.getBytes();
//            fooStream.write(myBytes);
//            fooStream.close();
//
//            return htmlFilePath;
//        } catch (Docx4JException | IOException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//    public String docxToHTML(String path, Layanan layanan, JDokumen dokumen) {
//        try {
//            String reportPath = environment.getProperty("layanan.document.path");
//
//            Docx4jProperties.setProperty("docx4j.Convert.Out.HTML.OutputMethodXML", true);
//
//            WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.load(new File(path));
//            AbstractHtmlExporter.HtmlSettings htmlSettings = new AbstractHtmlExporter.HtmlSettings();
//
//            htmlSettings.setWmlPackage(wordMLPackage);
//            htmlSettings.setImageDirPath(path + "_files");
//            htmlSettings.setImageTargetUri(path + "_files");
//
//            SdtWriter.registerTagHandler("HTML_ELEMENT", new SdtToListSdtTagHandler());
//
//            String htmlFilePath = path.replace("docx", "html");
//
//            OutputStream os = new FileOutputStream(htmlFilePath);
//
//            Docx4J.toHTML(htmlSettings, os, Docx4J.FLAG_NONE);
//
//            String urlPath = "";
//            if (reportPath != null) {
//                urlPath = reportPath.replace("/", "+");
//            }
//
//            String baseUrl = environment.getProperty("project.base");
//
//            String folder = baseUrl + urlPath
//                    + "+" + layanan.getPemohonon().getUsername()
//                    + "+" + layanan.getNomor()
//                    + "+hasil" + "+" + dokumen.getKeterangan() + ".docx_files+";
//
//            String html = htmlToString(htmlFilePath);
//            String newHtml = html.replace(path + "_files/", folder);
//
//            FileOutputStream fooStream = new FileOutputStream(new File(htmlFilePath), false);
//            byte[] myBytes = newHtml.getBytes();
//            fooStream.write(myBytes);
//            fooStream.close();
//
//            return htmlFilePath;
//        } catch (Docx4JException | IOException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//    public String htmlToString(Layanan layanan, JDokumen dokumen) {
//        String reportPath = environment.getProperty("layanan.document.path");
//        String file;
//
//        System.out.println("jenis = " + dokumen.getId());
//
//        if (layanan.getProgress() == ON_BATCH_2_KPPBC) {
//            if (layanan.getLokasi() == TANGERANG) file = reportPath + "/template/tangerang/" + dokumen.getId() + ".html";
//            else file = reportPath + "/template/merak/" + dokumen.getId() + ".html";
//        } else file = reportPath + "/template/kanwil/" + dokumen.getId() + ".html";
//
//        return htmlToString(file);
//    }
//
//    public String htmlToString(String path) {
//        try {
//            return FileUtils.readFileToString(new File(path), "UTF-8");
//        } catch (IOException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }

    public File getPath(Layanan layanan, JDokumen dokumen) {
        String reportPath = environment.getProperty("layanan.document.path");
        String file;

        if (layanan.getLokasi() == TANGERANG) file = reportPath + "\\template\\tangerang\\" + dokumen.getId() + ".docx";
        else file = reportPath + "\\template\\merak\\" + dokumen.getId() + ".docx";

        return new File(file);
    }

//    private String htmlToXhtml(String html) {
//        Document document = Jsoup.parse(html);
//        document.outputSettings().syntax(Document.OutputSettings.Syntax.xml);
//
//        return document.html();
//    }

    public void docxToPdf(String path) {
        try {
            InputStream doc = new FileInputStream(new File(path));
            XWPFDocument document = new XWPFDocument(doc);
            PdfOptions options = PdfOptions.create();
            OutputStream out = new FileOutputStream(new File(path.replace("docx", "pdf")));
            PdfConverter.getInstance().convert(document, out, options);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public String uploadFile(MemoryBuffer memoryBuffer, Layanan layanan, JDokumen dokumen) {
        String reportPath = environment.getProperty("layanan.document.path");

        String path = reportPath
                + "\\" + layanan.getPemohonon().getUsername()
                + "\\" + layanan.getNomor()
                + "\\hasil";

        createDir(path);
        String fileDocx = path + "\\" + dokumen.getKeterangan() + ".docx";

        uploadService.saveFile(memoryBuffer, path, fileDocx);

        return fileDocx;
    }

    public String getTemplate(Layanan layanan, JDokumen dokumen) {
        String reportPath = environment.getProperty("layanan.document.path");
        String path;

        if (layanan.getProgress() == ON_BATCH_2_KPPBC) {
            if (layanan.getLokasi() == TANGERANG) path = reportPath + "\\template\\tangerang\\" + dokumen.getId() + ".pdf";
            else path = reportPath + "\\template\\merak\\" + dokumen.getId() + ".pdf";
        } else path = reportPath + "\\template\\kanwil\\" + dokumen.getId() + ".pdf";

        return path;
    }
}
