package com.tam.siap.views.izinonline;

import static com.tam.siap.utils.refs.ProgressLayanan.ON_BATCH_2_KANWIL;
import static com.tam.siap.utils.refs.ProgressLayanan.ON_BATCH_2_KPPBC;
import static com.tam.siap.utils.refs.ProgressLayanan.ON_BATCH_3_KANWIL;
import static com.tam.siap.utils.refs.Role.KANWIL_PEMERIKSA_DOKUMEN;
import static com.tam.siap.utils.refs.Role.KANWIL_PEMERIKSA_P2;
import static com.tam.siap.utils.refs.Role.KANWIL_PEMERIKSA_PKC;
import static com.tam.siap.utils.refs.Role.KEPALA_SEKSI_P2;
import static com.tam.siap.utils.refs.Role.KEPALA_SEKSI_PERBEND;
import static com.tam.siap.utils.refs.Role.KEPALA_SUB_SEKSI_P2;
import static com.tam.siap.utils.refs.Role.KEPALA_SUB_SEKSI_PERBEND;
import static com.tam.siap.utils.refs.Role.PEMERIKSA_P2;
import static com.tam.siap.utils.refs.Role.PEMERIKSA_PERBEND;
import static com.tam.siap.utils.refs.Role.PEMERIKSA_PKC;
import static com.tam.siap.utils.refs.StatusLayanan.ACCEPTED;
import static com.tam.siap.utils.refs.StatusLayanan.REJECTED;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.vaadin.pekka.WysiwygE;

import com.tam.siap.EmbeddedPdfDocument;
import com.tam.siap.models.Account;
import com.tam.siap.models.DocFilter;
import com.tam.siap.models.JDokumen;
import com.tam.siap.models.Layanan;
import com.tam.siap.models.Role;
import com.tam.siap.models.StatusLayanan;
import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.models.responses.UploadTemplateResponse;
import com.tam.siap.models.responses.ViewDokumenResponse;
import com.tam.siap.services.EditorService;
import com.tam.siap.services.IzinOnlineService;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.LayananService;
import com.tam.siap.utils.TamUtils;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.checkbox.Checkbox;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.formlayout.FormLayout.ResponsiveStep;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.grid.GridVariant;
import com.vaadin.flow.component.html.Anchor;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.icon.Icon;
import com.vaadin.flow.component.icon.VaadinIcon;
import com.vaadin.flow.component.menubar.MenuBar;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.page.Page;
import com.vaadin.flow.component.textfield.TextArea;
import com.vaadin.flow.component.upload.SucceededEvent;
import com.vaadin.flow.component.upload.Upload;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import com.vaadin.flow.dom.DomEvent;
import com.vaadin.flow.dom.DomEventListener;
import com.vaadin.flow.router.BeforeEnterEvent;
import com.vaadin.flow.router.BeforeEnterObserver;
import com.vaadin.flow.router.BeforeEvent;
import com.vaadin.flow.router.HasUrlParameter;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.InputStreamFactory;
import com.vaadin.flow.server.StreamResource;

@Route(value = "inboxbcdetail", layout = HomePageIzinOnline2.class)
public class InboxBcDetailPage extends VerticalLayout implements BeforeEnterObserver, HasUrlParameter<String> {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = 7272302887998337493L;

//	private MultiselectComboBox<Account> picBox = new MultiselectComboBox<Account>();
	private ComboBox<Account> picBox = new ComboBox<Account>("PIC Selanjutnya");

	private List<Account> nextPic = new ArrayList();

	private TextArea txtCatatan = new TextArea("Catatan");

//	private Layanan dataLay = new Layanan();

	private MenuBar menuBar = new MenuBar();

	private String idlayanan = "0";

	@Autowired
	IzinOnlineService izinOnlineService;

	@Autowired
	LayananService layananService;

	@Autowired
	AccountService accountService;

	@Autowired
	EditorService editorService;

	private Grid<CheklistModel> gridDokumen = new Grid<CheklistModel>();

	private Grid<CheklistModel2> gridDokumenHasil = new Grid<CheklistModel2>();

	private VerticalLayout vldok = new VerticalLayout();
	private Label lbltitledok = new Label();
	// private Button btnTolak = new Button("Tolak");
	private Button btnLanjut = new Button("Proses Lanjut");
	// private Label lblJudul = new Label();
	private WysiwygE wysiwygE = new WysiwygE(true);

	List<ViewDokumenResponse> listVDocs = new ArrayList<ViewDokumenResponse>();
	List<CheklistModel> listChecks = new ArrayList<CheklistModel>();
	List<DocFilter> listJdoks = new ArrayList<DocFilter>();
	List<CheklistModel2> listCheklistModel2s = new ArrayList<CheklistModel2>();

	@PostConstruct
	void init() {
//		System.out.println("lay id : "+layananid);
//		dokdatas = dokumenRepo.findDokLayanan(layananid);
//		gridDokumen.setItems(dokdatas);
//		LoginResponse dataLogin = TamUtils.getLoginResponse();
//		if (dataLogin != null) {		
//			
//		}
	}

	public void InboxBcDetailPageComp(Layanan dataLay) {
		// List layanan = layananRepository.findLayananPerusahaan(perusahaanid);
		Page page = UI.getCurrent().getPage();
		LoginResponse dataLogin = TamUtils.getLoginResponse();
		if (dataLogin != null) {
			nextPic = izinOnlineService.getNextPic(dataLogin.getAccount(), dataLay);
			System.out.println("Size nexpic : " + nextPic.size());
			picBox.setItems(nextPic);

			listJdoks = izinOnlineService.docFilter(dataLogin.getAccount().getRole(), dataLay, 3);
			for (DocFilter datJdok : listJdoks) {
				boolean adaFile = false;
				if (datJdok.getStatus() == 1) {
					adaFile = true;
				} else {
					adaFile = false;
				}
				listCheklistModel2s.add(new CheklistModel2(adaFile, datJdok.getJenisDokumen(), new MemoryBuffer(),
						dataLay, null, adaFile));
			}

			gridDokumen.addColumn(data -> data.getDoc().getDokumen().getNamaDokumen()).setHeader("Dokumen");
			gridDokumen.addComponentColumn(data -> gridCheck(data)).setHeader("Ada");
			gridDokumen.setSizeUndefined();
			gridDokumen.addThemeVariants(GridVariant.LUMO_ROW_STRIPES);
			gridDokumen.addThemeVariants(GridVariant.LUMO_COLUMN_BORDERS);
			gridDokumen.addThemeVariants(GridVariant.LUMO_WRAP_CELL_CONTENT);

			gridDokumenHasil.addColumn(data -> data.getjDokumen().getKeterangan()).setHeader("Dokumen");
			gridDokumenHasil.addComponentColumn(data -> gridCheck2(data)).setHeader("Cek");
			gridDokumenHasil.addComponentColumn(data -> gridActions(data)).setHeader("Edit");
			gridDokumenHasil.setSizeUndefined();
			gridDokumenHasil.addThemeVariants(GridVariant.LUMO_ROW_STRIPES);
			gridDokumenHasil.addThemeVariants(GridVariant.LUMO_COLUMN_BORDERS);
			gridDokumenHasil.addThemeVariants(GridVariant.LUMO_WRAP_CELL_CONTENT);

			listVDocs = izinOnlineService.viewDocs(dataLay);
			for (int h = 0; h < listVDocs.size(); h++) {
				ViewDokumenResponse data = listVDocs.get(h);
				if (checkP2(dataLogin)) {
					listChecks.add(new CheklistModel(true, data, dataLay));
				} else {
					listChecks.add(new CheklistModel(false, data, dataLay));
				}

				menuBar.addItem(data.getDokumen().getNamaDokumen(), e -> showDoc(data));
			}
			gridDokumen.setItems(listChecks);
			gridDokumenHasil.setItems(listCheklistModel2s);

			picBox.setLabel("PIC Selanjutnya");
			picBox.setItemLabelGenerator(data -> data.getPribadi().getNama());
//			picBox.addValueChangeListener(new ValueChangeListener<ValueChangeEvent<?>>() {
			//
//				@Override
//				public void valueChanged(ValueChangeEvent<?> event) {
//					// TODO Auto-generated method stub
//					LoginResponse dataLogin = TamUtils.getLoginResponse();
//					Set<Account> selectedItems = picBox.getValue();
//					if (dataLogin.getAccount().getRole().getId() == KEPALA_KANTOR) {
			//
//					} else {
//						if (selectedItems.size() > 1) {
////							List<Account> dd = new ArrayList<>(selectedItems);
////							for (int i = 1; i < dd.size(); i++) {
////								picBox.deselect(dd.get(i));
////							}
//							picBox.deselectAll();
//							Notification notification = new Notification("Pilih salah satu", 3000, Position.MIDDLE);
//							notification.addThemeVariants(NotificationVariant.LUMO_PRIMARY);
//							notification.open();
//						}
//					}
//				}
//			});

			if (dataLay != null && (dataLay.getProgress() == ON_BATCH_2_KANWIL
					|| dataLay.getProgress() == ON_BATCH_2_KPPBC || dataLay.getProgress() == ON_BATCH_3_KANWIL)) {
				picBox.setVisible(false);
			} else if (checkPemeriksa(dataLogin)) {
				picBox.setVisible(false);
			}

			HorizontalLayout fl = new HorizontalLayout(btnLanjut);
			fl.setWidthFull();
			fl.setAlignItems(Alignment.CENTER);
			fl.setJustifyContentMode(JustifyContentMode.CENTER);
			btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
//			btnTolak.addThemeVariants(ButtonVariant.LUMO_ERROR);

			btnLanjut.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

				@Override
				public void onComponentEvent(ClickEvent<Button> event) {
					Account acc = picBox.getValue();
					if (dataLay != null
							&& (dataLay.getProgress() == ON_BATCH_2_KANWIL || dataLay.getProgress() == ON_BATCH_2_KPPBC
									|| dataLay.getProgress() == ON_BATCH_3_KANWIL)) {
						if (checkList() && checkList2()) {
//							Set<Account> acc = picBox.getValue();
							// List<Account> accs = new ArrayList<>(acc);
//							if (acc != null) {
//								
//							} else {
//								Notification notification = new Notification("Pilih pic selanjutnya", 3000,
//										Position.MIDDLE);
//								notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
//								notification.open();
//							}
							LoginResponse dataLogin = TamUtils.getLoginResponse();
							SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
							String catatan = txtCatatan.getValue();
//							StatusLayanan statusLayanan = new StatusLayanan("" + dataLogin.getAccount().getId(),
//									dateFormat.format(new Date()), "" + ACCEPTED, catatan);
							StatusLayanan statusLayanan = new StatusLayanan("" + dataLogin.getAccount().getId(),
									dateFormat.format(new Date()), "" + ACCEPTED, catatan, acc);

							// Account acc = picBox.getValue();
//							dataLay.setKepKantor(accs.get(0).getUsername());
							izinOnlineService.processLayanan(dataLay, statusLayanan);

//							for (int j = 0; j < listCheklistModel2s.size(); j++) {
//								CheklistModel2 data = listCheklistModel2s.get(j);
//								if (data.getTemplateHtml() != null || !data.getTemplateHtml().isEmpty()) {
//									izinOnlineService.saveTemplate(data.getDatalay(), data.getjDokumen(),
//											data.getTemplateHtml());
//								}
//							}
							Notification notification = new Notification("Layanan telah diproses", 3000,
									Position.MIDDLE);
							notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
							notification.open();
							page.getHistory().back();
						} else {
							if (checkP2(dataLogin)) {
								LoginResponse dataLogin = TamUtils.getLoginResponse();
								SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
								String catatan = txtCatatan.getValue();
								StatusLayanan statusLayanan = new StatusLayanan("" + dataLogin.getAccount().getId(),
										dateFormat.format(new Date()), "" + ACCEPTED, catatan, acc);
								izinOnlineService.processLayanan(dataLay, statusLayanan);

								Notification notification = new Notification("Layanan telah diproses", 3000,
										Position.MIDDLE);
								notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
								notification.open();
								page.getHistory().back();
							} else {
								LoginResponse dataLogin = TamUtils.getLoginResponse();
								SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
								String catatan = txtCatatan.getValue();
								StatusLayanan statusLayanan = new StatusLayanan("" + dataLogin.getAccount().getId(),
										dateFormat.format(new Date()), "" + REJECTED, catatan, acc);
								izinOnlineService.processLayanan(dataLay, statusLayanan);

								Notification notification = new Notification("Layanan telah ditolak", 3000,
										Position.MIDDLE);
								notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
								notification.open();
								page.getHistory().back();
							}
						}
					} else {
						if (checkList()) {
//							Set<Account> acc = picBox.getValue();
							// List<Account> accs = new ArrayList<>(acc);
							if (checkPemeriksa(dataLogin)) {
								LoginResponse dataLogin = TamUtils.getLoginResponse();
								SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
								String catatan = txtCatatan.getValue();
//								StatusLayanan statusLayanan = new StatusLayanan("" + dataLogin.getAccount().getId(),
//										dateFormat.format(new Date()), "" + ACCEPTED, catatan);
								StatusLayanan statusLayanan = new StatusLayanan("" + dataLogin.getAccount().getId(),
										dateFormat.format(new Date()), "" + ACCEPTED, catatan, null);

								// Account acc = picBox.getValue();
//								dataLay.setKepKantor(accs.get(0).getUsername());
								izinOnlineService.processLayanan(dataLay, statusLayanan);

								Notification notification = new Notification("Layanan telah diproses", 3000,
										Position.MIDDLE);
								notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
								notification.open();
								page.getHistory().back();
							} else {
								if (acc != null) {
									LoginResponse dataLogin = TamUtils.getLoginResponse();
									SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
									String catatan = txtCatatan.getValue();
//									StatusLayanan statusLayanan = new StatusLayanan("" + dataLogin.getAccount().getId(),
//											dateFormat.format(new Date()), "" + ACCEPTED, catatan);
									StatusLayanan statusLayanan = new StatusLayanan("" + dataLogin.getAccount().getId(),
											dateFormat.format(new Date()), "" + ACCEPTED, catatan, acc);

									// Account acc = picBox.getValue();
//									dataLay.setKepKantor(accs.get(0).getUsername());
									izinOnlineService.processLayanan(dataLay, statusLayanan);

									Notification notification = new Notification("Layanan telah diproses", 3000,
											Position.MIDDLE);
									notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
									notification.open();
									page.getHistory().back();
								} else {
									Notification notification = new Notification("Pilih pic selanjutnya", 3000,
											Position.MIDDLE);
									notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
									notification.open();
								}
							}
						} else {
							if (checkP2(dataLogin)) {
								LoginResponse dataLogin = TamUtils.getLoginResponse();
								SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
								String catatan = txtCatatan.getValue();
								StatusLayanan statusLayanan = new StatusLayanan("" + dataLogin.getAccount().getId(),
										dateFormat.format(new Date()), "" + ACCEPTED, catatan, acc);
								izinOnlineService.processLayanan(dataLay, statusLayanan);

								Notification notification = new Notification("Layanan telah diproses", 3000,
										Position.MIDDLE);
								notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
								notification.open();
							} else {
								LoginResponse dataLogin = TamUtils.getLoginResponse();
								SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
								String catatan = txtCatatan.getValue();
								StatusLayanan statusLayanan = new StatusLayanan("" + dataLogin.getAccount().getId(),
										dateFormat.format(new Date()), "" + REJECTED, catatan, acc);
								izinOnlineService.processLayanan(dataLay, statusLayanan);

								Notification notification = new Notification("Layanan telah ditolak", 3000,
										Position.MIDDLE);
								notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
								notification.open();
							}
						}
					}
				}
			});

			menuBar.setWidthFull();

			picBox.setWidthFull();
			VerticalLayout vl1 = new VerticalLayout();
			if (dataLay != null && (dataLay.getProgress() == ON_BATCH_2_KANWIL
					|| dataLay.getProgress() == ON_BATCH_2_KPPBC || dataLay.getProgress() == ON_BATCH_3_KANWIL)) {
				vl1.add(new Label("Hasil penelitian dokumen"), gridDokumen, new Label("Konsep Naskah Dinas"),
						gridDokumenHasil, picBox, txtCatatan, fl); 
				if (checkList()) {
					listJdoks = new ArrayList<DocFilter>();
					listCheklistModel2s = new ArrayList<InboxBcDetailPage.CheklistModel2>();
					listJdoks = izinOnlineService.docFilter(dataLogin.getAccount().getRole(), dataLay, 1);
					for (DocFilter datJdok : listJdoks) {
						boolean adaFile = false;
						if (datJdok.getStatus() == 1) {
							adaFile = true;
						} else {
							adaFile = false;
						}
						if (checkP2(dataLogin)) {
							listCheklistModel2s.add(new CheklistModel2(adaFile, datJdok.getJenisDokumen(),
									new MemoryBuffer(), dataLay, null, adaFile));
						} else {
							listCheklistModel2s.add(new CheklistModel2(adaFile, datJdok.getJenisDokumen(),
									new MemoryBuffer(), dataLay, null, adaFile));
						}
					}
					gridDokumenHasil.setItems(listCheklistModel2s);
					btnLanjut.setText("Proses Lanjut");
					btnLanjut.removeThemeVariants(ButtonVariant.LUMO_ERROR);
					btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
					btnLanjut.addThemeVariants(ButtonVariant.LUMO_SUCCESS);
				} else {
					listJdoks = new ArrayList<DocFilter>();
					listCheklistModel2s = new ArrayList<InboxBcDetailPage.CheklistModel2>();
					listJdoks = izinOnlineService.docFilter(dataLogin.getAccount().getRole(), dataLay, 3);
					for (DocFilter datJdok : listJdoks) {
						boolean adaFile = false;
						if (datJdok.getStatus() == 1) {
							adaFile = true;
						} else {
							adaFile = false;
						}
						listCheklistModel2s.add(new CheklistModel2(adaFile, datJdok.getJenisDokumen(),
								new MemoryBuffer(), dataLay, null, adaFile));
					}
					gridDokumenHasil.setItems(listCheklistModel2s);
					btnLanjut.setText("Tolak");
					btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
					btnLanjut.addThemeVariants(ButtonVariant.LUMO_ERROR);
				}
			} else {
				vl1.add(new Label("Hasil penelitian dokumen"), gridDokumen, picBox, txtCatatan, fl);
				if (checkList()) {
					btnLanjut.setText("Proses Lanjut");
					btnLanjut.removeThemeVariants(ButtonVariant.LUMO_ERROR);
					btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
					btnLanjut.addThemeVariants(ButtonVariant.LUMO_SUCCESS);
				} else {
					btnLanjut.setText("Tolak");
					btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
					btnLanjut.addThemeVariants(ButtonVariant.LUMO_ERROR);
				}
			}

			txtCatatan.setWidthFull();
			vl1.setWidth("20%");
			lbltitledok.setText("Preview - Dokumen");
			vldok.setSizeFull();
			vldok.setHeight("600px");
			wysiwygE.setWidthFull();

			VerticalLayout vl2 = new VerticalLayout(menuBar, lbltitledok, vldok);
			FormLayout hl = new FormLayout(vl1, vl2);
//			hl.setPadding(false);
			hl.setResponsiveSteps(new ResponsiveStep("10em", 1), new ResponsiveStep("32em", 2),
					new ResponsiveStep("40em", 3));
			hl.setColspan(vl1, 1);
			hl.setColspan(vl2, 2);
			hl.setSizeFull();
			setSizeFull();

			add(hl);
		}
	}

	private void showDoc(ViewDokumenResponse data) {
		lbltitledok.setText(data.getDokumen().getNamaDokumen());
		vldok.removeAll();
		StreamResource res = new StreamResource(data.getFile().getName(), new InputStreamFactory() {

			@Override
			public InputStream createInputStream() {
				// TODO Auto-generated method stub
				File initialFile = data.getFile();
				InputStream targetStream = null;
				try {
					targetStream = new FileInputStream(initialFile);
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return targetStream;
			}
		});
		EmbeddedPdfDocument pdfdoc = new EmbeddedPdfDocument(res);
		pdfdoc.setWidthFull();
		pdfdoc.setHeight("600px");
		// lbltitledok.setText("Preview - " + data.getSyaratAdministrasi().getDscp());
		vldok.add(pdfdoc);
	}

	private Checkbox gridCheck(CheklistModel data) {
		Checkbox ch = new Checkbox();
		LoginResponse dataLogin = TamUtils.getLoginResponse();
		if (data.isCheck()) {
			ch.setValue(true);
		} else {
			ch.setValue(false);
		}
		ch.addClickListener(new ComponentEventListener<ClickEvent<Checkbox>>() {

			@Override
			public void onComponentEvent(ClickEvent<Checkbox> event) {
				// TODO Auto-generated method stub
				if (ch.getValue() == true) {
					data.setCheck(true);
				} else {
					data.setCheck(false);
				}
				Layanan dataLay = data.getDatalay();
				if (dataLay != null && (dataLay.getProgress() == ON_BATCH_2_KANWIL
						|| dataLay.getProgress() == ON_BATCH_2_KPPBC || dataLay.getProgress() == ON_BATCH_3_KANWIL)) {
					if (checkList()) {
						listJdoks = new ArrayList<DocFilter>();
						listCheklistModel2s = new ArrayList<InboxBcDetailPage.CheklistModel2>();
						listJdoks = izinOnlineService.docFilter(dataLogin.getAccount().getRole(), dataLay, 1);
						System.out.println("Sizexx : " + listJdoks.size());
						for (DocFilter datJdok : listJdoks) {
							boolean adaFile = false;
							if (datJdok.getStatus() == 1) {
								adaFile = true;
							} else {
								adaFile = false;
							}
							listCheklistModel2s.add(new CheklistModel2(adaFile, datJdok.getJenisDokumen(),
									new MemoryBuffer(), dataLay, null, adaFile));
						}
						gridDokumenHasil.setItems(listCheklistModel2s);
//						btnLanjut.setText("Proses Lanjut");
//						btnLanjut.removeThemeVariants(ButtonVariant.LUMO_ERROR);
//						btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
//						btnLanjut.addThemeVariants(ButtonVariant.LUMO_SUCCESS);
					} else {
						listJdoks = new ArrayList<DocFilter>();
						listCheklistModel2s = new ArrayList<InboxBcDetailPage.CheklistModel2>();
						listJdoks = izinOnlineService.docFilter(dataLogin.getAccount().getRole(), dataLay, 3);
						System.out.println("Sizexx : " + listJdoks.size());
						for (DocFilter datJdok : listJdoks) {
							boolean adaFile = false;
							if (datJdok.getStatus() == 1) {
								adaFile = true;
							} else {
								adaFile = false;
							}
							listCheklistModel2s.add(new CheklistModel2(adaFile, datJdok.getJenisDokumen(),
									new MemoryBuffer(), dataLay, null, adaFile));
						}
						gridDokumenHasil.setItems(listCheklistModel2s);
						btnLanjut.setText("Tolak");
						btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
						btnLanjut.addThemeVariants(ButtonVariant.LUMO_ERROR);
					}
				} else {
					if (checkList()) {
						if (checkPemeriksa(dataLogin)) {
							listJdoks = izinOnlineService.docFilter(dataLogin.getAccount().getRole(), dataLay, 3);
							System.out.println("Sizexx : " + listJdoks.size());
							for (DocFilter datJdok : listJdoks) {
								boolean adaFile = false;
								if (datJdok.getStatus() == 1) {
									adaFile = true;
								} else {
									adaFile = false;
								}
								listCheklistModel2s.add(new CheklistModel2(adaFile, datJdok.getJenisDokumen(),
										new MemoryBuffer(), dataLay, null, adaFile));
							}
							gridDokumenHasil.setItems(listCheklistModel2s);
						}
						btnLanjut.setText("Proses Lanjut");
						btnLanjut.removeThemeVariants(ButtonVariant.LUMO_ERROR);
						btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
						btnLanjut.addThemeVariants(ButtonVariant.LUMO_SUCCESS);
					} else {
						if (checkP2(dataLogin)) {
							btnLanjut.setText("Proses Lanjut");
							btnLanjut.removeThemeVariants(ButtonVariant.LUMO_ERROR);
							btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
							btnLanjut.addThemeVariants(ButtonVariant.LUMO_SUCCESS);
						} else {
							btnLanjut.setText("Tolak");
							btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
							btnLanjut.addThemeVariants(ButtonVariant.LUMO_ERROR);
						}
					}
				}
			}
		});
		return ch;
	}

	private Checkbox gridCheck2(CheklistModel2 data) {
		Checkbox ch = new Checkbox();
		LoginResponse dataLogin = TamUtils.getLoginResponse();
		ch.addClickListener(new ComponentEventListener<ClickEvent<Checkbox>>() {

			@Override
			public void onComponentEvent(ClickEvent<Checkbox> event) {
				// TODO Auto-generated method stub
				if (ch.getValue() == true) {
					// data.setAda(1);
					data.setCheck(true);
				} else {
					data.setCheck(false);
				}
				Layanan dataLay = data.getDatalay();
				if (dataLay != null && (dataLay.getProgress() == ON_BATCH_2_KANWIL
						|| dataLay.getProgress() == ON_BATCH_2_KPPBC || dataLay.getProgress() == ON_BATCH_3_KANWIL)) {

					if (checkList() && checkList2()) {
						btnLanjut.setText("Proses Lanjut");
						btnLanjut.removeThemeVariants(ButtonVariant.LUMO_ERROR);
						btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
						btnLanjut.addThemeVariants(ButtonVariant.LUMO_SUCCESS);
					} else {
						btnLanjut.setText("Tolak");
						btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
						btnLanjut.addThemeVariants(ButtonVariant.LUMO_ERROR);
					}
				} else {
					if (checkList()) {
						btnLanjut.setText("Proses Lanjut");
						btnLanjut.removeThemeVariants(ButtonVariant.LUMO_ERROR);
						btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
						btnLanjut.addThemeVariants(ButtonVariant.LUMO_SUCCESS);
					} else {
						if (checkP2(dataLogin)) {
							btnLanjut.setText("Proses Lanjut");
							btnLanjut.removeThemeVariants(ButtonVariant.LUMO_ERROR);
							btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
							btnLanjut.addThemeVariants(ButtonVariant.LUMO_SUCCESS);
						} else {
							btnLanjut.setText("Tolak");
							btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
							btnLanjut.addThemeVariants(ButtonVariant.LUMO_ERROR);
						}
					}
				}
			}
		});
		return ch;
	}

	private HorizontalLayout gridActions(CheklistModel2 data) {
		HorizontalLayout hl = new HorizontalLayout();
		Button btnEdit = new Button("edit");
//		if (data.isDocada()) {
//			btnEdit.setText("uploaded");
//		}else {
//			btnEdit.setText("edit");
//		}
		btnEdit.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				lbltitledok.setText(data.getjDokumen().getKeterangan());
				vldok.removeAll();
				vldok.setSpacing(false);
				formEditor(vldok, data);
			}
		});
		hl.add(btnEdit);

		return hl;
	}

	private void formEditor(VerticalLayout vl, CheklistModel2 data) {
//		VerticalLayout vl = new VerticalLayout();
//		vl.getStyle().set("margin","0");
//		vl.setSpacing(false);
//		vl.setWidthFull();
		StreamResource res = new StreamResource(data.getjDokumen().getKeterangan() + ".docx", new InputStreamFactory() {

			@Override
			public InputStream createInputStream() {
				// TODO Auto-generated method stub
				File initialFile = izinOnlineService.downloadTemplate(data.getDatalay(), data.getjDokumen());
				InputStream targetStream = null;
				try {
					targetStream = new FileInputStream(initialFile);
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return targetStream;
			}
		});
		Anchor download = new Anchor(res, "");
		download.getElement().setAttribute("download", true);
		Button btndownload = new Button(new Icon(VaadinIcon.DOWNLOAD_ALT));
		download.add(btndownload);
		Button btnsave = new Button("save");
		btnsave.addThemeVariants(ButtonVariant.LUMO_SMALL);
		btnsave.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				String html = wysiwygE.getValue();
				data.setTemplateHtml(html);
				izinOnlineService.saveTemplate(data.getDatalay(), data.getjDokumen(), html);
				Notification notification = new Notification("Dokumen telah di simpan", 3000, Position.MIDDLE);
				notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
				notification.open();
			}
		});
		HorizontalLayout hl = new HorizontalLayout();
		hl.setWidthFull();
		hl.setSpacing(true);
		Upload up = new Upload(data.getMembuffer());
		up.setMaxFileSize(2000000);
		up.setDropAllowed(false);
		Button btn = new Button("upload");
		btn.setSizeUndefined();
		btn.addThemeVariants(ButtonVariant.LUMO_SMALL);
		up.setUploadButton(btn);
		up.getElement().addEventListener("file-remove", new DomEventListener() {
			@Override
			public void handleEvent(DomEvent event) {
				data.setMembuffer(new MemoryBuffer());
				up.setReceiver(data.getMembuffer());
				data.setCheck(false);
			}
		});
		up.addSucceededListener(new ComponentEventListener<SucceededEvent>() {

			@Override
			public void onComponentEvent(SucceededEvent event) {
				// TODO Auto-generated method stub
				System.out.println("Upload success");
				UploadTemplateResponse html = izinOnlineService.uploadTemplate(data.getMembuffer(), data.getDatalay(),
						data.getjDokumen());
				// System.out.println("Ht : " + html);
				wysiwygE.setValue(html.getHtml());
				if (html.getStatus() == 1) {
					data.setCheck(true);
				} else {
					data.setCheck(false);
				}
			}
		});
		up.setAcceptedFileTypes("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
		hl.add(up, btnsave, download);
		String html = izinOnlineService.getTemplate(data.getDatalay(), data.getjDokumen());
		wysiwygE.setValue(html);
		wysiwygE.setWidthFull();
		wysiwygE.setHeight("500px");
		vl.add(hl, wysiwygE);
	}

	private boolean checkList() {
		boolean h = true;
		for (CheklistModel data : listChecks) {
			if (!data.isCheck()) {
				h = false;
			}
		}
		return h;
	}

	private boolean checkList2() {
		boolean h = true;
		for (CheklistModel2 data : listCheklistModel2s) {
			if (!data.isCheck()) {
				h = false;
			}
		}
		return h;
	}

	@Override
	public void setParameter(BeforeEvent event, String parameter) {
		// TODO Auto-generated method stub
		if (parameter == null) {
			event.getUI().getPage().getHistory().back();
		} else {

		}
	}

	private boolean checkP2(LoginResponse dataLogin) {
		boolean yes = false;
		Role r = dataLogin.getAccount().getRole();
		if (r.getId() == KEPALA_SEKSI_P2 || r.getId() == KEPALA_SUB_SEKSI_P2 || r.getId() == PEMERIKSA_P2
				|| r.getId() == KEPALA_SEKSI_PERBEND || r.getId() == KEPALA_SUB_SEKSI_PERBEND
				|| r.getId() == PEMERIKSA_PERBEND) {
			yes = true;
		}
		return yes;
	}

	private boolean checkPemeriksa(LoginResponse dataLogin) {
		boolean yes = false;
		Role r = dataLogin.getAccount().getRole();
		if (r.getId() == PEMERIKSA_P2 || r.getId() == PEMERIKSA_PERBEND || r.getId() == PEMERIKSA_PKC
				|| r.getId() == KANWIL_PEMERIKSA_DOKUMEN || r.getId() == KANWIL_PEMERIKSA_P2
				|| r.getId() == KANWIL_PEMERIKSA_PKC) {
			yes = true;
		}
		return yes;
	}

	class CheklistModel {
		private boolean check;
		private ViewDokumenResponse doc;
		private Layanan datalay;

		public CheklistModel(boolean check, ViewDokumenResponse doc, Layanan datalay) {
			super();
			this.check = check;
			this.doc = doc;
			this.datalay = datalay;
		}

		public boolean isCheck() {
			return check;
		}

		public void setCheck(boolean check) {
			this.check = check;
		}

		public ViewDokumenResponse getDoc() {
			return doc;
		}

		public void setDoc(ViewDokumenResponse doc) {
			this.doc = doc;
		}

		public Layanan getDatalay() {
			return datalay;
		}

		public void setDatalay(Layanan datalay) {
			this.datalay = datalay;
		}

	}

	class CheklistModel2 {
		private boolean check;
		private JDokumen jDokumen;
		private MemoryBuffer membuffer;
		private Layanan datalay;
		private String templateHtml;
		private boolean docada;

		public CheklistModel2(boolean check, JDokumen jDokumen, MemoryBuffer membuffer, Layanan datalay,
				String templateHtml, boolean docada) {
			super();
			this.check = check;
			this.jDokumen = jDokumen;
			this.membuffer = membuffer;
			this.datalay = datalay;
			this.templateHtml = templateHtml;
			this.docada = docada;
		}

		public boolean isCheck() {
			return check;
		}

		public void setCheck(boolean check) {
			this.check = check;
		}

		public JDokumen getjDokumen() {
			return jDokumen;
		}

		public void setjDokumen(JDokumen jDokumen) {
			this.jDokumen = jDokumen;
		}

		public MemoryBuffer getMembuffer() {
			return membuffer;
		}

		public void setMembuffer(MemoryBuffer membuffer) {
			this.membuffer = membuffer;
		}

		public Layanan getDatalay() {
			return datalay;
		}

		public void setDatalay(Layanan datalay) {
			this.datalay = datalay;
		}

		public String getTemplateHtml() {
			return templateHtml;
		}

		public void setTemplateHtml(String templateHtml) {
			this.templateHtml = templateHtml;
		}

		public boolean isDocada() {
			return docada;
		}

		public void setDocada(boolean docada) {
			this.docada = docada;
		}

	}

	@Override
	public void beforeEnter(BeforeEnterEvent event) {
		// TODO Auto-generated method stub
		String loc = event.getLocation().getSubLocation().get().getFirstSegment();
		System.out.println("locnya gan : " + loc);
		Layanan dataLay = layananService.findLayananById(Integer.parseInt(loc));
		if (dataLay == null) {
			event.getUI().getPage().getHistory().back();
		} else {
			InboxBcDetailPageComp(dataLay);
		}
	}
}
