package com.tam.siap.views.izinonline;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.components.TamCard;
import com.tam.siap.models.JenisPerusahaan;
import com.tam.siap.models.Perusahaan;
import com.tam.siap.models.Pic;
import com.tam.siap.repos.JenisPerusahaanRepository;
import com.tam.siap.repos.PerusahaanRepository;
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
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.router.Route;

@Route(value = "setpicbc", layout = HomePageIzinOnline2.class)
public class SetPICBcPage extends VerticalLayout {

	/**
	 * @author AHMADT
	 */
	private static final long serialVersionUID = -7553805264111526574L;
	private ComboBox<Pic> comboPIC = new ComboBox<Pic>("PIC Staf");
	private ComboBox<JenisPerusahaan> comboJnsPT = new ComboBox<JenisPerusahaan>("Jenis PT");
	private Button btnsave = new Button("Simpan");
	private Button btndel = new Button("Delete");
	private Button btncancel = new Button("Cancel");
	private Grid<Perusahaan> gridpt = new Grid<Perusahaan>();
	private List<Perusahaan> listperusahaan = new ArrayList<Perusahaan>();
	private List<JenisPerusahaan> listjenispt = new ArrayList<JenisPerusahaan>();
	private List<Pic> listpic = new ArrayList<Pic>();
	private TextField txtnamapt = new TextField("Nama PT");
	private TextField txtnpwp = new TextField("NPWP");
	private TextField txtalamat = new TextField("Alamat");
	
	@Autowired
	PicRepository picRepository;
	
	@Autowired
	PerusahaanRepository perusahaanrepo;
	
	@Autowired
	JenisPerusahaanRepository jenisptrepo;
	
	@PostConstruct
	public void init() {
		listpic =  picRepository.findAll();
		listperusahaan = perusahaanrepo.findAll();
		listjenispt = jenisptrepo.findAll();
		gridpt.setItems(listperusahaan);
		comboJnsPT.setItems(listjenispt);
		comboJnsPT.setItemLabelGenerator(data->data.getCode());
		comboPIC.setItems(listpic);
		comboPIC.setItemLabelGenerator(data-> data.getNama()+" - "+data.getNipuser());
	}
	
	public SetPICBcPage() {
		// TODO Auto-generated constructor stub
		setSizeFull();
		gridpt.addColumn(Perusahaan::getNamaperusahaan).setHeader("Nama");
		gridpt.addColumn(Perusahaan::getNpwpperusahaan).setHeader("NPWP");
		gridpt.addColumn(Perusahaan::getAlamat).setHeader("Alamat");
		gridpt.addColumn(data->data==null? "" : data.getJenisPerusahaan().getCodeDscp()).setHeader("Jenis PT");
		gridpt.addColumn(data->data.getPicStaff()==null ? "" : data.getPicStaff().getNama()).setHeader("PIC Staf BC");
		gridpt.addComponentColumn(data->editbtn(data)).setHeader("Action");
		
		TamCard card = new TamCard("Perusahaan");
		HorizontalLayout hl = new HorizontalLayout(Addbtn());
		hl.setSizeUndefined();
		hl.setPadding(true);
		card.addComp(hl);
		
		add(card,gridpt);
	}
	
	private Component popupAddPT(Perusahaan perusahaan,Dialog d) {
		TamCard card = new TamCard("Input baru Perusahaan");
		if(perusahaan == null) {
			card.setTitle("Input baru PIC Perusahaan");
			resetField();
		}else {
			card.setTitle("Edit PIC Perusahaan");
			txtnamapt.setValue(perusahaan.getNamaperusahaan());
			txtnpwp.setValue(perusahaan.getNpwpperusahaan());
			txtalamat.setValue(perusahaan.getAlamat());
			try {
				Optional<Pic> datapic =  picRepository.findById(perusahaan.getId());
				comboPIC.setValue(datapic.get());
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			comboJnsPT.setValue(perusahaan.getJenisPerusahaan());
		}
		VerticalLayout lay = new VerticalLayout();
		lay.setSizeFull();
		lay.setPadding(true);
		FormLayout fm = new FormLayout();
		fm.add(txtnamapt,txtnpwp,txtalamat,comboJnsPT,comboPIC);
		lay.add(fm);
		btnsave.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				if(perusahaan!=null) {
					Optional<Perusahaan> result = perusahaanrepo.findById(perusahaan.getId());
					Perusahaan p = result.orElse(null);
					if(p!=null) {
						p.setNamaperusahaan(txtnamapt.getValue());
						p.setNpwpperusahaan(txtnpwp.getValue());
						p.setAlamat(txtalamat.getValue());
						p.setJenisperusahaanid(comboJnsPT.getValue().getId());
						p.setPicstafid(comboPIC.getValue().getId());
						perusahaanrepo.save(p);
					}else {
						p = new Perusahaan();
						p.setId(UIDGenerator.getInstance().getUID());
						p.setNamaperusahaan(txtnamapt.getValue());
						p.setNpwpperusahaan(txtnpwp.getValue());
						p.setAlamat(txtalamat.getValue());
						p.setJenisperusahaanid(comboJnsPT.getValue().getId());
						p.setPicstafid(comboPIC.getValue().getId());
						perusahaanrepo.save(p);
					}
				}else {
					Perusahaan p = new Perusahaan();
					p.setId(UIDGenerator.getInstance().getUID());
					p.setNamaperusahaan(txtnamapt.getValue());
					p.setNpwpperusahaan(txtnpwp.getValue());
					p.setAlamat(txtalamat.getValue());
					p.setJenisperusahaanid(comboJnsPT.getValue().getId());
					p.setPicstafid(comboPIC.getValue().getId());
					perusahaanrepo.save(p);
				}
				d.close();
				
			}
		});
		btndel.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				perusahaanrepo.delete(perusahaan);
				
				d.close();
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
	
	private Button editbtn(Perusahaan perusahaan) {
		Button btnedit = new Button("Edit");
		btnedit.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				Dialog dialog = new Dialog();
				dialog.add(popupAddPT(perusahaan,dialog));
				dialog.open();
			}
		});
		
		return btnedit;
	}
	
	
	private void resetField() {
		txtnamapt.setValue("");
		txtnpwp.setValue("");
		txtalamat.setValue("");
		comboJnsPT.setValue(null);
		comboPIC.setValue(null);
	}
	
	private Button Addbtn() {
		Button btnadd = new Button("Tambah");
		btnadd.setSizeUndefined();
		btnadd.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				Dialog dialog = new Dialog();
				dialog.add(popupAddPT(null,dialog));
				dialog.open();
			}
		});
		
		return btnadd;
	}	
	
}
