package com.tam.siap.views;

import static com.tam.siap.utils.refs.Status.SUCCESS;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.services.AuthBEService;
import com.tam.siap.utils.TamUtils;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.html.Input;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.page.Viewport;
import com.vaadin.flow.component.polymertemplate.Id;
import com.vaadin.flow.component.polymertemplate.PolymerTemplate;
import com.vaadin.flow.router.BeforeEnterEvent;
import com.vaadin.flow.router.BeforeEnterObserver;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.InitialPageSettings;
import com.vaadin.flow.server.PageConfigurator;
import com.vaadin.flow.templatemodel.TemplateModel;

@Route(value = "")
@Tag("login-page")
@HtmlImport("html/login.html")
@Viewport("width=device-width, minimum-scale=1, initial-scale=1, user-scalable=yes, viewport-fit=cover")
public class LoginPage extends PolymerTemplate<TemplateModel> implements PageConfigurator, BeforeEnterObserver {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3136313122260827045L;

//	@Autowired
//	AuthService authService;
//
//	@Autowired
//	JenisPerusahaanRepository jenisPerusahaanRepository;
	
	@Autowired
	AuthBEService authServices;

	@Id("txtusername")
	private Input txtusername;

	@Id("txtpassword")
	private Input txtpassword;

	@Id("btnsignin")
	private Button btnsignin;

	@PostConstruct
	private void init() {
		// TODO Auto-generated method stub
	}

	public LoginPage() {
		if (UI.getCurrent() != null) {
			UI.getCurrent().getElement().getStyle().set("class", "body-class");
		}

		btnsignin.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

			@Override
			public void onComponentEvent(ClickEvent<Button> event) {
				// TODO Auto-generated method stub
				LoginAction();
//				System.out.println("awdawdaw "+txtusername.getValue());
			}
		});
	}

	private void LoginAction() {
		String usernameval = txtusername.getValue();
		String passwordval = txtpassword.getValue();
		
		LoginResponse response =  authServices.login(usernameval, passwordval);
		if(response.getCode() == SUCCESS) {
			TamUtils.setSession(response);
			Notification notification = new Notification("Selamat datang", 3000, Position.MIDDLE);
			notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
			notification.open();
			getUI().get().navigate(HomeMainPage.class);	
		}else {
			Notification notification = new Notification("Username / password salah", 3000, Position.MIDDLE);
			notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
			notification.open();
		}
		//getUI().get().navigate(HomeMainPage.class);
	}

	@Override
	public void configurePage(InitialPageSettings settings) {
		// TODO Auto-generated method stub
		settings.addInlineWithContents("body {height: 100vh;width:auto;margin: 0;}",
				InitialPageSettings.WrapMode.STYLESHEET);
		settings.addInlineWithContents(
				InitialPageSettings.Position.PREPEND, "window.customElements=window.customElements||{};"
						+ "window.customElements.forcePolyfill=true;" + "window.ShadyDOM={force:true};",
				InitialPageSettings.WrapMode.JAVASCRIPT);
	}

	@Override
	public void beforeEnter(BeforeEnterEvent event) {
		// TODO Auto-generated method stub
//		if (authService.isAuthenticated()) {
//			boolean bcuser = (boolean) VaadinSession.getCurrent().getAttribute(UserService.BCUSER);
//			if (bcuser) {
//				event.forwardTo(StatusLayananPageBc.class);
//			} else {
//				event.forwardTo(PerizinanPage.class);
//			}
//		}
	}
}
