package com.tam.siap.views.izinonline;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.models.responses.LayananResponse;
import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.services.IzinOnlineService;
import com.tam.siap.services.master.LayananService;
import com.tam.siap.utils.TamUtils;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.dialog.Dialog;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.grid.GridVariant;
import com.vaadin.flow.component.html.Span;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.Route;

@Route(value = "instan", layout = HomePageIzinOnline2.class)
public class StatusBC extends VerticalLayout {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = -1613805910080579932L;

	private Grid<LayananResponse> gridsattus = new Grid<LayananResponse>();
	private List<LayananResponse> layRes = new ArrayList<>();

	private Dialog dialog = new Dialog();

	@Autowired
	LayananService layananService;

	@Autowired
	IzinOnlineService izinOnlineService;

	@PostConstruct
	public void init() {
		// TODO Auto-generated constructor stub
		LoginResponse logRes = TamUtils.getLoginResponse();
		if (logRes != null) {
//			layRes = izinOnlineService.viewPerizinanOnline(logRes.getAccount(),logRes.getAccount().getRole());
			layRes = izinOnlineService.viewStatusLayanan(logRes.getAccount(),logRes.getAccount().getRole());
			gridsattus.setItems(layRes);
		}
	}

	public StatusBC() {
		setSizeFull();
		gridsattus.getElement().setAttribute("style", "font-size: 12px;text-align: center;padding:0;");
		gridsattus.addColumn(LayananResponse::getNomor).setHeader(TamUtils.setCustomHerader("Nomor")).setWidth("5em");
		gridsattus.addColumn(LayananResponse::getTanggalRequest).setHeader(TamUtils.setCustomHerader("Tanggal"))
				.setWidth("7em");
		gridsattus.addColumn(LayananResponse::getNamaPerusahaan).setHeader(TamUtils.setCustomHerader("Nama Perusahaan"))
				.setWidth("7em");
		gridsattus.addColumn(LayananResponse::getJenisPerusahaan)
				.setHeader(TamUtils.setCustomHerader("Jenis Perusahaan")).setWidth("7em");
		gridsattus.addColumn(LayananResponse::getLayanan).setHeader(TamUtils.setCustomHerader("Jenis Layanan"))
				.setWidth("5em");
		gridsattus.addComponentColumn(data -> layCell(0, data)).setHeader(TamUtils.setCustomHerader("Penerima dokumen"))
				.setWidth("7em");
		gridsattus.addComponentColumn(data -> layCell(1, data)).setHeader(TamUtils.setCustomHerader("Pemeriksa"))
				.setWidth("7em");
		gridsattus.addComponentColumn(data -> layCell(2, data)).setHeader(TamUtils.setCustomHerader("Kepala Sub Seksi"))
				.setWidth("7em");
		gridsattus.addComponentColumn(data -> layCell(3, data)).setHeader(TamUtils.setCustomHerader("Kepala Seksi"))
				.setWidth("7em");
		gridsattus.addComponentColumn(data -> layCell(4, data)).setHeader(TamUtils.setCustomHerader("Kepala Bidang"))
				.setWidth("7em");
		gridsattus.addComponentColumn(data -> layCell(5, data)).setHeader(TamUtils.setCustomHerader("Kepala Kantor"))
				.setWidth("7em");
//		gridsattus.addComponentColumn(item -> createRemoveButton2(item)).setHeader(TamUtils.setCustomHerader("Actions"))
//				.setWidth("6em");
		gridsattus.addThemeVariants(GridVariant.LUMO_ROW_STRIPES);
		gridsattus.addThemeVariants(GridVariant.LUMO_COLUMN_BORDERS);
		gridsattus.addThemeVariants(GridVariant.LUMO_WRAP_CELL_CONTENT);
		gridsattus.setHeight("600px");

		add(gridsattus);
	}

	private Button createRemoveButton2(LayananResponse item) {
		Button btnproses = new Button("Proses");
		btnproses.getElement().setProperty("style", "font-size:12px;");
		btnproses.addThemeVariants(ButtonVariant.LUMO_PRIMARY);

		btnproses.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				getUI().get().navigate("inboxbcdetail/" + item.getId());
			}
		});

		return btnproses;
	}

	private VerticalLayout layCell(int col, LayananResponse data) {
		VerticalLayout vel = new VerticalLayout();
		Span span = new Span();
		if (col == 0) {
			span.getElement().setProperty("innerHTML",
					getNullorWhat(data.getPenerima(), "-") + "</br>" + getNullorWhat(data.getTanggalPenerima(), "-"));
		} else if (col == 1) {
			span.getElement().setProperty("innerHTML",
					getNullorWhat(data.getPemeriksa(), "-") + "</br>" + getNullorWhat(data.getTanggalPemeriksa(), "-"));
		} else if (col == 2) {
			span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksi(), "-") + "</br>"
					+ getNullorWhat(data.getTanggalKepSubSeksi(), "-"));
		} else if (col == 3) {
			span.getElement().setProperty("innerHTML",
					getNullorWhat(data.getKepSeksi(), "-") + "</br>" + getNullorWhat(data.getTanggalKepSeksi(), "-"));
		} else if (col == 4) {
			span.getElement().setProperty("innerHTML",
					getNullorWhat(data.getKepBidang(), "-") + "</br>" + getNullorWhat(data.getTanggalKepBidang(), "-"));
		} else {
			span.getElement().setProperty("innerHTML",
					getNullorWhat(data.getKepKantor(), "-") + "</br>" + getNullorWhat(data.getTanggalKepKantor(), "-"));
		}

		vel.add(span);
		return vel;
	}
	
	

	private String getNullorWhat(String text, String change) {
		String hasil = text == null ? change : text;
		return hasil;
	}
}
