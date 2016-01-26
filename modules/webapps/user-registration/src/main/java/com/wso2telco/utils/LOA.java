package com.wso2telco.utils;

import org.wso2.carbon.identity.application.authentication.framework.ApplicationAuthenticator;
import org.wso2.carbon.identity.application.authentication.framework.util.FrameworkUtils;

import javax.xml.bind.annotation.XmlElement;
import java.util.ArrayList;
import java.util.List;

public class LOA {

	private String level;
	private Authentication authentication;

	private List<MIFEAbstractAuthenticator> authenticators = null;

	@XmlElement(name = "Level")
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	@XmlElement(name = "Authentication", nillable = false)
	public Authentication getAuthentication() {
		return authentication;
	}

	public void setAuthentication(Authentication authentication) {
		this.authentication = authentication;
	}

	public void init() {
		authenticators = new ArrayList<MIFEAbstractAuthenticator>();
		List<Authenticators> authenticatorConfigs = authentication.getAuthenticatorList();

		for (Authenticators a : authenticatorConfigs) {
			List<Authenticator> s = a.getAuthenticators();
			for (Authenticator authenticator : s) {
				MIFEAbstractAuthenticator mifeAuth = new MIFEAbstractAuthenticator();
				mifeAuth.setAuthenticator(FrameworkUtils.getAppAuthenticatorByName(authenticator
						.getAuthenticatorName()));
				mifeAuth.setOnFailAction(authenticator.getOnfail());
				authenticators.add(mifeAuth);
			}
		}
	}

	public List<MIFEAbstractAuthenticator> getAuthenticators() {
		return authenticators;
	}

	// Inner type to handle authenticators and respective external attributes
	public class MIFEAbstractAuthenticator {
		private ApplicationAuthenticator authenticator;
		private String onFailAction;

		public ApplicationAuthenticator getAuthenticator() {
			return authenticator;
		}

		public void setAuthenticator(ApplicationAuthenticator authenticator) {
			this.authenticator = authenticator;
		}

		public String getOnFailAction() {
			return onFailAction;
		}

		public void setOnFailAction(String onFailAction) {
			this.onFailAction = onFailAction;
		}
	}

}
