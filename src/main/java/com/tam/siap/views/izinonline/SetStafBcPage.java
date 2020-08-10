package com.tam.siap.views.izinonline;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.components.TamCard;
import com.tam.siap.models.Jabatan;
import com.tam.siap.models.Pic;
import com.tam.siap.repos.JabatanRepository;
import com.tam.siap.repos.PicRepository;
import com.tam.siap.utils.UIDGenerator;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.dialog.Dialog;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.router.Route;

@Route(value = "setstafbc", layout = HomePageIzinOnline2.class)
public class SetStafBcPage extends VerticalLayout {

	/**
	 * @author AHMADT
	 */
	private static final long serialVersionUID = -7553805264111526574L;
	private TextField txtnamastafpic = new TextField("Nama");
	private TextField txtnipstafpic = new TextField("Nip");
	private TextField txtusernamestafpic = new TextField("Username");
	private TextField txtpassstafpic = new TextField("Password");
	private ComboBox<Jabatan> comboJabatan = new ComboBox<Jabatan>("Jabatan");
//	private ComboBox<Role> comboRole = new ComboBox<Role>("Role");
	private Button btnsave = new Button("Simpan");
	private Button btndel = new Button("Delete");
	private Button btncancel = new Button("Cancel");
	private Grid<Pic> griddata = new Grid<Pic>();
	private List<Pic> listpic = new ArrayList<Pic>();
	private List<Jabatan> listjabatan = new ArrayList<Jabatan>();
//	private List<Role> listrole = new ArrayList<Role>();
	
	@Autowired
	JabatanRepository jabrepo;
	
	@Autowired
	PicRepository picrepo;
	
//	@Autowired
//	RoleRepository rolerepo;
	
	@PostConstruct
	public void init() {
		listpic =  picrepo.findAll();
		listjabatan = jabrepo.findAll();
//		listrole = rolerepo.findAll();
		griddata.setItems(listpic);
		comboJabatan.setItems(listjabatan);
		comboJabatan.setItemLabelGenerator(Jabatan::getHierarkiJabatan);
//		comboRole.setItems(listrole);
//		comboRole.setItemLabelGenerator(Role::getNama);
	}
	
	public SetStafBcPage() {
		// TODO Auto-generated constructor stub
		setSizeFull();
		griddata.addColumn(Pic::getNama).setHeader("Nama");
		griddata.addColumn(Pic::getNipuser).setHeader("Nip");
		griddata.addColumn(Pic::getUsername).setHeader("Username");
		griddata.addColumn(Pic::getPassword).setHeader("Password");
		griddata.addColumn(data-> data.getJabatan().getNama()).setHeader("Jabatan");
		griddata.addComponentColumn(data->editbtn(data)).setHeader("Action");
		
		TamCard card = new TamCard("PIC Perusahaan");
		HorizontalLayout hl = new HorizontalLayout(Addbtn());
		hl.setSizeUndefined();
		hl.setPadding(true);
		card.addComp(hl);
		
		add(card,griddata);
	}
	
	private Component popupEditor(Pic pic,Dialog d) {
		TamCard card = new TamCard("Input baru Staf BC");
		if(pic == null) {
			card.setTitle("Input baru Staf BC");
			resetField();
		}else {
			card.setTitle("Edit Staf BC");
			txtnamastafpic.setValue(pic.getNama());
			txtnipstafpic.setValue(pic.getNipuser());
			txtusernamestafpic.setValue(pic.getUsername());
			txtpassstafpic.setValue(pic.getPassword());
			comboJabatan.setValue(pic.getJabatan());
		}
		VerticalLayout lay = new VerticalLayout();
		lay.setSizeFull();
		lay.setPadding(true);
		FormLayout fm = new FormLayout();
		fm.add(txtnamastafpic,txtnipstafpic,txtusernamestafpic,txtpassstafpic,comboJabatan);
		lay.add(fm);
		btnsave.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				if(pic!=null) {
//					Optional<Pic> result = picrepo.findById(pic.getId());
//					Pic p = result.orElse(null);
					pic.setNama(txtnamastafpic.getValue());
					pic.setNipuser(txtnipstafpic.getValue());
					pic.setUsername(txtusernamestafpic.getValue());
					pic.setPassword(txtpassstafpic.getValue());
					pic.setJabatanid(comboJabatan.getValue().getId());
					pic.setJenispic(comboJabatan.getValue().getJenisJabatan().getJenispic());
					picrepo.save(pic);
					Notification notification = new Notification("Data telah di simpan", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
					notification.open();
//					if(p!=null) {
//						p.setNama(txtnamastafpic.getValue());
//						p.setNipuser(txtnipstafpic.getValue());
//						p.setUsername(txtusernamestafpic.getValue());
//						p.setPassword(txtpassstafpic.getValue());
//						p.setJabatanid(comboJabatan.getValue().getId());
//						p.setJenispic(comboJabatan.getValue().getJenisJabatan().getJenispic());
//						picrepo.save(p);
//					}else {
//						p = new Pic();
//						p.setId(UIDGenerator.getInstance().getUID());
//						p.setNama(txtnamastafpic.getValue());
//						p.setNipuser(txtnipstafpic.getValue());
//						p.setUsername(txtusernamestafpic.getValue());
//						p.setPassword(txtpassstafpic.getValue());
//						p.setJabatanid(comboJabatan.getValue().getId());
//						p.setJenispic(comboJabatan.getValue().getJenisJabatan().getJenispic());
//						picrepo.save(p);
//						Notification notification = new Notification("Data telah di hapus", 3000, Position.MIDDLE);
//						notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
//						notification.open();
//					}
				}else {
					Pic p = new Pic();
					p.setId(UIDGenerator.getInstance().getUID());
					p.setNama(txtnamastafpic.getValue());
					p.setNipuser(txtnipstafpic.getValue());
					p.setUsername(txtusernamestafpic.getValue());
					p.setPassword(txtpassstafpic.getValue());
					p.setJabatanid(comboJabatan.getValue().getId());
					p.setJenispic(comboJabatan.getValue().getJenisJabatan().getJenispic());
					picrepo.save(p);
					Notification notification = new Notification("Data telah di simpan", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
					notification.open();
				}
				
				d.close();
			}
		});
		btndel.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				System.out.println("id pic : "+pic.getId());
				picrepo.delete(pic);
				d.close();
				Notification notification = new Notification("Data telah di hapus", 3000, Position.MIDDLE);
				notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
				notification.open();
			}
		});
		btncancel.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				d.close();
			}
		});
		HorizontalLayout btnacform = new HorizontalLayout(btnsave,btndel,btncancel);
		btnacform.setSizeUndefined();
		btnacform.setPadding(true);
		card.addComp(lay,btnacform);
		return card;
	}
	
	private Button editbtn(Pic pic) {
		Button btnedit = new Button("Edit");
		btnedit.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				Dialog dialog = new Dialog();
				dialog.add(popupEditor(pic,dialog));
				dialog.open();
			}
		});
		
		return btnedit;
	}
	
	
	public void resetField() {
		txtnamastafpic.setValue("");
		txtnipstafpic.setValue("");
		txtusernamestafpic.setValue("");
		txtpassstafpic.setValue("");
		comboJabatan.setValue(null);
	}
	private Button Addbtn() {
		Button btnadd = new Button("Tambah");
		btnadd.setSizeUndefined();
		btnadd.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				Dialog dialog = new Dialog();
				dialog.add(popupEditor(null,dialog));
				dialog.open();
			}
		});
		
		return btnadd;
	}	
	
}
