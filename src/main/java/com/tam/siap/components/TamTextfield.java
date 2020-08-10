package com.tam.siap.components;

import com.vaadin.flow.component.PropertyDescriptor;
import com.vaadin.flow.component.PropertyDescriptors;
import com.vaadin.flow.component.Synchronize;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.textfield.TextField;

@Tag("input")
public class TamTextfield extends TextField {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8997749164429496495L;

	private static PropertyDescriptor<String, String> VALUE = PropertyDescriptors.propertyWithDefault("value", "");

	public TamTextfield(String type, String placeholder) {
		getElement().setAttribute("type", type);
		getElement().setAttribute("class", "form-control");
		getElement().setAttribute("placeholder", placeholder);
	}

	@Synchronize("change")
	public String getValue() {
		return get(VALUE);
	}

	public void setValue(String value) {
		set(VALUE, value);
	}

}