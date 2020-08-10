package com.tam.siap.components;

import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.H6;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;

@Tag("div")
//@StyleSheet(value = "css/bootstrap.min.css")
public class TamCard extends Div {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4430597047276639622L;
	
	Div divcardheader = new Div();
	Div divcardbody = new Div();
	H6 cardtitle = new H6();
	VerticalLayout vlay = new VerticalLayout();

	public TamCard(String title) {
		// TODO Auto-generated constructor stub
		setSizeFull();
		getElement().setAttribute("class", "card shadow mb-6");
		divcardheader.getElement().setAttribute("class", "card-header");
		divcardbody.getElement().setAttribute("class", "card-body");
		cardtitle.getElement().setAttribute("class", "m-0 font-weight-bold text-primary");
		cardtitle.add(title);
		vlay.setPadding(true);
		vlay.setSizeFull();
		divcardbody.add(vlay);
		divcardheader.add(cardtitle);
		add(divcardheader,divcardbody);
	}
	
	public void addComp(Component... components) {
		vlay.add(components);
	}
	
	public void setTitle(String title) {
		cardtitle.removeAll();
		cardtitle.add(title);
	}
	
}
