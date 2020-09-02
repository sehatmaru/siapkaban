package com.tam.siap.services;

import org.apache.commons.io.FileUtils;
import org.docx4j.Docx4J;
import org.docx4j.Docx4jProperties;
import org.docx4j.XmlUtils;
import org.docx4j.convert.in.xhtml.XHTMLImporterImpl;
import org.docx4j.convert.out.ConversionFeatures;
import org.docx4j.convert.out.html.AbstractHtmlExporter;
import org.docx4j.convert.out.html.SdtToListSdtTagHandler;
import org.docx4j.convert.out.html.SdtWriter;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;

@Service
public class EditorService {

    @Autowired
    Environment environment;

    public void htmlToDocx(String filename) {
        try {
            String reportPath = environment.getProperty("layanan.generated.report.path");

            String htmlFilePath = reportPath + "/html/" + filename;
            String stringFromFile = FileUtils.readFileToString(new File(htmlFilePath), "UTF-8");

            WordprocessingMLPackage docxOut = WordprocessingMLPackage.createPackage();

            XHTMLImporterImpl XHTMLImporter = new XHTMLImporterImpl(docxOut);

            docxOut.getMainDocumentPart().getContent().addAll(
                    XHTMLImporter.convert(stringFromFile, null) );

            docxOut.save(new java.io.File(reportPath + "/html/resultHtmlToDocx.docx") );
        } catch (IOException | Docx4JException e) {
            e.printStackTrace();
        }
    }

    public void docxToHTML(String filename) {
        try {
            String reportPath = environment.getProperty("layanan.generated.report.path");
            String docxFilePath = reportPath + "/docx/" + filename;

            Docx4jProperties.setProperty("docx4j.Convert.Out.HTML.OutputMethodXML", true);

            WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.load(new java.io.File(docxFilePath));

            AbstractHtmlExporter.HtmlSettings htmlSettings = new AbstractHtmlExporter.HtmlSettings();

            htmlSettings.setWmlPackage(wordMLPackage);

            htmlSettings.setImageDirPath(docxFilePath + "_files");
            htmlSettings.setImageTargetUri(docxFilePath + "_files");

            boolean nestLists = true;
            if (nestLists) {
                SdtWriter.registerTagHandler("HTML_ELEMENT", new SdtToListSdtTagHandler());
            } else {
                htmlSettings.getFeatures().remove(ConversionFeatures.PP_HTML_COLLECT_LISTS);
            } // must do one or the other


            String htmlFilePath = reportPath + "/resultDocxToXhtml.html";
            OutputStream os = new java.io.FileOutputStream(htmlFilePath);

            Docx4J.toHTML(htmlSettings, os, Docx4J.FLAG_NONE);
        } catch (FileNotFoundException | Docx4JException e) {
            e.printStackTrace();
        }

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
