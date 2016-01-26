/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wso2telco.sms;

import com.wso2telco.ReceiptRequest;

import java.util.List;

public class OutboundSMSMessageRequest {
    

    private String clientCorrelator = "";
//    private String callbackData = "";
    private List<String> address;
    private String senderAddress = "";
    private String senderName = "";
    
    private OutboundSMSTextMessage outboundSMSTextMessage;
    private ReceiptRequest receiptRequest;
    
    
    
    public OutboundSMSMessageRequest() {
    }


    public String getClientCorrelator() {
            return clientCorrelator;
    }

    public void setClientCorrelator(String clientCorrelator) {
            this.clientCorrelator = clientCorrelator;
    }
    public String getSenderAddress() {
            return senderAddress;
    }

    public void setSenderAddress(String senderAddress) {
            this.senderAddress = senderAddress;
    }
    /*
    public String getCallbackData() {
            return callbackData;
    }

    public void setCallbackData(String callbackData) {
            this.callbackData = callbackData;
    }
    */
     public List<String> getAddress() {
            return address;
    }

    public void setAddress(List<String> address) {
            this.address = address;
    }
    
    public OutboundSMSTextMessage getOutboundTextMessage() {
            return outboundSMSTextMessage;
    }

    public void setOutboundTextMessage(OutboundSMSTextMessage outboundSMSTextMessage) {
            this.outboundSMSTextMessage = outboundSMSTextMessage;
    }
    
    public ReceiptRequest getReceiptRequest() {
            return receiptRequest;
    }

    public void setReceiptRequest(ReceiptRequest receiptRequest) {
            this.receiptRequest = receiptRequest;
    }
    public String getSenderName() {
            return senderName;
    }

    public void setSenderName(String senderName) {
            this.senderName = senderName;
    }
    
}
