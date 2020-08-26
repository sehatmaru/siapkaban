package com.tam.siap.controller;

import com.tam.siap.models.Account;
import com.tam.siap.models.Layanan;
import com.tam.siap.models.SJLayanan;
import com.tam.siap.models.request.EditProfileRequest;
import com.tam.siap.models.responses.LayananResponse;
import com.tam.siap.repos.JLayananRepository;
import com.tam.siap.services.AdminService;
import com.tam.siap.services.AuthBEService;
import com.tam.siap.services.ProfileService;
import com.tam.siap.services.*;
import com.tam.siap.services.master.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

import static com.tam.siap.utils.TamUtils.getRandomNumber;

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

	@Autowired
    ExportingService exportingService;

	@Autowired
	JenisDokumenService jenisDokumenService;

	@Autowired
	SubJenisLayananService subJenisLayananService;

	@Autowired
	IzinOnlineService izinOnlineService;

	@Autowired
	DataViewService dataViewService;

	@Autowired
	LayananService layananService;

	@Autowired
	ViewService viewService;


//	@PostMapping("/register")
//	public void register() {
//		Account user = new Account("123456123", "123456", roleService.getRole(1));
//		DPribadi pribadi = new DPribadi("test", "NGSPKWE@#124", "CEO", "0812352", "email", jenisIdentitasService.getJenisIdentitas(1));
//		DPerusahaan perusahaan = new DPerusahaan("asd", "1sgdsda", "jakarta", "0623463", "email", jenisPerusahaanService.getJenisPerusahaan(1));
//
//		System.out.println("hasil regis = " + registerService.register(user, pribadi, perusahaan));
//	}

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

//	@PostMapping("/print/pdf")
//	public void print() {
//		try{
//			exportingService.print(DPribadi, DPerusahaan);
//		} catch (JRException | FileNotFoundException e) {
//			e.printStackTrace();
//		}
//	}

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

	@PostMapping("email/send")
	public void sendMail() {
//		EmailRequestDto email = new EmailRequestDto("siapkaban@gmail.com", "maruzhaky@gmail.com", "Test Email", "Sehats");
//
//		Map<String, String> model = new HashMap<>();
//		model.put("name", email.getName());
//		model.put("value", "Test Email");
//		System.out.println("hasil email = " + registerService.sendMail(email, model));
	}

	@PostMapping("dok/filter")
	public void filterDok(){
		System.out.println("hasil filter = " + izinOnlineService.docFilter(subJenisLayananService.getSubJenisLayanan(1)).toString());
	}

	@GetMapping("view/data")
	public void viewData(){


		LayananResponse layanan = new LayananResponse();
		Layanan layanan1 = new Layanan();
		SJLayanan sjLayanan = new SJLayanan();

		/*

		layanan.getAccount().getPribadi().getNomor();
		layanan.getSjLayanan().getKeterangan();
		layanan.getLayanan().getTanggal();
		layanan.getLayanan().getPemohonon().getPerusahaan().getNama();
		layanan.getLayanan().getPemohonon().getPerusahaan().getJenis();
		layanan.getLayanan().getPenerima().getPribadi().getNama();
		layanan.getLayanan().getTanggalPenerima();
		layanan.getLayanan().getPemeriksa().getPribadi().getNama();
		layanan.getLayanan().getTanggalPemeriksa();
		layanan.getLayanan().getKepalaSubSeksi().getPribadi().getNama();
		layanan.getLayanan().getTanggalKepalaSubSeksi();
		layanan.getLayanan().getKepalaSeksi().getPribadi().getNama();
		layanan.getLayanan().getTanggalKepalaSeksi();
		layanan.getLayanan().getKepalaKantor().getPribadi().getNama();
		layanan.getLayanan().getTanggalKepalaKantor();


		 */
		layanan1.setId(1);
		layanan.getLayanan().setNomor(layanan1.getNomor());
		layanan.getSjLayanan().setKeterangan(sjLayanan.getKeterangan());
		layanan.getLayanan().setTanggal(layanan1.getTanggal());
		layanan.getLayanan().getPemohonon().getPerusahaan().setNama(layanan1.getPemohonon().getPerusahaan().getNama());
		layanan.getLayanan().getPemohonon().getPerusahaan().setJenis(layanan1.getPemohonon().getPerusahaan().getJenis());
		layanan.getLayanan().setPenerima(layanan1.getPenerima());
		layanan.getLayanan().setTanggal(layanan1.getTanggal());
		layanan.getLayanan().setPemeriksaP2(layanan1.getPemeriksaP2());
		layanan.getLayanan().setPemeriksaPerbend(layanan1.getPemeriksaPerbend());
		layanan.getLayanan().setPemeriksaPkc(layanan1.getPemeriksaPkc());
		layanan.getLayanan().setKsSeksiPkc(layanan1.getKsSeksiPkc());
		layanan.getLayanan().setKsSeksiPerbend(layanan1.getKsSeksiPerbend());
		layanan.getLayanan().setKsSeksiP2(layanan1.getKsSeksiP2());
		layanan.getLayanan().setkSeksiPkc(layanan1.getkSeksiPkc());
		layanan.getLayanan().setkSeksiPerbend(layanan1.getkSeksiPerbend());
		layanan.getLayanan().setkSeksiP2(layanan1.getkSeksiP2());
		layanan.getLayanan().setkKantor(layanan1.getkKantor());

		System.out.println("Hasil view" + dataViewService.viewData(layanan).toString());
	}

	@GetMapping("view/random")
	public void getNumber(){
		System.out.println("Hasil Random " + getRandomNumber());
	}
}