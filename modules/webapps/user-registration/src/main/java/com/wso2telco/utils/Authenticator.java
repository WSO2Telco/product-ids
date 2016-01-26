package com.wso2telco.utils;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlValue;

public class Authenticator {

	private String onfail;
	private String authenticatorName;

	@XmlAttribute
	public String getOnfail() {
		return onfail;
	}

	public void setOnfail(String onfail) {
		this.onfail = onfail;
	}

	@XmlValue
	public String getAuthenticatorName() {
		return authenticatorName;
	}

	public void setAuthenticatorName(String authName) {
		this.authenticatorName = authName;
	}
}