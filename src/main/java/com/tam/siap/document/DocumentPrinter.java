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

	public byte[]  printNotaDinas(long id, String dokumen, String type) {
		
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

			byte[] contents = reportGenerator.generateReport(jrxmlFileName, filename, parameters, type);

			System.out.println("Done exporting reports to pdf");

			return contents;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public byte[]  printRegisForm (long id, String type, List<Object> listObj) {

		try {
			String jrxmlFileName = "RegisterForm.jrxml";

			String filename = "RegisterForm";
			Boolean tujuanbaru = true;
			Boolean tujuanpenambahanbaru = false;
			Boolean tujuanperubahan = false;
			String pemohonnama = "Sehat";
			String pemohonnomorktp = "1234567890";
			String pemohonjabatan = "Manager";
			String pemohontelp = "1234567890";
			String pemohonemail = "sehat@gmail.com";
			String perusahaannama = "Jaya";
			String perusahaannpwp = "1234567890";
			String perusahaanalamat = "Jakarta Selatan";
			Boolean perusahaanjeniskb = true;
			Boolean perusahaanjenisgb = false;
			Boolean perusahaanjenisplb = false;
			Boolean perusahaanjenistppb = false;
			Boolean perusahaanjeniskp = false;
			Boolean perusahaanjenistps = false;
			String perusahaantelp = "0987654321";
			String perusahaanemail = "info@company.com";
			String mengetahuijabatan = "Direktur";
			String jabatannama = "Coki";
			String tempattanggal = "14 Agustus 2020";
			String ttdmaterai = "Diisi ttd di atas materai 6000";
			String ttdpemohonnama = "Sehat";
			String defaultparam = " ";

			Map<String, Object> parameters = new HashMap();
			parameters.put(" ", defaultparam);
			parameters.put("tujuanbaru", tujuanbaru);
			parameters.put("tujuanpenambahanbaru", tujuanpenambahanbaru);
			parameters.put("tujuanperubahan", tujuanperubahan);
			parameters.put("pemohonnama", pemohonnama);
			parameters.put("pemohonnomorktp", pemohonnomorktp);
			parameters.put("pemohonjabatan", pemohonjabatan);
			parameters.put("pemohontelp", pemohontelp);
			parameters.put("pemohonemail", pemohonemail);
			parameters.put("perusahaannama", perusahaannama);
			parameters.put("perusahaannpwp", perusahaannpwp);
			parameters.put("perusahaanalamat", perusahaanalamat);
			parameters.put("perusahaanjeniskb", perusahaanjeniskb);
			parameters.put("perusahaanjenisgb", perusahaanjenisgb);
			parameters.put("perusahaanjenisplb", perusahaanjenisplb);
			parameters.put("perusahaanjenistppb", perusahaanjenistppb);
			parameters.put("perusahaanjeniskp", perusahaanjeniskp);
			parameters.put("perusahaanjenistps", perusahaanjenistps);
			parameters.put("perusahaantelp", perusahaantelp);
			parameters.put("perusahaanemail", perusahaanemail);
			parameters.put("mengetahuijabatan", mengetahuijabatan);
			parameters.put("jabatannama", jabatannama);
			parameters.put("tempattanggal", tempattanggal);
			parameters.put("ttdmaterai", ttdmaterai);
			parameters.put("ttdpemohonnama", ttdpemohonnama);

			byte[] contents = reportGenerator.generateReport(jrxmlFileName, filename, parameters, type);

			System.out.println("Done exporting reports to pdf");

			return contents;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

}
