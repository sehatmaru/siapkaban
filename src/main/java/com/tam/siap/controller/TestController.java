package com.tam.siap.controller;

import com.tam.siap.models.request.EditProfileRequest;
import com.tam.siap.models.request.InsertPegawaiRequest;
import com.tam.siap.services.*;
import com.tam.siap.services.master.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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
	LayananService layananService;

	@Autowired
	AccountService accountService;

	@Autowired
	EditorService editorService;

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

//	@GetMapping("izin/view")
//	public void datanya(){
//		System.out.println("hasil view = " + izinOnlineService.viewPerizinanOnline(roleService.getRole(3)).toString());
//	}

	@GetMapping("utils/rannum")
	public void getNumber(){
		System.out.println("Hasil Random " + getRandomNumber());
	}

	@GetMapping("get/nextpic")
	public void getNextPic(){
		System.out.println("Hasil Next Pic " + izinOnlineService.getNextPic(accountService.findById("283")).toString());
	}

	@PostMapping("insert/pegawai")
	public void insertPegawai(@RequestBody @Validated InsertPegawaiRequest request) {
		registerService.insertPegawai(request);
	}

//	@GetMapping("convert/doctohtml")
//	public void conDocToHtml() throws SAXException, TikaException, TransformerConfigurationException, IOException {
//		docToHTML();
//	}

//	@GetMapping("convert/docxToHTML")
//	public void conDocxToHtml(@RequestBody @Validated String filename) {
//		System.out.println("Hasil html = " + izinOnlineService.getTemplate(filename));
//	}


//	@GetMapping("convert/htmlToDoc")
//	public void htmltoDoc(@RequestBody @Validated String filename) {
//		editorService.htmlToDocx(filename);
//	}
//

	@GetMapping("convert/htmlToString")
	public void htmltoDoc() {
		System.out.println("string = " + izinOnlineService.getTemplate(layananService.findLayananById(15), jenisDokumenService.getJenisDokumen(298)));
	}
}