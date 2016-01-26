package com.axiata.dialog;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.apache.http.entity.StringEntity;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;

import org.apache.http.util.EntityUtils;

import java.io.IOException;

public class SendUSSD {

    private static Log log = LogFactory.getLog(SendUSSD.class);
    //private MobileConnectConfig.USSDConfig ussdConfig;
    private static String CONST_MTINIT = "mtinit";

    protected String sendUSSD(String msisdn, String sessionID, int noOfAttempts,String action) throws IOException {
       // ussdConfig = DataHolder.getInstance().getMobileConnectConfig().getUssdConfig();
        //FileUtil.getApplicationProperty("ussdsend");
        
        USSDRequest req = new USSDRequest();

        OutboundUSSDMessageRequest outboundUSSDMessageRequest = new OutboundUSSDMessageRequest();
        outboundUSSDMessageRequest.setAddress("tel:+" + msisdn);
        outboundUSSDMessageRequest.setShortCode(FileUtil.getApplicationProperty("shortcode"));
        outboundUSSDMessageRequest.setKeyword(FileUtil.getApplicationProperty("keyword"));
        
        if (noOfAttempts == 1){
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("message"));
        }
        else if(noOfAttempts == 2){
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("retry_message"));
        }
        else{
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("error_message"));
        }
        
        outboundUSSDMessageRequest.setClientCorrelator(sessionID);

        ResponseRequest responseRequest = new ResponseRequest();

        responseRequest.setNotifyURL(FileUtil.getApplicationProperty("notifyurl"));
        responseRequest.setCallbackData("");

        outboundUSSDMessageRequest.setResponseRequest(responseRequest);
        
        
        outboundUSSDMessageRequest.setUssdAction(action);

        req.setOutboundUSSDMessageRequest(outboundUSSDMessageRequest);

        Gson gson = new GsonBuilder().serializeNulls().create();
        String reqString = gson.toJson(req);


        String endpoint = FileUtil.getApplicationProperty("ussdsend");
        
        endpoint = endpoint + "/tel:+" + msisdn;

        
        String returnString = postRequest(endpoint, reqString);
        System.out.println("Returned from Backend = " + returnString);
        
        return returnString;
    }

    
    public static String getJsonPayload(String msisdn, String sessionID, int noOfAttempts,String action){
       String  reqString = null;
       
        USSDRequest req = new USSDRequest();

        OutboundUSSDMessageRequest outboundUSSDMessageRequest = new OutboundUSSDMessageRequest();
        outboundUSSDMessageRequest.setAddress("tel:+" + msisdn);
        outboundUSSDMessageRequest.setShortCode(FileUtil.getApplicationProperty("shortcode"));
        outboundUSSDMessageRequest.setKeyword(FileUtil.getApplicationProperty("keyword"));
        
        if (noOfAttempts == 1){
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("message"));
        }
        else if(noOfAttempts == 2){
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("retry_message"));
        }
        else{
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("error_message"));
        }
        
        outboundUSSDMessageRequest.setClientCorrelator(sessionID);

        ResponseRequest responseRequest = new ResponseRequest();

        responseRequest.setNotifyURL(FileUtil.getApplicationProperty("notifyurl"));
        responseRequest.setCallbackData("");

        outboundUSSDMessageRequest.setResponseRequest(responseRequest);
        
        
        outboundUSSDMessageRequest.setUssdAction(action);

        req.setOutboundUSSDMessageRequest(outboundUSSDMessageRequest);

        Gson gson = new GsonBuilder().serializeNulls().create();
        reqString = gson.toJson(req);
       
       
       return reqString;
    }

    public static String getJsonPayload(String msisdn, String sessionID, int noOfAttempts,String action, String ussdSessionID){
        String  reqString = null;

        USSDRequest req = new USSDRequest();

        OutboundUSSDMessageRequest outboundUSSDMessageRequest = new OutboundUSSDMessageRequest();
        outboundUSSDMessageRequest.setAddress("tel:+" + msisdn);
        outboundUSSDMessageRequest.setShortCode(FileUtil.getApplicationProperty("shortcode"));
        outboundUSSDMessageRequest.setKeyword(FileUtil.getApplicationProperty("keyword"));

        if (noOfAttempts == 1){
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("message"));
        }
        else if(noOfAttempts == 2){
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("retry_message"));
        }
        else{
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("error_message"));
        }

        outboundUSSDMessageRequest.setClientCorrelator(sessionID);

        outboundUSSDMessageRequest.setSessionID(ussdSessionID);

        ResponseRequest responseRequest = new ResponseRequest();

        responseRequest.setNotifyURL(FileUtil.getApplicationProperty("notifyurl"));
        responseRequest.setCallbackData("");

        outboundUSSDMessageRequest.setResponseRequest(responseRequest);


        outboundUSSDMessageRequest.setUssdAction(action);

        req.setOutboundUSSDMessageRequest(outboundUSSDMessageRequest);

        Gson gson = new GsonBuilder().serializeNulls().create();
        reqString = gson.toJson(req);


        return reqString;
    }

    public static String getUSSDJsonPayload(String msisdn, String sessionID, int noOfAttempts,String action , String ussdSessionID){
        String  reqString = null;

        USSDRequest req = new USSDRequest();

        OutboundUSSDMessageRequest outboundUSSDMessageRequest = new OutboundUSSDMessageRequest();
        outboundUSSDMessageRequest.setAddress("tel:+" + msisdn);
        outboundUSSDMessageRequest.setShortCode(FileUtil.getApplicationProperty("shortcode"));
        outboundUSSDMessageRequest.setKeyword(FileUtil.getApplicationProperty("keyword"));
        if(ussdSessionID != null){
        outboundUSSDMessageRequest.setSessionID(ussdSessionID);
        }

        if (noOfAttempts < 2){
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("ussd_retry_meesage"));
        }else if (noOfAttempts ==5) {
        	outboundUSSDMessageRequest.setOutboundUSSDMessage("Thank You");
		}else if (noOfAttempts ==9) {
			log.info("Reset PIN request sending....");
        	outboundUSSDMessageRequest.setOutboundUSSDMessage("Please reset your PIN");
		}
        else{
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("ussd_error_message"));
        }

        outboundUSSDMessageRequest.setClientCorrelator(sessionID);

        ResponseRequest responseRequest = new ResponseRequest();

        responseRequest.setNotifyURL(FileUtil.getApplicationProperty("notifyurl"));
        responseRequest.setCallbackData("");

        outboundUSSDMessageRequest.setResponseRequest(responseRequest);


        outboundUSSDMessageRequest.setUssdAction(action);

        req.setOutboundUSSDMessageRequest(outboundUSSDMessageRequest);

        Gson gson = new GsonBuilder().serializeNulls().create();
        reqString = gson.toJson(req);


        return reqString;
    }

    public static String getUSSDJsonPayload(String msisdn, String sessionID, int noOfAttempts,String action ){
        String  reqString = null;

        USSDRequest req = new USSDRequest();

        OutboundUSSDMessageRequest outboundUSSDMessageRequest = new OutboundUSSDMessageRequest();
        outboundUSSDMessageRequest.setAddress("tel:+" + msisdn);
        outboundUSSDMessageRequest.setShortCode(FileUtil.getApplicationProperty("shortcode"));
        outboundUSSDMessageRequest.setKeyword(FileUtil.getApplicationProperty("keyword"));


        if (noOfAttempts < 2){
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("ussd_retry_meesage"));
        }else if (noOfAttempts ==5) {
            outboundUSSDMessageRequest.setOutboundUSSDMessage("Thank You");
        }else{
            outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("ussd_error_message"));
        }

        outboundUSSDMessageRequest.setClientCorrelator(sessionID);

        ResponseRequest responseRequest = new ResponseRequest();

        responseRequest.setNotifyURL(FileUtil.getApplicationProperty("notifyurl"));
        responseRequest.setCallbackData("");

        outboundUSSDMessageRequest.setResponseRequest(responseRequest);


        outboundUSSDMessageRequest.setUssdAction(action);

        req.setOutboundUSSDMessageRequest(outboundUSSDMessageRequest);

        Gson gson = new GsonBuilder().serializeNulls().create();
        reqString = gson.toJson(req);


        return reqString;
    }



    private String postRequest(String url, String requestStr) throws IOException {

        HttpClient client = new DefaultHttpClient();
        HttpPost postRequest = new HttpPost(url);

        postRequest.addHeader("accept", "application/json");
        postRequest.addHeader("Authorization", "Bearer " + FileUtil.getApplicationProperty("accesstoken"));


        StringEntity input = new StringEntity(requestStr);
        input.setContentType("application/json");

        postRequest.setEntity(input);

        HttpResponse response = client.execute(postRequest);

        if ((response.getStatusLine().getStatusCode() != 201)) {
            log.error("Error occured while calling end points - " + response.getStatusLine().getStatusCode() + "-" +
                    response.getStatusLine().getReasonPhrase());
        } else {
            log.info("Success Request");
        }
        String responseStr = null;
        HttpEntity responseEntity = response.getEntity();
        if (responseEntity != null) {
            responseStr = EntityUtils.toString(responseEntity);
        }
        return responseStr;
    }
}
