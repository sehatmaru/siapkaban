package com.tam.siap.components;

import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.html.Label;

@Tag("label")
public class TamLabel extends Label {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6178691798640005034L;
	
	public TamLabel(String text) {
		// TODO Auto-generated constructor stub
		getElement().setAttribute("type", "label");
		getElement().setAttribute("class", "label label-primary text-left");
		setText(text);
	}

}
