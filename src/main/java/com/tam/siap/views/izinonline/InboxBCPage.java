package com.tam.siap.views.izinonline;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.models.responses.LayananResponse;
import com.tam.siap.models.responses.LoginResponse;
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

	private Dialog dialog = new Dialog();

	@Autowired
	IzinOnlineService izinOnlineService;

	@Autowired
	LayananRepository layananRepository;

	@PostConstruct
	public void init() {
		// TODO Auto-generated constructor stub
		LoginResponse logRes = TamUtils.getLoginResponse();
		if (logRes != null) {
			layRes = izinOnlineService.viewPerizinanOnline(logRes.getAccount(),logRes.getAccount().getRole());
			gridsattus.setItems(layRes);
		}
	}

	public InboxBCPage() {
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
		gridsattus.addComponentColumn(item -> createRemoveButton2(item)).setHeader(TamUtils.setCustomHerader("Actions"))
				.setWidth("6em");
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
		LoginResponse logRes = TamUtils.getLoginResponse();
		//String layRole = getListLayananFor(logRes.getAccount().getRole(), data);
		if (col == 0) {
			span.getElement().setProperty("innerHTML", getNullorWhat(data.getPenerima(), "-") + "</br>"
					+ getNullorWhat(data.getTanggalPenerima(), "-"));

		} else if (col == 1) {
			span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksa(), "-") + "</br>"
					+ getNullorWhat(data.getTanggalPemeriksa(), "-"));
			// cek role dan status layanan
//			if(data.get) {
//				
//			}
//			if (layRole.equals("pkc")) {
//				if (data.getPemeriksaDokumenKanwil() != null) {
//					span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaDokumenKanwil(), "-")
//							+ "</br>" + getNullorWhat(data.getTanggalPemeriksaDokumenKanwil(), "-"));
//				} else {
//					span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPkc(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalPemeriksaPkc(), "-"));
//				}
//			} else if (layRole.equals("p2")) {
//				if (data.getPemeriksaP2() != null) {
//					span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaP2(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalPemeriksaP2(), "-"));
//				} else if (data.getPemeriksaPerbend() != null) {
//					span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaP2Kanwil(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalPemeriksaP2Kanwil(), "-"));
//				}
//			} else {
//				if (data.getPemeriksaPerbend() != null) {
//					span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPerbend(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalPemeriksaPerbend(), "-"));
//				} else {
//					span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPkc(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalPemeriksaPkc(), "-"));
//				}
//			}
//			if (data.getPemeriksaP2() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaP2(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalPemeriksaP2(), "-"));
//			} else if (data.getPemeriksaPerbend() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPerbend(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalPemeriksaPerbend(), "-"));
//			} else if (data.getPemeriksaDokumenKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaDokumenKanwil(), "-")
//						+ "</br>" + getNullorWhat(data.getTanggalPemeriksaDokumenKanwil(), "-"));
//			} else if (data.getPemeriksaP2Kanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaP2Kanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalPemeriksaP2Kanwil(), "-"));
//			} else if (data.getPemeriksaPkcKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPkcKanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalPemeriksaPkcKanwil(), "-"));
//			} else {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPkc(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalPemeriksaPkc(), "-"));
//			}
		} else if (col == 2) {
//			if (data.getKepSubSeksiP2() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiP2(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSubSeksiP2(), "-"));
//			} else if (data.getKepSubSeksiPerbend() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiPerbend(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSubSeksiPerbend(), "-"));
//			} else {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiPkc(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSubSeksiPkc(), "-"));
//			}
			
			span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksi(), "-") + "</br>"
					+ getNullorWhat(data.getTanggalKepSubSeksi(), "-"));
		} else if (col == 3) {
			span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksi(), "-") + "</br>"
					+ getNullorWhat(data.getTanggalKepSeksi(), "-"));
//			if (data.getKepSeksiP2() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiP2(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSeksiP2(), "-"));
//			} else if (data.getKepSeksiPerbend() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPerbend(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSeksiPerbend(), "-"));
//			} else if (data.getKepSeksiIntelijenKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiIntelijenKanwil(), "-")
//						+ "</br>" + getNullorWhat(data.getTanggalKepSeksiIntelijenKanwil(), "-"));
//			} else if (data.getKepSeksiPfKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPfKanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSeksiPfKanwil(), "-"));
//			} else if (data.getKepSeksiPkcKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPkcKanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSeksiPkcKanwil(), "-"));
//			} else {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPkc(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepSeksiPkc(), "-"));
//			}
		} else if (col == 4) {
//			if (data.getKepBidangFasilitasKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepBidangFasilitasKanwil(), "-")
//						+ "</br>" + getNullorWhat(data.getTanggalKepBidangFasilitasKanwil(), "-"));
//			} else if (data.getKepBidangP2Kanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepBidangP2Kanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepBidangP2Kanwil(), "-"));
//			} else {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiIntelijenKanwil(), "-")
//						+ "</br>" + getNullorWhat(data.getTanggalKepSeksiIntelijenKanwil(), "-"));
//			}
			span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepBidang(), "-") + "</br>"
					+ getNullorWhat(data.getTanggalKepBidang(), "-"));
		} else {
//			if (data.getKepKantorKanwil() != null) {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepKantorKanwil(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepKantorKanwil(), "-"));
//			} else {
//				span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepKantor(), "-") + "</br>"
//						+ getNullorWhat(data.getTanggalKepKantor(), "-"));
//			}
			span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepKantor(), "-") + "</br>"
					+ getNullorWhat(data.getTanggalKepKantor(), "-"));
		}

//		Button btnSeeAll = new Button("Detail");
//		btnSeeAll.getElement().setProperty("style", "font-size:12px;");
//		btnSeeAll.setWidthFull();
//		btnSeeAll.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
//
//			@Override
//			public void onComponentEvent(ClickEvent<Button> event) {
//				// TODO Auto-generated method stub
//				dialog.removeAll();
//				if (col == 0) {
//					Span span = new Span();
//
//					if (data.getPenerimaKanwil() != null) {
//						span.getElement().setProperty("innerHTML", getNullorWhat(data.getPenerimaKanwil(), "-")
//								+ "</br>" + getNullorWhat(data.getTanggalPenerimaKanwil(), "-"));
//					} else {
//						span.getElement().setProperty("innerHTML", getNullorWhat(data.getPenerima(), "-") + "</br>"
//								+ getNullorWhat(data.getTanggalPenerima(), "-"));
//					}
//
//					dialog.add(new H5("Pendok"));
//					dialog.add(span);
//					dialog.open();
//				} else if (col == 1) {
//					Span span = new Span();
//					Span span2 = new Span();
//					Span span3 = new Span();
//					Span span4 = new Span();
//					Span span5 = new Span();
//					Span span6 = new Span();
//
//					span.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaP2(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalPemeriksaP2(), "-"));
//
//					span2.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPerbend(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalPemeriksaPerbend(), "-"));
//
//					span3.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPkc(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalPemeriksaPkc(), "-"));
//					
//					span4.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaDokumenKanwil(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalPemeriksaDokumenKanwil(), "-"));
//					
//					span5.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaP2Kanwil(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalPemeriksaP2Kanwil(), "-"));
//					
//					span6.getElement().setProperty("innerHTML", getNullorWhat(data.getPemeriksaPkcKanwil(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalPemeriksaPkcKanwil(), "-"));
//
//					dialog.add(new H5("P2"));
//					dialog.add(span);
//					dialog.add(new H5("Perbend"));
//					dialog.add(span2);
//					dialog.add(new H5("PKC"));
//					dialog.add(span3);
//					dialog.add(new H5("Pemeriksa Dokumen Kanwil"));
//					dialog.add(span3);
//					dialog.add(new H5("Pemeriksa P2 Kanwil"));
//					dialog.add(span3);
//					dialog.add(new H5("Pemeriksa PKC Kanwil"));
//					dialog.add(span3);
//					dialog.open();
//					// tooltip.setEnabled(!tooltip.isEnabled());
//				} else if (col == 2) {
//					Span span = new Span();
//					Span span2 = new Span();
//					Span span3 = new Span();
//					Span span4 = new Span();
//					Span span5 = new Span();
//					Span span6 = new Span();
//
//					span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiP2(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalKepSubSeksiP2(), "-"));
//
//					span2.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiPerbend(), "-")
//							+ "</br>" + getNullorWhat(data.getTanggalKepSubSeksiPerbend(), "-"));
//
//					span3.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSubSeksiPkc(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalKepSubSeksiPkc(), "-"));
//					
//					
//
//					dialog.add(new H5("P2"));
//					dialog.add(span);
//					dialog.add(new H5("Perbend"));
//					dialog.add(span2);
//					dialog.add(new H5("PKC"));
//					dialog.add(span3);
//					dialog.add(new H5("PKC Kanwil"));
//					dialog.add(span4);
//					
//					dialog.open();
//					// tooltip.setEnabled(!tooltip.isEnabled());
//				} else if (col == 3) {
//					Span span = new Span();
//					Span span2 = new Span();
//					Span span3 = new Span();
//
//					span.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiP2(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalKepSeksiP2(), "-"));
//
//					span2.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPerbend(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalKepSeksiPerbend(), "-"));
//
//					span3.getElement().setProperty("innerHTML", getNullorWhat(data.getKepSeksiPkc(), "-") + "</br>"
//							+ getNullorWhat(data.getTanggalKepSeksiPkc(), "-"));
//
//					dialog.add(new H5("P2"));
//					dialog.add(span);
//					dialog.add(new H5("Perbend"));
//					dialog.add(span2);
//					dialog.add(new H5("PKC"));
//					dialog.add(span3);
//					dialog.open();
//					// tooltip.setEnabled(!tooltip.isEnabled());
//				} else {
//					Span span = new Span();
//					
//					if(data.getKepKantorKanwil() !=null) {
//						span.getElement().setProperty("innerHTML",
//								getNullorWhat(data.getKepKantorKanwil(), "-") + "</br>" + getNullorWhat(data.getTanggalKepKantorKanwil(), "-"));
//					}else {
//						span.getElement().setProperty("innerHTML",
//								getNullorWhat(data.getKepKantor(), "-") + "</br>" + getNullorWhat(data.getTanggalKepKantor(), "-"));	
//					}
//					
//					dialog.add(new H5("Kep. Kantor"));
//					dialog.add(span);
//					dialog.open();
//				}
//
//			}
//		});

		vel.add(span);
//		vel.add(btnSeeAll);
		return vel;
	}

//	private String getListLayananFor(Role role, LayananResponse respoLayanan) {
//		String hasil = "pkc";
//		int id = Integer.parseInt(respoLayanan.getId());
//		Layanan dataLay = layananRepository.findById(id);
//		if (dataLay!=null) {
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

	private String getNullorWhat(String text, String change) {
		String hasil = text == null ? change : text;
		return hasil;
	}
}
