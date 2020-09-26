package com.tam.siap.views;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.models.DPribadi;
import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.security.AuthService;
import com.tam.siap.security.UserService;
import com.tam.siap.utils.TamUtils;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.html.H6;
import com.vaadin.flow.component.html.Image;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.page.Page;
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
import com.vaadin.flow.server.StreamResource;
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

	@Id("txttgl")
	Label txttgl;

	@Id("imgavatar")
	Image imgavatar;

	private boolean adminrole = false;

	@PostConstruct
	private void init() {

	}

	public HomePageIzinOnline2() {
		Locale id = new Locale("in", "ID");
		txttgl.setText(new SimpleDateFormat("EEEE, dd MMMM yyyy", id).format(new Date()));
		LoginResponse dataLogin = TamUtils.getLoginResponse();
		if (dataLogin != null) {
			txtemail.setText("" + dataLogin.getAccount().getPribadi().getEmail());
			txtnamauser.setText("" + dataLogin.getAccount().getPribadi().getNama());
			txtjabatan.setText("" + dataLogin.getAccount().getPribadi().getJabatan());
			txtnip.setText("" + dataLogin.getAccount().getPribadi().getNomor());
			setImage(dataLogin.getAccount().getPribadi());
		}
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
				if (name.toLowerCase().equals("back")) {
					Page page = UI.getCurrent().getPage();
					page.getHistory().back();
				} else {
					getUI().get().navigate(val);
				}
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
		String loc = event.getLocation().getFirstSegment();
		menus.removeAllChildren();
		if (!authService.isAuthenticated()) {
			event.forwardTo(LoginPage.class);
		} else {
			LoginResponse dataLogin = TamUtils.getLoginResponse();
			menus.removeAllChildren();
			if (dataLogin.getAccount().getRole().getId() != 1) {
				if (dataLogin.getAccount().getRole().getId() == 2) {
					if (loc.equals("adminuserpemohon")) {
						txtjudulapp.setText("User Pemohon");
						menus.appendChild(createLink("Home", "mainhome", false));
						menus.appendChild(createLink("User Pemohon", "adminuserpemohon", true));
					} else if (loc.equals("profil")) {
						txtjudulapp.setText("Profil");
						menus.appendChild(createLink("Home", "mainhome", false));
						menus.appendChild(createLink("Profil", "profil", true));
					} else if (loc.equals("inboxbc")) {
						txtjudulapp.setText("Perizinan Online");
						menus.appendChild(createLink("Home", "mainhome", false));
						menus.appendChild(createLink("Inbox", "inboxbc", true));
					} else if (loc.equals("inboxbcdetail")) {
						txtjudulapp.setText("Inbox Detail");
						menus.appendChild(createLink("Back", "inboxbc", false));
					} else if (loc.equals("instanadmin")) {
						txtjudulapp.setText("Instan");
						menus.appendChild(createLink("Back", "mainhome", false));
					} else {
						event.forwardTo(LoginPage.class);
					}
				} else {
					if (loc.equals("profil")) {
						txtjudulapp.setText("Profil");
						menus.appendChild(createLink("Home", "mainhome", false));
						menus.appendChild(createLink("Profil", "profil", true));
					} else if (loc.equals("inboxbc")) {
						txtjudulapp.setText("Perizinan Online");
						menus.appendChild(createLink("Home", "mainhome", false));
						menus.appendChild(createLink("Inbox", "inboxbc", true));
					} else if (loc.equals("inboxbcdetail")) {
						txtjudulapp.setText("Inbox Detail");
						menus.appendChild(createLink("Back", "inboxbc", false));
					} else if (loc.equals("instan")) {
						txtjudulapp.setText("Instan");
						menus.appendChild(createLink("Back", "mainhome", false));
					} else {
						event.forwardTo(LoginPage.class);
					}
				}

			} else if (dataLogin.getAccount().getRole().getId() == 1) {
				if (loc.equals("profil")) {
					txtjudulapp.setText("Profil");
					menus.appendChild(createLink("Home", "mainhome", false));
					menus.appendChild(createLink("Profil", "profil", true));
				} else if (loc.equals("izinonline")) {
					txtjudulapp.setText("Perizinan Online");
					menus.appendChild(createLink("Home", "mainhome", false));
					menus.appendChild(createLink("Perizinan", "izinonline", true));
					menus.appendChild(createLink("Status Layanan", "inboxpt", false));
				} else if (loc.equals("inboxpt")) {
					txtjudulapp.setText("Status Layanan");
					menus.appendChild(createLink("Home", "mainhome", false));
					menus.appendChild(createLink("Perizinan", "izinonline", false));
					menus.appendChild(createLink("Status Layanan", "inboxpt", true));
				} else {
					event.forwardTo(LoginPage.class);
				}
			} else {
				event.forwardTo(LoginPage.class);
			}
		}
	}

	private void setImage(DPribadi dpribadi) {
		if (dpribadi.getGambar() == null) {
			imgavatar.setSrc("http://localhost:8089/frontend/img/avatar.jpg");
		} else {
			try {
				File initialFile = new File(dpribadi.getGambar());
				InputStream in = new FileInputStream(initialFile);
				byte[] imageBytes = IOUtils.toByteArray(in);
				StreamResource resource = new StreamResource(dpribadi.getId() + ".jpg",
						() -> new ByteArrayInputStream(imageBytes));
				imgavatar.setSrc(resource);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
			}
		}
	}
}
