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
import com.tam.siap.models.Role;
import com.tam.siap.services.RegisterService;
import com.tam.siap.services.master.JenisIdentitasService;
import com.tam.siap.services.master.JenisPerusahaanService;
import com.tam.siap.services.master.RoleService;
import com.tam.siap.utils.TamUtils;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.formlayout.FormLayout;
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

//	private TextField txtTipeAkun = new TextField("TUJUAN");
//	private Label lblPemohon = new Label("DATA PEMOHON");
//	private TextField txtNama = new TextField("Nama");
//	private ComboBox<String> comboJnsIdentitas = new ComboBox<>("Jenis Identitas");
//	private TextField txtNoidentitas = new TextField("Nomor Identitas");
//	private TextField txtJabatan = new TextField("Jabatan");
//	private TextField txtHandphone = new TextField("No. Telepon");
//	private TextField txtEmail = new TextField("Email");
//	private Label lblPerusahaan = new Label("DATA PERUSAHAAN");
//	private TextField txtNamaPt = new TextField("Nama");
//	private TextField txtNpwpPt = new TextField("Nama");
//	private ComboBox<String> comboJnsPerusahaan = new ComboBox<>("Jenis Perusahaan");
//	private TextField txtAlamatPt = new TextField("Alamat");
//	private TextField txtHandphonePt = new TextField("No. Telepon");
//	private TextField txtEmailPt = new TextField("Email");

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

	private TextArea txtConfirm = new TextArea();
	private Button btnSubmit = new Button("Submit");

	@Autowired
	private JenisIdentitasService identitasService = new JenisIdentitasService();

	@Autowired
	private JenisPerusahaanService jenisPerusahaanService = new JenisPerusahaanService();

	@Autowired
	RegisterService registerService = new RegisterService();

	@Autowired
	private RoleService roleService = new RoleService();

	private List<JIdentitas> lisidentitas = new ArrayList<>();
	private List<JPerusahaan> listperusahaans = new ArrayList<>();

	@PostConstruct
	private void init() {
		lisidentitas = identitasService.findAllJenisIdentitas();
		listperusahaans = jenisPerusahaanService.findAllJenisPerusahaan();

		comboJnsIdentitas.setItems(lisidentitas);
		comboJnsIdentitas.setItemLabelGenerator(JIdentitas::getKeterangan);

		comboJnsPerusahaan.setItems(listperusahaans);
		comboJnsPerusahaan.setItemLabelGenerator(JPerusahaan::getKeterangan);
	}

	public RegisterPage() {
		// TODO Auto-generated constructor stub
		Locale id = new Locale("in", "ID");
		txttgl.setText(new SimpleDateFormat("EEEE, dd MMMM yyyy", id).format(new Date()));
		menus.appendChild(createLink("Login", "", false));
		vform.setSizeFull();
		setForm();

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

				if (datatipeid == null) {
					Notification notification = new Notification("Jenis identitas harus diisi", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
					notification.open();
				} else if (jnsPt == null) {
					Notification notification = new Notification("Jenis perusahaan harus diisi", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
					notification.open();
				} else {
					Role r = roleService.getRole(1);
					Account account = new Account(noid, TamUtils.generatePassword(8).toString(), r);

					DPribadi dPribadi = new DPribadi(nama, noid, jabatan, notelp, email, datatipeid);
					DPerusahaan dPerusahaan = new DPerusahaan(namapt, npwp, alamatpt, notelppt, emailpt, jnsPt);

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

		txtTipeAkun.setWidth("100%");
		txtNama.setWidth("100%");
		comboJnsIdentitas.setWidth("100%");
		txtNoidentitas.setWidth("100%");
		txtJabatan.setWidth("100%");
		txtHandphone.setWidth("100%");
		txtEmail.setWidth("100%");

		txtNamaPt.setWidth("100%");
		txtNpwpPt.setWidth("100%");
		comboJnsPerusahaan.setWidth("100%");
		txtAlamatPt.setWidth("100%");
		txtNpwpPt.setWidth("100%");
		txtHandphonePt.setWidth("100%");
		txtEmailPt.setWidth("100%");
		txtConfirm.setWidth("49.3%");

//		vform.add(txtTipeAkun, new Label(""), lblPemohon, txtNama, comboJnsIdentitas, txtNoidentitas, txtJabatan,
//				txtHandphone, txtEmail, new Label(), lblPerusahaan, txtNamaPt, txtNpwpPt, comboJnsPerusahaan,
//				txtAlamatPt, txtHandphonePt, txtEmailPt, txtConfirm, btnSubmit);

		vform.add(setInlinetext(txtTipeAkun, "TUJUAN"), new Label(""), lblPemohon, setInlinetext(txtNama, "Nama"),
				setInlinetext(comboJnsIdentitas, "Jenis Identitas"), setInlinetext(txtNoidentitas, "Nomor Identitas"),
				setInlinetext(txtJabatan, "Jabatan"), setInlinetext(txtHandphone, "No. Telepon"),
				setInlinetext(txtEmail, "Email"), new Label(), lblPerusahaan, setInlinetext(txtNamaPt, "Nama"),
				setInlinetext(txtNpwpPt, "NPWP"), setInlinetext(comboJnsPerusahaan, "Jenis Perusahaan"),
				setInlinetext(txtAlamatPt, "Alamat"), setInlinetext(txtHandphonePt, "No. Telepon"),
				setInlinetext(txtEmailPt, "Email"), txtConfirm, btnSubmit);

		vform.setSpacing(false);
	}

	private FormLayout setInlinetext(Component comp, String text) {
		FormLayout fl = new FormLayout();
		fl.addFormItem(comp, text);
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
