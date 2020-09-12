package com.tam.siap.views.izinonline;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.tam.siap.EmbeddedPdfDocument;
import com.tam.siap.document.DocumentPrinter;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.checkbox.Checkbox;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.grid.GridVariant;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.menubar.MenuBar;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.page.Viewport;
import com.vaadin.flow.component.polymertemplate.Id;
import com.vaadin.flow.component.polymertemplate.PolymerTemplate;
import com.vaadin.flow.component.textfield.TextArea;
import com.vaadin.flow.router.BeforeEvent;
import com.vaadin.flow.router.HasUrlParameter;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.InputStreamFactory;
import com.vaadin.flow.server.StreamResource;
import com.vaadin.flow.templatemodel.TemplateModel;

@Route(value = "testeditor")
@Tag("inboxbcdetail-page")
@HtmlImport("html/teseditor.html")
@Viewport("width=device-width, minimum-scale=1, initial-scale=1, user-scalable=yes, viewport-fit=cover")
public class TestEditor extends PolymerTemplate<TemplateModel> implements HasUrlParameter<String> {

	/**
	 * @author ahmad
	 */
	private static final long serialVersionUID = 7272302887998337493L;

	

	@PostConstruct
	void init() {
//		System.out.println("lay id : "+layananid);
//		dokdatas = dokumenRepo.findDokLayanan(layananid);
//		System.out.println("Data dok : "+dokdatas.size());
//		gridDokumen.setItems(dokdatas);
	}

	public TestEditor() {
		// TODO Auto-generated constructor stub
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
