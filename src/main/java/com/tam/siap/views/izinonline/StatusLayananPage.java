package com.tam.siap.views.izinonline;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.models.Layanan;
import com.tam.siap.models.PicPerusahaan;
import com.tam.siap.repos.LayananRepository;
import com.tam.siap.repos.PicPerusahaanRepository;
import com.tam.siap.security.UserService;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.grid.GridVariant;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.orderedlayout.FlexComponent;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.VaadinSession;

@Route(value = "statuslayananpt", layout = HomePageIzinOnline2.class)
public class StatusLayananPage extends VerticalLayout {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8342023334695591084L;
	Grid<Layanan> gridsattus = new Grid<Layanan>();
	List<Layanan> layanan = new ArrayList<Layanan>();

	@Autowired
	LayananRepository layananRepository;

	@Autowired
	PicPerusahaanRepository picPerusahaanRepository;

	@PostConstruct
	void init() {
		loadData();
		gridsattus.setItems(layanan);
	}

	public void loadData() {
		Object userid = VaadinSession.getCurrent().getAttribute(UserService.USERID);
		if (userid != "null" && userid != "" && userid != null) {
			Optional<PicPerusahaan> picper = picPerusahaanRepository.findByUserid(Long.parseLong(userid.toString()));
			if (picper != null && picper.get() != null) {
				PicPerusahaan picperusahaan = picper.get();
				layanan = layananRepository.findLayananPerusahaan(picperusahaan.getPerusahaanid());
			}
		}
	}

	public StatusLayananPage() {
		// List layanan = layananRepository.findLayananPerusahaan(perusahaanid);
		setSizeFull();
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		// grid header
		gridsattus.addColumn(Layanan::getId).setHeader(setCustomHerader("Nomor")).setWidth("5em");
		gridsattus.addColumn(data -> dateFormat.format(data.getTanggal())).setHeader(setCustomHerader("Tanggal"))
				.setWidth("5em");
		gridsattus.addColumn(Layanan::getNamaperusahaan).setHeader(setCustomHerader("Nama PT")).setWidth("5em");
		gridsattus.addColumn(Layanan::getLbljenisperusahaan).setHeader(setCustomHerader("Jenis Perusahaan"))
				.setWidth("5em");
		gridsattus.addColumn(Layanan::getLbjjenislayanan).setHeader(setCustomHerader("Jenis Layanan")).setWidth("5em");
//		gridsattus.addColumn(Layanan::getLblsubjenislayanan).setHeader(setCustomHerader("Sub Jenis Layanan"))
//				.setWidth("5em");
		gridsattus.addColumn(Layanan::getLbjanjilayanan).setHeader(setCustomHerader("Janji Layanan")).setWidth("5em");
		gridsattus
				.addColumn(data -> data.getPenerimadok() + "\n"
						+ (data.getPenerimadok().length() > 0 ? dateFormat.format(data.getTglpendok()) : ""))
				.setHeader(setCustomHerader("Penerima dokumen")).setWidth("5em");
		gridsattus
				.addColumn(data -> data.getLblpicstaff() + "\n"
						+ (data.getLblpicstaff().length() > 0 ? dateFormat.format(data.getTglstaff()) : ""))
				.setHeader(setCustomHerader("Staf")).setWidth("5em");
		gridsattus
				.addColumn(data -> data.getLblkepalaseksi() + "\n"
						+ (data.getLblkepalaseksi().length() > 0 ? dateFormat.format(data.getTglkplseksi()) : ""))
				.setHeader(setCustomHerader("Kepala Seksi")).setWidth("5em");
		gridsattus
				.addColumn(data -> data.getLblkepalabidang() + "\n"
						+ (data.getLblkepalabidang().length() > 0 ? dateFormat.format(data.getTglkplbidang()) : ""))
				.setHeader(setCustomHerader("Kepala Bidang")).setWidth("5em");
		gridsattus
				.addColumn(data -> data.getLblkepalakantor() + "\n"
						+ (data.getLblkepalakantor().length() > 0 ? dateFormat.format(data.getTglkplkantor()) : ""))
				.setHeader(setCustomHerader("Kepala Kantor")).setWidth("5em");
//		gridsattus.addColumn(Layanan::getKet).setHeader(setCustomHerader("Keterangan")).setWidth("5em");
		// gridsattus.addComponentColumn(item -> createRemoveButton2(gridsattus,
		// item)).setHeader("Actions");
		gridsattus.addThemeVariants(GridVariant.LUMO_ROW_STRIPES);
		gridsattus.addThemeVariants(GridVariant.LUMO_COLUMN_BORDERS);
		gridsattus.addThemeVariants(GridVariant.LUMO_WRAP_CELL_CONTENT);

		gridsattus.setItems(layanan);

//		TamCard card = new TamCard("Status layanan");
//		card.add(gridsattus);
//		card.setSizeFull();
		add(gridsattus);
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
