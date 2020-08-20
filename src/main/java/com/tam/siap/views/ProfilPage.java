package com.tam.siap.views;

import static com.tam.siap.utils.refs.Status.SUCCESS;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.PostConstruct;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.codec.multipart.FilePart;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPribadi;
import com.tam.siap.models.JIdentitas;
import com.tam.siap.models.request.EditProfileRequest;
import com.tam.siap.models.responses.LoginResponse;
import com.tam.siap.services.ProfileService;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.utils.TamUtils;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.html.Image;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.polymertemplate.Id;
import com.vaadin.flow.component.textfield.PasswordField;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.component.upload.Upload;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import com.vaadin.flow.dom.Element;
import com.vaadin.flow.router.BeforeEnterEvent;
import com.vaadin.flow.router.BeforeEnterListener;
import com.vaadin.flow.router.BeforeEnterObserver;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.StreamResource;

@Route(value = "profil", layout = HomePageIzinOnline2.class)
public class ProfilPage extends VerticalLayout implements BeforeEnterObserver {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = -9190409409556559377L;

	@Id("txtjudulapp")
	Element txtjudulapp;

	@Autowired
	private Environment env;

	@Autowired
	AccountService accountService;

	@Autowired
	ProfileService profileService;

	private TextField txtNama = new TextField();
	private ComboBox<JIdentitas> comboJnsIdentitas = new ComboBox<>();
	private TextField txtNoidentitas = new TextField();
//	private TextField txtJabatan = new TextField();
	private TextField txtHandphone = new TextField();
	private TextField txtEmail = new TextField();
	private PasswordField txtPass = new PasswordField();
	private Upload uploadProfile = new Upload();
	private Image imgprof = new Image("http://localhost:8089/frontend/img/avatar.jpg", "");
	private Button btnupdate = new Button("Update");
	private MemoryBuffer memoryBuf = new MemoryBuffer();

	@PostConstruct
	private void init() {

	}

	public ProfilPage() {
		// TODO Auto-generated constructor stub
		setSizeFull();
		LoginResponse response = TamUtils.getLoginResponse();
		if (response == null) {
			// getUI().get().navigate(LoginPage.class);
		} else {
//			setSpacing(false);
			txtNama.setReadOnly(true);
			txtNoidentitas.setReadOnly(true);

			txtNama.setValue(response.getAccount().getPribadi().getNama());
			txtNoidentitas.setValue(response.getAccount().getPribadi().getNomor());
			txtEmail.setValue(response.getAccount().getPribadi().getEmail());
			// txtPass.setValue(response.getAccount().getPassword());
			txtPass.setPlaceholder("ketik untuk merubah password saat ini");
//			imgprof.setSrc(env.getProperty("layanan.images.baseurl") + response.getAccount().getPribadi().getGambar());
			setImage(response.getAccount().getPribadi());

			txtNama.setWidthFull();
			txtNoidentitas.setWidthFull();
			txtEmail.setWidthFull();
			txtPass.setWidthFull();

			imgprof.setHeight("10%");
			imgprof.setWidth("10%");
			btnupdate.addThemeVariants(ButtonVariant.LUMO_PRIMARY);

			uploadProfile.setReceiver(memoryBuf);

			add(imgprof, TamUtils.setInlinetext(uploadProfile, "Upload image"), TamUtils.setInlinetext(txtNama, "Nama"),
					TamUtils.setInlinetext(txtNoidentitas, "No. Identitas"), TamUtils.setInlinetext(txtEmail, "Email"),
					TamUtils.setInlinetext(txtPass, "Password"), btnupdate);

			btnupdate.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

				@Override
				public void onComponentEvent(ClickEvent<Button> event) {
					// TODO Auto-generated method stub
					LoginResponse response = TamUtils.getLoginResponse();
					String nama = txtNama.getValue();
					String email = txtEmail.getValue();
					String password = txtPass.getValue().length() <= 0 ? response.getAccount().getPassword()
							: txtPass.getValue();
					String nomor = txtNoidentitas.getValue();
					String username = response.getAccount().getUsername();
					String gambar = response.getAccount().getPribadi().getGambar();
					if (memoryBuf == null || memoryBuf.getFileName() == null) {
						System.out.println("membuff null");
						gambar = response.getAccount().getPribadi().getGambar();
					} else {
						String filename = response.getAccount().getPribadi().getId() + "_" + memoryBuf.getFileName();
						String filaPath = env.getProperty("layanan.images.path");
						try {
							TamUtils.saveImage(memoryBuf, filaPath, filename);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						gambar = filaPath + "\\" + filename;
					}
					EditProfileRequest editProfileRequest = new EditProfileRequest(nama, email, password, gambar, nomor,
							username);

					int hasil = profileService.updateProfile(editProfileRequest);
					if (hasil == SUCCESS) {
						Notification notification = new Notification("Update profil berhasil", 3000, Position.MIDDLE);
						notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
						notification.open();
						
						response.setAccount(accountService.findByUsername(response.getAccount().getUsername()));
						
						getUI().get().navigate(HomeMainPage.class);
					} else {
						Notification notification = new Notification("Update profil tidak berhasil", 3000,
								Position.MIDDLE);
						notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
						notification.open();
					}
				}
			});
		}
	}

	private void refreshData() {
		LoginResponse response = TamUtils.getLoginResponse();
		Account acc = accountService.findByUsername(response.getAccount().getUsername());
		txtNama.setValue(acc.getPribadi().getNama());
		txtNoidentitas.setValue(acc.getPribadi().getNomor());
		txtEmail.setValue(acc.getPribadi().getEmail());
		txtPass.setValue(acc.getPassword());
		setImage(acc.getPribadi());

	}

	private void setImage(DPribadi dpribadi) {
		if (dpribadi.getGambar() == null) {
			imgprof.setSrc("http://localhost:8089/frontend/img/avatar.jpg");
		} else {
			try {
				File initialFile = new File(dpribadi.getGambar());
				InputStream in = new FileInputStream(initialFile);
				byte[] imageBytes = IOUtils.toByteArray(in);
				StreamResource resource = new StreamResource(dpribadi.getId() + ".jpg",
						() -> new ByteArrayInputStream(imageBytes));
				imgprof.setSrc(resource);
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

	@Override
	public void beforeEnter(BeforeEnterEvent event) {
		// TODO Auto-generated method stub

	}

}
