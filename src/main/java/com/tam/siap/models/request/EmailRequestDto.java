package com.tam.siap.models.request;

import java.util.Map;

public class EmailRequestDto {

	private String from;
	private String to;
	private String subject;
	private int type;
	private String username;
	private Map<String, String> model;

	public EmailRequestDto(String from, String to, String subject, int type, String username, Map<String, String> model) {
		this.from = from;
		this.to = to;
		this.subject = subject;
		this.type = type;
		this.username = username;
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Map<String, String> getModel() {
		return model;
	}

	public void setModel(Map<String, String> model) {
		this.model = model;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}