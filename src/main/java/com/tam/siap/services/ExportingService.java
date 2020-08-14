package com.tam.siap.services;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tam.siap.models.Employee;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

@Service
public class ExportingService {

    @Autowired
    private Environment env;

    public void print() throws JRException, FileNotFoundException {
        String reportDir = env.getProperty("project.home");

        List<Employee> studentList = new ArrayList<Employee>();

        Map<String, Object> parameter  = new HashMap<String, Object>();

        studentList.add(new Employee(1, "Employee 1", "FY BSc"));
        studentList.add(new Employee(2, "Employee 2", "TY BSc"));
        studentList.add(new Employee(3, "Employee 3", "TY BBA"));

        Employee employee = new Employee(1, "Employee 1", "FY BSc");

        parameter.put("name", employee.getName());
        parameter.put("std", employee.getStd());

        JasperReport jasperDesign = JasperCompileManager.compileReport(reportDir + "/src/main/resources/report/RegisterForm.jrxml");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperDesign, parameter,
                new JREmptyDataSource());

        File file = new File(reportDir + "/src/main/resources/report/RegisterForm.pdf");
        OutputStream outputSteam = new FileOutputStream(file);
        JasperExportManager.exportReportToPdfStream(jasperPrint, outputSteam);

        System.out.println("Report Generated!");
    }
}
