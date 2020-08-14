package com.tam.siap.models.request;

import java.util.Map;

public class EmailRequestDto {

	private String from;
	private String to;
	private String subject;
	private String type;
	private Map<String, String> model;

	public EmailRequestDto(String from, String to, String subject, String type, Map<String, String> model) {
		this.from = from;
		this.to = to;
		this.subject = subject;
		this.type = type;
		this.model = model;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Map<String, String> getModel() {
		return model;
	}

	public void setModel(Map<String, String> model) {
		this.model = model;
	}
}