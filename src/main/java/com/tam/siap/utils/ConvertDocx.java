package com.tam.siap.utils;

import java.io.*;

import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

public class ConvertDocx {
    public static void createHTML() {
        try {
            long start = System.currentTimeMillis();

            // 1) Load DOCX into XWPFDocument
            InputStream is = new FileInputStream(new File(
                    "D:\\Pribadi\\Project\\SiapKaban\\master\\siapkaban\\src\\main\\resources\\report\\be\\docx\\Contoh Surat Undangan Peresmian Kantor.docx"));
            XWPFDocument document = new XWPFDocument(is);

            // 2) Prepare Html options
            XHTMLOptions options = XHTMLOptions.create();

            // 3) Convert XWPFDocument to HTML
            OutputStream out = new FileOutputStream(new File(
                    "D:\\Pribadi\\Project\\SiapKaban\\master\\siapkaban\\src\\main\\resources\\report\\be\\html\\Contoh Surat Undangan Peresmian Kantorx.html"));
            XHTMLConverter.getInstance().convert(document, out, options);

            System.out.println("Sukses");

            System.err.println("Generate html/regsiapkaban.html with "
                    + (System.currentTimeMillis() - start) + "ms");

        } catch (Throwable e) {
            e.printStackTrace();
        }
    }
}
