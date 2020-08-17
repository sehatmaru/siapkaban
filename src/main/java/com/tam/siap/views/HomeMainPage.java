package com.tam.siap.views;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.PostConstruct;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.models.DPribadi;
import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.security.AuthService;
import com.tam.siap.utils.TamUtils;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.H6;
import com.vaadin.flow.component.html.Image;
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
import com.vaadin.flow.server.StreamResource;
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

	@Id("txtemail")
	Element txtemail;

	@Id("pnldetailinfo")
	Div pnldetailinfo;

	@Id("menuapps")
	Div menuapps;
	
	@Id("imgavatar")
	Image imgavatar;

	@PostConstruct
	private void init() {
		// TODO Auto-generated method stub

	}

	private Element elmenu(String nama, String icon, String url) {
		Div div = new Div();
		div.getElement().setAttribute("class", "col-md-3 mb-3");
		div.getElement().setAttribute("style", "margin-bottom: 0 !important;");
		Button bt = new Button();
		bt.getElement().setAttribute("class", "btn btn-primary btn-lg btn-block button-menu hvr-buzz btn-" + icon);
		bt.getElement().setAttribute("type", "button");
		bt.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				if (url.equals("mainhome")) {
					Notification notification = new Notification("Under construction", 3000, Position.MIDDLE);
					notification.addThemeVariants(NotificationVariant.LUMO_CONTRAST);
					notification.open();
				} else {
//					getUI().get().navigate(url);
					UI.getCurrent().getPage().open(url);
					// UI.getCurrent().getPage().executeJs("window.open(http://localhost:8089/"+url+",
					// \"_blank\", \"\");");
				}
			}
		});
		Element img = new Element("img");
		img.setAttribute("src", "./frontend/img/" + icon + ".svg");
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
		LoginResponse datasLogin = TamUtils.getLoginResponse();
		if (datasLogin != null) {
			setImage(datasLogin.getAccount().getPribadi());
			if (datasLogin.getAccount().getRole().getId() != 1) {
				txtnamauser.setText(datasLogin.getAccount().getPribadi().getNama());
				txtjabatan.setText(datasLogin.getAccount().getPribadi().getJabatan());
				txtnip.setText(datasLogin.getAccount().getPribadi().getNomor());
				txtemail.setText(datasLogin.getAccount().getPribadi().getEmail());
				txtemail.setVisible(false);
				menuapps.getElement().appendChild(elmenu("Perizinan Online", "izinonline", "inboxbc"));
				menuapps.getElement().appendChild(elmenu("Instan", "instan", "instan"));
				menuapps.getElement().appendChild(elmenu("Survey Kepuasan", "survey", "mainhome"));
				menuapps.getElement().appendChild(elmenu("Apps Manager", "appsmanager", "adminuserpemohon"));
				menuapps.getElement().appendChild(elmenu("Executive Summary", "executive", "mainhome"));
				menuapps.getElement().appendChild(elmenu("Ekspor", "ekspor", "mainhome"));
				menuapps.getElement().appendChild(elmenu("Impor", "impor", "mainhome"));
				menuapps.getElement().appendChild(elmenu("TPB", "tpb", "tpb"));
				menuapps.getElement().appendChild(elmenu("KITE", "kte", "mainhome"));
				menuapps.getElement().appendChild(elmenu("Cukai", "cukai", "mainhome"));
				menuapps.getElement().appendChild(elmenu("Kawasan Pabean & TPS", "pabean", "mainhome"));
				menuapps.getElement().appendChild(elmenu("Pengawasan", "dataintel", "pengawasan"));
				pnldetailinfo.getElement().setProperty("innerHTML",
						"<center><strong>Unit Kerja</strong></center>\r\n<small style=\"font-size: 0.7rem;\" class=\"text-muted\">Eselon II :\r\n"
								+ "								</small>\r\n"
								+ "							<h6 style=\"font-size: 12px;\" class=\"my-0\">Kantor Wilayah DJBC Banten\r\n"
								+ "								</h6>\r\n" + "\r\n"
								+ "							<small style=\"font-size: 0.7rem;\" class=\"text-muted\">Eselon III :</small>\r\n"
								+ "							<h6 style=\"font-size: 12px;\" class=\"my-0\">Kantor Pengawasan dan Pelayanan Bea Cukai TMP A Tangerang</h6>\r\n"
								+ "\r\n"
								+ "							<small style=\"font-size: 0.7rem;\" class=\"text-muted\">Eselon IV :</small>\r\n"
								+ "							<h6 style=\"font-size: 12px;\" class=\"my-0\">Seksi Pelayanan Kepabeanan dan Cukai I</h6></br></br></br></br></br>");
			} else {
				txtnamauser.setText(datasLogin.getAccount().getPribadi().getNama());
				txtjabatan.setText(datasLogin.getAccount().getPribadi().getJabatan());
				txtnip.setText(datasLogin.getAccount().getPribadi().getNomor());
				txtemail.setText(datasLogin.getAccount().getPribadi().getEmail());
				menuapps.getElement().appendChild(elmenu("Perizinan Online", "izinonline", "izinonline"));
				menuapps.getElement().appendChild(elmenu("Instan", "instan", "statuslayananpt"));
				pnldetailinfo.getElement().setProperty("innerHTML",
						"<small style=\"font-size: 0.625rem;\" class=\"text-muted\">Nama\r\n"
								+ "								Perusahaan</small>\r\n"
								+ "							<h6 style=\"font-size: 10px;\" class=\"my-0\">"+datasLogin.getAccount().getPerusahaan().getNama()+"\r\n"
								+ "								</h6>\r\n" + "\r\n"
								+ "							<small style=\"font-size: 0.625rem;\" class=\"text-muted\">NPWP</small>\r\n"
								+ "							<h6 style=\"font-size: 10px;\" class=\"my-0\">"+datasLogin.getAccount().getPerusahaan().getNpwp()+"</h6>\r\n"
								+ "\r\n"
								+ "							<small style=\"font-size: 0.625rem;\" class=\"text-muted\">Alamat</small>\r\n"
								+ "							<h6 style=\"font-size: 10px;\" class=\"my-0\">"+datasLogin.getAccount().getPerusahaan().getAlamat()+"</h6>\r\n"
								+ "\r\n"
								+ "							<small style=\"font-size: 0.625rem;\" class=\"text-muted\">Komoditi Utama</small>\r\n"
								+ "							<h6 style=\"font-size: 10px;\" class=\"my-0\">"+(datasLogin.getAccount().getPerusahaan().getKomoditi()==null?"-":datasLogin.getAccount().getPerusahaan().getKomoditi())+"</h6>\r\n"
								+ "							\r\n"
								+ "							<small style=\"font-size: 0.625rem;\" class=\"text-muted\">Jenis Perusahaan</small>\r\n"
								+ "							<h6 style=\"font-size: 10px;\" class=\"my-0\">"+datasLogin.getAccount().getPerusahaan().getJenis().getKeterangan()+"</h6>\r\n"
								+ "							\r\n"
								+ "							<small style=\"font-size: 0.625rem;\" class=\"text-muted\">Nomor Dokumen Penetapan</small>\r\n"
								+ "							<h6 style=\"font-size: 10px;\" class=\"my-0\">"+(datasLogin.getAccount().getPerusahaan().getNomorSkep()== null?"-":datasLogin.getAccount().getPerusahaan().getNomorSkep())+"</h6>\r\n"
								+ "\r\n"
								+ "							<small style=\"font-size: 0.625rem;\" class=\"text-muted\">Tanggal Izin Penetapan</small>\r\n"
								+ "							<h6 style=\"font-size: 10px;\" class=\"my-0\">"+(datasLogin.getAccount().getPerusahaan().getTanggalSkep()== null ? "-" : datasLogin.getAccount().getPerusahaan().getTanggalSkep())+"</h6>");
			}
		}

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
		if (TamUtils.isAuthenticated()) {

		} else {
			event.forwardTo(LoginPage.class);
		}
	}
	
	private void setImage(DPribadi dpribadi) {
		if(dpribadi.getGambar() == null) {
			imgavatar.setSrc("http://localhost:8089/frontend/img/avatar.jpg");
		}else {
			try {
				File initialFile = new File(dpribadi.getGambar());
				InputStream in = new FileInputStream(initialFile);
				byte[] imageBytes = IOUtils.toByteArray(in);
				StreamResource resource = new StreamResource(dpribadi.getId() + ".jpg",
						() -> new ByteArrayInputStream(imageBytes));
				imgavatar.setSrc(resource);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
	}
}
