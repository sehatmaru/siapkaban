package com.tam.siap.views;

import javax.annotation.PostConstruct;
import javax.swing.event.DocumentEvent.EventType;

import org.springframework.beans.factory.annotation.Autowired;

//import com.tam.siap.repos.JenisPerusahaanRepository;
import com.tam.siap.security.AuthService;
import com.tam.siap.security.UserService;
import com.vaadin.flow.component.EventData;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.dependency.CssImport;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.page.Viewport;
import com.vaadin.flow.component.polymertemplate.EventHandler;
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

@Tag("homeizin-page")
@HtmlImport("html/homeizinpt.html")
@Viewport("width=device-width, minimum-scale=1, initial-scale=1, user-scalable=yes, viewport-fit=cover")
public class HomePageIzinOnline extends PolymerTemplate<TemplateModel>
		implements RouterLayout, PageConfigurator, BeforeEnterObserver {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3136313122260827045L;

	@Autowired
	AuthService authService;

//	@Autowired
//	JenisPerusahaanRepository jenisPerusahaanRepository;

	@Id("menus")
	Element menus;

	@PostConstruct
	private void init() {
		// TODO Auto-generated method stub
	}

	public HomePageIzinOnline() {
//		menus.setProperty("innerHTML", "<li class=\"nav-item active\">\r\n" + 
//				"                        <a class=\"nav-link\">Home</a>\r\n" + 
//				"                    </li>\r\n" + 
//				"                    <li class=\"nav-item\">\r\n" + 
//				"                        <a class=\"nav-link\" dataku=\"wewe\" on-click=\"clickmenu\">Perijinan</a>\r\n" + 
//				"                    </li>\r\n" + 
//				"                    <li class=\"nav-item\">\r\n" + 
//				"                        <a class=\"nav-link\" >Transaksional</a>\r\n" + 
//				"                    </li>");
		
		
		menus.appendChild(createLink("Home","mainhome",false));
		menus.appendChild(createLink("Perijinan","izinonline",true));
		menus.appendChild(createLink("Status Layanan","izinonlinestatus",false));
		
	}
	
	private Element createLink(String name,String val,boolean aktif) {
		Element link = new Element("li");
		Element a = new Element("a");
		link.setAttribute("class", "nav-item");
		a.setAttribute("class", "nav-link "+(aktif==true?"active":""));
		a.addEventListener("click", new DomEventListener() {
			
			@Override
			public void handleEvent(DomEvent event) {
				// TODO Auto-generated method stub
				//String c = event.getSource().getAttribute("class");
				//System.out.println("Event alt pressed: "+val);
				getUI().get().navigate(val);
			}
		});
		a.setText(name);
		link.appendChild(a);
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
		if (!authService.isAuthenticated()) {
			event.forwardTo(LoginPage.class);
		}else {
			if((boolean)VaadinSession.getCurrent().getAttribute(UserService.BCUSER)) {
				event.forwardTo(LoginPage.class);
			}
		}
	}
}
