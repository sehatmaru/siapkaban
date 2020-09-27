package com.tam.siap.services;

import com.tam.siap.models.Account;
import net.sf.jasperreports.engine.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import static com.tam.siap.utils.TamUtils.createDir;

@Service
public class ExportingService {

    @Autowired
    private Environment env;

    public void print(Account account) throws JRException, FileNotFoundException {
        String reportPath = env.getProperty("layanan.document.path");
        String reportDir = reportPath + "\\" + account.getUsername();
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
        parameter.put("namaPenanggungJawab", account.getPerusahaan().getPenanggungJawab());

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

        JasperReport jasperDesign = JasperCompileManager.compileReport(env.getProperty("layanan.jasper.path") + "\\RegisterForm.jrxml");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperDesign, parameter,
                new JREmptyDataSource());

        if (createDir(reportDir)) {
            File file = new File(reportDir + "\\RegisterForm.pdf");
            OutputStream outputSteam = new FileOutputStream(file);
            JasperExportManager.exportReportToPdfStream(jasperPrint, outputSteam);
        }
    }
}
