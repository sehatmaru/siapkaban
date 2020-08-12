package com.tam.siap.views;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.security.AuthService;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.H6;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.page.Page;
import com.vaadin.flow.component.page.Viewport;
import com.vaadin.flow.component.polymertemplate.Id;
import com.vaadin.flow.component.polymertemplate.PolymerTemplate;
import com.vaadin.flow.dom.Element;
import com.vaadin.flow.router.BeforeEnterEvent;
import com.vaadin.flow.router.BeforeEnterObserver;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.InitialPageSettings;
import com.vaadin.flow.server.PageConfigurator;
import com.vaadin.flow.templatemodel.TemplateModel;

@Route(value = "mainhome")
@Tag("mainhome-page")
@HtmlImport("html/main.html")
@Viewport("width=device-width, minimum-scale=1, initial-scale=1, user-scalable=yes, viewport-fit=cover")
public class HomeMainPage extends PolymerTemplate<TemplateModel> implements PageConfigurator, BeforeEnterObserver {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3136313122260827045L;

	@Autowired
	AuthService authService;

//	@Autowired
//	PicRepository picRepository;

//	@Autowired
//	PicPerusahaanRepository picPerusahaanRepository;
//
//	@Autowired
//	JabatanRepository jabatanRepository;

	@Id("txtnamauser")
	H6 txtnamauser;

	@Id("txtjabatan")
	H6 txtjabatan;

	@Id("txtnip")
	Element txtnip;

	@Id("btnsignout")
	Button btnsignout;
	
	@Id("btnprofil")
	Button btnprofil;

//	@Id("txtbidang")
//	H6 txtbidang;

	@Id("txtemail")
	Element txtemail;
	
	@Id("pnldetailinfo")
	Div pnldetailinfo;

//	@Id("txtdscpbidang")
//	Element txtdscpbidang;
	
	@Id("menuapps")
	Div menuapps;

	@PostConstruct
	private void init() {
		// TODO Auto-generated method stub
		boolean bcuser = false;
		long userid = 0;
		try {
//			bcuser = (boolean) VaadinSession.getCurrent().getAttribute(UserService.BCUSER);
//			if (bcuser) {
//				userid = (long) VaadinSession.getCurrent().getAttribute(UserService.PIC_ID);
				//Optional<Pic> picdata = picRepository.findById(userid);
//				txtnamauser.setText(picdata.get().getNama());
//				txtjabatan.setText(picdata.get().getJabatan().getNama());
//				txtnip.setText(picdata.get().getNipuser());
//				txtbidang.setText(picdata.get().getJabatan().getBidang().getNama());
//				txtemail.setVisible(false);
//				txtnamauser.setText("Arezka May Fajri");
//				txtjabatan.setText("Eselon III");
//				txtnip.setText("1342342");
//				txtbidang.setText("awdawdawd");
//				txtemail.setVisible(false);
//				txtdscpbidang.setText("Unit Kerja");
//				menuapps.getElement().appendChild(elmenu("Perizinan Online", "izinonline", "statuslayananbc"));
//				menuapps.getElement().appendChild(elmenu("Instan", "instan", "instan"));
//				menuapps.getElement().appendChild(elmenu("Survey Kepuasan", "survey", "mainhome"));
//				menuapps.getElement().appendChild(elmenu("Apps Manager", "appsmanager", "mainhome"));
//				menuapps.getElement().appendChild(elmenu("Executive Summary", "executive", "mainhome"));
//				menuapps.getElement().appendChild(elmenu("Ekspor", "ekspor", "mainhome"));
//				menuapps.getElement().appendChild(elmenu("Impor", "impor", "mainhome"));
//				menuapps.getElement().appendChild(elmenu("TPB", "tpb", "tpb"));
//				menuapps.getElement().appendChild(elmenu("KITE", "kte", "mainhome"));
//				menuapps.getElement().appendChild(elmenu("Cukai", "cukai", "mainhome"));
//				menuapps.getElement().appendChild(elmenu("Kawasan Pabean & TPS", "pabean", "mainhome"));
//				menuapps.getElement().appendChild(elmenu("Pengawasan", "dataintel", "pengawasan"));
//			} else {
				//userid = (long) VaadinSession.getCurrent().getAttribute(UserService.USERID);
//				Optional<PicPerusahaan> picdata = picPerusahaanRepository.findById(userid);
				txtnamauser.setText("Tamimi");
				txtjabatan.setText("CTO");
				txtnip.setText("123123123");
//				txtbidang.setText("PT INSAN HIJRAH" + " - "
//						+ "12313212");
				txtemail.setText("adaw@adwdaw.com");
//				txtdscpbidang.setText("Perusahaan");
				menuapps.getElement().appendChild(elmenu("Perizinan Online", "izinonline", "izinonline"));
				menuapps.getElement().appendChild(elmenu("Instan", "instan", "statuslayananpt"));
//			}
		} catch (NullPointerException e) {
			// TODO: handle exception
			bcuser = false;
		}
	}
	
	private Element elmenu(String nama, String icon,String url) {
		Div div = new Div();
		div.getElement().setAttribute("class", "col-md-3 mb-3");
		div.getElement().setAttribute("style", "margin-bottom: 0 !important;");
		Button bt = new Button();
		bt.getElement().setAttribute("class", "btn btn-primary btn-lg btn-block button-menu hvr-buzz btn-"+icon);
		bt.getElement().setAttribute("type", "button");
		bt.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				if(url.equals("mainhome")) {
					Notification notification = new Notification("Under construction", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_CONTRAST);
					notification.open();
				}else {
//					getUI().get().navigate(url);
					UI.getCurrent().getPage().open(url);
					//UI.getCurrent().getPage().executeJs("window.open(http://localhost:8089/"+url+", \"_blank\", \"\");");
				}
			}
		});
		Element img = new Element("img");
		img.setAttribute("src", "./frontend/img/"+icon+".svg");
		img.setAttribute("height", "50");
		bt.getElement().appendChild(img);
		Element p = new Element("p");
		p.setAttribute("class", "label-button");
		p.setText(nama);
		div.add(bt);
		div.getElement().appendChild(p);
		return div.getElement();
	}

	public HomeMainPage() {
		btnsignout.addThemeVariants(ButtonVariant.LUMO_SMALL);
		btnprofil.addThemeVariants(ButtonVariant.LUMO_SMALL);
		btnsignout.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				AuthService.logOut();
			}
		});
		
		btnprofil.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
			
			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				getUI().get().navigate(ProfilPage.class);
			}
		});

//		btnizinonline.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {
//
//			@Override
//			public void onComponentEvent(ClickEvent<Button> event) {
//				// TODO Auto-generated method stub
//				boolean bcuser = (boolean) VaadinSession.getCurrent().getAttribute(UserService.BCUSER);
//				if (bcuser) {
//					getUI().get().navigate(StatusLayananPageBc.class);
//				} else {
//					getUI().get().navigate(IzinOnline.class);
//				}
//			}
//		});
	}
	
	@Override
	public void configurePage(InitialPageSettings settings) {
		// TODO Auto-generated method stub
		settings.addInlineWithContents("body {height: 100vh;width:auto;margin: 0;}",
				InitialPageSettings.WrapMode.STYLESHEET);
	}

	@Override
	public void beforeEnter(BeforeEnterEvent event) {
		// TODO Auto-generated method stub
//		if (authService.isAuthenticated()) {
//
//		} else {
//			event.forwardTo(LoginPage.class);
//		}
	}
}
