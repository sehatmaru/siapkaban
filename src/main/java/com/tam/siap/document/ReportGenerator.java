package com.tam.siap.document;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * This class makes the work, loads the template, compile, fill and export the report.
 */

@Component
public class ReportGenerator {
    private Log log= LogFactory.getLog(this.getClass());
    
    @Autowired
	private Environment env;
	

    public static final String REPORT_DOCX = "docx";
    public static final String REPORT_PDF = "pdf";
    
    public byte[] generateReport(String jrxmlFile, String targetFileName, Map parameters, String reportType) throws Exception {
    	//compile report
    	InputStream is = getClass().getResourceAsStream("/report/"+jrxmlFile);
    	JasperReport jasperReport = JasperCompileManager.compileReport(is);
    	
    	JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JREmptyDataSource());
    	
    	String reportDir = env.getProperty("layanan.generated.report.path");
		JRDocxExporter exporter = new JRDocxExporter();
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, reportDir+"/"+targetFileName+"."+reportType);
		exporter.exportReport();
		
		File file = new File(reportDir+"/"+targetFileName+"."+reportType);
		byte[] contents = Files.readAllBytes(file.toPath());
		
		return contents;
    }

}