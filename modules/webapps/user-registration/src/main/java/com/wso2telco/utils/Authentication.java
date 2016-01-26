package com.wso2telco.utils;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;

import java.util.List;

public class Authentication {

	@XmlAttribute
	private String fallbacklevel;
	private List<Authenticators> authenticatorList;

	public String getFallbackLevel() {
		return fallbacklevel;
	}

	public void setFallbackLevel(String fallbacklevel) {
		this.fallbacklevel = fallbacklevel;
	}

	@XmlElement(name = "Authenticators", nillable = false)
	public List<Authenticators> getAuthenticatorList() {
		return authenticatorList;
	}

	public void setAuthenticatorList(List<Authenticators> authenticatorList) {
		this.authenticatorList = authenticatorList;
	}

}
