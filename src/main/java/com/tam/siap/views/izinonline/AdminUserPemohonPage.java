package com.tam.siap.views.izinonline;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import com.tam.siap.models.Account;
import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.repos.DPribadiRepository;
import com.tam.siap.security.AuthService;
import com.tam.siap.services.AdminService;
import com.tam.siap.utils.TamUtils;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.grid.GridVariant;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.Route;
import static com.tam.siap.utils.refs.Status.*;

@Route(value = "adminuserpemohon", layout = HomePageIzinOnline2.class)
public class AdminUserPemohonPage extends VerticalLayout {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = -1613805910080579932L;

	@Autowired
	AuthService authService;

	@Autowired
	DPribadiRepository dPribadiRepository;

	@Autowired
	AdminService adminService;

	Grid<Account> gridPemohon = new Grid<>();

	private List<Account> listDataPemohon = new ArrayList<>();

	@PostConstruct
	public void init() {
		// TODO Auto-generated constructor stub
		listDataPemohon = adminService.getUnverifiedAccountList();
		gridPemohon.setItems(listDataPemohon);
	}

	public AdminUserPemohonPage() {
		setSizeFull();
		gridPemohon.addColumn(data -> data.getPerusahaan().getNama())
				.setHeader(TamUtils.setCustomHerader("Nama PT"));
		gridPemohon.addColumn(data -> data.getPerusahaan().getNpwp()).setHeader(TamUtils.setCustomHerader("NPWP"));
		gridPemohon.addColumn(data -> data.getPerusahaan().getAlamat())
				.setHeader(TamUtils.setCustomHerader("Alamat"));
		gridPemohon.addColumn(data -> data.getPerusahaan().getJenis().getKeterangan())
				.setHeader(TamUtils.setCustomHerader("Jenis PT"));
		gridPemohon.addColumn(data -> data.getPribadi().getNama()).setHeader(TamUtils.setCustomHerader("Nama PIC"));
		gridPemohon.addColumn(data -> data.getPribadi().getNomor())
				.setHeader(TamUtils.setCustomHerader("No Identitas"));
		gridPemohon.addComponentColumn(item -> createRemoveButton2(gridPemohon, item))
				.setHeader(TamUtils.setCustomHerader("Proses")).setWidth("6em");
		gridPemohon.addThemeVariants(GridVariant.LUMO_ROW_STRIPES);
		gridPemohon.addThemeVariants(GridVariant.LUMO_COLUMN_BORDERS);
		gridPemohon.addThemeVariants(GridVariant.LUMO_WRAP_CELL_CONTENT);
		add(gridPemohon);
	}

	private HorizontalLayout createRemoveButton2(Grid<Account> grid, Account item) {
		Button btntolak = new Button("Tolak");
		btntolak.addThemeVariants(ButtonVariant.LUMO_ERROR);
		btntolak.addThemeVariants(ButtonVariant.LUMO_SMALL);
		Button btnproses = new Button("Setujui");
		btnproses.addThemeVariants(ButtonVariant.LUMO_SUCCESS);
		btnproses.addThemeVariants(ButtonVariant.LUMO_SMALL);
		HorizontalLayout hl = new HorizontalLayout(btntolak, btnproses);
		hl.setSpacing(true);

		btnproses.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// getUI().get().navigate("detaildatapemohon/" + item.getId());
				int status = adminService.respondAccount(item.getUsername(), 1);
				if (status == SUCCESS) {
					Notification notification = new Notification("Akun telah disetujui", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
					notification.open();
					RefreshData();
				} else {
					Notification notification = new Notification("Terjadi kesalahan", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
					notification.open();
				}
			}
		});

		btntolak.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				int status = adminService.respondAccount(item.getUsername(), 4);
				if (status == SUCCESS) {
					Notification notification = new Notification("Akun telah ditolak", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
					notification.open();
					RefreshData();
				} else {
					Notification notification = new Notification("Terjadi kesalahan", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
					notification.open();
				}
			}
		});

		return hl;
	}
	
	private void RefreshData() {
		listDataPemohon = adminService.getUnverifiedAccountList();
		gridPemohon.setItems(listDataPemohon);
	}

//	private Button createRemoveButton2(Grid<DPerusahaan> grid, DPerusahaan item) {
//		Button btnproses = new Button("Detail");
//		btnproses.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
//
//			@Override
//			public void onComponentEvent(ClickEvent<Button> event) {
//				getUI().get().navigate("detaildatapemohon/"+item.getId());
//			}
//		});
//
//		return btnproses;
//	}

}
