package com.tam.siap.views;

import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.security.AuthService;
import com.tam.siap.security.UserService;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.html.H6;
import com.vaadin.flow.component.page.Viewport;
import com.vaadin.flow.component.polymertemplate.Id;
import com.vaadin.flow.component.polymertemplate.PolymerTemplate;
import com.vaadin.flow.dom.DomEvent;
import com.vaadin.flow.dom.DomEventListener;
import com.vaadin.flow.dom.Element;
import com.vaadin.flow.router.BeforeEnterEvent;
import com.vaadin.flow.router.BeforeEnterObserver;
import com.vaadin.flow.router.RouterLayout;
import com.vaadin.flow.server.InitialPageSettings;
import com.vaadin.flow.server.PageConfigurator;
import com.vaadin.flow.server.VaadinSession;
import com.vaadin.flow.templatemodel.TemplateModel;

@Tag("homeizin2-page")
@HtmlImport("html/homeizinpt2.html")
@Viewport("width=device-width, minimum-scale=1, initial-scale=1, user-scalable=yes, viewport-fit=cover")
public class HomePageIzinOnline2 extends PolymerTemplate<TemplateModel>
		implements RouterLayout, PageConfigurator, BeforeEnterObserver {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3136313122260827045L;

	@Autowired
	AuthService authService;

//	@Autowired
//	PicRepository picRepository;
//
//	@Autowired
//	PicPerusahaanRepository picPerusahaanRepository;
//
//	@Autowired
//	JabatanRepository jabatanRepository;

	@Id("menus")
	Element menus;

	@Id("txtjudulapp")
	Element txtjudulapp;

	@Id("txtnamauser")
	H6 txtnamauser;

	@Id("txtjabatan")
	H6 txtjabatan;

	@Id("txtnip")
	Element txtnip;

	@Id("btnsignout")
	Button btnsignout;

	@Id("txtemail")
	Element txtemail;

	private boolean adminrole = false;

	@PostConstruct
	private void init() {
		boolean bcuser = false;
		long userid = 0;
		try {
			bcuser = (boolean) VaadinSession.getCurrent().getAttribute(UserService.BCUSER);
			if (bcuser) {
				userid = (long) VaadinSession.getCurrent().getAttribute(UserService.PIC_ID);
//				Optional<Pic> picdata = picRepository.findById(userid);
//				txtnamauser.setText(picdata.get().getNama());
//				txtjabatan.setText(picdata.get().getJabatan().getNama());
//				txtnip.setText(picdata.get().getNipuser());
				txtemail.setVisible(false);
			} else {
				userid = (long) VaadinSession.getCurrent().getAttribute(UserService.USERID);
//				Optional<PicPerusahaan> picdata = picPerusahaanRepository.findById(userid);
//				txtnamauser.setText(picdata.get().getNama());
//				txtjabatan.setText(picdata.get().getJabatan());
//				txtnip.setText(picdata.get().getKtp());
//				txtemail.setText(picdata.get().getEmail());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public HomePageIzinOnline2() {

		btnsignout.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				AuthService.logOut();
			}
		});

	}

	private Element createLink(String name, String val, boolean aktif) {
		Element link = new Element("div");
		link.setText(name);
		link.setAttribute("class", "nav-link " + (aktif == true ? "active" : ""));
		link.addEventListener("click", new DomEventListener() {

			@Override
			public void handleEvent(DomEvent event) {
				// TODO Auto-generated method stub
				getUI().get().navigate(val);
			}
		});

		return link;
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
//		event.getLocation().getSubLocation().ifPresent(location -> 
//			System.out.println(location.getSegments()
//		));
		if (!authService.isAuthenticated()) {
			String loc =event.getLocation().getFirstSegment();
			//event.forwardTo(LoginPage.class);
			menus.removeAllChildren();
			if(loc.equals("profil")) {
				txtjudulapp.setText("Profil");
				menus.appendChild(createLink("Home", "mainhome", false));
				menus.appendChild(createLink("Profil", "profil", true));
			}else if (loc.equals("izinonline")) {
				txtjudulapp.setText("Perizinan Online");
				menus.appendChild(createLink("Perizinan", "izinonline", true));
				menus.appendChild(createLink("Status Layanan", "statuslayananpt", false));
			}
		} else {
			String loc =event.getLocation().getFirstSegment();
			if ((boolean) VaadinSession.getCurrent().getAttribute(UserService.BCUSER)) {
				adminrole = (boolean) VaadinSession.getCurrent().getAttribute(UserService.ADMIN_ROLE);
				menus.removeAllChildren();
				if (!adminrole && loc.equals("statuslayananbc")) {
					txtjudulapp.setText("Perizinan Online");
					menus.appendChild(createLink("Home", "mainhome", true));
					menus.appendChild(createLink("Inbox", "statuslayananbc", true));
				}else if (loc.equals("instan")) {
					txtjudulapp.setText("Instan");
					menus.appendChild(createLink("Home", "mainhome", true));
					menus.appendChild(createLink("Instan", "instan", true));
				}else if (loc.equals("statuslayanandetailbc")) {
					txtjudulapp.setText("Detail pemohon");
					menus.appendChild(createLink("Back", "statuslayananbc", true));
				}else if (adminrole && loc.equals("statuslayananbc")) {
					txtjudulapp.setText("(Admin) Perizinan Online");
					menus.appendChild(createLink("Inbox", "statuslayananbc", true));
					menus.appendChild(createLink("PIC Bea Cukai", "setpicbc", false));
					menus.appendChild(createLink("PIC Perusahaan", "setpicpt", false));
					menus.appendChild(createLink("Staf Bea Cukai", "setstafbc", false));
				} else if (adminrole && loc.equals("setpicbc")) {
					txtjudulapp.setText("(Admin) Perizinan Online");
					menus.appendChild(createLink("Inbox", "statuslayananbc", false));
					menus.appendChild(createLink("PIC Bea Cukai", "setpicbc", true));
					menus.appendChild(createLink("PIC Perusahaan", "setpicpt", false));
					menus.appendChild(createLink("Staf Bea Cukai", "setstafbc", false));
				} else if (adminrole && loc.equals("setpicpt")) {
					txtjudulapp.setText("(Admin) Perizinan Online");
					menus.appendChild(createLink("Inbox", "statuslayananbc", false));
					menus.appendChild(createLink("PIC Bea Cukai", "setpicbc", false));
					menus.appendChild(createLink("PIC Perusahaan", "setpicpt", true));
					menus.appendChild(createLink("Staf Bea Cukai", "setstafbc", false));
				} else if (adminrole && loc.equals("setstafbc")) {
					txtjudulapp.setText("(Admin) Perizinan Online");
					menus.appendChild(createLink("Inbox", "statuslayananbc", false));
					menus.appendChild(createLink("PIC Bea Cukai", "setpicbc", false));
					menus.appendChild(createLink("PIC Perusahaan", "setpicpt", false));
					menus.appendChild(createLink("Staf Bea Cukai", "setstafbc", true));
				} else {
					event.forwardTo(LoginPage.class);
				}
			} else {
				menus.removeAllChildren();
				if (loc.equals("izinonline")) {
					txtjudulapp.setText("Perizinan Online");
					menus.appendChild(createLink("Perizinan", "izinonline", true));
					menus.appendChild(createLink("Status Layanan", "statuslayananpt", false));
				} else if (loc.equals("statuslayananpt")) {
					txtjudulapp.setText("Perizinan Online");
					menus.appendChild(createLink("Perizinan", "izinonline", false));
					menus.appendChild(createLink("Status Layanan", "statuslayananpt", true));
				}else if(loc.equals("profil")) {
					txtjudulapp.setText("Profil");
					menus.appendChild(createLink("Home", "mainhome", false));
					menus.appendChild(createLink("Profil", "profil", true));
				} else {
					event.forwardTo(LoginPage.class);
				}
			}
		}
	}
}
