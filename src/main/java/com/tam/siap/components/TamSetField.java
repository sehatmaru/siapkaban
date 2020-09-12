package com.tam.siap.components;

import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.HasComponents;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.dependency.StyleSheet;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.dom.Element;

@Tag("fieldset")
@StyleSheet(value = "css/main.css")
public class TamSetField extends Component implements HasComponents  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4430597047276639622L;
	
	VerticalLayout vlay = new VerticalLayout();
	//Element elfieldset = new Element("fieldset");
	Element ellegend = new Element("legend");

	public TamSetField(String title) {
		// TODO Auto-generated constructor stub
		//getElement().setAttribute("class", "row");
		getElement().setAttribute("class", "scheduler-border2");
		ellegend.setAttribute("class", "scheduler-border");
		getElement().appendChild(ellegend);
		ellegend.setProperty("innerHTML", title);
		this.add(vlay);
		//getElement().appendChild(elfieldset);		
	}
	
	public void addTamCom(Component... components) {
		vlay.add(components);
	}
	
}
