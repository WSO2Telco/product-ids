package com.wso2telco;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

public class SendUSSD {

    private static Log log = LogFactory.getLog(SendUSSD.class);
    //private MobileConnectConfig.USSDConfig ussdConfig;
    private static String CONST_MTINIT = "mtinit";

    protected String sendUSSD(String msisdn, String sessionID, int noOfAttempts,String action, String operator) throws IOException {
       // ussdConfig = DataHolder.getInstance().getMobileConnectConfig().getUssdConfig();
        //FileUtil.getApplicationPropery("ussdsend");
        
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

        log.info("USSD request -->" + reqString);
        String returnString = postRequest(endpoint, reqString, operator);
        log.info("Returned from Backend = " + returnString);
        
        return returnString;
    }

    protected String sendUSSDPush(String msisdn, String sessionID, String action, String operator) throws IOException {
        // ussdConfig = DataHolder.getInstance().getMobileConnectConfig().getUssdConfig();
    	log.info("USSD Push request with tel:"+msisdn);
         
         USSDRequest req = new USSDRequest();

         OutboundUSSDMessageRequest outboundUSSDMessageRequest = new OutboundUSSDMessageRequest();
         outboundUSSDMessageRequest.setAddress("tel:+" + msisdn);
         outboundUSSDMessageRequest.setShortCode(FileUtil.getApplicationProperty("shortcode"));
         outboundUSSDMessageRequest.setKeyword(FileUtil.getApplicationProperty("keyword"));         
         outboundUSSDMessageRequest.setClientCorrelator(sessionID);    
         outboundUSSDMessageRequest.setOutboundUSSDMessage(FileUtil.getApplicationProperty("ussdPushMessage")+"\n1. OK\n2. Cancel");
         

         ResponseRequest responseRequest = new ResponseRequest();

         responseRequest.setNotifyURL(FileUtil.getApplicationProperty("ussdPushNotifyUrl"));
         responseRequest.setCallbackData("");

         outboundUSSDMessageRequest.setResponseRequest(responseRequest);
         
         
         outboundUSSDMessageRequest.setUssdAction(action);

         req.setOutboundUSSDMessageRequest(outboundUSSDMessageRequest);

         Gson gson = new GsonBuilder().serializeNulls().create();
         String reqString = gson.toJson(req);


         String endpoint = FileUtil.getApplicationProperty("ussdsend");
         
         endpoint = endpoint + "/tel:+" + msisdn;

         log.info("USSD Push request -->" + reqString);
         String returnString = postRequest(endpoint, reqString, operator);
         log.info("Returned from Backend = " + returnString);
         
         return returnString;
     }
    
    protected String sendUSSD(String msisdn, String sessionID, int noOfAttempts,String action, String ussdSessionID, boolean isResend, String operator) throws IOException {
        // ussdConfig = DataHolder.getInstance().getMobileConnectConfig().getUssdConfig();
        //FileUtil.getApplicationPropery("ussdsend");

        USSDRequest req = new USSDRequest();

        OutboundUSSDMessageRequest outboundUSSDMessageRequest = new OutboundUSSDMessageRequest();
        outboundUSSDMessageRequest.setAddress("tel:+" + msisdn);
        outboundUSSDMessageRequest.setShortCode(FileUtil.getApplicationProperty("shortcode"));
        outboundUSSDMessageRequest.setKeyword(FileUtil.getApplicationProperty("keyword"));
        outboundUSSDMessageRequest.setSessionID(ussdSessionID);

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


        String returnString = postRequest(endpoint, reqString, operator);
        System.out.println("Returned from Backend = " + returnString);

        return returnString;
    }

    private static USSDRequest setOutboundUSSDMessageRequest(String msisdn, String sessionID, String action, String notifyUrl, String message, String ussdSessionID) {
        USSDRequest req = new USSDRequest();

        OutboundUSSDMessageRequest outboundUSSDMessageRequest = new OutboundUSSDMessageRequest();
        outboundUSSDMessageRequest.setAddress("tel:+" + msisdn);
        outboundUSSDMessageRequest.setShortCode(FileUtil.getApplicationProperty("shortcode"));
        outboundUSSDMessageRequest.setKeyword(FileUtil.getApplicationProperty("keyword"));
        outboundUSSDMessageRequest.setSessionID(ussdSessionID);
        
        outboundUSSDMessageRequest.setOutboundUSSDMessage(message);
        
        outboundUSSDMessageRequest.setClientCorrelator(sessionID);

        ResponseRequest responseRequest = new ResponseRequest();

        responseRequest.setNotifyURL(notifyUrl);//FileUtil.getApplicationProperty("notifyurl")
        responseRequest.setCallbackData("");

        outboundUSSDMessageRequest.setResponseRequest(responseRequest);
        
        
        outboundUSSDMessageRequest.setUssdAction(action);
        req.setOutboundUSSDMessageRequest(outboundUSSDMessageRequest);
        return req;
    }

    private static USSDRequest setOutboundUSSDMessageRequest(String msisdn, String sessionID, String action, String notifyUrl, String message) {
        USSDRequest req = new USSDRequest();

        OutboundUSSDMessageRequest outboundUSSDMessageRequest = new OutboundUSSDMessageRequest();
        outboundUSSDMessageRequest.setAddress("tel:+" + msisdn);
        outboundUSSDMessageRequest.setShortCode(FileUtil.getApplicationProperty("shortcode"));
        outboundUSSDMessageRequest.setKeyword(FileUtil.getApplicationProperty("keyword"));

        outboundUSSDMessageRequest.setOutboundUSSDMessage(message);

        outboundUSSDMessageRequest.setClientCorrelator(sessionID);

        ResponseRequest responseRequest = new ResponseRequest();

        responseRequest.setNotifyURL(notifyUrl);//FileUtil.getApplicationProperty("notifyurl")
        responseRequest.setCallbackData("");

        outboundUSSDMessageRequest.setResponseRequest(responseRequest);


        outboundUSSDMessageRequest.setUssdAction(action);
        req.setOutboundUSSDMessageRequest(outboundUSSDMessageRequest);
        return req;
    }
    public static String getJsonPayload(String msisdn, String sessionID, int noOfAttempts, String action, String notifyUrl, String ussdSessionID, boolean isUssdSessionId) {
        String message = null;
        if (noOfAttempts == 1){
            message = FileUtil.getApplicationProperty("message");
        }
        else if(noOfAttempts == 2){
            message = FileUtil.getApplicationProperty("retry_message");
        }
        else if(noOfAttempts == 3){
            message = FileUtil.getApplicationProperty("pinmismatch");
        }
        //Invalid pin format
        else if(noOfAttempts == 4){
            message = FileUtil.getApplicationProperty("pinformat");
        }

        else if(noOfAttempts == 5){

            message = "Thank you";

        }
        else{
            message = FileUtil.getApplicationProperty("error_message");
        }
        USSDRequest req = setOutboundUSSDMessageRequest(msisdn, sessionID, action, notifyUrl, message, ussdSessionID);
        Gson gson = new GsonBuilder().serializeNulls().create();
        String reqString = gson.toJson(req);
        return reqString;
    }

    public static String getJsonPayload(String msisdn, String sessionID, int noOfAttempts, String action, String notifyUrl) {
        String message = null;
        if (noOfAttempts == 1){
            message = FileUtil.getApplicationProperty("message");
        }
        else if(noOfAttempts == 2){
            message = FileUtil.getApplicationProperty("retry_message");
        }
        else if(noOfAttempts == 3){
            message = FileUtil.getApplicationProperty("pinmismatch");
        }
        //Invalid pin format
        else if(noOfAttempts == 4){
            message = FileUtil.getApplicationProperty("pinformat");
        }

        else if(noOfAttempts == 5){

            message = "Thank you";

        }
        else{
            message = FileUtil.getApplicationProperty("error_message");
        }
        USSDRequest req = setOutboundUSSDMessageRequest(msisdn, sessionID, action, notifyUrl, message);
        Gson gson = new GsonBuilder().serializeNulls().create();
        String reqString = gson.toJson(req);
        return reqString;
    }


    public static String getJsonPayload(String msisdn, String sessionID, String action, String notifyUrl, String message) {
        USSDRequest req = setOutboundUSSDMessageRequest(msisdn, sessionID, action, notifyUrl, message);
        Gson gson = new GsonBuilder().serializeNulls().create();
        String reqString = gson.toJson(req);
        return reqString;
    }
    
    private String postRequest(String url, String requestStr, String operator) throws IOException {

        HttpClient client = new DefaultHttpClient();
        HttpPost postRequest = new HttpPost(url);

        postRequest.addHeader("accept", "application/json");
        log.info(" url -->> " +url);
        postRequest.addHeader("Authorization", "Bearer " + FileUtil.getApplicationProperty("accesstoken"));
        log.info(" token  : " +FileUtil.getApplicationProperty("accesstoken"));
        postRequest.addHeader("operator", operator);
        log.info(" operator -->> " +operator);

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
            log.info("Success Response : "+ responseStr);
        }
        return responseStr;
    }
    
    protected String sendUSSDLogin(String msisdn, String sessionID, int noOfAttempts,String action, String operator) throws IOException {
         
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

         responseRequest.setNotifyURL(FileUtil.getApplicationProperty("notifyurlLogin"));
         responseRequest.setCallbackData("");

         outboundUSSDMessageRequest.setResponseRequest(responseRequest);
         
         
         outboundUSSDMessageRequest.setUssdAction(action);

         req.setOutboundUSSDMessageRequest(outboundUSSDMessageRequest);

         Gson gson = new GsonBuilder().serializeNulls().create();
         String reqString = gson.toJson(req);


         String endpoint = FileUtil.getApplicationProperty("ussdsend");
         
         endpoint = endpoint + "/tel:+" + msisdn;

         
         String returnString = postRequest(endpoint, reqString, operator);
         System.out.println("Returned from Backend = " + returnString);
         
         return returnString;
     }
}
