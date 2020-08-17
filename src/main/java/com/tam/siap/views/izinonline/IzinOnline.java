package com.tam.siap.views.izinonline;

import java.io.File;
import java.io.IOException;
import java.nio.file.StandardCopyOption;

import javax.annotation.PostConstruct;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;

import com.tam.siap.components.TamSetField;
import com.tam.siap.models.Account;
import com.tam.siap.models.JFasilitas;
import com.tam.siap.models.JLayanan;
import com.tam.siap.models.JPengelola;
import com.tam.siap.models.JPenimbunan;
import com.tam.siap.models.JPerusahaan;
import com.tam.siap.models.SJLayanan;
import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.JenisDokumenService;
import com.tam.siap.services.master.JenisFasilitasService;
import com.tam.siap.services.master.JenisLayananService;
import com.tam.siap.services.master.JenisPengelolaService;
import com.tam.siap.services.master.JenisPenimbunanService;
import com.tam.siap.services.master.JenisPerusahaanService;
import com.tam.siap.services.master.LayananService;
import com.tam.siap.services.master.SubJenisLayananService;
import com.tam.siap.utils.TamUtils;
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
	JenisPerusahaanService jenisPerusahaanService;

	@Autowired
	AccountService accountService;

	@Autowired
	JenisDokumenService jenisDokumenService;

	@Autowired
	JenisFasilitasService jenisFasilitasService;

	@Autowired
	JenisLayananService jenisLayananService;

	@Autowired
	SubJenisLayananService subJenisLayananService;
	
	@Autowired
	JenisPengelolaService jenisPengelolaService;
	
	@Autowired
	JenisPenimbunanService jenisPenimbunanService;

	// identitas perusahaan
	private TextField txtfnpwp = new TextField("NPWP Perusahaan / Pemohon (Wajib)");
	private TextField txtfnamapt = new TextField("Nama Perusahaan");
	private TextArea txtalamatpt = new TextArea("Alamat Perusahaan lengkap");

	// B. Identitas PIC
	private TextField picname = new TextField("Nama PIC");
	private TextField txtjabtan = new TextField("Jabatan");
	private EmailField txtemail = new EmailField("Email");
	private TextField txtnohp = new TextField("No Handphone");
	private VerticalLayout lay = new VerticalLayout();

	private ComboBox<JPerusahaan> combojnsperusahaan = new ComboBox<JPerusahaan>("Jenis Perusahaan");
	private ComboBox<JFasilitas> combojnsfasilitas = new ComboBox<JFasilitas>("Jenis Fasilitas");// KITE
	private ComboBox<JPengelola> combojnspengelola = new ComboBox<JPengelola>("Jenis Pengelola");// KP
	private ComboBox<JPenimbunan> combotmppenimbunan = new ComboBox<JPenimbunan>("Tempat Penimbunan");// TPS
	private ComboBox<JLayanan> combojnslayanan = new ComboBox<JLayanan>("Jenis Layanan");
	private ComboBox<SJLayanan> combosubjenislayanan = new ComboBox<SJLayanan>("Sub Jenis Layanan");

	private VerticalLayout docandconfirmation = new VerticalLayout();
	private VerticalLayout layconfirmation = new VerticalLayout();
	private Label[] lblDokumen = new Label[10];
	private Upload[] upload = new Upload[10];
	private MemoryBuffer[] membuff = new MemoryBuffer[10];
	private Button submit = new Button();

	private Checkbox checbok = new Checkbox("Menyetujui");

//	private List<JPerusahaan> listJPerusahaans = new ArrayList<>();
//	private List<JLayanan> listJLayanans = new ArrayList<>();
//	private List<SJLayanan> listSjLayanans = new ArrayList<>();

	@Autowired
	private Environment env;

	@PostConstruct
	public void init() {
		// TODO Auto-generated constructor stub
		LoginResponse response = TamUtils.getLoginResponse();
		if (response != null) {
			txtalamatpt.setValue(response.getAccount().getPerusahaan().getAlamat());
			txtemail.setValue(response.getAccount().getPribadi().getEmail());
			txtfnamapt.setValue(response.getAccount().getPerusahaan().getNama());
			txtfnpwp.setValue(response.getAccount().getPerusahaan().getNpwp());
			txtjabtan.setValue(response.getAccount().getPribadi().getJabatan());
			txtnohp.setValue(response.getAccount().getPribadi().getTelepon());
			picname.setValue(response.getAccount().getPribadi().getNama());

			Account account = accountService.findByUsername(response.getAccount().getUsername());
			// listJPerusahaans = jenisPerusahaanService.findAllJenisPerusahaan();
			combojnsperusahaan.setItems(jenisPerusahaanService.findAllJenisPerusahaan());
			combojnsperusahaan.setItemLabelGenerator(JPerusahaan::getKeterangan);
			combojnsperusahaan.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

				@Override
				public void valueChanged(ValueChangeEvent<?> event) {
					// TODO Auto-generated method stub
					// listJLayanans = layananService.findLayanan(combojnsperusahaan.getValue());
					JPerusahaan datajp = combojnsperusahaan.getValue();
					if (datajp.getId() == 4 || datajp.getId() == 5 || datajp.getId() == 6) {
						jenisLayanan(datajp.getId());
//						combojnsfasilitas.setItems(layananService.findFasilitas(datajp));
						combojnsfasilitas.setItems(jenisFasilitasService.findJenisFasilitas(datajp));
						combojnsfasilitas.setItemLabelGenerator(JFasilitas::getKeterangan);
						combojnsfasilitas.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

							@Override
							public void valueChanged(ValueChangeEvent<?> event) {
								// TODO Auto-generated method stub
								JFasilitas datafasilitas = combojnsfasilitas.getValue();
								if (datafasilitas != null) {
//									combojnslayanan.setItems(layananService.findLayanan(datajp, datafasilitas));
									combojnslayanan.setItems(jenisLayananService.findJenisLayanan(datafasilitas));
									combojnslayanan.setItemLabelGenerator(JLayanan::getKeterangan);
									combojnslayanan
											.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

												@Override
												public void valueChanged(ValueChangeEvent<?> event) {
													combosubjenislayanan.setItems(
															subJenisLayananService.findSubJenisLayanan(combojnslayanan.getValue()));
													combosubjenislayanan
															.setItemLabelGenerator(SJLayanan::getKeterangan);
//													combosubjenislayanan.setItems(layananService.findSubLayanan(
//															combojnsperusahaan.getValue(), combojnslayanan.getValue()));
													
												}
											});
								}
							}
						});
					} else if (datajp.getId() == 5) {
						jenisLayanan(datajp.getId());
						//combotmppenimpunan.setItems(layananService.findPenimbunan(datajp));
						combotmppenimbunan.setItems(jenisPenimbunanService.findJenisPenimbunan(datajp));
						combotmppenimbunan.setItemLabelGenerator(JPenimbunan::getKeterangan);
						combotmppenimbunan.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

							@Override
							public void valueChanged(ValueChangeEvent<?> event) {
								// TODO Auto-generated method stub
								JPenimbunan datapenimbunan = combotmppenimbunan.getValue();
								if (datapenimbunan != null) {
									combojnslayanan.setItems(layananService.findLayanan(datajp, datapenimbunan));
									combojnslayanan.setItemLabelGenerator(JLayanan::getKeterangan);
									combojnslayanan
											.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

												@Override
												public void valueChanged(ValueChangeEvent<?> event) {
													combosubjenislayanan
															.setItemLabelGenerator(SJLayanan::getKeterangan);
//													combosubjenislayanan.setItems(layananService.findSubLayanan(
//															combojnsperusahaan.getValue(), combojnslayanan.getValue()));
													combosubjenislayanan.setItems(
															subJenisLayananService.findSubJenisLayanan(combojnslayanan.getValue()));
												}
											});
								}
							}
						});
					} else if (datajp.getId() == 6) {
						jenisLayanan(datajp.getId());
						combojnspengelola.setItems(jenisPengelolaService.findJenisPengelola(datajp));
//						combojnspengelola.setItems(layananService.findPengelola(datajp));
						combojnspengelola.setItemLabelGenerator(JPengelola::getKeterangan);
						combojnspengelola.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

							@Override
							public void valueChanged(ValueChangeEvent<?> event) {
								// TODO Auto-generated method stub
								JPengelola datapengelola = combojnspengelola.getValue();
								if (datapengelola != null) {
									combojnslayanan.setItems(layananService.findLayanan(datajp, datapengelola));
									combojnslayanan.setItemLabelGenerator(JLayanan::getKeterangan);
									combojnslayanan
											.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

												@Override
												public void valueChanged(ValueChangeEvent<?> event) {
													combosubjenislayanan
															.setItemLabelGenerator(SJLayanan::getKeterangan);
//													combosubjenislayanan.setItems(layananService.findSubLayanan(
//															combojnsperusahaan.getValue(), combojnslayanan.getValue()));
													combosubjenislayanan.setItems(
															subJenisLayananService.findSubJenisLayanan(combojnslayanan.getValue()));
												}
											});
								}
							}
						});
					} else {
						jenisLayanan(datajp.getId());
						combojnslayanan.setItems(jenisLayananService.findJenisLayanan(datajp));
//						combojnslayanan.setItems(layananService.findLayanan(datajp));
						combojnslayanan.setItemLabelGenerator(JLayanan::getKeterangan);
						combojnslayanan.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

							@Override
							public void valueChanged(ValueChangeEvent<?> event) {
								combosubjenislayanan.setItems(
										subJenisLayananService.findSubJenisLayanan(combojnslayanan.getValue()));
								combosubjenislayanan.setItemLabelGenerator(SJLayanan::getKeterangan);
//								combosubjenislayanan.setItems(layananService
//										.findSubLayanan(combojnsperusahaan.getValue(), combojnslayanan.getValue()));
							}
						});
					}
				}
			});
			combojnsperusahaan.setValue(account.getPerusahaan().getJenis());

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
		}

	}

	public IzinOnline() {
		setSizeFull();
		layconfirmation.setWidthFull();

		HorizontalLayout hll = new HorizontalLayout(identitasPerusahaan(), identitasPIC());
		TamSetField setField = new TamSetField("Identitas Perusahaan");
		setField.addTamCom(hll);

		TamSetField setFieldJnsLay = new TamSetField("Pilih Layanan");
		setFieldJnsLay.addTamCom(jenisLayanan(0));

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

		txtfnpwp.setReadOnly(true);
		txtfnamapt.setReadOnly(true);
		txtalamatpt.setReadOnly(true);
		;
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

		picname.setReadOnly(true);
		txtjabtan.setReadOnly(true);
		txtemail.setReadOnly(true);
		txtnohp.setReadOnly(true);
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

	private VerticalLayout jenisLayanan(int jnsperusahaan) {
		// VerticalLayout lay = new VerticalLayout();
		if (lay.getComponentCount() < 1) {
			lay.add(combojnsperusahaan);
		}
		for (int i = 0; i < lay.getComponentCount(); i++) {
			if (i != 0) {
				lay.remove(lay.getComponentAt(i));
			}
		}

		lay.setWidthFull();
		lay.setSpacing(true);
		combojnslayanan.setWidthFull();
		combosubjenislayanan.setWidthFull();
		combojnsperusahaan.setWidthFull();
		combojnsfasilitas.setWidthFull();
		combojnspengelola.setWidthFull();
		combotmppenimbunan.setWidthFull();
		
		combojnslayanan.setValue(null);
		combosubjenislayanan.setValue(null);
		combojnsfasilitas.setValue(null);
		combojnspengelola.setValue(null);
		combotmppenimbunan.setValue(null);

		if (jnsperusahaan == 4) {
			lay.add(combojnsfasilitas, combojnslayanan, combosubjenislayanan);
		} else if (jnsperusahaan == 5) {
			lay.add(combotmppenimbunan, combojnslayanan, combosubjenislayanan);
		} else if (jnsperusahaan == 6) {
			lay.add(combojnspengelola, combojnslayanan, combosubjenislayanan);
		} else {
			lay.add(combojnslayanan, combosubjenislayanan);
		}

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
