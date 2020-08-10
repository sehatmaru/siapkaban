package com.tam.siap.components;

import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.dom.Element;

@Tag("div")
public class TamTextfield2 extends TextField {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3358883168832630607L;

	Element inputElement = new Element("input");
	Element spanElement1 = new Element("span");
	Element spanElement2 = new Element("span");
	Element iconElement = new Element("iron-icon");

	public TamTextfield2(String type, String placeholder, String icon) {
		getElement().setAttribute("class", "wrap-input100");
		inputElement.setAttribute("class", "input100");
		inputElement.setAttribute("type", type);
		inputElement.setAttribute("placeholder", placeholder);
		spanElement1.setAttribute("class", "focus-input100");
		spanElement2.setAttribute("class", "symbol-input100");
		iconElement.setAttribute("icon", icon);
		spanElement2.appendChild(iconElement);

		inputElement.addPropertyChangeListener("value", "change", e -> {
			setValue(e.getValue().toString());
		});

		getElement().appendChild(inputElement, spanElement1, spanElement2);
	}

	public String getValue() {
		return inputElement.getProperty("value");
	}

	public void setValue(String value) {
		inputElement.setProperty("value", value);
	}
}