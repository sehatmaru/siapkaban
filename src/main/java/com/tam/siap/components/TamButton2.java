package com.tam.siap.components;

import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.button.Button;

@Tag("button")
public class TamButton2 extends Button {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6178691798640005034L;
	
	public TamButton2(String text) {
		// TODO Auto-generated constructor stub
		getElement().setAttribute("type", "button");
		getElement().setAttribute("class", "login100-form-btn");
		setText(text);
	}

}
