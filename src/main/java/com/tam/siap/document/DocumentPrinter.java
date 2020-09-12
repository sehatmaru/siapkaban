package com.tam.siap.document;

import java.io.File;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;

import javax.validation.constraints.Null;


@Component
public class DocumentPrinter {
	
	@Autowired
	private Environment env;
		
	 
	@Autowired
	ReportGenerator reportGenerator;
	
	public static final String LEMBAR_DISPOSISI_KEPALA_KANTOR = "_Lembar_Disposisi_Kepala_kantor";
	public static final String KONSEP_TELAAH_STAFF = "_Konsep_Telaah_Staff";
	public static final String NOTA_DINAS = "_NOTA_DINAS";
	public static final String SKEP_PERUBAHAN = "_SKEP_PERUBAHAN";
	public static final String TANDA_TERIMA = "_TANDA_TERIMA";
	public static final String REGISTER_FORM = "REGISTER_FORM";

	public void printNotaDinas(long id, String dokumen, String type) {
		
		try {
			String jrxmlFileName = "LembarDisposisiKepalaKantor.jrxml";
			if(dokumen.equals(DocumentPrinter.LEMBAR_DISPOSISI_KEPALA_KANTOR)) {
				jrxmlFileName = "LembarDisposisiKepalaKantor.jrxml";
			}else if(dokumen.equals(DocumentPrinter.KONSEP_TELAAH_STAFF)) {
				jrxmlFileName = "LembarDisposisiKepalaKantor.jrxml";
			}else if(dokumen.equals(DocumentPrinter.NOTA_DINAS)) {
				jrxmlFileName = "NotaDinasPengantarSKEP.jrxml";
			}else if(dokumen.equals(DocumentPrinter.SKEP_PERUBAHAN)) {
				jrxmlFileName = "SKEPPerubahan.jrxml";
			}else if(dokumen.equals(DocumentPrinter.TANDA_TERIMA)) {
				jrxmlFileName = "TandaTerima.jrxml";
			} else if(dokumen.equals(DocumentPrinter.REGISTER_FORM)) {
				jrxmlFileName = "RegisterForm.jrxml";
			}
			
			String filename = id+dokumen;
	    	String logo = env.getProperty("layanan.document.bc.logo");
			Map<String, Object> parameters = new HashMap();
			parameters.put("logo", logo);

			reportGenerator.generateReport(jrxmlFileName, filename, parameters, type);

			System.out.println("Done exporting reports to pdf");


		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void printRegisForm (long id, String type) {
			try{
                Boolean tujuanbaru = true;
                Boolean tujuanpenambahanbaru = false;
                String jrxmlFileName = "RegisterForm.jrxml";

                String filename = "RegisterForm";
                Map<String, Object> parameters = new HashMap();
                parameters.put("satu", tujuanbaru);
                parameters.put("dua", tujuanpenambahanbaru);

//                reportGenerator.generateReport(jrxmlFileName, filename, parameters, type);
            } catch (NullPointerException e) {
                System.out.println(e.toString());
            }
//		try {
//			String jrxmlFileName = "RegisterForm.jrxml";
//
//			String filename = "RegisterForm";
//			Boolean tujuanbaru = true;
//			Boolean tujuanpenambahanbaru = false;
//			Boolean tujuanperubahan = false;
//			String pemohonnama = "Sehat";
//			String pemohonnomorktp = "1234567890";
//			String pemohonjabatan = "Manager";
//			String pemohontelp = "1234567890";
//			String pemohonemail = "sehat@gmail.com";
//			String perusahaannama = "Jaya";
//			String perusahaannpwp = "1234567890";
//			String perusahaanalamat = "Jakarta Selatan";
//			Boolean perusahaanjeniskb = true;
//			Boolean perusahaanjenisgb = false;
//			Boolean perusahaanjenisplb = false;
//			Boolean perusahaanjenistppb = false;
//			Boolean perusahaanjeniskp = false;
//			Boolean perusahaanjenistps = false;
//			String perusahaantelp = "0987654321";
//			String perusahaanemail = "info@company.com";
//			String mengetahuijabatan = "Direktur";
//			String jabatannama = "Coki";
//			String tempattanggal = "14 Agustus 2020";
//			String ttdmaterai = "Diisi ttd di atas materai 6000";
//			String ttdpemohonnama = "Sehat";
//			String defaultparam = " ";
//
//			Map<Integer, Object> parameters = new HashMap();
//			parameters.put(1, tujuanbaru);
//			parameters.put(2, tujuanpenambahanbaru);
//
//			reportGenerator.generateReport(jrxmlFileName, filename, parameters, type);
//
//			System.out.println("Done exporting reports to pdf");
//
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

}
