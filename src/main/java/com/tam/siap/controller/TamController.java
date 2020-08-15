package com.tam.siap.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tam.siap.models.DPribadi;
import com.tam.siap.services.master.DataPribadiService;

@Controller
public class TamController {

	@Autowired
	private Environment env;

	@Autowired
	DataPribadiService dataPribadiService;

	@GetMapping("/tams")
	public String greeting() {
		return "tams";
	}

	@RequestMapping(value = "/siapimages2", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getImageAsResponseEntity() {
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		String filaPath = env.getProperty("layanan.images.path") + "\\" + "pwk.png";
		File initialFile = new File(filaPath);
		InputStream in;
		try {
			in = new FileInputStream(initialFile);
			// InputStream in =
			// servletContext.getResourceAsStream("/WEB-INF/images/image-example.jpg");
			byte[] media = IOUtils.toByteArray(in);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());

			responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return responseEntity;
	}

	@RequestMapping(value = "/profilimages/{profilid}", method = RequestMethod.GET)
	public void getImageAsByteArray(HttpServletResponse response,@PathVariable int profilid) throws IOException {
		System.out.println("Gen Image : "+profilid);
		//String filaPath = env.getProperty("layanan.images.path") + "\\" + profilid;
		DPribadi dPribadi = dataPribadiService.findDataPribadiById(profilid);
		String filaPath = dPribadi.getGambar();
		File initialFile = new File(filaPath);
		InputStream in = new FileInputStream(initialFile);
	    response.setContentType(MediaType.IMAGE_JPEG_VALUE);
	    IOUtils.copy(in, response.getOutputStream());
	}

//	@PostMapping("/login")
//	public String loginSubmit(@ModelAttribute Login greeting) {
//		return "result";
//	}

}