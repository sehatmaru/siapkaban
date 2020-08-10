package com.tam.siap.views.izinonline;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.models.JenisPerusahaan;
import com.tam.siap.models.KPPBeaCukai;
import com.tam.siap.models.Perusahaan;
import com.tam.siap.repos.PerusahaanRepository;
import com.tam.siap.repos.PicPerusahaanRepository;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.router.Route;

@Route(value = "setpt", layout = HomePageIzinOnline2.class)
public class SetPTPage extends VerticalLayout {

	/**
	 * @author AHMADT
	 */
	private static final long serialVersionUID = -7553805264111526574L;
	private TextField txtalamat = new TextField("Alamat");
	private TextField txtnamapt = new TextField("Nama PT");
	private TextField txtemailpt = new TextField("Email PT");
	private TextField txtnpwppt = new TextField("NPWP PT");
	
	private ComboBox<KPPBeaCukai> comboKpp = new ComboBox<KPPBeaCukai>("KPP");
	private ComboBox<JenisPerusahaan> comboPT = new ComboBox<JenisPerusahaan>("Jenis Perusahaan");
	private Button btnsave = new Button("Simpan");
	private Button btndel = new Button("Delete");
	private Button btncancel = new Button("Cancel");
	private Grid<Perusahaan> gridpicpt = new Grid<Perusahaan>();
	private List<Perusahaan> listperusahaan = new ArrayList<Perusahaan>();
	private List<KPPBeaCukai> listkpp = new ArrayList<KPPBeaCukai>();
	private List<JenisPerusahaan> listjenisperusahaan = new ArrayList<JenisPerusahaan>();
	
	@Autowired
	PicPerusahaanRepository picperusahaanrepo;
	
	@Autowired
	PerusahaanRepository perusahaanrepo;
	
//	@PostConstruct
//	public void init() {
//		listpicperusahaan =  picperusahaanrepo.findAll();
//		listperusahaan = perusahaanrepo.findAll();
//		gridpicpt.setItems(listpicperusahaan);
//		comboPT.setItems(listperusahaan);
//		comboPT.setItemLabelGenerator(Perusahaan::getNamaperusahaan);
//	}
//	
//	public SetPTPage() {
//		// TODO Auto-generated constructor stub
//		setSizeFull();
//		gridpicpt.addColumn(PicPerusahaan::getNama).setHeader("Nama");
//		gridpicpt.addColumn(PicPerusahaan::getEmail).setHeader("Email");
//		gridpicpt.addColumn(PicPerusahaan::getKtp).setHeader("KTP");
//		gridpicpt.addColumn(PicPerusahaan::getJabatan).setHeader("Jabatan");
//		gridpicpt.addColumn(PicPerusahaan::getHandphone).setHeader("Handphone");
//		gridpicpt.addColumn(PicPerusahaan::getPassword).setHeader("Password");
//		gridpicpt.addColumn(data-> data.getPerusahaan().getNamaperusahaan()).setHeader("Perusahaan");
//		gridpicpt.addComponentColumn(data->editbtn(data)).setHeader("Action");
//		
//		TamCard card = new TamCard("PIC Perusahaan");
//		HorizontalLayout hl = new HorizontalLayout(Addbtn());
//		hl.setSizeUndefined();
//		hl.setPadding(true);
//		card.addComp(hl);
//		
//		add(card,gridpicpt);
//	}
//	
//	private Component popupAddPIC(PicPerusahaan pic,Dialog d) {
//		TamCard card = new TamCard("Input baru PIC Perusahaan");
//		if(pic == null) {
//			card.setTitle("Input baru PIC Perusahaan");
//			resetfield();
//		}else {
//			card.setTitle("Edit PIC Perusahaan");
//			txtnamapicpt.setValue(pic.getNama());
//			txtemailpicpt.setValue(pic.getEmail());
//			txtktppicpt.setValue(pic.getKtp());
//			txtjabatanpicpt.setValue(pic.getJabatan());
//			txthandphonepicpt.setValue(pic.getHandphone());
//			txtpasswordpicpt.setValue(pic.getPassword());
//			comboPT.setValue(pic.getPerusahaan());
//		}
//		VerticalLayout lay = new VerticalLayout();
//		lay.setSizeFull();
//		lay.setPadding(true);
//		FormLayout fm = new FormLayout();
//		fm.add(txtnamapicpt,txtemailpicpt,txtktppicpt,txtjabatanpicpt,txthandphonepicpt,txtpasswordpicpt,comboPT);
//		lay.add(fm);
//		btnsave.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
//			
//			@Override
//			public void onComponentEvent(ClickEvent<Button> event) {
//				if(pic==null) {
//					PicPerusahaan p = new PicPerusahaan(txtnamapicpt.getValue(), txtjabatanpicpt.getValue(), txtemailpicpt.getValue(), txthandphonepicpt.getValue(), txtktppicpt.getValue()
//							, comboPT.getValue().getId(), txtpasswordpicpt.getValue());
//					picperusahaanrepo.save(p);
//				}else {
//					Optional<PicPerusahaan> result = picperusahaanrepo.findById(pic.getId());
//					PicPerusahaan p =  result.orElse(null);
//					if(p!=null) {
//						p.setNama(txtnamapicpt.getValue());
//						p.setJabatan(txtjabatanpicpt.getValue());
//						p.setEmail(txtemailpicpt.getValue());
//						p.setHandphone(txthandphonepicpt.getValue());
//						p.setKtp(txtktppicpt.getValue());
//						p.setPerusahaanid(comboPT.getValue().getId());
//						p.setPassword(txtpasswordpicpt.getValue());
//						picperusahaanrepo.save(p);
//					}else {
//						p = new PicPerusahaan(txtnamapicpt.getValue(), txtjabatanpicpt.getValue(), txtemailpicpt.getValue(), txthandphonepicpt.getValue(), txtktppicpt.getValue()
//								, comboPT.getValue().getId(), txtpasswordpicpt.getValue());
//						picperusahaanrepo.save(p);
//					}
//				}
//				
//				d.close();
//				getUI().get().navigate(SetPTPage.class);	
//			}
//		});
//		btndel.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
//			
//			@Override
//			public void onComponentEvent(ClickEvent<Button> event) {
//				picperusahaanrepo.delete(pic);
//				d.close();
//				getUI().get().navigate(SetPTPage.class);	
//				
//			}
//		});
//		btncancel.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
//			
//			@Override
//			public void onComponentEvent(ClickEvent<Button> event) {
//				// TODO Auto-generated method stub
//				d.close();
//			}
//		});
//		HorizontalLayout btnacform = new HorizontalLayout(btnsave,btndel,btncancel);
//		btnacform.setSizeUndefined();
//		btnacform.setPadding(true);
//		card.addComp(lay,btnacform);
//		return card;
//	}
//	
//	private Button editbtn(PicPerusahaan picPerusahaan) {
//		Button btnedit = new Button("Edit");
//		btnedit.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
//			
//			@Override
//			public void onComponentEvent(ClickEvent<Button> event) {
//				// TODO Auto-generated method stub
//				Dialog dialog = new Dialog();
//				dialog.add(popupAddPIC(picPerusahaan,dialog));
//				dialog.open();
//			}
//		});
//		
//		return btnedit;
//	}
//	
//	
//	private void resetfield() {
//		txtnamapicpt.setValue("");
//		txtemailpicpt.setValue("");
//		txtktppicpt.setValue("");
//		txtjabatanpicpt.setValue("");
//		txthandphonepicpt.setValue("");
//		txtpasswordpicpt.setValue("");
//		comboPT.setValue(null);
//	}
//	private Button Addbtn() {
//		Button btnadd = new Button("Tambah");
//		btnadd.setSizeUndefined();
//		btnadd.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
//			
//			@Override
//			public void onComponentEvent(ClickEvent<Button> event) {
//				// TODO Auto-generated method stub
//				Dialog dialog = new Dialog();
//				dialog.add(popupAddPIC(null,dialog));
//				dialog.open();
//			}
//		});
//		
//		return btnadd;
//	}	
	
}
