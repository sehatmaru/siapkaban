package com.tam.siap;

import com.tam.siap.models.*;
import com.tam.siap.services.JenisIdentitasService;
import com.tam.siap.services.JenisPerusahaanService;
import com.tam.siap.services.RegisterService;
import com.tam.siap.services.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "test")
public class TestController {

	@Autowired
	RegisterService registerService;

	@Autowired
	RoleService roleService;

	@Autowired
	JenisIdentitasService jenisIdentitasService;

	@Autowired
	JenisPerusahaanService jenisPerusahaanService;

	@PostMapping("/register")
	public void register() {
		Account user = new Account("123456", "123456", roleService.getRole(1));
		DPribadi pribadi = new DPribadi("test", "NGSPKWE@#124", "CEO", "0812352", "email", jenisIdentitasService.getJenisIdentitas(1));
		DPerusahaan perusahaan = new DPerusahaan("asd", "1sgdsda", "jakarta", "0623463", "email", jenisPerusahaanService.getJenisPerusahaan(1));

		registerService.register(user, pribadi, perusahaan);
	}

}