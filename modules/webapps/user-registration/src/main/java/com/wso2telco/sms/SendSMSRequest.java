package com.wso2telco.sms;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "outboundSMSMessageRequest")
public class SendSMSRequest {
    private OutboundSMSMessageRequest outboundSMSMessageRequest;

    public SendSMSRequest() {
    }

    public OutboundSMSMessageRequest getOutboundSMSMessageRequest() {
        return outboundSMSMessageRequest;
    }


    public void setOutboundSMSMessageRequest(OutboundSMSMessageRequest receiptRequest) {
        this.outboundSMSMessageRequest = receiptRequest;
    }
}
