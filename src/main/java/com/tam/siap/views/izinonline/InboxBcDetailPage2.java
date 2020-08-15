package com.tam.siap.views.izinonline;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.EmbeddedPdfDocument;
import com.tam.siap.document.DocumentPrinter;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.checkbox.Checkbox;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.grid.GridVariant;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.menubar.MenuBar;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.page.Viewport;
import com.vaadin.flow.component.polymertemplate.Id;
import com.vaadin.flow.component.polymertemplate.PolymerTemplate;
import com.vaadin.flow.component.textfield.TextArea;
import com.vaadin.flow.router.BeforeEvent;
import com.vaadin.flow.router.HasUrlParameter;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.InputStreamFactory;
import com.vaadin.flow.server.StreamResource;
import com.vaadin.flow.templatemodel.TemplateModel;

@Route(value = "inboxbcdetail2")
@Tag("inboxbcdetail-page")
@HtmlImport("html/inboxbcdetail.html")
@Viewport("width=device-width, minimum-scale=1, initial-scale=1, user-scalable=yes, viewport-fit=cover")
public class InboxBcDetailPage2 extends PolymerTemplate<TemplateModel> implements HasUrlParameter<String> {

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

	@Id("vform")
	VerticalLayout vform;

	@Id("vform2")
	VerticalLayout vform2;

	@Autowired
	DocumentPrinter documentPrinter;

	private Grid<String> gridDokumen = new Grid<String>();

	private VerticalLayout vldok = new VerticalLayout();
	private Label lbltitledok = new Label();
	private Button btnTolak = new Button("Tolak");
	private Button btnLanjut = new Button("Proses Lanjut");
	private Label lblJudul = new Label();

	@PostConstruct
	void init() {
//		System.out.println("lay id : "+layananid);
//		dokdatas = dokumenRepo.findDokLayanan(layananid);
//		System.out.println("Data dok : "+dokdatas.size());
//		gridDokumen.setItems(dokdatas);
	}

	private VerticalLayout LeftComp() {
		gridDokumen.addColumn(data -> data).setHeader("Dokumen");
		gridDokumen.addComponentColumn(data -> gridCheck(data)).setHeader("Ada");
		gridDokumen.setSizeUndefined();
		gridDokumen.addThemeVariants(GridVariant.LUMO_ROW_STRIPES);
		gridDokumen.addThemeVariants(GridVariant.LUMO_COLUMN_BORDERS);
		gridDokumen.addThemeVariants(GridVariant.LUMO_WRAP_CELL_CONTENT);

		HorizontalLayout fl = new HorizontalLayout(btnTolak, btnLanjut);
		btnLanjut.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
		btnTolak.addThemeVariants(ButtonVariant.LUMO_ERROR);

		picBox.setWidthFull();
		picBox.setLabel("Next PIC");
		
		txtCatatan.setWidthFull();

		vform.setSizeFull();
		vform.add(new Label("Hasil penelitian dokumen"), gridDokumen, picBox, txtCatatan, fl);

		return vform;
	}

	private VerticalLayout RightComp() {
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
		
		lbltitledok.setText("Preview - Dokumen");
		vldok.setSizeFull();
		
		vform2.setSizeFull();
		vform2.add(menuBar, lbltitledok, vldok);
		
		return vform2;
	}

	public InboxBcDetailPage2() {
		// List layanan = layananRepository.findLayananPerusahaan(perusahaanid);
		LeftComp();
		RightComp();
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
