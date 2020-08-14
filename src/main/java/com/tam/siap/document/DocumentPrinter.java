package com.tam.siap.document;

import java.io.File;
import java.nio.file.Files;
import java.util.HashMap;
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

}
