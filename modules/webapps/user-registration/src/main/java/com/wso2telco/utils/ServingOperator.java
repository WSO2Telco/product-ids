package com.wso2telco.utils;

import javax.xml.bind.annotation.XmlElement;

public class ServingOperator {

	private String mcc = null;
	private String mnc = null;
	
	@XmlElement(name = "mcc")
	public String getMcc() {
		return mcc;
	}
	
	@XmlElement(name = "mnc")
	public String getMnc() {
		return mnc;
	}
	
	public void setMcc(String mcc) {
		this.mcc = mcc;
	}
	
	public void setMnc(String mnc) {
		this.mnc = mnc;
	}
}
