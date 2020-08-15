package com.tam.siap.views.izinonline;

import javax.annotation.PostConstruct;

import com.tam.siap.utils.TamUtils;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.upload.Upload;
import com.vaadin.flow.router.BeforeEvent;
import com.vaadin.flow.router.HasUrlParameter;
import com.vaadin.flow.router.Route;

@Route(value = "uploadpemohon", layout = HomePageIzinOnline2.class)
public class UploadPemohonPage extends VerticalLayout implements HasUrlParameter<String> {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = -1613805910080579932L;

	private Upload uploadFile=new Upload();
	private Button btnSubmit = new Button("Submit");

	@PostConstruct
	public void init() {
		// TODO Auto-generated constructor stub
		
	}

	public UploadPemohonPage() {
		setSizeFull();
		btnSubmit.addThemeVariants(ButtonVariant.LUMO_SUCCESS);
		btnSubmit.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
		add(TamUtils.setInlinetext(uploadFile, "Upload file pemohon"),btnSubmit);
	}

	@Override
	public void setParameter(BeforeEvent event, String parameter) {
		// TODO Auto-generated method stub
		if (parameter == null) {
			event.getUI().getPage().getHistory().back();
		} else {
			
		}
	}
	
	
}
