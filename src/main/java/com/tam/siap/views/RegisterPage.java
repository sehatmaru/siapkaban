package com.tam.siap.views;

import static com.tam.siap.utils.refs.Status.SUCCESS;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.models.DPribadi;
import com.tam.siap.models.JIdentitas;
import com.tam.siap.models.JPerusahaan;
import com.tam.siap.models.Kabupaten;
import com.tam.siap.models.Kecamatan;
import com.tam.siap.models.Role;
import com.tam.siap.repos.DPerusahaanRepository;
import com.tam.siap.services.RegisterService;
import com.tam.siap.services.master.JenisIdentitasService;
import com.tam.siap.services.master.JenisPerusahaanService;
import com.tam.siap.services.master.KabupatenService;
import com.tam.siap.services.master.KecamatanService;
import com.tam.siap.services.master.RoleService;
import com.tam.siap.utils.TamUtils;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.HasValue.ValueChangeEvent;
import com.vaadin.flow.component.HasValue.ValueChangeListener;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.formlayout.FormLayout.FormItem;
import com.vaadin.flow.component.formlayout.FormLayout.ResponsiveStep;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.page.Viewport;
import com.vaadin.flow.component.polymertemplate.Id;
import com.vaadin.flow.component.polymertemplate.PolymerTemplate;
import com.vaadin.flow.component.textfield.TextArea;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.dom.DomEvent;
import com.vaadin.flow.dom.DomEventListener;
import com.vaadin.flow.dom.Element;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.templatemodel.TemplateModel;

@Route(value = "register")
@Tag("register-page")
@HtmlImport("html/registerpage.html")
@Viewport("width=device-width, minimum-scale=1, initial-scale=1, user-scalable=yes, viewport-fit=cover")
public class RegisterPage extends PolymerTemplate<TemplateModel> {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = 9154010595246798149L;

	@Id("vform")
	VerticalLayout vform;
	@Id("menus")
	Element menus;

	@Id("txttgl")
	Label txttgl;

	@Autowired
	DPerusahaanRepository dPerusahaanRepository;

	private TextField txtTipeAkun = new TextField();
	private Label lblPemohon = new Label("DATA PEMOHON");
	private TextField txtNama = new TextField();
	private ComboBox<JIdentitas> comboJnsIdentitas = new ComboBox<>();
	private TextField txtNoidentitas = new TextField();
	private TextField txtJabatan = new TextField();
	private TextField txtHandphone = new TextField();
	private TextField txtEmail = new TextField();
	private Label lblPerusahaan = new Label("DATA PERUSAHAAN");
	private TextField txtNamaPt = new TextField();
	private TextField txtNpwpPt = new TextField();
	private ComboBox<JPerusahaan> comboJnsPerusahaan = new ComboBox<>();
	private TextField txtAlamatPt = new TextField();
	private TextField txtHandphonePt = new TextField();
	private TextField txtEmailPt = new TextField();
	private TextField txtNamaPenggungJwb = new TextField();
	private ComboBox<Kabupaten> comboKabupaten = new ComboBox<>();
	private ComboBox<Kecamatan> comboKecamatan = new ComboBox<>();

	private TextArea txtConfirm = new TextArea();
	private Button btnSubmit = new Button("Submit");

	@Autowired
	private JenisIdentitasService identitasService = new JenisIdentitasService();

	@Autowired
	private JenisPerusahaanService jenisPerusahaanService = new JenisPerusahaanService();

	@Autowired
	RegisterService registerService = new RegisterService();

	@Autowired
	RoleService roleService = new RoleService();

	@Autowired
	KabupatenService kabupatenService;

	@Autowired
	KecamatanService kecamatanService;

	private List<JIdentitas> lisidentitas = new ArrayList<>();
	private List<JPerusahaan> listperusahaans = new ArrayList<>();
	private List<Kabupaten> listKabupatens = new ArrayList<>();
	private List<Kecamatan> listKecamatans = new ArrayList<>();

	@PostConstruct
	private void init() {
		lisidentitas = identitasService.findAllJenisIdentitas();
		listperusahaans = jenisPerusahaanService.findAllJenisPerusahaan();

		comboJnsIdentitas.setItems(lisidentitas);
		comboJnsIdentitas.setItemLabelGenerator(JIdentitas::getKeterangan);

		comboJnsPerusahaan.setItems(listperusahaans);
		comboJnsPerusahaan.setItemLabelGenerator(JPerusahaan::getKeterangan);

		listKabupatens = kabupatenService.findAll();
		comboKabupaten.setItems(listKabupatens);
	}

	public RegisterPage() {
		// TODO Auto-generated constructor stub
		Locale id = new Locale("in", "ID");
		txttgl.setText(new SimpleDateFormat("EEEE, dd MMMM yyyy", id).format(new Date()));
		menus.appendChild(createLink("Login", "", false));
		vform.setSizeFull();
		setForm();

		txtNpwpPt.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

			@Override
			public void valueChanged(ValueChangeEvent<?> event) {
				// TODO Auto-generated method stub
				String val = "" + event.getValue();
				DPerusahaan dataDPerusahaan = dPerusahaanRepository.findByNpwp(val);
				String val2 = val.replaceAll("[^a-zA-Z0-9]", "");
				System.out.println(val + " - " + val2);
				// txtNpwpPt.setValue(val+" - "+val2);
				// DPerusahaan dataDPerusahaan2 = dPerusahaanRepository.findByNpwp(val);
				DPerusahaan dataDPerusahaan2 = new DPerusahaan();
				List<DPerusahaan> dPerusahaans = dPerusahaanRepository.findAll();
				if (dataDPerusahaan != null) {
					String npwptemp = dataDPerusahaan.getNpwp().replaceAll("[^a-zA-Z0-9]", "");
					txtNamaPt.setValue("" + dataDPerusahaan.getNama());
					txtNpwpPt.setValue(npwptemp);
					comboJnsPerusahaan.setValue(dataDPerusahaan.getJenis());
					txtAlamatPt.setValue("" + dataDPerusahaan.getAlamat());
					txtHandphonePt.setValue("" + dataDPerusahaan.getTelepon());
					txtEmailPt.setValue("" + dataDPerusahaan.getEmail());
					txtNamaPenggungJwb.setValue("" + dataDPerusahaan.getPenanggungJawab());
					comboKabupaten.setValue(dataDPerusahaan.getKabupaten());
					comboKecamatan.setValue(dataDPerusahaan.getKecamatan());
				} else {
					for (DPerusahaan datap : dPerusahaans) {
						String npwptemp = datap.getNpwp().replaceAll("[^a-zA-Z0-9]", "");
						if (val2.equals(npwptemp)) {
							txtNamaPt.setValue("" + datap.getNama());
							txtNpwpPt.setValue(npwptemp);
							comboJnsPerusahaan.setValue(datap.getJenis());
							txtAlamatPt.setValue("" + datap.getAlamat());
							txtHandphonePt.setValue("" + datap.getTelepon());
							txtEmailPt.setValue("" + datap.getEmail());
							txtNamaPenggungJwb.setValue("" + datap.getPenanggungJawab());
							comboKabupaten.setValue(datap.getKabupaten());
							comboKecamatan.setValue(datap.getKecamatan());
						}
					}
				}
			}
		});

		comboKabupaten.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

			@Override
			public void valueChanged(ValueChangeEvent<?> event) {
				Kabupaten dataKabupaten = comboKabupaten.getValue();
				if (dataKabupaten != null) {
					listKecamatans = kecamatanService.getKecamatanList(dataKabupaten);
					comboKecamatan.setItems(listKecamatans);
					if (listKecamatans.size() > 0) {
						comboKecamatan.setValue(listKecamatans.get(0));
					}
				}
			}
		});

		btnSubmit.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				// data pemohon
				String nama = txtNama.getValue();
				JIdentitas datatipeid = comboJnsIdentitas.getValue();
				String noid = txtNoidentitas.getValue();
				String jabatan = txtJabatan.getValue();
				String notelp = txtHandphone.getValue();
				String email = txtEmail.getValue();

				// data PT
				String namapt = txtNamaPt.getValue();
				String npwp = txtNpwpPt.getValue();
				JPerusahaan jnsPt = comboJnsPerusahaan.getValue();
				String alamatpt = txtAlamatPt.getValue();
				String notelppt = txtHandphonePt.getValue();
				String emailpt = txtEmailPt.getValue();
				String tgJawab = txtNamaPenggungJwb.getValue();

				Kabupaten datakKabupaten = comboKabupaten.getValue();
				Kecamatan dataKecamatan = comboKecamatan.getValue();

				if (datatipeid == null) {
					Notification notification = new Notification("Jenis identitas harus diisi", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
					notification.open();
				} else if (jnsPt == null) {
					Notification notification = new Notification("Jenis perusahaan harus diisi", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
					notification.open();
				} else if (datakKabupaten == null) {
					Notification notification = new Notification("Kabupaten harus dipilih", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
					notification.open();
				} else if (dataKecamatan == null) {
					Notification notification = new Notification("Kecamatan harus dipilih", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
					notification.open();
				} else {
					Role r = roleService.getRole(1);
					Account account = new Account(noid, TamUtils.generatePassword(8).toString(), r);
					account.setLokasi(datakKabupaten.getLokasi());

					DPribadi dPribadi = new DPribadi(nama, noid, jabatan, notelp, email, datatipeid);
					DPerusahaan dPerusahaan = new DPerusahaan(namapt, npwp, alamatpt, notelppt, emailpt, jnsPt, tgJawab,
							dataKecamatan, datakKabupaten);

					int sukses = registerService.register(account, dPribadi, dPerusahaan);
					if (sukses == SUCCESS) {
						Notification notification = new Notification("Terima kasih, pendaftaran berhasil", 3000,
								Position.MIDDLE);
						notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
						notification.open();
						getUI().get().navigate(LoginPage.class);
					} else {
						Notification notification = new Notification("Mohon maaf, pendaftaran gagal", 3000,
								Position.MIDDLE);
						notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
						notification.open();
					}
				}
			}
		});
	}

	private void setForm() {
		txtTipeAkun.setReadOnly(true);
		txtTipeAkun.setValue("Akun baru");

		txtConfirm.setValue(
				"Dengan melakukan pengisian pada formulir isian, saya menyatakan bahwa data yang dituliskan dalam Formulir Registrasi ini adalah benar dan dapat dipertanggungjawabkan untuk permohonan akun baru");
		txtConfirm.setReadOnly(true);

		btnSubmit.addThemeVariants(ButtonVariant.LUMO_PRIMARY);

		// txtTipeAkun.setWidth("45%");
//		txtNama.setWidth("100%");
//		comboJnsIdentitas.setWidth("100%");
//		txtNoidentitas.setWidth("100%");
//		txtJabatan.setWidth("100%");
//		txtHandphone.setWidth("100%");
//		txtEmail.setWidth("100%");
//
//		txtNamaPt.setWidth("100%");
//		txtNpwpPt.setWidth("100%");
//		comboJnsPerusahaan.setWidth("100%");
//		txtAlamatPt.setWidth("100%");
//		txtNpwpPt.setWidth("100%");
//		txtHandphonePt.setWidth("100%");
//		txtEmailPt.setWidth("100%");
//		txtNamaPenggungJwb.setWidth("100%");
//		txtConfirm.setWidth("49.3%");

		txtTipeAkun.setWidthFull();
		txtNama.setWidthFull();
		comboJnsIdentitas.setWidthFull();
		txtNoidentitas.setWidthFull();
		txtJabatan.setWidthFull();
		txtHandphone.setWidthFull();
		txtEmail.setWidthFull();

		txtNamaPt.setWidthFull();
		txtNpwpPt.setWidthFull();
		comboJnsPerusahaan.setWidthFull();
		txtAlamatPt.setWidthFull();
		txtNpwpPt.setWidthFull();
		txtHandphonePt.setWidthFull();
		txtEmailPt.setWidthFull();
		txtNamaPenggungJwb.setWidthFull();
		txtConfirm.setWidthFull();

		comboKabupaten.setItemLabelGenerator(Kabupaten::getKeterangan);
		comboKecamatan.setItemLabelGenerator(Kecamatan::getKeterangan);
		comboKabupaten.setWidthFull();
		comboKecamatan.setWidthFull();

//		vform.add(txtTipeAkun, new Label(""), lblPemohon, txtNama, comboJnsIdentitas, txtNoidentitas, txtJabatan,
//				txtHandphone, txtEmail, new Label(), lblPerusahaan, txtNamaPt, txtNpwpPt, comboJnsPerusahaan,
//				txtAlamatPt, txtHandphonePt, txtEmailPt, txtConfirm, btnSubmit);

		VerticalLayout vltujuan = new VerticalLayout(setInlinetext(txtTipeAkun, "TUJUAN"));
		vltujuan.setWidth("49%");
		vltujuan.setSpacing(false);

		// data PT
		VerticalLayout vlpt = new VerticalLayout(lblPerusahaan, setInlinetext(txtNpwpPt, "NPWP"),
				setInlinetext(txtNamaPt, "Nama"), setInlinetext(txtNamaPenggungJwb, "Penanggung Jawab"),
				setInlinetext(comboJnsPerusahaan, "Jenis Perusahaan"), setInlinetext(comboKabupaten, "Kab/Kota"),
				setInlinetext(comboKecamatan, "Kecamatan"), setInlinetext(txtAlamatPt, "Alamat Pabrik"),
				setInlinetext(txtHandphonePt, "No. Telepon"), setInlinetext(txtEmailPt, "Email"));
		vlpt.setWidthFull();
		vlpt.setSpacing(false);

		VerticalLayout vlpemohon = new VerticalLayout(lblPemohon, setInlinetext(txtNama, "Nama"),
				setInlinetext(comboJnsIdentitas, "Jenis Identitas"), setInlinetext(txtNoidentitas, "Nomor Identitas"),
				setInlinetext(txtJabatan, "Jabatan"), setInlinetext(txtHandphone, "No. Telepon"),
				setInlinetext(txtEmail, "Email"), txtConfirm, btnSubmit);
		vlpemohon.setWidthFull();
		vlpemohon.setSpacing(false);

		vform.add(vltujuan);
		FormLayout fl = new FormLayout(vlpt, vlpemohon);
		fl.setWidthFull();
		vform.add(fl);

		vform.setSpacing(false);
	}

	private FormLayout setInlinetext(Component comp, String text) {
		FormLayout fl = new FormLayout();
		fl.addFormItem(comp, text);
		fl.setResponsiveSteps(new ResponsiveStep("40em", 1));
		fl.setColspan(comp, 1);
		fl.setWidthFull();
		return fl;
	}

	private Element createLink(String name, String val, boolean aktif) {
		Element link = new Element("div");
		link.setText(name);
		link.setAttribute("class", "nav-link " + (aktif == true ? "active" : ""));
		link.addEventListener("click", new DomEventListener() {

			@Override
			public void handleEvent(DomEvent event) {
				// TODO Auto-generated method stub
				getUI().get().navigate(val);
			}
		});

		return link;
	}
}
