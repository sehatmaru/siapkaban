package com.tam.siap.views;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.models.DPribadi;
import com.tam.siap.models.JIdentitas;
import com.tam.siap.models.JPerusahaan;
import com.tam.siap.models.Role;
import com.tam.siap.services.JenisIdentitasService;
import com.tam.siap.services.JenisPerusahaanService;
import com.tam.siap.services.RegisterService;
import com.tam.siap.services.RoleService;
import com.tam.siap.utils.TamUtils;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.html.Image;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.page.Viewport;
import com.vaadin.flow.component.polymertemplate.Id;
import com.vaadin.flow.component.polymertemplate.PolymerTemplate;
import com.vaadin.flow.component.textfield.PasswordField;
import com.vaadin.flow.component.textfield.TextArea;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.component.upload.Upload;
import com.vaadin.flow.dom.DomEvent;
import com.vaadin.flow.dom.DomEventListener;
import com.vaadin.flow.dom.Element;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.templatemodel.TemplateModel;

@Route(value = "profil", layout = HomePageIzinOnline2.class)
public class ProfilPage extends VerticalLayout {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = -9190409409556559377L;

	@Id("txtjudulapp")
	Element txtjudulapp;

	private TextField txtNama = new TextField();
	private ComboBox<JIdentitas> comboJnsIdentitas = new ComboBox<>();
	private TextField txtNoidentitas = new TextField();
//	private TextField txtJabatan = new TextField();
	private TextField txtHandphone = new TextField();
	private TextField txtEmail = new TextField();
	private PasswordField txtPass = new PasswordField();
	private Upload uploadProfile = new Upload();
	private Image imgprof = new Image("http://localhost:8089/frontend/img/avatar.jpg","");
	private Button btnupdate = new Button("Update");

	@PostConstruct
	private void init() {

	}

	public ProfilPage() {
		// TODO Auto-generated constructor stub
		setSizeFull();
//		setSpacing(false);
		txtNama.setReadOnly(true);
		txtNoidentitas.setReadOnly(true);
		
		txtNama.setValue("Tamimi");
		txtNoidentitas.setValue("123131312");
		txtEmail.setValue("ahmadtamimi62@gmail.com");
		txtPass.setValue("wadwadawd");
		
		txtNama.setWidthFull();
		txtNoidentitas.setWidthFull();
		txtEmail.setWidthFull();
		txtPass.setWidthFull();
		
		imgprof.setHeight("10%");
		imgprof.setWidth("10%");
		btnupdate.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
		
		add(imgprof,TamUtils.setInlinetext(uploadProfile, "Upload image"),TamUtils.setInlinetext(txtNama, "Nama"),TamUtils.setInlinetext(txtNoidentitas, "No. Identitas"),TamUtils.setInlinetext(txtEmail, "Email"),TamUtils.setInlinetext(txtPass, "Password"),btnupdate);
	}
}
