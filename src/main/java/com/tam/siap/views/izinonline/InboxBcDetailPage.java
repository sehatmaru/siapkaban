package com.tam.siap.views.izinonline;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.vaadin.pekka.WysiwygE;

import com.tam.siap.EmbeddedPdfDocument;
import com.tam.siap.document.DocumentPrinter;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.checkbox.Checkbox;
import com.vaadin.flow.component.combobox.ComboBox;
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

@Route(value = "inboxbcdetail", layout = HomePageIzinOnline2.class)
public class InboxBcDetailPage extends VerticalLayout implements HasUrlParameter<String> {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = 7272302887998337493L;

	private String role = "";

	private ComboBox<String> picBox = new ComboBox<String>();

	private List<String> nextPic = new ArrayList();

	private List<String> dokdatas = new ArrayList();

	private TextArea txtCatatan = new TextArea("Catatan");

	private long layananid;

	@Autowired
	DocumentPrinter documentPrinter;

	private Grid<String> gridDokumen = new Grid<String>();

	private VerticalLayout vldok = new VerticalLayout();
	private Label lbltitledok = new Label();
	private Button btnTolak = new Button("Tolak");
	private Button btnLanjut = new Button("Proses Lanjut");
	private Label lblJudul = new Label();
	private WysiwygE wysiwygE = new WysiwygE(true);

	@PostConstruct
	void init() {
//		System.out.println("lay id : "+layananid);
//		dokdatas = dokumenRepo.findDokLayanan(layananid);
//		System.out.println("Data dok : "+dokdatas.size());
//		gridDokumen.setItems(dokdatas);
		
	}

	public InboxBcDetailPage() {
		// List layanan = layananRepository.findLayananPerusahaan(perusahaanid);
		gridDokumen.addColumn(data -> data).setHeader("Dokumen");
		gridDokumen.addComponentColumn(data -> gridCheck(data)).setHeader("Ada");
		gridDokumen.setSizeUndefined();
		gridDokumen.addThemeVariants(GridVariant.LUMO_ROW_STRIPES);
		gridDokumen.addThemeVariants(GridVariant.LUMO_COLUMN_BORDERS);
		gridDokumen.addThemeVariants(GridVariant.LUMO_WRAP_CELL_CONTENT);

		HorizontalLayout fl = new HorizontalLayout(btnTolak, btnLanjut);
		btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
		btnTolak.addThemeVariants(ButtonVariant.LUMO_ERROR);

		MenuBar menuBar = new MenuBar();
		menuBar.addItem("Permohonan", e -> lbltitledok.setText("Dokumen pemohon"));
		menuBar.addItem("NIB", e -> lbltitledok.setText("Dokumen NIB"));
		menuBar.addItem("IZIN USAHA", e -> lbltitledok.setText("Dokumen IZIN USAHA"));
		menuBar.addItem("STATUS WP", e -> lbltitledok.setText("Dokumen STATUS WP"));
		menuBar.addItem("KEPEMILIKAN TEMPAT", e -> lbltitledok.setText("Dokumen KEPEMILIKAN TEMPAT"));
		menuBar.addItem("SPT TAHUNAN", e -> lbltitledok.setText("Dokumen SPT TAHUNAN"));
		menuBar.addItem("PETA LOKASI", e -> lbltitledok.setText("Dokumen PETA LOKASI"));
		menuBar.addItem("DENAH", e -> lbltitledok.setText("Dokumen DENAH"));
		menuBar.addItem("IDENTITAS", e -> lbltitledok.setText("Dokumen IDENTITAS"));
		menuBar.getElement().setAttribute("style", "max-width: 1200px;width:100%");

		picBox.setWidthFull();

		VerticalLayout vl1 = new VerticalLayout(new Label("Hasil penelitian dokumen"), gridDokumen, picBox, txtCatatan,
				fl);
		txtCatatan.setWidthFull();
		vl1.setWidth("40%");
		lbltitledok.setText("Preview - Dokumen");
		vldok.setSizeFull();
		vldok.setHeight("600px");
		wysiwygE.setSizeFull();
		wysiwygE.setVisible(true);
		VerticalLayout vl2 = new VerticalLayout(menuBar, lbltitledok, wysiwygE);
		HorizontalLayout hl = new HorizontalLayout(vl1, vl2);
		hl.setPadding(false);
		hl.setSizeFull();
		setSizeFull();

		add(hl);

		System.out.println("size dok : " + dokdatas.size());
		
		btnTolak.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				System.out.println(wysiwygE.getValue());
				System.out.println("========== \n"+wysiwygE.getElement().getAttribute("innerHTML"));
			}
		});

	}

	private Button btnView(String data) {
		Button btnView = new Button("view");
		btnView.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				vldok.removeAll();
				StreamResource res = new StreamResource(data, new InputStreamFactory() {

					@Override
					public InputStream createInputStream() {
						// TODO Auto-generated method stub
						File initialFile = new File(data);
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
				pdfdoc.setSizeFull();
				pdfdoc.setHeight("600px");
				// lbltitledok.setText("Preview - " + data.getSyaratAdministrasi().getDscp());
				vldok.add(pdfdoc);
			}
		});
		return btnView;
	}

	private Checkbox gridCheck(String data) {
		Checkbox ch = new Checkbox();
		ch.addClickListener(new ComponentEventListener<ClickEvent<Checkbox>>() {

			@Override
			public void onComponentEvent(ClickEvent<Checkbox> event) {
				// TODO Auto-generated method stub
				if (ch.getValue() == true) {
					// data.setAda(1);
				} else {
					// data.setAda(0);
				}
			}
		});
		return ch;
	}

	@Override
	public void setParameter(BeforeEvent event, String parameter) {
		// TODO Auto-generated method stub
		if (parameter == null) {
			event.getUI().getPage().getHistory().back();
		} else {

		}
	}
}
