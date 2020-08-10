package com.tam.siap.components;

import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.button.Button;

@Tag("button")
public class TamButton extends Button {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6178691798640005034L;
	
	public TamButton(String text) {
		// TODO Auto-generated constructor stub
		getElement().setAttribute("type", "button");
		getElement().setAttribute("class", "btn btn-success");
		setText(text);
	}

}
