package com.tam.siap.controller;

import com.tam.siap.models.*;
import com.tam.siap.services.AuthService;
import com.tam.siap.services.master.JenisIdentitasService;
import com.tam.siap.services.master.JenisPerusahaanService;
import com.tam.siap.services.RegisterService;
import com.tam.siap.services.master.RoleService;
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

	@Autowired
	AuthService authService;

	@PostMapping("/register")
	public void register() {
		Account user = new Account("123456123", "123456", roleService.getRole(1));
		DPribadi pribadi = new DPribadi("test", "NGSPKWE@#124", "CEO", "0812352", "email", jenisIdentitasService.getJenisIdentitas(1));
		DPerusahaan perusahaan = new DPerusahaan("asd", "1sgdsda", "jakarta", "0623463", "email", jenisPerusahaanService.getJenisPerusahaan(1));

		System.out.println("hasil regis = " + registerService.register(user, pribadi, perusahaan));
	}

	@PostMapping("/login/wrong/password")
	public void loginWrongPassword() {
		System.out.println("hasil login = " + authService.login("00000", "asd").toString());
	}

	@PostMapping("/login/success")
	public void loginSuccess() {
		System.out.println("hasil login = " + authService.login("00000", "[C@213c3426").toString());
	}
}