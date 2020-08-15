package com.tam.siap.views.izinonline;

import javax.annotation.PostConstruct;

import com.tam.siap.utils.TamUtils;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.grid.GridVariant;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.upload.Upload;
import com.vaadin.flow.router.Route;

@Route(value = "inboxbc", layout = HomePageIzinOnline2.class)
public class InboxBCPage extends VerticalLayout {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = -1613805910080579932L;

	private Grid<String> gridsattus = new Grid<String>();

	private Upload uploadFile = new Upload();
	private Button btnSubmit = new Button("Submit");

	@PostConstruct
	public void init() {
		// TODO Auto-generated constructor stub

	}

	public InboxBCPage() {
		setSizeFull();
		gridsattus.addColumn(data -> data).setHeader(TamUtils.setCustomHerader("Nomor")).setWidth("5em");
		gridsattus.addColumn(data -> data).setHeader(TamUtils.setCustomHerader("Tanggal")).setWidth("7em");
		gridsattus.addColumn(data -> data).setHeader(TamUtils.setCustomHerader("Nama PT")).setWidth("7em");
		gridsattus.addColumn(data -> data).setHeader(TamUtils.setCustomHerader("Jenis Perusahaan")).setWidth("7em");
		gridsattus.addColumn(data -> data).setHeader(TamUtils.setCustomHerader("Jenis Layanan")).setWidth("5em");
		gridsattus.addColumn(data -> data).setHeader(TamUtils.setCustomHerader("Penerima dokumen")).setWidth("7em");
		gridsattus.addColumn(data -> data).setHeader(TamUtils.setCustomHerader("Pemeriksa")).setWidth("7em");
		gridsattus.addColumn(data -> data).setHeader(TamUtils.setCustomHerader("Kepala Sub Seksi")).setWidth("7em");
		gridsattus.addColumn(data -> data).setHeader(TamUtils.setCustomHerader("Kepala Seksi")).setWidth("7em");
		gridsattus.addColumn(data -> data).setHeader(TamUtils.setCustomHerader("Kepala Kantor")).setWidth("7em");
		gridsattus.addComponentColumn(item -> createRemoveButton2(gridsattus, item))
				.setHeader(TamUtils.setCustomHerader("Actions")).setWidth("6em");
		gridsattus.addThemeVariants(GridVariant.LUMO_ROW_STRIPES);
		gridsattus.addThemeVariants(GridVariant.LUMO_COLUMN_BORDERS);
		gridsattus.addThemeVariants(GridVariant.LUMO_WRAP_CELL_CONTENT);
		add(gridsattus);
	}
	
	private Button createRemoveButton2(Grid<String> grid, String item) {
		Button btnproses = new Button("Proses");

		btnproses.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				getUI().get().navigate("inboxbcdetail/"+item);
			}
		});

		return btnproses;
	}
}
