package com.tam.siap.views.izinonline;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.EmbeddedPdfDocument;
import com.tam.siap.LayananStatus;
import com.tam.siap.RoleEnum;
import com.tam.siap.document.DocumentPrinter;
import com.tam.siap.document.ReportGenerator;
import com.tam.siap.models.Dokumen;
import com.tam.siap.models.Layanan;
import com.tam.siap.models.Pic;
import com.tam.siap.repos.DokumenRepository;
import com.tam.siap.repos.LayananRepository;
import com.tam.siap.repos.PicRepository;
import com.tam.siap.security.UserService;
import com.tam.siap.utils.EmailSMTP;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.dialog.Dialog;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.grid.GridVariant;
import com.vaadin.flow.component.html.Anchor;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.orderedlayout.FlexComponent;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.TextArea;
import com.vaadin.flow.data.provider.ListDataProvider;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.InputStreamFactory;
import com.vaadin.flow.server.StreamResource;
import com.vaadin.flow.server.VaadinSession;

@Route(value = "statuslayananbc", layout = HomePageIzinOnline2.class)
public class StatusLayananPageBc extends VerticalLayout {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8342023334695591084L;
	Grid<Layanan> gridsattus = new Grid<Layanan>();
	List<Layanan> layanan = new ArrayList<Layanan>();
	private String role = "";

	private ComboBox<Pic> picBox = new ComboBox<Pic>();

	private List<Pic> nextPic = new ArrayList();

	@Autowired
	LayananRepository layananRepository;

	@Autowired
	PicRepository picRepository;

	@Autowired
	PicRepository picRepo;

	@Autowired
	DokumenRepository dokumenRepo;

	@Autowired
	DocumentPrinter documentPrinter;

	@PostConstruct
	void init() {
		loadData();
		gridsattus.setItems(layanan);
	}

	public void loadData() {
//		Object userid = VaadinSession.getCurrent().getAttribute(UserService.USERID);
//		System.out.println(userid);
//		if (userid != "null" && userid != "" && userid != null ) {
//			Pic picper = picRepository.findByNipuser(userid.toString());
//			System.out.println(picper);
//			if (picper != null && picper.get() != null) {
//				//PicPerusahaan picperusahaan = picper.get();
//				
//			}
//		}
		String status = "";
		try {
			role = (String) VaadinSession.getCurrent().getAttribute(UserService.ROLE);
			Long userid = (Long) VaadinSession.getCurrent().getAttribute(UserService.PIC_ID);

			if (RoleEnum.ROLE_PENERIMA_DOC.getKey().equals(role)) {
				status = LayananStatus.STATUS_BARU.getKey();
				layanan = layananRepository.findPendokInbox(status);

			} else if (RoleEnum.ROLE_PIC_STAFF.getKey().equals(role)) {
				status = LayananStatus.STATUS_DISPOSISI_STAFF.getKey();
				layanan = layananRepository.findBCPicStafInbox(status, userid);

			} else if (RoleEnum.ROLE_PIC_KEPALA_SEKSI.getKey().equals(role)) {
				status = LayananStatus.STATUS_DISPOSISI_KEPALA_SEKSI.getKey();
				layanan = layananRepository.findBCPicInbox(status);

			} else if (RoleEnum.ROLE_PIC_KEPALA_BIDANG.getKey().equals(role)) {
				status = LayananStatus.STATUS_DISPOSISI_KEPALA_BIDANG.getKey();
				layanan = layananRepository.findBCPicInbox(status);

			} else if (RoleEnum.ROLE_PIC_KEPALA_KANTOR.getKey().equals(role)) {
				status = LayananStatus.STATUS_DISPOSISI_KEPALA_KANTOR.getKey();
				layanan = layananRepository.findBCPicInbox(status);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public StatusLayananPageBc() {
		// List layanan = layananRepository.findLayananPerusahaan(perusahaanid);
		setSizeFull();
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		gridsattus.addColumn(data -> String.valueOf(data.getId()).substring(0, 6)).setHeader(setCustomHerader("Nomor"))
				.setWidth("5em");
//		gridsattus.addColumn(Layanan::getLblstatus).setHeader("Status Permohonan").setWidth("9em");
		gridsattus.addColumn(data -> dateFormat.format(data.getTanggal())).setHeader(setCustomHerader("Tanggal"))
				.setWidth("7em");
		gridsattus.addColumn(Layanan::getNamaperusahaan).setHeader(setCustomHerader("Nama PT")).setWidth("7em");
		gridsattus.addColumn(Layanan::getLbljenisperusahaan).setHeader(setCustomHerader("Jenis Perusahaan"))
				.setWidth("7em");
		gridsattus.addColumn(Layanan::getLbjjenislayanan).setHeader(setCustomHerader("Jenis Layanan")).setWidth("5em");
//		gridsattus.addColumn(Layanan::getLblsubjenislayanan).setHeader("Sub Jenis Layanan").setWidth("9em");
//		gridsattus.addColumn(Layanan::getLbjanjilayanan).setHeader("Janji Layanan").setWidth("9em");
		gridsattus
				.addColumn(data -> data.getPenerimadok() + "\n"
						+ (data.getPenerimadok().length() > 0 ? dateFormat.format(data.getTglpendok()) : ""))
				.setHeader(setCustomHerader("Penerima dokumen")).setWidth("7em");
		gridsattus
				.addColumn(data -> data.getLblpicstaff() + "\n"
						+ (data.getLblpicstaff().length() > 0 ? dateFormat.format(data.getTglstaff()) : ""))
				.setHeader(setCustomHerader("Staf")).setWidth("7em");
		gridsattus
				.addColumn(data -> data.getLblkepalaseksi() + "\n"
						+ (data.getLblkepalaseksi().length() > 0 ? dateFormat.format(data.getTglkplseksi()) : ""))
				.setHeader(setCustomHerader("Kepala Seksi")).setWidth("7em");
		gridsattus
				.addColumn(data -> data.getLblkepalabidang() + "\n"
						+ (data.getLblkepalabidang().length() > 0 ? dateFormat.format(data.getTglkplbidang()) : ""))
				.setHeader(setCustomHerader("Kepala Bidang")).setWidth("7em");
		gridsattus
				.addColumn(data -> data.getLblkepalakantor() + "\n"
						+ (data.getLblkepalakantor().length() > 0 ? dateFormat.format(data.getTglkplkantor()) : ""))
				.setHeader(setCustomHerader("Kepala Kantor")).setWidth("7em");
		// gridsattus.addColumn(Layanan::getKet).setHeader("Keterangan").setWidth("15em").setFlexGrow(2);
		gridsattus.addComponentColumn(item -> createRemoveButton2(gridsattus, item))
				.setHeader(setCustomHerader("Actions")).setWidth("6em");
		gridsattus.addThemeVariants(GridVariant.LUMO_ROW_STRIPES);
		gridsattus.addThemeVariants(GridVariant.LUMO_COLUMN_BORDERS);
		gridsattus.addThemeVariants(GridVariant.LUMO_WRAP_CELL_CONTENT);
		gridsattus.setItems(layanan);

//		for(Column<Layanan> col : gridsattus.getColumns()) {
//			col.setFlexGrow(9);
//		}

		add(gridsattus);
	}

	private Button createRemoveButton2(Grid<Layanan> grid, Layanan item) {
		Button btnproses = new Button("Proses");

		btnproses.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				Dialog dialog = new Dialog();
				dialog.setMaxHeight("300px");
				// dialog.setHeight("calc(100vh - (2*var(--lumo-space-m)))");
				// dialog.setWidth("calc(100vw - (4*var(--lumo-space-m)))");
				dialog.add(insideDialog(grid, item));
				dialog.open();
			}
		});

		return btnproses;
	}

	private VerticalLayout insideDialog(Grid<Layanan> grid, Layanan item) {
		Button btndisposisi = new Button("Disposisi");
		if (item.getStatus().equals(LayananStatus.STATUS_DISPOSISI_KEPALA_KANTOR.getKey())) {
			btndisposisi.setText("Disetujui");
		} else {
			btndisposisi.setText("Disposisi");
		}

		Button btncetak3 = new Button("Cetak");
		Button btnconfirm = new Button("Konfirmasi");
		Button btnpenolakan = new Button("Surat Penolakan");
		Button btnundangan = new Button("undangan");
		Button btnproses = new Button("proses");
		Button btntolak = new Button("Ditolak");

		Anchor dlLembarDisposisi = null;
		Anchor dlNotaDinas = null;
		Anchor dlSkepPerubahan = null;
		Anchor dlTandaTerima = null;

		if (RoleEnum.ROLE_PENERIMA_DOC.getKey().equals(role)) {
			dlLembarDisposisi = new Anchor(getStreamResource(item.getId(),
					DocumentPrinter.LEMBAR_DISPOSISI_KEPALA_KANTOR, ReportGenerator.REPORT_DOCX), "");
			dlLembarDisposisi.getElement().setAttribute("download", true);
			dlLembarDisposisi.add(new Button("Cetak Lembar Disposisi"));
		}

		if (RoleEnum.ROLE_PIC_STAFF.getKey().equals(role)) {
			dlNotaDinas = new Anchor(
					getStreamResource(item.getId(), DocumentPrinter.NOTA_DINAS, ReportGenerator.REPORT_DOCX), "");
			dlNotaDinas.getElement().setAttribute("download", true);
			dlNotaDinas.add(new Button("Cetak Nota Dinas"));

			dlSkepPerubahan = new Anchor(
					getStreamResource(item.getId(), DocumentPrinter.SKEP_PERUBAHAN, ReportGenerator.REPORT_DOCX), "");
			dlSkepPerubahan.getElement().setAttribute("download", true);
			dlSkepPerubahan.add(new Button("Cetak SKEP Perubahan"));

			dlTandaTerima = new Anchor(
					getStreamResource(item.getId(), DocumentPrinter.TANDA_TERIMA, ReportGenerator.REPORT_DOCX), "");
			dlTandaTerima.getElement().setAttribute("download", true);
			dlTandaTerima.add(new Button("Cetak Tanda Terima"));
		}

		HorizontalLayout hl = new HorizontalLayout();
		hl.setPadding(true);

		if (item.getStatus().equals(LayananStatus.STATUS_BARU.getKey())) {
			nextPic = (List<Pic>) picRepository.findByJenispic(RoleEnum.ROLE_PIC_STAFF.getKey());
			picBox.setLabel(RoleEnum.ROLE_PIC_STAFF.getLabel());
		} else if (item.getStatus().equals(LayananStatus.STATUS_DISPOSISI_STAFF.getKey())) {
			nextPic = (List<Pic>) picRepository.findByJenispic(RoleEnum.ROLE_PIC_KEPALA_SEKSI.getKey());
			picBox.setLabel(RoleEnum.ROLE_PIC_KEPALA_SEKSI.getLabel());
		} else if (item.getStatus().equals(LayananStatus.STATUS_DISPOSISI_KEPALA_SEKSI.getKey())) {
			nextPic = (List<Pic>) picRepository.findByJenispic(RoleEnum.ROLE_PIC_KEPALA_BIDANG.getKey());
			picBox.setLabel(RoleEnum.ROLE_PIC_KEPALA_BIDANG.getLabel());
		} else if (item.getStatus().equals(LayananStatus.STATUS_DISPOSISI_KEPALA_BIDANG.getKey())) {
			nextPic = (List<Pic>) picRepository.findByJenispic(RoleEnum.ROLE_PIC_KEPALA_KANTOR.getKey());
			picBox.setLabel(RoleEnum.ROLE_PIC_KEPALA_KANTOR.getLabel());
		}
		loadNextPic(item);

		btnconfirm.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				Dialog dialog = new Dialog();
				VerticalLayout vl = new VerticalLayout();
				HorizontalLayout hll = new HorizontalLayout();

				TextArea txtalasan = new TextArea("Alasan konfirmasi");
				Button btnconfirminside = new Button("Konfirmasi");
				Button btncancel = new Button("Cancel");

				btncancel.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

					@Override
					public void onComponentEvent(ClickEvent<Button> event) {
						// TODO Auto-generated method stub
						dialog.close();
					}
				});

				btnconfirminside.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

					@Override
					public void onComponentEvent(ClickEvent<Button> event) {
						// TODO Auto-generated method stub
						EmailSMTP email = new EmailSMTP();
//						item.getPerusahaan().get
						boolean sent = email.sendEmail("Konfirmasi", txtalasan.getValue(), item.getEmail());
						if (sent) {
							Notification notification = new Notification("Email Sent Successfully", 3000,
									Position.MIDDLE);
							notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
							notification.open();
							dialog.close();
						} else {
							Notification notification = new Notification("Error", 3000, Position.MIDDLE);
							notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
							notification.open();
							dialog.close();
						}
					}
				});

				hll.add(btncancel);
				hll.add(btnconfirminside);
				vl.add(txtalasan);
				vl.add(hll);
				dialog.add(vl);
				dialog.open();
			}
		});

		btnproses.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {

			}
		});

		btnundangan.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				Dialog dialog = new Dialog();
				VerticalLayout vl = new VerticalLayout();
				HorizontalLayout hll = new HorizontalLayout();

				TextArea txtalasan = new TextArea("Alasan undangan");
				Button btnconfirminside = new Button("Kirim");
				Button btncancel = new Button("Cancel");

				btncancel.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

					@Override
					public void onComponentEvent(ClickEvent<Button> event) {
						// TODO Auto-generated method stub
						dialog.close();
					}
				});

				btnconfirminside.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

					@Override
					public void onComponentEvent(ClickEvent<Button> event) {
						// TODO Auto-generated method stub
						EmailSMTP email = new EmailSMTP();
//						item.getPerusahaan().get
						boolean sent = email.sendEmail("Undangan", txtalasan.getValue(), item.getEmail());
						if (sent) {
							Notification notification = new Notification("Email Sent Successfully", 3000,
									Position.MIDDLE);
							notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
							notification.open();
							dialog.close();
						} else {
							Notification notification = new Notification("Error", 3000, Position.MIDDLE);
							notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
							notification.open();
							dialog.close();
						}
					}
				});

				hll.add(btncancel);
				hll.add(btnconfirminside);
				vl.add(txtalasan);
				vl.add(hll);
				dialog.add(vl);
				dialog.open();
			}
		});

		btnpenolakan.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				Dialog dialog = new Dialog();
				VerticalLayout vl = new VerticalLayout();
				HorizontalLayout hll = new HorizontalLayout();

				TextArea txtalasan = new TextArea("Alasan penolakan");
				Button btnconfirminside = new Button("Penolakan");
				Button btncancel = new Button("Cancel");

				btncancel.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

					@Override
					public void onComponentEvent(ClickEvent<Button> event) {
						// TODO Auto-generated method stub
						dialog.close();
					}
				});

				btnconfirminside.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

					@Override
					public void onComponentEvent(ClickEvent<Button> event) {
						// TODO Auto-generated method stub
						EmailSMTP email = new EmailSMTP();
//						item.getPerusahaan().get
						boolean sent = email.sendEmail("Penolakan", txtalasan.getValue(), item.getEmail());
						ListDataProvider<Layanan> dataProvider = (ListDataProvider<Layanan>) grid.getDataProvider();
						Optional<Layanan> layanan = layananRepository.findById(item.getId());
						Layanan l = layanan.get();
						layananRepository.save(layanan.get());
						DateFormat frm = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
						l.setPickplkantorid((Long) VaadinSession.getCurrent().getAttribute(UserService.PIC_ID));
						l.setTglkplbidang(new Date());
						l.setKet("Ditolak Tgl " + frm.format(new Date()));
						l.setStatus(LayananStatus.STATUS_DISPOSISI_KEPALA_KANTOR.getKey());
						if (sent) {
							Notification notification = new Notification("Email Sent Successfully", 3000,
									Position.MIDDLE);
							notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
							notification.open();
							dialog.close();
							UI.getCurrent().getPage().setLocation("statuslayananbc");
						} else {
							Notification notification = new Notification("Error", 3000, Position.MIDDLE);
							notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
							notification.open();
							dialog.close();
							UI.getCurrent().getPage().setLocation("statuslayananbc");
						}
					}
				});

				hll.add(btncancel);
				hll.add(btnconfirminside);
				vl.add(txtalasan);
				vl.add(hll);
				dialog.add(vl);
				dialog.open();
			}
		});

		btndisposisi.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				ListDataProvider<Layanan> dataProvider = (ListDataProvider<Layanan>) grid.getDataProvider();
				Optional<Layanan> layanan = layananRepository.findById(item.getId());
				Layanan l = layanan.get();
				if (l.getStatus().equals(LayananStatus.STATUS_BARU.getKey())) {
					l.setStatus(LayananStatus.STATUS_DISPOSISI_STAFF.getKey());
					l.setPenerimadok((String) VaadinSession.getCurrent().getAttribute(UserService.NAMEUSER));
					l.setPenerimadokid((Long) VaadinSession.getCurrent().getAttribute(UserService.PIC_ID));
					l.setPicstafid(picBox.getValue().getId());
					l.setTglstaff(new Date());
					l.setTglpendok(new Date());
				} else if (l.getStatus().equals(LayananStatus.STATUS_DISPOSISI_STAFF.getKey())) {
					l.setPicstafid((Long) VaadinSession.getCurrent().getAttribute(UserService.PIC_ID));
					l.setStatus(LayananStatus.STATUS_DISPOSISI_KEPALA_SEKSI.getKey());
					l.setPickplseksiid(picBox.getValue().getId());
					l.setTglstaff(new Date());
					l.setTglkplseksi(new Date());
				} else if (l.getStatus().equals(LayananStatus.STATUS_DISPOSISI_KEPALA_SEKSI.getKey())) {
					l.setPickplseksiid((Long) VaadinSession.getCurrent().getAttribute(UserService.PIC_ID));
					l.setStatus(LayananStatus.STATUS_DISPOSISI_KEPALA_BIDANG.getKey());
					l.setPickplbidangid(picBox.getValue().getId());
					l.setTglkplseksi(new Date());
					l.setTglkplbidang(new Date());
				} else if (l.getStatus().equals(LayananStatus.STATUS_DISPOSISI_KEPALA_BIDANG.getKey())) {
					l.setPickplbidangid((Long) VaadinSession.getCurrent().getAttribute(UserService.PIC_ID));
					l.setStatus(LayananStatus.STATUS_DISPOSISI_KEPALA_KANTOR.getKey());
					l.setPickplkantorid(picBox.getValue().getId());
					l.setTglkplbidang(new Date());
				} else if (l.getStatus().equals(LayananStatus.STATUS_DISPOSISI_KEPALA_KANTOR.getKey())) {
					DateFormat frm = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
					l.setPickplkantorid((Long) VaadinSession.getCurrent().getAttribute(UserService.PIC_ID));
					l.setTglkplkantor(new Date());
					l.setKet("Disetujui Tgl " + frm.format(new Date()));
					l.setStatus(LayananStatus.SETUJU.getKey());
				}

				layananRepository.save(layanan.get());
				Notification notification = new Notification("Sukses", 3000, Position.MIDDLE);
				notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
				notification.open();
				UI.getCurrent().getPage().setLocation("statuslayananbc");
			}
		});

		if (role != null && !"".equals(role)) {
			if (RoleEnum.ROLE_PENERIMA_DOC.getKey().equals(role)) {
				hl.add(btndisposisi);
				hl.add(dlLembarDisposisi);
			} else if (RoleEnum.ROLE_PIC_STAFF.getKey().equals(role)) {
				hl.add(btndisposisi);
				hl.add(btnconfirm);
				hl.add(btnpenolakan);
				hl.add(btnundangan);
				hl.add(dlNotaDinas);
				hl.add(dlSkepPerubahan);
				hl.add(dlTandaTerima);
			} else if (RoleEnum.ROLE_PIC_KEPALA_SEKSI.getKey().equals(role)) {
				hl.add(btndisposisi);
				hl.add(btnconfirm);
				hl.add(btnpenolakan);
				hl.add(btnundangan);
			} else if (RoleEnum.ROLE_PIC_KEPALA_BIDANG.getKey().equals(role)) {
				hl.add(btndisposisi);
				hl.add(btnconfirm);
				hl.add(btnpenolakan);
				hl.add(btnundangan);
			} else if (RoleEnum.ROLE_PIC_KEPALA_KANTOR.getKey().equals(role)) {
				hl.add(btndisposisi);
				hl.add(btnconfirm);
				hl.add(btnpenolakan);
				hl.add(btnundangan);
			}
		}

		HorizontalLayout hl4 = new HorizontalLayout();
		hl4.add(btncetak3);

		VerticalLayout vl = new VerticalLayout();
		vl.setPadding(true);
		vl.setSizeFull();

		List<Dokumen> dokdatas = dokumenRepo.findDokLayanan(item.getId());
		for (Dokumen dokdata : dokdatas) {
			VerticalLayout vldok = new VerticalLayout();
			StreamResource res = new StreamResource(dokdata.getFilename(), new InputStreamFactory() {

				@Override
				public InputStream createInputStream() {
					// TODO Auto-generated method stub
					File initialFile = new File(dokdata.getFullpath());
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
			vldok.add(new Label(dokdata.getSyaratAdministrasi().getDscp()), new EmbeddedPdfDocument(res));
			vldok.setHeight("400px");
			vldok.setWidthFull();
			vl.add(vldok);
		}

		vl.add(picBox);
		vl.add(hl);

		return vl;
	}

	public void loadNextPic(Layanan layanan) {
		if (LayananStatus.STATUS_BARU.getKey().equals(layanan.getStatus())) {
			if (layanan.getPerusahaan() != null && layanan.getPerusahaan().getPicStaff() != null) {
				nextPic = new ArrayList<Pic>();
				nextPic.add(layanan.getPerusahaan().getPicStaff());
			} else {
				nextPic = (List<Pic>) picRepository.findByJenispic(RoleEnum.ROLE_PIC_STAFF.getKey());

			}

		} else {
			try {
				Pic currentLoginPic = picRepository
						.findByNipuser((String) VaadinSession.getCurrent().getAttribute(UserService.USERID));
				Long superiorJabatanId = currentLoginPic.getJabatan().getParentid();
				nextPic = (List<Pic>) picRepository.findSuperiorByJenisjabatanid(superiorJabatanId);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		picBox.setSizeFull();
		picBox.setItems(nextPic);
		picBox.setItemLabelGenerator(Pic::getFullPicDscp);
	}

	public StreamResource getStreamResource(long id, String dokumen, String type) {
		byte[] bytes = documentPrinter.printNotaDinas(id, dokumen, type);
		String fileName = id + dokumen + "." + type;
		return new StreamResource(fileName, () -> new ByteArrayInputStream(bytes));
	}

	private VerticalLayout setCustomHerader(String text) {
		Label head1 = new Label();
		head1.getElement().setProperty("innerHTML", "<center><strong>" + text + "</strong></center>");
		VerticalLayout headerContent = new VerticalLayout();
		headerContent.setSizeFull();
		headerContent.setPadding(false);
		headerContent.setSpacing(false);
		headerContent.setMargin(false);
		headerContent.add(head1);
		headerContent.setHorizontalComponentAlignment(FlexComponent.Alignment.CENTER, head1);
		return headerContent;
	}

}
