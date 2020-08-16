package com.tam.siap.services;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

import com.tam.siap.models.DPerusahaan;
import com.tam.siap.models.DPribadi;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

@Service
public class ExportingService {

    @Autowired
    private Environment env;

    public void print(DPribadi dPribadi, DPerusahaan dPerusahaan) throws JRException, FileNotFoundException {
        Locale locale = new Locale("in", "ID");
        String reportDir = env.getProperty("project.home");
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, dd MMMM yyyy", locale);
        Date date = new Date();
        String tanggal = dateFormat.format(date);

        Map<String, Object> parameter  = new HashMap<String, Object>();

        parameter.put("pemohonnama", dPribadi.getNama());
        parameter.put("pemohonnomorktpnik", dPribadi.getNomor());
        parameter.put("pemohonjabatan", dPribadi.getJabatan());
        parameter.put("pemohontelp", dPribadi.getTelepon());
        parameter.put("pemohonemail", dPribadi.getEmail());
        parameter.put("perusahaannama", dPerusahaan.getNama());
        parameter.put("perusahaannpwp", dPerusahaan.getNpwp());
        parameter.put("perusahaanalamat", dPerusahaan.getAlamat());
        parameter.put("perusahaantelp", dPerusahaan.getTelepon());
        parameter.put("perusahaanemail", dPerusahaan.getEmail());
        parameter.put("ttdpemohonnama", dPribadi.getNama());
        parameter.put("tempattanggal", tanggal);
        parameter.put("perusahaanjeniskb", " ");
        parameter.put("perusahaanjenisgb", " ");
        parameter.put("perusahaanjenisplb", " ");
        parameter.put("perusahaanjenistppb", " ");
        parameter.put("perusahaanjenistps", " ");
        parameter.put("perusahaanjeniskp", " ");

        if(dPerusahaan.getJenis().getId() == 1) {
            parameter.put("perusahaanjeniskb", "X");
        } else if(dPerusahaan.getJenis().getId() == 2) {
            parameter.put("perusahaanjenisgb", "X");
        } else if(dPerusahaan.getJenis().getId() == 3) {
            parameter.put("perusahaanjenisplb", "X");
        } else if(dPerusahaan.getJenis().getId() == 4) {
            parameter.put("perusahaanjenistppb", "X");
        } else if(dPerusahaan.getJenis().getId() == 5) {
            parameter.put("perusahaanjenistps", "X");
        } else if(dPerusahaan.getJenis().getId() == 6) {
            parameter.put("perusahaanjeniskp", "X");
        }

        parameter.put("tujuanbaru", "X");
        parameter.put("tujuanpenambahanbaru", " ");
        parameter.put("tujuanperubahan", " ");

        JasperReport jasperDesign = JasperCompileManager.compileReport(reportDir + "/src/main/resources/report/RegisterForm.jrxml");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperDesign, parameter,
                new JREmptyDataSource());

        File file = new File(reportDir + "/src/main/resources/report/RegisterForm.pdf");
        OutputStream outputSteam = new FileOutputStream(file);
        JasperExportManager.exportReportToPdfStream(jasperPrint, outputSteam);

        System.out.println("Report Generated!");
    }
}
