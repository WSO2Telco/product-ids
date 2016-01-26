package com.axiata.dialog;

public class OutboundUSSDMessageRequest {

	private String address = "";
	private String shortCode = "";
	private String keyword = "";
	private String outboundUSSDMessage = "";
	private String clientCorrelator = "";
	private ResponseRequest responseRequest = null;
	private String ussdAction = "";
    private String sessionID  = "";
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getShortCode() {
		return shortCode;
	}
	
	public void setShortCode(String shortCode) {
		this.shortCode = shortCode;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getOutboundUSSDMessage() {
		return outboundUSSDMessage;
	}
	
	public void setOutboundUSSDMessage(String outboundUSSDMessage) {
		this.outboundUSSDMessage = outboundUSSDMessage;
	}
	
	public String getClientCorrelator() {
		return clientCorrelator;
	}
	
	public void setClientCorrelator(String clientCorrelator) {
		this.clientCorrelator = clientCorrelator;
	}
	
	public ResponseRequest getResponseRequest() {
		return responseRequest;
	}
	
	public void setResponseRequest(ResponseRequest responseRequest) {
		this.responseRequest = responseRequest;
	}
	
	public String getUssdAction() {
		return ussdAction;
	}
	
	public void setUssdAction(String ussdAction) {
		this.ussdAction = ussdAction;
	}


    public String getSessionID() {
        return sessionID;
    }

    public void setSessionID(String sessionID) {
        this.sessionID = sessionID;
    }
}
