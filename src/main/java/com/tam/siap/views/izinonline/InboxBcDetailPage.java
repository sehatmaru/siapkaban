package com.tam.siap.views.izinonline;

import static com.tam.siap.utils.refs.StatusLayanan.ON_PROGRESS;

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
import com.tam.siap.models.Layanan;
import com.tam.siap.models.StatusLayanan;
import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.models.responses.ViewDokumenResponse;
import com.tam.siap.services.IzinOnlineService;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.LayananService;
import com.tam.siap.utils.TamUtils;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.checkbox.Checkbox;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.formlayout.FormLayout.ResponsiveStep;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.grid.GridVariant;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.menubar.MenuBar;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.TextArea;
import com.vaadin.flow.router.BeforeEvent;
import com.vaadin.flow.router.HasUrlParameter;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.InputStreamFactory;
import com.vaadin.flow.server.StreamResource;
import com.vaadin.flow.server.VaadinSession;

@Route(value = "inboxbcdetail", layout = HomePageIzinOnline2.class)
public class InboxBcDetailPage extends VerticalLayout implements HasUrlParameter<String> {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = 7272302887998337493L;

	private ComboBox<Account> picBox = new ComboBox<Account>("PIC Selanjutnya");

	private List<Account> nextPic = new ArrayList();

	private TextArea txtCatatan = new TextArea("Catatan");

	private Layanan dataLay = new Layanan();

	private MenuBar menuBar = new MenuBar();

	@Autowired
	IzinOnlineService izinOnlineService;

	@Autowired
	LayananService layananService;

	@Autowired
	AccountService accountService;

	private Grid<ViewDokumenResponse> gridDokumen = new Grid<ViewDokumenResponse>();

	private VerticalLayout vldok = new VerticalLayout();
	private Label lbltitledok = new Label();
	// private Button btnTolak = new Button("Tolak");
	private Button btnLanjut = new Button("Proses Lanjut");
	// private Label lblJudul = new Label();
	private WysiwygE wysiwygE = new WysiwygE(true);

	List<ViewDokumenResponse> listVDocs = new ArrayList<ViewDokumenResponse>();
	List<CheklistModel> listChecks = new ArrayList<CheklistModel>();

	@PostConstruct
	void init() {
//		System.out.println("lay id : "+layananid);
//		dokdatas = dokumenRepo.findDokLayanan(layananid);
//		gridDokumen.setItems(dokdatas);
		LoginResponse dataLogin = TamUtils.getLoginResponse();
		if (dataLogin != null) {
			dataLay = (Layanan) VaadinSession.getCurrent().getAttribute("paramnya");
			System.out.println(dataLay);
			nextPic = izinOnlineService.getNextPic(dataLogin.getAccount());
			System.out.println("Size nexpic : "+nextPic.size());
			picBox.setItems(nextPic);
		}
	}

	public void InboxBcDetailPageComp(Layanan dataLay) {
		// List layanan = layananRepository.findLayananPerusahaan(perusahaanid);

		gridDokumen.addColumn(data -> data.getDokumen().getNamaDokumen()).setHeader("Dokumen");
		gridDokumen.addComponentColumn(data -> gridCheck(data)).setHeader("Ada");
		gridDokumen.setSizeUndefined();
		gridDokumen.addThemeVariants(GridVariant.LUMO_ROW_STRIPES);
		gridDokumen.addThemeVariants(GridVariant.LUMO_COLUMN_BORDERS);
		gridDokumen.addThemeVariants(GridVariant.LUMO_WRAP_CELL_CONTENT);

		listVDocs = izinOnlineService.viewDocs(dataLay);
		for (int h = 0; h < listVDocs.size(); h++) {
			ViewDokumenResponse data = listVDocs.get(h);
			listChecks.add(new CheklistModel(false, data));
			menuBar.addItem(data.getDokumen().getNamaDokumen(), e -> showDoc(data));
		}
		
		gridDokumen.setItems(listVDocs);

		picBox.setItemLabelGenerator(data -> data.getPribadi().getNama());

		HorizontalLayout fl = new HorizontalLayout(btnLanjut);
		fl.setWidthFull();
		fl.setAlignItems(Alignment.CENTER);
		fl.setJustifyContentMode(JustifyContentMode.CENTER);
		btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
//		btnTolak.addThemeVariants(ButtonVariant.LUMO_ERROR);
		if(checkList()) {
			btnLanjut.setText("Proses Lanjut");
			btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);	
			btnLanjut.addThemeVariants(ButtonVariant.LUMO_SUCCESS);
		}else {
			btnLanjut.setText("Tolak");
			btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
			btnLanjut.addThemeVariants(ButtonVariant.LUMO_ERROR);
		}

		btnLanjut.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				if(checkList()) {
					Account acc = picBox.getValue();
					LoginResponse dataLogin = TamUtils.getLoginResponse();
					SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
					String catatan = txtCatatan.getValue();
					StatusLayanan statusLayanan = new StatusLayanan("" + dataLogin.getAccount().getId(),
							dateFormat.format(new Date()), "" + ON_PROGRESS, catatan);
					dataLay.setKepKantor(acc.getUsername());
					izinOnlineService.processLayanan(dataLay, statusLayanan);	
				}else {
					
				}
			}
		});

		// menuBar.getStyle().set("wi", "");
		menuBar.setWidthFull();

		picBox.setWidthFull();

		VerticalLayout vl1 = new VerticalLayout(new Label("Hasil penelitian dokumen"), gridDokumen, picBox, txtCatatan,
				fl);
		txtCatatan.setWidthFull();
		vl1.setWidth("20%");
		lbltitledok.setText("Preview - Dokumen");
		vldok.setSizeFull();
		vldok.setHeight("600px");
		wysiwygE.setSizeFull();
		wysiwygE.setVisible(false);
		VerticalLayout vl2 = new VerticalLayout(menuBar, lbltitledok, vldok);
		FormLayout hl = new FormLayout(vl1, vl2);
//		hl.setPadding(false);
		hl.setResponsiveSteps(new ResponsiveStep("10em", 1), new ResponsiveStep("32em", 2),
				new ResponsiveStep("40em", 3));
		hl.setColspan(vl1, 1);
		hl.setColspan(vl2, 2);
		hl.setSizeFull();
		setSizeFull();

		add(hl);

//		btnTolak.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
//
//			@Override
//			public void onComponentEvent(ClickEvent<Button> event) {
//				// TODO Auto-generated method stub
////				System.out.println(wysiwygE.getValue());
////				System.out.println("========== \n" + wysiwygE.getElement().getAttribute("innerHTML"));
//			}
//		});

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

	private Checkbox gridCheck(ViewDokumenResponse data) {
		Checkbox ch = new Checkbox();
		ch.addClickListener(new ComponentEventListener<ClickEvent<Checkbox>>() {

			@Override
			public void onComponentEvent(ClickEvent<Checkbox> event) {
				// TODO Auto-generated method stub
				if (ch.getValue() == true) {
					// data.setAda(1);
					int in = listVDocs.indexOf(data);
					listChecks.get(in).setCheck(true);
				} else {
					// data.setAda(0);
					int in = listVDocs.indexOf(data);
					listChecks.get(in).setCheck(false);
				}
				
				if(checkList()) {
					btnLanjut.setText("Proses Lanjut");
					btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);	
					btnLanjut.addThemeVariants(ButtonVariant.LUMO_SUCCESS);	
				}else {
					btnLanjut.setText("Tolak");
					btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
					btnLanjut.addThemeVariants(ButtonVariant.LUMO_ERROR);
				}
			}
		});
		return ch;
	}

	private boolean checkList() {
		boolean h = true;
		for (CheklistModel data : listChecks) {
			if(!data.isCheck()) {
				h=false;
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
			Layanan dataLay = layananService.findLayananById(Integer.parseInt(parameter));
			if (dataLay == null) {
				event.getUI().getPage().getHistory().back();
			} else {
				VaadinSession.getCurrent().setAttribute("paramnya", dataLay);
				InboxBcDetailPageComp(dataLay);
			}
		}
	}

	class CheklistModel {
		private boolean check;
		private ViewDokumenResponse doc;

		public CheklistModel(boolean check, ViewDokumenResponse doc) {
			super();
			this.check = check;
			this.doc = doc;
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

	}
}
