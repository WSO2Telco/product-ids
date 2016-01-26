package com.wso2telco.utils;

import javax.xml.bind.annotation.XmlElement;

import java.util.List;

public class Authenticators {

	private List<Authenticator> authenticators;

	@XmlElement(name = "Authenicator")
	public List<Authenticator> getAuthenticators() {
		return authenticators;
	}

	public void setAuthenticators(List<Authenticator> authenticators) {
		this.authenticators = authenticators;
	}

}
