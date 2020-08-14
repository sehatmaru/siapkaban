package com.tam.siap.controller;

import com.tam.siap.models.*;
import com.tam.siap.models.request.EditProfileRequest;
import com.tam.siap.services.AdminService;
import com.tam.siap.services.AuthBEService;
import com.tam.siap.services.ProfileService;
import com.tam.siap.services.master.JenisIdentitasService;
import com.tam.siap.services.master.JenisPerusahaanService;
import com.tam.siap.services.RegisterService;
import com.tam.siap.services.master.RoleService;
import com.tam.siap.utils.EmailSMTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.Session;
import java.util.Properties;

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
	AuthBEService authService;

	@Autowired
	AdminService adminService;

	@Autowired
	ProfileService profileService;

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

	@PostMapping("/admin/account/active")
	public void accountActive() {
		System.out.println("hasil verified = " + adminService.respondAccount("00000", 1));
	}

	@PostMapping("/admin/account/pending")
	public void accountPending() {
		System.out.println("hasil verified = " + adminService.respondAccount("00000", 2));
	}

	@PostMapping("/admin/account/inactive")
	public void accountInactive() {
		System.out.println("hasil verified = " + adminService.respondAccount("00000", 3));
	}

	@PostMapping("/admin/account/rejected")
	public void accountRejected() {
		System.out.println("hasil verified = " + adminService.respondAccount("00000", 4));
	}

	@PostMapping("/admin/list/unverified")
	public void getUnverified() {
		System.out.println("hasil get unverified = " + adminService.getUnverifiedAccountList().toString());
	}


	@PostMapping("/profile/update")
	public void updateProfile() {

		EditProfileRequest profileRequest = new EditProfileRequest();
		profileRequest.setUsername("a");
		profileRequest.setPassword("ini");
		profileRequest.setNomor("nomornya");
		profileRequest.setNama("edit namanya");
		profileRequest.setEmail("jadi email");
		profileRequest.setGambar("gambarnya");

		System.out.println("hasil update = " + profileService.updateProfile(profileRequest));
	}
}