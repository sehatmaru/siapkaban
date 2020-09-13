package com.tam.siap.views.izinonline;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.models.responses.LayananResponse;
import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.services.IzinOnlineService;
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

@Route(value = "inboxpt", layout = HomePageIzinOnline2.class)
public class StatusPT extends VerticalLayout {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = -1613805910080579932L;

	private Grid<LayananResponse> gridsattus = new Grid<LayananResponse>();
	private List<LayananResponse> layRes = new ArrayList<>();

	private Dialog dialog = new Dialog();

	@Autowired
	IzinOnlineService izinOnlineService;

	@PostConstruct
	public void init() {
		// TODO Auto-generated constructor stub
		LoginResponse logRes = TamUtils.getLoginResponse();
		if (logRes != null) {
			layRes = izinOnlineService.viewPerizinanOnline(logRes.getAccount());
			gridsattus.setItems(layRes);
		}
	}

	public StatusPT() {
		setSizeFull();
		gridsattus.getElement().setAttribute("style", "font-size: 12px;");
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
			if (data.getPenerimaKanwil() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPenerimaKanwil(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalPenerimaKanwil(), "-"));
			} else {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPenerima(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalPenerima(), "-"));
			}

		} else if (col == 1) {
			if (data.getPemeriksaP2() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaP2(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalPemeriksaP2(), "-"));
			} else if (data.getPemeriksaPerbend() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPerbend(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalPemeriksaPerbend(), "-"));
			} else if (data.getPemeriksaDokumenKanwil() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaDokumenKanwil(), "-")
						+ "</br>" + getNullorWhat(data.getTanggalPemeriksaDokumenKanwil(), "-"));
			} else if (data.getPemeriksaP2Kanwil() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaP2Kanwil(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalPemeriksaP2Kanwil(), "-"));
			} else if (data.getPemeriksaPkcKanwil() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPkcKanwil(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalPemeriksaPkcKanwil(), "-"));
			} else {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPkc(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalPemeriksaPkc(), "-"));
			}
		} else if (col == 2) {
			if (data.getKepSubSeksiP2() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiP2(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalKepSubSeksiP2(), "-"));
			} else if (data.getKepSubSeksiPerbend() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiPerbend(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalKepSubSeksiPerbend(), "-"));
			} else {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiPkc(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalKepSubSeksiPkc(), "-"));
			}
		} else if (col == 3) {
			if (data.getKepSeksiP2() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiP2(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalKepSeksiP2(), "-"));
			} else if (data.getKepSeksiPerbend() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPerbend(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalKepSeksiPerbend(), "-"));
			} else if (data.getKepSeksiIntelijenKanwil() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiIntelijenKanwil(), "-")
						+ "</br>" + getNullorWhat(data.getTanggalKepSeksiIntelijenKanwil(), "-"));
			} else if (data.getKepSeksiPfKanwil() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPfKanwil(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalKepSeksiPfKanwil(), "-"));
			} else if (data.getKepSeksiPkcKanwil() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPkcKanwil(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalKepSeksiPkcKanwil(), "-"));
			} else {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPkc(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalKepSeksiPkc(), "-"));
			}
		} else if (col == 4) {
			if (data.getKepBidangFasilitasKanwil() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepBidangFasilitasKanwil(), "-")
						+ "</br>" + getNullorWhat(data.getTanggalKepBidangFasilitasKanwil(), "-"));
			} else if (data.getKepBidangP2Kanwil() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepBidangP2Kanwil(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalKepBidangP2Kanwil(), "-"));
			} else {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiIntelijenKanwil(), "-")
						+ "</br>" + getNullorWhat(data.getTanggalKepSeksiIntelijenKanwil(), "-"));
			}
		} else {
			if (data.getKepKantorKanwil() != null) {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepKantorKanwil(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalKepKantorKanwil(), "-"));
			} else {
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepKantor(), "-") + "</br>"
						+ getNullorWhat(data.getTanggalKepKantor(), "-"));
			}
		}

		vel.add(span);
		return vel;
	}

	private String getNullorWhat(String text, String change) {
		String hasil = text == null ? change : text;
		return hasil;
	}
}
