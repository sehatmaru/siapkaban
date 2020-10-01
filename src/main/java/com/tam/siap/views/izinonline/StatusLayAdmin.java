package com.tam.siap.views.izinonline;

import static com.tam.siap.utils.refs.ProgressLayanan.COMPLETE;
import static com.tam.siap.utils.refs.ProgressLayanan.ON_BATCH_1_KANWIL;
import static com.tam.siap.utils.refs.ProgressLayanan.ON_BATCH_1_KPPBC;
import static com.tam.siap.utils.refs.ProgressLayanan.ON_BATCH_2_KANWIL;
import static com.tam.siap.utils.refs.ProgressLayanan.ON_BATCH_2_KPPBC;
import static com.tam.siap.utils.refs.ProgressLayanan.ON_BATCH_3_KANWIL;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.models.responses.PemohonLayananResponse;
import com.tam.siap.repos.LayananRepository;
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
import com.vaadin.flow.component.html.H4;
import com.vaadin.flow.component.html.H5;
import com.vaadin.flow.component.html.Span;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.orderedlayout.FlexComponent.Alignment;
import com.vaadin.flow.router.Route;

@Route(value = "instanadmin", layout = HomePageIzinOnline2.class)
public class StatusLayAdmin extends VerticalLayout {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = -1613805910080579932L;

	private Grid<PemohonLayananResponse> gridsattus = new Grid<PemohonLayananResponse>();
	private List<PemohonLayananResponse> layRes = new ArrayList<>();

	private Dialog dialog = new Dialog();

	@Autowired
	LayananRepository layananRepository;

	@Autowired
	IzinOnlineService izinOnlineService;

	@PostConstruct
	public void init() {
		// TODO Auto-generated constructor stub
		LoginResponse logRes = TamUtils.getLoginResponse();
		if (logRes != null) {
			layRes = izinOnlineService.viewStatusLayanan(logRes.getAccount());
			gridsattus.setItems(layRes);
		}
	}

	public StatusLayAdmin() {
		setSizeFull();
		gridsattus.getElement().setAttribute("style", "font-size: 12px;text-align: center;padding:0;");
		gridsattus.addColumn(PemohonLayananResponse::getNomor).setHeader(TamUtils.setCustomHerader("Nomor"))
				.setWidth("5em");
		//gridsattus.addComponentColumn(data->layCell(11, data)).setHeader(TamUtils.setCustomHerader("Nomor")).setWidth("5em");
		gridsattus.addColumn(data->TamUtils.setFormatDate(data.getTanggalRequest())).setHeader(TamUtils.setCustomHerader("Tanggal"))
				.setWidth("7em");
		gridsattus.addColumn(PemohonLayananResponse::getNamaPerusahaan)
				.setHeader(TamUtils.setCustomHerader("Nama Perusahaan")).setWidth("7em");
		gridsattus.addColumn(data->data.getDataLayanan().getPerusahaan().getKeterangan())
				.setHeader(TamUtils.setCustomHerader("Jenis Perusahaan")).setWidth("7em");
		gridsattus.addColumn(PemohonLayananResponse::getLayanan).setHeader(TamUtils.setCustomHerader("Jenis Layanan"))
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

	private Button createRemoveButton2(PemohonLayananResponse item) {
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

	private VerticalLayout layCell(int col, PemohonLayananResponse data) {
		VerticalLayout vel = new VerticalLayout();
//		vel.setPadding(true);
//		vel.setWidthFull();
		vel.setAlignItems(Alignment.CENTER);
		Span span = new Span();
		// LoginResponse logRes = TamUtils.getLoginResponse();
		// String layRole = getListLayananFor(logRes.getAccount().getRole(), data);
		if (col == 11) {
			vel.setSpacing(false);
			vel.setPadding(false);
			String prog = "<span style='font-size:9px;padding:0;color:#0000ff'>(Siklus 0)</span>";
			if (data.getDataLayanan().getProgress() == ON_BATCH_1_KANWIL) {
				prog = "<span style='font-size:9px;padding:0;color:#0000ff'>(Siklus 0 KANWIL)</span>";
			} else if (data.getDataLayanan().getProgress() == ON_BATCH_1_KPPBC) {
				prog = "<span style='font-size:9px;padding:0;color:#0000ff'>(Siklus 0 KPPBC)</span>";
			} else if (data.getDataLayanan().getProgress() == ON_BATCH_2_KANWIL) {
				prog = "<span style='font-size:9px;padding:0;color:#0000ff'>(Siklus 1 KANWIL)</span>";
			} else if (data.getDataLayanan().getProgress() == ON_BATCH_2_KPPBC) {
				prog = "<span style='font-size:9px;padding:0;color:#0000ff'>(Siklus 1 KPPBC)</span>";
			} else if (data.getDataLayanan().getProgress() == ON_BATCH_3_KANWIL) {
				prog = "<span style='font-size:9px;padding:0;color:#0000ff'>(Siklus 2 KANWIL)</span>";
			} else if (data.getDataLayanan().getProgress() == COMPLETE) {
				prog = "Selesai";
				prog = "<span style='font-size:9px;padding:0;color:#00ff00'>(Selesai)</span>";
			}
			span.getElement().setProperty("innerHTML", getNullorWhat(data.getNomor(), "-") + "</br>"+prog);
		} else if (col == 0) {
			if (data.getPenerimaKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPenerimaKanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalPenerimaKanwil(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalPenerimaKanwil(), "-"));
			} else {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPenerima(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalPenerima(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalPenerima(), "-"));

			}

		} else if (col == 1) {
			if (data.getPemeriksaP2() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaP2(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalPemeriksaP2(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalPemeriksaP2(), "-"));
			} else if (data.getPemeriksaPerbend() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPerbend(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalPemeriksaPerbend(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalPemeriksaPerbend(), "-"));
			} else if (data.getPemeriksaDokumenKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaDokumenKanwil(), "-")
//						+ "</br>" + getNullorWhat(data.getTanggalPemeriksaDokumenKanwil(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalPemeriksaDokumenKanwil(), "-"));
			} else if (data.getPemeriksaP2Kanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaP2Kanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalPemeriksaP2Kanwil(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalPemeriksaP2Kanwil(), "-"));
			} else if (data.getPemeriksaPkcKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPkcKanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalPemeriksaPkcKanwil(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalPemeriksaPkcKanwil(), "-"));
			} else {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPkc(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalPemeriksaPkc(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalPemeriksaPkc(), "-"));
			}
		} else if (col == 2) {
			if (data.getKepSubSeksiP2() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiP2(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSubSeksiP2(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalKepSubSeksiP2(), "-"));
			} else if (data.getKepSubSeksiPerbend() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiPerbend(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSubSeksiPerbend(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalKepSubSeksiPerbend(), "-"));
			} else {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiPkc(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSubSeksiPkc(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalKepSubSeksiPkc(), "-"));
			}
		} else if (col == 3) {
			if (data.getKepSeksiP2() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiP2(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSeksiP2(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalKepSeksiP2(), "-"));
			} else if (data.getKepSeksiPerbend() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPerbend(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSeksiPerbend(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalKepSeksiPerbend(), "-"));
			} else if (data.getKepSeksiIntelijenKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiIntelijenKanwil(), "-")
//						+ "</br>" + getNullorWhat(data.getTanggalKepSeksiIntelijenKanwil(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalKepSeksiIntelijenKanwil(), "-"));
			} else if (data.getKepSeksiPfKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPfKanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSeksiPfKanwil(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalKepSeksiPfKanwil(), "-"));
			} else if (data.getKepSeksiPkcKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPkcKanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSeksiPkcKanwil(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalKepSeksiPkcKanwil(), "-"));
			} else {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPkc(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSeksiPkc(), "-"));
				span.getElement().setProperty("innerHTML",getNullorWhat(data.getTanggalKepSeksiPkc(), "-"));
			}
		} else if (col == 4) {
			if (data.getKepBidangFasilitasKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepBidangFasilitasKanwil(), "-")
//						+ "</br>" + getNullorWhat(data.getTanggalKepBidangFasilitasKanwil(), "-"));
				span.getElement().setProperty("innerHTML",getNullorWhat(data.getTanggalKepBidangFasilitasKanwil(), "-"));
			} else if (data.getKepBidangP2Kanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepBidangP2Kanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepBidangP2Kanwil(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalKepBidangP2Kanwil(), "-"));
			} else {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepBidPkcKanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepBidPkcKanwil(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalKepBidPkcKanwil(), "-"));
			}
		} else {
			if (data.getKepKantorKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepKantorKanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepKantorKanwil(), "-"));
				span.getElement().setProperty("innerHTML",getNullorWhat(data.getTanggalKepKantorKanwil(), "-"));
			} else {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepKantor(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepKantor(), "-"));
				span.getElement().setProperty("innerHTML", getNullorWhat(data.getTanggalKepKantor(), "-"));
			}
		}

		Button btnSeeAll = new Button("Detail");
		btnSeeAll.getElement().setProperty("style", "font-size:12px;width:100%");
//		btnSeeAll.setWidthFull();
		btnSeeAll.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				dialog.removeAll();
//				setHeight("calc(100vh - (2*var(--lumo-space-m)))");
//				setWidth("calc(100vw - (4*var(--lumo-space-m)))");
				dialog.setHeight("calc(70vh - (2*var(--lumo-space-m)))");
				if (col == 0) {
					Span span = new Span();
					Span span2 = new Span();

					span.getElement().setProperty("innerHTML", getNullorWhat(data.getPenerimaKanwil(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalPenerimaKanwil(), "-"));

					span2.getElement().setProperty("innerHTML", getNullorWhat(data.getPenerima(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalPenerima(), "-"));

					dialog.add(new H5("Pendok kanwil"));
					dialog.add(span);
					dialog.add(new H5("Pendok"));
					dialog.add(span2);
					dialog.open();
				} else if (col == 1) {
					Span span = new Span();
					Span span2 = new Span();
					Span span3 = new Span();
					Span span4 = new Span();
					Span span5 = new Span();
					Span span6 = new Span();

					span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaP2(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalPemeriksaP2(), "-"));

					span2.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPerbend(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalPemeriksaPerbend(), "-"));

					span3.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPkc(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalPemeriksaPkc(), "-"));

					span4.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaDokumenKanwil(), "-")
							+ "</br>" + getNullorWhat(data.getTanggalPemeriksaDokumenKanwil(), "-"));

					span5.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaP2Kanwil(), "-")
							+ "</br>" + getNullorWhat(data.getTanggalPemeriksaP2Kanwil(), "-"));

					span6.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPkcKanwil(), "-")
							+ "</br>" + getNullorWhat(data.getTanggalPemeriksaPkcKanwil(), "-"));

					dialog.add(new H4("KPPBC Tangerang"));
					dialog.add(new H5("P2"));
					dialog.add(span);
					dialog.add(new H5("Perbend"));
					dialog.add(span2);
					dialog.add(new H5("PKC"));
					dialog.add(span3);
					dialog.add(new H4("Kanwil DJBC Banten"));
					dialog.add(new H5("Pemeriksa Dokumen Kanwil"));
					dialog.add(span4);
					dialog.add(new H5("Pemeriksa P2 Kanwil"));
					dialog.add(span5);
					dialog.add(new H5("Pemeriksa PKC Kanwil"));
					dialog.add(span6);
					dialog.open();
					// tooltip.setEnabled(!tooltip.isEnabled());
				} else if (col == 2) {
					Span span = new Span();
					Span span2 = new Span();
					Span span3 = new Span();

					span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiP2(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalKepSubSeksiP2(), "-"));

					span2.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiPerbend(), "-")
							+ "</br>" + getNullorWhat(data.getTanggalKepSubSeksiPerbend(), "-"));

					span3.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiPkc(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalKepSubSeksiPkc(), "-"));

					dialog.add(new H5("P2"));
					dialog.add(span);
					dialog.add(new H5("Perbend"));
					dialog.add(span2);
					dialog.add(new H5("PKC"));
					dialog.add(span3);

					dialog.open();
					// tooltip.setEnabled(!tooltip.isEnabled());
				} else if (col == 3) {
					Span span = new Span();
					Span span2 = new Span();
					Span span3 = new Span();
					Span span4 = new Span();
					Span span5 = new Span();
					Span span6 = new Span();

					span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiP2(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalKepSeksiP2(), "-"));

					span2.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPerbend(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalKepSeksiPerbend(), "-"));

					span3.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPkc(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalKepSeksiPkc(), "-"));

					span4.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiIntelijenKanwil(), "-")
							+ "</br>" + getNullorWhat(data.getTanggalKepSeksiIntelijenKanwil(), "-"));

					span5.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPfKanwil(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalKepSeksiPfKanwil(), "-"));

					span6.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPkcKanwil(), "-")
							+ "</br>" + getNullorWhat(data.getTanggalKepSeksiPkcKanwil(), "-"));

					dialog.add(new H4("KPPBC Tangerang"));
					dialog.add(new H5("P2"));
					dialog.add(span);
					dialog.add(new H5("Perbend"));
					dialog.add(span2);
					dialog.add(new H5("PKC"));
					dialog.add(span3);
					dialog.add(new H4("Kanwil DJBC Banten"));
					dialog.add(new H5("Seksi Intelijen"));
					dialog.add(span4);
					dialog.add(new H5("Pf Kanwil"));
					dialog.add(span5);
					dialog.add(new H5("PKC Kanwil"));
					dialog.add(span6);
					dialog.open();
					// tooltip.setEnabled(!tooltip.isEnabled());
				} else if (col == 4) {
					Span span = new Span();
					Span span2 = new Span();
					Span span3 = new Span();
					span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepBidangFasilitasKanwil(), "-")
							+ "</br>" + getNullorWhat(data.getTanggalKepBidangFasilitasKanwil(), "-"));

					span2.getElement().setProperty("innerHTML", getNullorWhat(data.getKepBidangP2Kanwil(), "-")
							+ "</br>" + getNullorWhat(data.getTanggalKepBidangP2Kanwil(), "-"));

					span3.getElement().setProperty("innerHTML", getNullorWhat(data.getKepBidPkcKanwil(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalKepBidPkcKanwil(), "-"));
					dialog.add(new H5("Kepala Bidang Fasilitas"));
					dialog.add(span);
					dialog.add(new H5("Kepala Bidang P2"));
					dialog.add(span2);
					dialog.add(new H5("Kepala Bidang PKC"));
					dialog.add(span3);
					dialog.open();
				} else {
					Span span = new Span();
					Span span2 = new Span();
					span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepKantorKanwil(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalKepKantorKanwil(), "-"));

					span2.getElement().setProperty("innerHTML", getNullorWhat(data.getKepKantor(), "-") + "</br>"
							+ getNullorWhat(data.getTanggalKepKantor(), "-"));

					dialog.add(new H5("Kep. Kantor Kanwil"));
					dialog.add(span);
					dialog.add(new H5("Kep. Kantor"));
					dialog.add(span2);
					dialog.open();
				}

			}
		});
		vel.add(span);
		vel.add(btnSeeAll);
		return vel;
	}

	private String getNullorWhat(String text, String change) {
		String hasil = text == null ? change : text;
		return hasil;
	}

//	private String getListLayananFor(Role role, PemohonLayananResponse respoLayanan) {
//		String hasil = "pkc";
//		int id = Integer.parseInt(respoLayanan.getId());
//		Layanan dataLay = layananRepository.findById(id);
//		if (dataLay != null) {
//			if (dataLay.getProgress() == ON_BATCH_1_KANWIL || dataLay.getProgress() == ON_BATCH_2_KANWIL) {
//				hasil = "pkc";
//			} else {
//				if (role.getId() == KANWIL_KEPALA_BIDANG_P2 || role.getId() == KANWIL_PEMERIKSA_P2
//						|| role.getId() == KEPALA_SEKSI_P2 || role.getId() == KEPALA_SUB_SEKSI_P2
//						|| role.getId() == PEMERIKSA_P2) {
//					hasil = "p2";
//				} else {
//					hasil = "perbend";
//				}
//			}
//		}
//		return hasil;
//	}
}
