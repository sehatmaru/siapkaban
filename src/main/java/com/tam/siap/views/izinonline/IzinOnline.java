package com.tam.siap.views.izinonline;

import java.io.File;
import java.io.IOException;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;

import com.tam.siap.components.TamSetField;
import com.tam.siap.models.Account;
import com.tam.siap.models.Dokumen;
import com.tam.siap.models.JDokumen;
import com.tam.siap.models.JFasilitas;
import com.tam.siap.models.JLayanan;
import com.tam.siap.models.JPengelola;
import com.tam.siap.models.JPenimbunan;
import com.tam.siap.models.JPerusahaan;
import com.tam.siap.models.Kabupaten;
import com.tam.siap.models.Kecamatan;
import com.tam.siap.models.Layanan;
import com.tam.siap.models.SJLayanan;
import com.tam.siap.models.responses.DokumenListResponse;
import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.services.IzinOnlineService;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.JenisDokumenService;
import com.tam.siap.services.master.JenisFasilitasService;
import com.tam.siap.services.master.JenisLayananService;
import com.tam.siap.services.master.JenisPengelolaService;
import com.tam.siap.services.master.JenisPenimbunanService;
import com.tam.siap.services.master.JenisPerusahaanService;
import com.tam.siap.services.master.KabupatenService;
import com.tam.siap.services.master.KecamatanService;
import com.tam.siap.services.master.SubJenisLayananService;
import com.tam.siap.utils.TamUtils;
import com.tam.siap.views.HomeMainPage;
import com.tam.siap.views.HomePageIzinOnline2;
import com.tam.siap.views.LoginPage;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.HasValue.ValueChangeEvent;
import com.vaadin.flow.component.HasValue.ValueChangeListener;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.checkbox.Checkbox;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.page.Page;
import com.vaadin.flow.component.polymertemplate.Id;
import com.vaadin.flow.component.textfield.EmailField;
import com.vaadin.flow.component.textfield.TextArea;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.component.upload.SucceededEvent;
import com.vaadin.flow.component.upload.Upload;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import com.vaadin.flow.dom.DomEvent;
import com.vaadin.flow.dom.DomEventListener;
import com.vaadin.flow.dom.Element;
import com.vaadin.flow.router.Route;

import elemental.json.Json;

@Route(value = "izinonline", layout = HomePageIzinOnline2.class)
public class IzinOnline extends VerticalLayout {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1613805910080579932L;

	@Id("txtjudulapp")
	Element txtjudulapp;

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

	@Autowired
	IzinOnlineService izinOnlineService;

	@Autowired
	KabupatenService kabupatenService;

	@Autowired
	KecamatanService kecamatanService;

	private DokumenListResponse doklist = new DokumenListResponse();

	// identitas perusahaan
//	private TextField txtfnpwp = new TextField("NPWP Perusahaan / Pemohon (Wajib)");
//	private TextField txtfnamapt = new TextField("Nama Perusahaan");
//	private TextArea txtalamatpt = new TextArea("Alamat Perusahaan lengkap");

	private TextField txtfnpwp = new TextField();
	private TextField txtfnamapt = new TextField();
	private TextArea txtalamatpt = new TextArea();

	// B. Identitas PIC
//	private TextField picname = new TextField("Nama PIC");
//	private TextField txtjabtan = new TextField("Jabatan");
//	private EmailField txtemail = new EmailField("Email");
//	private TextField txtnohp = new TextField("No Handphone");
	private TextField picname = new TextField();
	private TextField txtjabtan = new TextField();
	private EmailField txtemail = new EmailField();
	private TextField txtnohp = new TextField();
	private VerticalLayout lay = new VerticalLayout();
	private VerticalLayout layDok = new VerticalLayout();

	private List<Kabupaten> listKabupatens = new ArrayList<>();
	private List<Kecamatan> listKecamatans = new ArrayList<>();

	private ComboBox<JPerusahaan> combojnsperusahaan = new ComboBox<JPerusahaan>("Jenis Perusahaan");
	// private ComboBox<JPerusahaan> combojnsperusahaan2 = new
	// ComboBox<JPerusahaan>("Jenis Perusahaan");
	private ComboBox<JPerusahaan> combojnsperusahaan2 = new ComboBox<JPerusahaan>();
	private ComboBox<JFasilitas> combojnsfasilitas = new ComboBox<JFasilitas>("Jenis Fasilitas");// KITE
	private ComboBox<JPengelola> combojnspengelola = new ComboBox<JPengelola>("Jenis Pengelola");// KP
	private ComboBox<JPenimbunan> combotmppenimbunan = new ComboBox<JPenimbunan>("Tempat Penimbunan");// TPS
	private ComboBox<JLayanan> combojnslayanan = new ComboBox<JLayanan>("Jenis Layanan");
	private ComboBox<SJLayanan> combosubjenislayanan = new ComboBox<SJLayanan>("Sub Jenis Layanan");

	private ComboBox<Kabupaten> comboKabupaten = new ComboBox<>();
	private ComboBox<Kecamatan> comboKecamatan = new ComboBox<>();

//	private VerticalLayout docandconfirmation = new VerticalLayout();
	private VerticalLayout layconfirmation = new VerticalLayout();
//	private Label[] lblDokumen = new Label[10];
//	private Upload[] upload = new Upload[10];
	private MemoryBuffer[] membuffDokPemohon = new MemoryBuffer[10];
	private MemoryBuffer[] membuffDokSyarat = new MemoryBuffer[10];
	private MemoryBuffer[] membuffDokLainnya = new MemoryBuffer[10];

	private String[] strDokPemohon = new String[10];
	private String[] strDokSyarat = new String[10];
	private String[] strDokLainnya = new String[10];

//	private String[] jDokIdPemohon = new String[10];
//	private String[] jDokIdSyarat = new String[10];
//	private String[] jDokIdLainnya = new String[10];

	private Button submit = new Button();

	private Checkbox checbok = new Checkbox();

//	private List<JPerusahaan> listJPerusahaans = new ArrayList<>();
//	private List<JLayanan> listJLayanans = new ArrayList<>();
//	private List<SJLayanan> listSjLayanans = new ArrayList<>();

	@PostConstruct
	public void init() {
		// TODO Auto-generated constructor stub
		LoginResponse response = TamUtils.getLoginResponse();
		if (response != null) {
			txtalamatpt.setValue(""+response.getAccount().getPerusahaan().getAlamat());
			txtemail.setValue(""+response.getAccount().getPerusahaan().getEmail());
			txtfnamapt.setValue(""+response.getAccount().getPerusahaan().getNama());
			txtfnpwp.setValue(""+response.getAccount().getPerusahaan().getNpwp());
			txtjabtan.setValue(""+response.getAccount().getPribadi().getJabatan());
			txtnohp.setValue(response.getAccount().getPerusahaan().getTelepon() == null ? "-"
					: response.getAccount().getPerusahaan().getTelepon());
			picname.setValue(response.getAccount().getPerusahaan().getPenanggungJawab() == null ? "-"
					: response.getAccount().getPerusahaan().getPenanggungJawab());

			listKabupatens = kabupatenService.findAll();
			listKecamatans = kecamatanService.findAll();

			comboKabupaten.setItemLabelGenerator(Kabupaten::getKeterangan);
			comboKecamatan.setItemLabelGenerator(Kecamatan::getKeterangan);
			comboKabupaten.setWidthFull();
			comboKecamatan.setWidthFull();

			comboKecamatan.setItems(listKecamatans);
			comboKabupaten.setItems(listKabupatens);

			comboKabupaten.setValue(response.getAccount().getPerusahaan().getKabupaten());
			comboKecamatan.setValue(response.getAccount().getPerusahaan().getKecamatan());

			Account account = accountService.findByUsername(response.getAccount().getUsername());
			// listJPerusahaans = jenisPerusahaanService.findAllJenisPerusahaan();
			combojnsperusahaan2.setItems(jenisPerusahaanService.findAllJenisPerusahaan());
			combojnsperusahaan2.setItemLabelGenerator(JPerusahaan::getKeterangan);
			combojnsperusahaan.setItems(jenisPerusahaanService.findAllJenisPerusahaan());
			combojnsperusahaan.setItemLabelGenerator(JPerusahaan::getKeterangan);
			combojnsperusahaan.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

				@Override
				public void valueChanged(ValueChangeEvent<?> event) {
					// TODO Auto-generated method stub
					// listJLayanans = layananService.findLayanan(combojnsperusahaan.getValue());
					JPerusahaan datajp = combojnsperusahaan.getValue();
					if (datajp.getId() == 4) {
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
													combosubjenislayanan.setItems(subJenisLayananService
															.findSubJenisLayanan(combojnslayanan.getValue()));
													combosubjenislayanan
															.setItemLabelGenerator(SJLayanan::getKeterangan);
//													combosubjenislayanan.setItems(layananService.findSubLayanan(
//															combojnsperusahaan.getValue(), combojnslayanan.getValue()));
													combosubjenislayanan.addValueChangeListener(
															new ValueChangeListener<ValueChangeEvent<?>>() {

																@Override
																public void valueChanged(ValueChangeEvent<?> event) {
																	// TODO Auto-generated method stub
																	dokumenUploads(combosubjenislayanan.getValue());
																}
															});

												}
											});
								}
							}
						});
					} else if (datajp.getId() == 5) {
						jenisLayanan(datajp.getId());
						// combotmppenimpunan.setItems(layananService.findPenimbunan(datajp));
						combotmppenimbunan.setItems(jenisPenimbunanService.findJenisPenimbunan(datajp));
						combotmppenimbunan.setItemLabelGenerator(JPenimbunan::getKeterangan);
						combotmppenimbunan.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

							@Override
							public void valueChanged(ValueChangeEvent<?> event) {
								// TODO Auto-generated method stub
								JPenimbunan datapenimbunan = combotmppenimbunan.getValue();
								if (datapenimbunan != null) {
									combojnslayanan.setItems(jenisLayananService.findJenisLayanan(datapenimbunan));
									combojnslayanan.setItemLabelGenerator(JLayanan::getKeterangan);
									combojnslayanan
											.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

												@Override
												public void valueChanged(ValueChangeEvent<?> event) {
													combosubjenislayanan
															.setItemLabelGenerator(SJLayanan::getKeterangan);
//													combosubjenislayanan.setItems(layananService.findSubLayanan(
//															combojnsperusahaan.getValue(), combojnslayanan.getValue()));
													combosubjenislayanan.setItems(subJenisLayananService
															.findSubJenisLayanan(combojnslayanan.getValue()));
													combosubjenislayanan.addValueChangeListener(
															new ValueChangeListener<ValueChangeEvent<?>>() {

																@Override
																public void valueChanged(ValueChangeEvent<?> event) {
																	// TODO Auto-generated method stub
																	dokumenUploads(combosubjenislayanan.getValue());
																}
															});
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
									combojnslayanan.setItems(jenisLayananService.findJenisLayanan(datapengelola));
									combojnslayanan.setItemLabelGenerator(JLayanan::getKeterangan);
									combojnslayanan
											.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

												@Override
												public void valueChanged(ValueChangeEvent<?> event) {
													combosubjenislayanan
															.setItemLabelGenerator(SJLayanan::getKeterangan);
//													combosubjenislayanan.setItems(layananService.findSubLayanan(
//															combojnsperusahaan.getValue(), combojnslayanan.getValue()));
													combosubjenislayanan.setItems(subJenisLayananService
															.findSubJenisLayanan(combojnslayanan.getValue()));
													combosubjenislayanan.addValueChangeListener(
															new ValueChangeListener<ValueChangeEvent<?>>() {

																@Override
																public void valueChanged(ValueChangeEvent<?> event) {
																	// TODO Auto-generated method stub
																	dokumenUploads(combosubjenislayanan.getValue());
																}
															});
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
								combosubjenislayanan
										.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {

											@Override
											public void valueChanged(ValueChangeEvent<?> event) {
												// TODO Auto-generated method stub
												dokumenUploads(combosubjenislayanan.getValue());
											}
										});
//								combosubjenislayanan.setItems(layananService
//										.findSubLayanan(combojnsperusahaan.getValue(), combojnslayanan.getValue()));
							}
						});
					}
				}
			});
			combojnsperusahaan.setValue(account.getPerusahaan().getJenis());
			combojnsperusahaan2.setValue(account.getPerusahaan().getJenis());

			submit = new Button("Submit");
			submit.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

				@Override
				public void onComponentEvent(ClickEvent<Button> event) {
//					Page page = UI.getCurrent().getPage();
					if (checbok.getValue()) {
						if (checkingDokumen()) {
							Layanan dataLay = new Layanan();
							dataLay.setPemohonon(account);
							dataLay.setLokasi(account.getLokasi());
							// SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
							dataLay.setTanggal(new Date());
							dataLay.setPerusahaan(combojnsperusahaan.getValue());
							dataLay.setSubLayanan(combosubjenislayanan.getValue());

							List<MemoryBuffer> listMemBuff = new ArrayList<>();
							listMemBuff.addAll(TamUtils.convertArrayToList(membuffDokPemohon));
							listMemBuff.addAll(TamUtils.convertArrayToList(membuffDokSyarat));
							listMemBuff.addAll(TamUtils.convertArrayToList(membuffDokLainnya));

							izinOnlineService.submit(listMemBuff, dataLay, getListdokumen());

							Notification notification = new Notification("Data berhasil tersimpan", 3000,
									Position.MIDDLE);
							notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
							notification.open();
//							page.getHistory().back();
							getUI().get().navigate(HomeMainPage.class);
						}
					} else {
						Notification notification = new Notification("Anda herus menyetujui disclaimer", 3000,
								Position.MIDDLE);
						notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
						notification.open();
					}
				}
			});

//			TextArea txtdisclimer = new TextArea();
//			txtdisclimer.setValue(
//					"Dengan melakukan pengisian pada Form Permohonan ini, kami menyatakan bahwa semua data dan dokumen yang kami berikan adalah lengkap, benar dan dapat dipertanggung jawabkan.");
//			txtdisclimer.setReadOnly(true);
//			txtdisclimer.setWidthFull();
			Label lbldisc = new Label("Disclaimer");
			// lbldisc.getElement().setAttribute("style", "font-size:12px;padding:0;");
			layconfirmation.add(lbldisc);
			HorizontalLayout hl = new HorizontalLayout();
			hl.add(TamUtils.setInlinetext5(checbok,
					"Dengan melakukan pengisian pada Form Permohonan ini, kami menyatakan bahwa semua data dan dokumen yang kami berikan adalah lengkap, benar dan dapat dipertanggung jawabkan."),
					submit);
			layconfirmation.add(hl);
//			layconfirmation.setSpacing(false);
			layconfirmation.getElement().setAttribute("style",
					"border: 1px groove #283B65 !important;border-radius: 7px;margin-top: 5px;");

			submit.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
			// layconfirmation.add(submit);
		}
	}

	private List<Dokumen> getListdokumen() {
		List<Dokumen> dokumens = new ArrayList<Dokumen>();
		// String path = env.getProperty("layanan.document.path");
		LoginResponse logRes = TamUtils.getLoginResponse();
		DokumenListResponse doklist = izinOnlineService.docFilter(combosubjenislayanan.getValue());
		for (int h = 0; h < membuffDokPemohon.length; h++) {
//			String file = path + "/" + logRes.getAccount().getUsername() + "/" + doklist.getPermohonan().get(h).getId()
//					+ "_" + membuffDokPemohon[h].getFileName();
			dokumens.add(new Dokumen(doklist.getPermohonan().get(h).getKeterangan(), null,
					doklist.getPermohonan().get(h), logRes.getAccount(), 1));
		}

		for (int h = 0; h < membuffDokSyarat.length; h++) {
//			String file = path + "/" + logRes.getAccount().getUsername() + "/" + doklist.getPersyaratan().get(h).getId()
//					+ "_" + membuffDokSyarat[h].getFileName();
			dokumens.add(new Dokumen(doklist.getPersyaratan().get(h).getKeterangan(), null,
					doklist.getPersyaratan().get(h), logRes.getAccount(), 1));
		}

		for (int h = 0; h < membuffDokLainnya.length; h++) {
//			String file = path + "/" + logRes.getAccount().getUsername() + "/" + doklist.getLainnya().get(h).getId()
//					+ "_" + membuffDokLainnya[h].getFileName();
			dokumens.add(new Dokumen(doklist.getLainnya().get(h).getKeterangan(), null, doklist.getLainnya().get(h),
					logRes.getAccount(), 1));
		}
		return dokumens;
	}

	public IzinOnline() {
		setSizeFull();
		layconfirmation.setWidthFull();

		// HorizontalLayout hll = new HorizontalLayout(identitasPerusahaan(),
		// identitasPIC());
		HorizontalLayout hll = new HorizontalLayout(idenTitasDanPic());
		TamSetField setField = new TamSetField("Identitas Perusahaan");
		setField.addTamCom(hll);

		TamSetField setFieldJnsLay = new TamSetField("Pilih Layanan");
		setFieldJnsLay.addTamCom(jenisLayanan(0));

		HorizontalLayout vl1 = new HorizontalLayout(setField, setFieldJnsLay);
		vl1.setSpacing(true);
		vl1.setWidthFull();
		VerticalLayout vl2 = new VerticalLayout(vl1, layconfirmation);
		vl2.setSpacing(false);
		vl2.setPadding(false);
		HorizontalLayout hl = new HorizontalLayout(vl2, inputChekclist());
		hl.setWidthFull();
		VerticalLayout vll = new VerticalLayout(hl);
		vll.setSpacing(false);
		add(vll);
		setSpacing(false);
		setPadding(false);
		getElement().setAttribute("style", "border: 1px groove #283B65 !important;border-radius: 7px;width:100%;");
	}

	private boolean checkingDokumen() {
		boolean ok = true;
		// check dokumen
		for (int h = 0; h < membuffDokPemohon.length; h++) {
			if (membuffDokPemohon[h].getFileName().isEmpty()) {
				Notification notification = new Notification(strDokPemohon[h] + " belum diupload", 3000,
						Position.MIDDLE);
				notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
				notification.open();
				ok = false;
				return ok;
			}
		}

		for (int h = 0; h < membuffDokSyarat.length; h++) {
			if (membuffDokSyarat[h].getFileName().isEmpty()) {
				Notification notification = new Notification(strDokSyarat[h] + " belum diupload", 3000,
						Position.MIDDLE);
				notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
				notification.open();
				ok = false;
				return ok;
			}
		}

		for (int h = 0; h < membuffDokLainnya.length; h++) {
			if (membuffDokLainnya[h].getFileName().isEmpty()) {
				Notification notification = new Notification(strDokLainnya[h] + " belum diupload", 3000,
						Position.MIDDLE);
				notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
				notification.open();
				ok = false;
				return ok;
			}
		}
		return ok;
	}

	private VerticalLayout dokumenUploads(SJLayanan subLayanan) {
//		VerticalLayout lay = new VerticalLayout();
		layDok.removeAll();
		if (subLayanan == null) {

		} else {
			Label lbl = new Label("Dokumen Persyaratan");
			lbl.getElement().setAttribute("style", "color:blue");
			lbl.setWidthFull();

			Label lbl2 = new Label("Dokumen Lainnya");
			lbl2.getElement().setAttribute("style", "color:blue");
			lbl2.setWidthFull();

			doklist = izinOnlineService.docFilter(subLayanan);
			membuffDokPemohon = new MemoryBuffer[doklist.getPermohonan().size()];
			strDokPemohon = new String[doklist.getPermohonan().size()];
			// System.out.println("dok pemohon : "+doklist.getPermohonan().size());
			for (int i = 0; i < doklist.getPermohonan().size(); i++) {
				JDokumen dokpemohon = doklist.getPermohonan().get(i);
				membuffDokPemohon[i] = new MemoryBuffer();
				Upload up = new Upload(membuffDokPemohon[i]);
				up.setDropAllowed(false);
				up.setWidthFull();
				up.setMaxFileSize(10000000);
				Button btn = new Button("upload");
				btn.addThemeVariants(ButtonVariant.LUMO_SMALL);
				up.setUploadButton(btn);
				final int pos = i;
				up.getElement().addEventListener("file-remove", new DomEventListener() {
					@Override
					public void handleEvent(DomEvent event) {
						membuffDokPemohon[pos] = new MemoryBuffer();
						up.setReceiver(membuffDokPemohon[pos]);
						btn.setText("upload");
					}
				});
				up.addSucceededListener(new ComponentEventListener<SucceededEvent>() {

					@Override
					public void onComponentEvent(SucceededEvent event) {
						// TODO Auto-generated method stub
						btn.setText("uploaded");
						up.getElement().setPropertyJson("files", Json.createArray());
					}
				});

				up.setAcceptedFileTypes("application/pdf");
				layDok.add(TamUtils.setInlinetext2(up, (1 + i) + ". " + dokpemohon.getKeterangan()));
				strDokPemohon[i] = dokpemohon.getKeterangan();
//				jDokIdPemohon[i] = ""+dokpemohon.getId();
			}

			layDok.add(new FormLayout(lbl));

			membuffDokSyarat = new MemoryBuffer[doklist.getPersyaratan().size()];
			strDokSyarat = new String[doklist.getPersyaratan().size()];
			// System.out.println("dok getPersyaratan : "+doklist.getPersyaratan().size());
			for (int i = 0; i < doklist.getPersyaratan().size(); i++) {
				JDokumen dokpemohon = doklist.getPersyaratan().get(i);
				membuffDokSyarat[i] = new MemoryBuffer();
				Upload up = new Upload(membuffDokSyarat[i]);
				up.setDropAllowed(false);
				up.setWidthFull();
				up.setMaxFileSize(10000000);
				Button btn = new Button("upload");
				btn.addThemeVariants(ButtonVariant.LUMO_SMALL);
				up.setUploadButton(btn);
				final int pos = i;
				up.getElement().addEventListener("file-remove", new DomEventListener() {
					@Override
					public void handleEvent(DomEvent event) {
						membuffDokSyarat[pos] = new MemoryBuffer();
						up.setReceiver(membuffDokSyarat[pos]);
					}
				});
				up.addSucceededListener(new ComponentEventListener<SucceededEvent>() {

					@Override
					public void onComponentEvent(SucceededEvent event) {
						// TODO Auto-generated method stub
						btn.setText("uploaded");
						up.getElement().setPropertyJson("files", Json.createArray());
					}
				});
				up.setAcceptedFileTypes("application/pdf");
				layDok.add(TamUtils.setInlinetext2(up,
						(doklist.getPermohonan().size() + i + 1) + ". " + dokpemohon.getKeterangan()));
				strDokSyarat[i] = dokpemohon.getKeterangan();
//				jDokIdSyarat[i] = ""+dokpemohon.getId();
			}

			layDok.add(lbl2);

			membuffDokLainnya = new MemoryBuffer[doklist.getLainnya().size()];
			strDokLainnya = new String[doklist.getLainnya().size()];
			// System.out.println("dok getLainnya : "+doklist.getLainnya().size());
			for (int i = 0; i < doklist.getLainnya().size(); i++) {
				JDokumen dokpemohon = doklist.getLainnya().get(i);
				membuffDokLainnya[i] = new MemoryBuffer();
				Upload up = new Upload(membuffDokLainnya[i]);
				up.setDropAllowed(false);
				up.setWidthFull();
				up.setMaxFileSize(10000000);
				Button btn = new Button("upload");
				btn.addThemeVariants(ButtonVariant.LUMO_SMALL);
				up.setUploadButton(btn);
				final int pos = i;
				up.getElement().addEventListener("file-remove", new DomEventListener() {
					@Override
					public void handleEvent(DomEvent event) {
						membuffDokLainnya[pos] = new MemoryBuffer();
						up.setReceiver(membuffDokLainnya[pos]);
					}
				});
				up.addSucceededListener(new ComponentEventListener<SucceededEvent>() {

					@Override
					public void onComponentEvent(SucceededEvent event) {
						// TODO Auto-generated method stub
						btn.setText("uploaded");
						up.getElement().setPropertyJson("files", Json.createArray());
					}
				});
				up.setAcceptedFileTypes("application/pdf");
				layDok.add(TamUtils.setInlinetext2(up,
						(doklist.getPersyaratan().size() + 2 + i) + ". " + dokpemohon.getKeterangan()));
				strDokLainnya[i] = dokpemohon.getKeterangan();
//				jDokIdLainnya[i] = ""+dokpemohon.getId();
			}
		}
		layDok.setWidthFull();
		layDok.getStyle().set("overflow-y", "auto");
		layDok.setSpacing(false);
		layDok.setPadding(false);
		return layDok;
	}

	private VerticalLayout identitasPerusahaan() {
		VerticalLayout lay = new VerticalLayout();
		lay.setWidthFull();
		txtfnpwp.setWidthFull();
		txtfnamapt.setWidthFull();
		txtalamatpt.setWidthFull();

		txtfnpwp.setReadOnly(true);
		txtfnamapt.setReadOnly(true);
		combojnsperusahaan2.setReadOnly(true);
		txtalamatpt.setReadOnly(true);
		lay.add(txtfnpwp, txtfnamapt, combojnsperusahaan2, txtalamatpt);

		return lay;
	}

	private VerticalLayout idenTitasDanPic() {
		VerticalLayout lay = new VerticalLayout();
		lay.setWidthFull();
		lay.setSpacing(false);
		lay.setPadding(false);
		txtfnpwp.setWidthFull();
		txtfnamapt.setWidthFull();
		txtalamatpt.setWidthFull();
		txtalamatpt.setHeight("50px");

		txtfnpwp.setReadOnly(true);
		txtfnamapt.setReadOnly(true);
		combojnsperusahaan2.setReadOnly(true);
		txtalamatpt.setReadOnly(true);

		comboKabupaten.setReadOnly(true);
		comboKecamatan.setReadOnly(true);

		picname.setWidthFull();
		txtjabtan.setWidthFull();
		txtemail.setWidthFull();
		txtnohp.setWidthFull();

		picname.setReadOnly(true);
		txtjabtan.setReadOnly(true);
		txtemail.setReadOnly(true);
		txtnohp.setReadOnly(true);

		lay.add(TamUtils.setInlinetext4(txtfnpwp, "NPWP"));
		lay.add(TamUtils.setInlinetext4(txtfnamapt, "Nama"));
		lay.add(TamUtils.setInlinetext4(picname, "Penaggung Jawab"));
		lay.add(TamUtils.setInlinetext4(combojnsperusahaan2, "Jenis Perusahaan"));
		lay.add(TamUtils.setInlinetext4(txtalamatpt, "Alamat Pabrik"));
		lay.add(TamUtils.setInlinetext4(comboKabupaten, "Kab/Kota"));
		lay.add(TamUtils.setInlinetext4(comboKecamatan, "Kecamatan"));
		lay.add(TamUtils.setInlinetext4(txtnohp, "No. Telepon"));
		lay.add(TamUtils.setInlinetext4(txtemail, "Email"));

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
		// lay.setSizeFull();
		// lay.setHeight("700px");
		lay.setWidthFull();
		// lay.getStyle().set("overflow-y", "auto");
		// lay.getStyle().set("overflow", "auto");
//		docandconfirmation.setWidthFull();
//		TamCard card = new TamCard("Upload dokumen");
//		card.addComp(docandconfirmation);
//
//		lay.add(card);
		TamSetField setFieldDok = new TamSetField("Upload Dokumen");
		setFieldDok.addTamCom(dokumenUploads(null));
		lay.add(setFieldDok);
		lay.setPadding(false);

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
		lay.setSpacing(false);
		lay.setPadding(false);
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
