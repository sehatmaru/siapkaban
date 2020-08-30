package com.tam.siap.services;

import com.tam.siap.models.Account;
import it.grabz.grabzit.GrabzItClient;
import net.sf.jasperreports.engine.*;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Stream;

import static com.tam.siap.utils.TamUtils.createDir;

@Service
public class ExportingService {

    @Autowired
    private Environment env;

    public void print(Account account) throws JRException, FileNotFoundException {
        String reportPath = env.getProperty("layanan.generated.report.path");
        String reportDir = reportPath + "/" + account.getUsername();
//windows        String reportDir = reportPath + "\\" + account.getUsername();
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, dd MMMM yyyy", new Locale("in", "ID"));
        Date date = new Date();
        String tanggal = dateFormat.format(date);

        Map<String, Object> parameter  = new HashMap<String, Object>();

        parameter.put("pemohonnama", account.getPribadi().getNama());
        parameter.put("pemohonnomorktpnik", account.getPribadi().getNomor());
        parameter.put("pemohonjabatan", account.getPribadi().getJabatan());
        parameter.put("pemohontelp", account.getPribadi().getTelepon());
        parameter.put("pemohonemail", account.getPribadi().getEmail());
        parameter.put("perusahaannama", account.getPribadi().getNama());
        parameter.put("perusahaannpwp", account.getPerusahaan().getNpwp());
        parameter.put("perusahaanalamat", account.getPerusahaan().getAlamat());
        parameter.put("perusahaantelp", account.getPribadi().getTelepon());
        parameter.put("perusahaanemail", account.getPribadi().getEmail());
        parameter.put("ttdpemohonnama", account.getPribadi().getNama());
        parameter.put("tempattanggal", tanggal);
        parameter.put("perusahaanjeniskb", " ");
        parameter.put("perusahaanjenisgb", " ");
        parameter.put("perusahaanjenisplb", " ");
        parameter.put("perusahaanjenistppb", " ");
        parameter.put("perusahaanjenistps", " ");
        parameter.put("perusahaanjeniskp", " ");

        if(account.getPribadi().getJenis().getId() == 1) {
            parameter.put("perusahaanjeniskb", "X");
        } else if(account.getPribadi().getJenis().getId() == 2) {
            parameter.put("perusahaanjenisgb", "X");
        } else if(account.getPribadi().getJenis().getId() == 3) {
            parameter.put("perusahaanjenisplb", "X");
        } else if(account.getPribadi().getJenis().getId() == 4) {
            parameter.put("perusahaanjenistppb", "X");
        } else if(account.getPribadi().getJenis().getId() == 5) {
            parameter.put("perusahaanjenistps", "X");
        } else if(account.getPribadi().getJenis().getId() == 6) {
            parameter.put("perusahaanjeniskp", "X");
        }

        parameter.put("tujuanbaru", "X");
        parameter.put("tujuanpenambahanbaru", " ");
        parameter.put("tujuanperubahan", " ");

        JasperReport jasperDesign = JasperCompileManager.compileReport(env.getProperty("layanan.jasper.path") + "/RegisterForm.jrxml");
//windows        JasperReport jasperDesign = JasperCompileManager.compileReport(env.getProperty("layanan.jasper.path") + "\\RegisterForm.jrxml");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperDesign, parameter,
                new JREmptyDataSource());

        if (createDir(reportDir)) {
            File file = new File(reportDir + "/RegisterForm.pdf");
//windows            File file = new File(reportDir + "\\RegisterForm.pdf");
            OutputStream outputSteam = new FileOutputStream(file);
            JasperExportManager.exportReportToPdfStream(jasperPrint, outputSteam);
        }
    }

    public void convertToDocx() {
        String path = env.getProperty("layanan.document.path");
        String file = path + "/html/a.html";

        StringBuilder contentBuilder = new StringBuilder();

        try (Stream<String> stream = Files.lines( Paths.get(file), StandardCharsets.UTF_8)) {
            stream.forEach(s -> contentBuilder.append(s).append("\n"));
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        String content = contentBuilder.toString();

        System.out.println("filename "+content);

        try{
            GrabzItClient grabzIt = new GrabzItClient("ZDkxODg1M2FmMzU3NDk4NzhkZWVlOGZmOGUyMTc4ZTg=", "Pz9gUCo/Pz8/Pz97bURkbT8/Lz8/Uz8/Pz9ZKz8/Pz8=");
            try {
                grabzIt.HTMLToDOCX(content);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            grabzIt.SaveTo(path + "/html/result.docx");
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }

    public void convertToHtml()  {
        try {
            String path = env.getProperty("layanan.document.path");

            long start = System.currentTimeMillis();

            // 1) Load DOCX into XWPFDocument
            InputStream is = new FileInputStream(new File(path + "/docx/test.docx"));
            XWPFDocument document = new XWPFDocument(is);

            // 2) Prepare Html options
            XHTMLOptions options = XHTMLOptions.create();

            // 3) Convert XWPFDocument to HTML
            OutputStream out = new FileOutputStream(new File(path + "/docx/result.html"));
            XHTMLConverter.getInstance().convert(document, out, options);

            System.out.println("Sukses");

            System.err.println("Generate html/regsiapkaban.html with "
                    + (System.currentTimeMillis() - start) + "ms");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
