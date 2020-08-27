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
import com.vaadin.componentfactory.Tooltip;
import com.vaadin.componentfactory.TooltipAlignment;
import com.vaadin.componentfactory.TooltipPosition;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.grid.GridVariant;
import com.vaadin.flow.component.html.H5;
import com.vaadin.flow.component.html.Span;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.Route;

@Route(value = "inboxbc", layout = HomePageIzinOnline2.class)
public class InboxBCPage extends VerticalLayout {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = -1613805910080579932L;

	private Grid<LayananResponse> gridsattus = new Grid<LayananResponse>();
	private List<LayananResponse> layRes = new ArrayList<>();

	private Tooltip tooltip = new Tooltip();

	@Autowired
	IzinOnlineService izinOnlineService;

	@PostConstruct
	public void init() {
		// TODO Auto-generated constructor stub
		LoginResponse logRes = TamUtils.getLoginResponse();
		if (logRes != null) {
			layRes = izinOnlineService.viewPerizinanOnline(logRes.getAccount().getRole());
			System.out.println("Size : " + layRes.size());
			if (layRes.size() <= 0) {
				layRes = izinOnlineService.viewPerizinanOnline(logRes.getAccount());
				System.out.println("Size 2: " + layRes.size());
			}

			gridsattus.setItems(layRes);
		}
	}

	public InboxBCPage() {
		setSizeFull();
		gridsattus.addColumn(LayananResponse::getNomor).setHeader(TamUtils.setCustomHerader("Nomor")).setWidth("5em");
		gridsattus.addColumn(LayananResponse::getTanggalRequest).setHeader(TamUtils.setCustomHerader("Tanggal"))
				.setWidth("7em");
		gridsattus.addColumn(LayananResponse::getNamaPerusahaan).setHeader(TamUtils.setCustomHerader("Nama PT"))
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
		gridsattus.addComponentColumn(data -> layCell(4, data)).setHeader(TamUtils.setCustomHerader("Kepala Kantor"))
				.setWidth("7em");
		gridsattus.addComponentColumn(item -> createRemoveButton2(item)).setHeader(TamUtils.setCustomHerader("Actions"))
				.setWidth("6em");
		gridsattus.addThemeVariants(GridVariant.LUMO_ROW_STRIPES);
		gridsattus.addThemeVariants(GridVariant.LUMO_COLUMN_BORDERS);
		gridsattus.addThemeVariants(GridVariant.LUMO_WRAP_CELL_CONTENT);

		tooltip.setPosition(TooltipPosition.RIGHT);
		tooltip.setAlignment(TooltipAlignment.LEFT);
		tooltip.setManualMode(true);

		add(gridsattus);
	}

	private Button createRemoveButton2(LayananResponse item) {
		Button btnproses = new Button("Proses");

		btnproses.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				getUI().get().navigate("inboxbcdetail/" + item.getLayanan());
			}
		});

		return btnproses;
	}

	private VerticalLayout layCell(int col, LayananResponse data) {
		VerticalLayout vel = new VerticalLayout();
		Span span = new Span();
		if (col == 0) {
			span.getElement().setProperty("innerHTML", data.getPenerima() + "</br>" + data.getTanggalPenerima());
		} else if (col == 1) {
			if (data.getPemeriksaP2() != null || !data.getPemeriksaP2().isEmpty()) {
				span.getElement().setProperty("innerHTML",
						data.getPemeriksaP2() + "</br>" + data.getTanggalPemeriksaP2());
			} else if (data.getPemeriksaPerbend() != null || !data.getPemeriksaPerbend().isEmpty()) {
				span.getElement().setProperty("innerHTML",
						data.getPemeriksaPerbend() + "</br>" + data.getTanggalPemeriksaPerbend());
			} else {
				span.getElement().setProperty("innerHTML",
						data.getPemeriksaPkc() + "</br>" + data.getTanggalPemeriksaPkc());
			}
		} else if (col == 2) {
			if (data.getKepSubSeksiP2() != null || !data.getKepSubSeksiP2().isEmpty()) {
				span.getElement().setProperty("innerHTML",
						data.getKepSubSeksiP2() + "</br>" + data.getTanggalKepSubSeksiP2());
			} else if (data.getKepSubSeksiPerbend() != null || !data.getKepSubSeksiPerbend().isEmpty()) {
				span.getElement().setProperty("innerHTML",
						data.getKepSubSeksiPerbend() + "</br>" + data.getTanggalKepSubSeksiPerbend());
			} else {
				span.getElement().setProperty("innerHTML",
						data.getKepSubSeksiPkc() + "</br>" + data.getTanggalKepSubSeksiPkc());
			}
		} else if (col == 3) {
			if (data.getKepSeksiP2() != null || !data.getKepSeksiP2().isEmpty()) {
				span.getElement().setProperty("innerHTML",
						data.getKepSeksiP2() + "</br>" + data.getTanggalKepSeksiP2());
			} else if (data.getKepSeksiPerbend() != null || !data.getKepSeksiPerbend().isEmpty()) {
				span.getElement().setProperty("innerHTML",
						data.getKepSeksiPerbend() + "</br>" + data.getTanggalKepSeksiPerbend());
			} else {
				span.getElement().setProperty("innerHTML",
						data.getKepSeksiPkc() + "</br>" + data.getTanggalKepSeksiPkc());
			}
		} else {
			span.getElement().setProperty("innerHTML", data.getKepKantor() + "</br>" + data.getTanggalKepKantor());
		}

		Button btnSeeAll = new Button("Detail");
		btnSeeAll.setWidthFull();
		btnSeeAll.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				tooltip.removeAll();
				if (col == 0) {
					Span span = new Span();
					span.getElement().setProperty("innerHTML",
							data.getPenerima() + "</br>" + data.getTanggalPenerima());
					tooltip.add(new H5("History"));
					tooltip.add(span);
					tooltip.open();
					// tooltip.setEnabled(!tooltip.isEnabled());
				} else if (col == 1) {
					Span span = new Span();
					Span span2 = new Span();
					Span span3 = new Span();
					span.getElement().setProperty("innerHTML",
							data.getPemeriksaP2() + "</br>" + data.getTanggalPemeriksaP2());
					span2.getElement().setProperty("innerHTML",
							data.getPemeriksaPerbend() + "</br>" + data.getTanggalPemeriksaPerbend());
					span3.getElement().setProperty("innerHTML",
							data.getPemeriksaPkc() + "</br>" + data.getTanggalPemeriksaPkc());
					tooltip.add(new H5("P2"));
					tooltip.add(span);
					tooltip.add(new H5("Perbend"));
					tooltip.add(span2);
					tooltip.add(new H5("PKC"));
					tooltip.add(span3);
					tooltip.open();
					// tooltip.setEnabled(!tooltip.isEnabled());
				} else if (col == 2) {
					Span span = new Span();
					Span span2 = new Span();
					Span span3 = new Span();

					span.getElement().setProperty("innerHTML",
							data.getKepSubSeksiP2() + "</br>" + data.getTanggalKepSubSeksiP2());
					span2.getElement().setProperty("innerHTML",
							data.getKepSubSeksiPerbend() + "</br>" + data.getTanggalKepSubSeksiPerbend());
					span3.getElement().setProperty("innerHTML",
							data.getKepSubSeksiPkc() + "</br>" + data.getTanggalKepSubSeksiPkc());

					tooltip.add(new H5("P2"));
					tooltip.add(span);
					tooltip.add(new H5("Perbend"));
					tooltip.add(span2);
					tooltip.add(new H5("PKC"));
					tooltip.add(span3);
					tooltip.open();
					// tooltip.setEnabled(!tooltip.isEnabled());
				} else if (col == 3) {
					Span span = new Span();
					Span span2 = new Span();
					Span span3 = new Span();

					span.getElement().setProperty("innerHTML",
							data.getKepSeksiP2() + "</br>" + data.getTanggalKepSeksiP2());

					span2.getElement().setProperty("innerHTML",
							data.getKepSeksiPerbend() + "</br>" + data.getTanggalKepSeksiPerbend());

					span3.getElement().setProperty("innerHTML",
							data.getKepSeksiPkc() + "</br>" + data.getTanggalKepSeksiPkc());

					tooltip.add(new H5("P2"));
					tooltip.add(span);
					tooltip.add(new H5("Perbend"));
					tooltip.add(span2);
					tooltip.add(new H5("PKC"));
					tooltip.add(span3);
					tooltip.open();
					// tooltip.setEnabled(!tooltip.isEnabled());
				} else {
					Span span = new Span();
					span.getElement().setProperty("innerHTML",
							data.getKepKantor() + "</br>" + data.getTanggalKepKantor());
					tooltip.add(new H5("History"));
					tooltip.add(span);
					tooltip.open();
				}

			}
		});

		vel.add(span);
		vel.add(btnSeeAll);
		return vel;
	}
}
