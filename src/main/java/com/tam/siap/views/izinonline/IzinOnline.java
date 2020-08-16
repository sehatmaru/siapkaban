package com.tam.siap.views.izinonline;

import java.io.File;
import java.io.IOException;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import com.tam.siap.services.master.*;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;

import com.tam.siap.components.TamSetField;
import com.tam.siap.models.JLayanan;
import com.tam.siap.models.JPerusahaan;
import com.tam.siap.models.SJLayanan;
import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.security.AuthService;
import com.tam.siap.utils.TamUtils;
import com.tam.siap.utils.UIDGenerator;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.HasValue.ValueChangeEvent;
import com.vaadin.flow.component.HasValue.ValueChangeListener;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.checkbox.Checkbox;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.polymertemplate.Id;
import com.vaadin.flow.component.textfield.EmailField;
import com.vaadin.flow.component.textfield.TextArea;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.component.upload.Upload;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import com.vaadin.flow.dom.Element;
import com.vaadin.flow.router.Route;

@Route(value = "izinonline", layout = HomePageIzinOnline2.class)
public class IzinOnline extends VerticalLayout {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1613805910080579932L;

	@Id("txtjudulapp")
	Element txtjudulapp;

	@Autowired
	LayananService layananService;

	@Autowired
	JenisFasilitasService fasilitasService;

	@Autowired
	JenisPengelolaService pengelolaService;

	@Autowired
	JenisPenimbunanService penimbunanService;

	@Autowired
	JenisLayananService jenisLayananService;

	@Autowired
	SubJenisLayananService subJenisLayananService;

	@Autowired
	JenisPerusahaanService jenisPerusahaanService;

	// identitas perusahaan
	private TextField txtfnpwp = new TextField("NPWP Perusahaan / Pemohon (Wajib)");
	private TextField txtfnamapt = new TextField("Nama Perusahaan");
	private TextArea txtalamatpt = new TextArea("Alamat Perusahaan lengkap");

	// B. Identitas PIC
	private TextField picname = new TextField("Nama PIC");
	private TextField txtjabtan = new TextField("Jabatan");
	private EmailField txtemail = new EmailField("Email");
	TextField txtnohp = new TextField("No Handphone");

	private ComboBox<JPerusahaan> combojnsperusahaan = new ComboBox<JPerusahaan>("Jenis Perusahaan");
	private ComboBox<JLayanan> combojnslayanan = new ComboBox<JLayanan>("Jenis Layanan");
	private ComboBox<SJLayanan> combosubjenislayanan = new ComboBox<SJLayanan>("Sub Jenis Layanan");

	private VerticalLayout docandconfirmation = new VerticalLayout();
	private VerticalLayout layconfirmation = new VerticalLayout();
	private Label[] lblDokumen = new Label[10];
	private Upload[] upload = new Upload[10];
	private MemoryBuffer[] membuff = new MemoryBuffer[10];
	private Button submit = new Button();

	private Checkbox checbok = new Checkbox("Menyetujui");

	private List<JPerusahaan> listJPerusahaans = new ArrayList<>();
	private List<JLayanan> listJLayanans = new ArrayList<>();
	private List<SJLayanan> listSjLayanans = new ArrayList<>();

	@Autowired
	private Environment env;

	@Autowired
	AuthService authService;

	@PostConstruct
	public void init() {
		// TODO Auto-generated constructor stub
		LoginResponse response = TamUtils.getLoginResponse();
		if (response != null) {
			listJPerusahaans = jenisPerusahaanService.findAllJenisPerusahaan();
			combojnsperusahaan.setItems(listJPerusahaans);
			combojnsperusahaan.setValue(response.getAccount().getPerusahaan().getJenis());
			combojnsperusahaan.setItemLabelGenerator(JPerusahaan::getKeterangan);
			combojnsperusahaan.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

				@Override
				public void valueChanged(ValueChangeEvent<?> event) {
					// TODO Auto-generated method stub
					listJLayanans = layananService.findLayanan(combojnsperusahaan.getValue());
					System.out.println("size : " + listJLayanans.size());
					combojnslayanan.setItems(jenisLayananService.findJenisLayanan(combojnsperusahaan.getValue()));
					combojnslayanan.setItemLabelGenerator(JLayanan::getKeterangan);
					combojnslayanan.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

						@Override
						public void valueChanged(ValueChangeEvent<?> event) {
							// TODO Auto-generated method stub
							listSjLayanans = subJenisLayananService.findSubJenisLayanan(combojnslayanan.getValue());
							System.out.println("size sjlay : " + listSjLayanans.size());
							combosubjenislayanan.setItemLabelGenerator(SJLayanan::getKeterangan);
							combosubjenislayanan.setItems(listSjLayanans);
						}
					});
				}
			});
		}
		try {
			submit = new Button("Submit");
			submit.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

				@Override
				public void onComponentEvent(ClickEvent<Button> event) {

					if (checbok.getValue()) {

					} else {
						Notification notification = new Notification("Anda herus menyetujui disclaimer", 3000,
								Position.MIDDLE);
						notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
						notification.open();
					}
				}
			});

			TextArea txtdisclimer = new TextArea("Disclaimer");
			txtdisclimer.setValue(
					"Dengan melakukan pengisian pada Form Permohonan ini, kami menyatakan bahwa semua data dan dokumen yang kami berikan adalah lengkap, benar dan dapat dipertanggung jawabkan.");
			txtdisclimer.setReadOnly(true);
			txtdisclimer.setWidthFull();

			layconfirmation.add(txtdisclimer);

			layconfirmation.add(checbok);

			submit.setWidthFull();
			submit.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
			layconfirmation.add(submit);

		} catch (Exception e) {
			// e.printStackTrace();
		}

	}

	public IzinOnline() {
		setSizeFull();
		layconfirmation.setWidthFull();

		HorizontalLayout hll = new HorizontalLayout(identitasPerusahaan(), identitasPIC());
		TamSetField setField = new TamSetField("Identitas Perusahaan");
		setField.addTamCom(hll);

		TamSetField setFieldJnsLay = new TamSetField("Pilih Layanan");
		setFieldJnsLay.addTamCom(jenisLayanan());

		HorizontalLayout vl1 = new HorizontalLayout(setField, setFieldJnsLay);
		vl1.setSpacing(true);
		VerticalLayout vl2 = new VerticalLayout(vl1, layconfirmation);
		HorizontalLayout f1 = new HorizontalLayout(vl2, inputChekclist());
		add(f1);
	}

	private VerticalLayout dokumenUploads() {
		VerticalLayout lay = new VerticalLayout();

		Label lbl = new Label("Dokumen Persyaratan");
		lbl.getElement().setAttribute("style", "color:blue");

		Label lbl2 = new Label("Dokumen Lainnya");
		lbl2.getElement().setAttribute("style", "color:blue");

		lay.add(TamUtils.setInlinetext(new Upload(), "1. Dokumen Permohonan"), lbl,
				TamUtils.setInlinetext(new Upload(), "2. Akta Perubahan dan surat pengesahannya"),
				TamUtils.setInlinetext(new Upload(), "3. NPWP dan surat pengukuhan PKP baru"), lbl2,
				TamUtils.setInlinetext(new Upload(),
						"4. Dokumen tambahan (SKEP penetapan dan perubahan;NPWP lama, dll)"));

		return lay;
	}

	private VerticalLayout identitasPerusahaan() {
		VerticalLayout lay = new VerticalLayout();
		lay.setWidthFull();
		txtfnpwp.setWidthFull();
		txtfnamapt.setWidthFull();
		txtalamatpt.setWidthFull();
		// TamCard card = new TamCard("Identitas Perusahaan");
		// card.addComp(txtfnpwp, txtfnamapt, combofasilitas, txtalamatpt);

		// lay.add(card);
		lay.add(txtfnpwp, txtfnamapt, txtalamatpt);

		return lay;
	}

	private VerticalLayout identitasPIC() {
		VerticalLayout lay = new VerticalLayout();
		lay.setWidthFull();
		picname.setWidthFull();
		txtjabtan.setWidthFull();
		txtemail.setWidthFull();
		txtnohp.setWidthFull();
		// TamCard card = new TamCard("Identitas Pic");
//		card.addComp(picname, txtjabtan, txtemail, txtnohp);
//
//		lay.add(card);
		lay.add(picname, txtjabtan, txtemail, txtnohp);

		return lay;
	}

	private VerticalLayout inputChekclist() {
		VerticalLayout lay = new VerticalLayout();
		lay.setWidthFull();
		docandconfirmation.setWidthFull();
//		TamCard card = new TamCard("Upload dokumen");
//		card.addComp(docandconfirmation);
//
//		lay.add(card);

		lay.add(dokumenUploads());

		return lay;
	}

	private VerticalLayout jenisLayanan() {
		VerticalLayout lay = new VerticalLayout();
		lay.setWidthFull();
		combojnslayanan.setWidthFull();
		combosubjenislayanan.setWidthFull();
		combojnsperusahaan.setWidthFull();
//		TamCard card = new TamCard("Jenis Layanan");
//		card.addComp(combofasilitas,combojnslayanan, combosubjenislayanan);
//
//		lay.add(card);

		lay.add(combojnsperusahaan, combojnslayanan, combosubjenislayanan);

		return lay;
	}

//	public void saveDocument(long layananid, long subjenislayananid) {
//		List<SyaratAdministrasi> syarat = syaratAdministrasiRepository
//				.findBySubjenislayananidOrderBySeq(subjenislayananid);
//		int i = 0;
//		int seq = 1;
//		List<Dokumen> docs = new ArrayList<Dokumen>();
//
//		String filaPath = env.getProperty("layanan.document.path") + "\\" + layananid;
//
//		for (SyaratAdministrasi s : syarat) {
//			String fileName = "";
//			try {
//				fileName = membuff[i].getFileName();
//				saveDocToServer(membuff[i], filaPath, fileName);
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			UIDGenerator.getInstance().getUID();
//			Dokumen d = new Dokumen(UIDGenerator.getInstance().getUID(), layananid, s.getId(),
//					filaPath + "\\" + fileName, fileName, seq, 0);
//			dokumenRepository.save(d);
//			i++;
//			seq++;
//			docs.add(d);
//		}
//
//	}

	private boolean saveDocToServer(MemoryBuffer mem, String filepath, String filename) throws IOException {
		// InputStream initialStream = new FileInputStream(new
		// File("src/main/resources/sample.txt"));
		boolean ok = true;
		File dir = new File(filepath);
		if (!dir.exists())
			dir.mkdirs();

		File targetFile = new File(filepath + "\\" + filename);

		java.nio.file.Files.copy(mem.getInputStream(), targetFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

		IOUtils.closeQuietly(mem.getInputStream());
		// System.out.println("File saved in : "+targetFile.getAbsolutePath());
		filepath = targetFile.getAbsolutePath();
		return ok;
	}

}
