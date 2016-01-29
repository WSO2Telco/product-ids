/*******************************************************************************
 * Copyright (c) 2015-2016, WSO2.Telco Inc. (http://www.wso2telco.com) 
 * 
 * All Rights Reserved. WSO2.Telco Inc. licences this file to you under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
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

// TODO: Auto-generated Javadoc
/**
 * The Class SendUSSD.
 */
public class SendUSSD {

    /** The log. */
    private static Log log = LogFactory.getLog(SendUSSD.class);
    
    /** The const mtinit. */
    //private MobileConnectConfig.USSDConfig ussdConfig;
    private static String CONST_MTINIT = "mtinit";

    /**
     * Send ussd.
     *
     * @param msisdn the msisdn
     * @param sessionID the session id
     * @param noOfAttempts the no of attempts
     * @param action the action
     * @param operator the operator
     * @return the string
     * @throws IOException Signals that an I/O exception has occurred.
     */
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

    /**
     * Send ussd push.
     *
     * @param msisdn the msisdn
     * @param sessionID the session id
     * @param action the action
     * @param operator the operator
     * @return the string
     * @throws IOException Signals that an I/O exception has occurred.
     */
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
    
    /**
     * Send ussd.
     *
     * @param msisdn the msisdn
     * @param sessionID the session id
     * @param noOfAttempts the no of attempts
     * @param action the action
     * @param ussdSessionID the ussd session id
     * @param isResend the is resend
     * @param operator the operator
     * @return the string
     * @throws IOException Signals that an I/O exception has occurred.
     */
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

    /**
     * Sets the outbound ussd message request.
     *
     * @param msisdn the msisdn
     * @param sessionID the session id
     * @param action the action
     * @param notifyUrl the notify url
     * @param message the message
     * @param ussdSessionID the ussd session id
     * @return the USSD request
     */
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

    /**
     * Sets the outbound ussd message request.
     *
     * @param msisdn the msisdn
     * @param sessionID the session id
     * @param action the action
     * @param notifyUrl the notify url
     * @param message the message
     * @return the USSD request
     */
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
    
    /**
     * Gets the json payload.
     *
     * @param msisdn the msisdn
     * @param sessionID the session id
     * @param noOfAttempts the no of attempts
     * @param action the action
     * @param notifyUrl the notify url
     * @param ussdSessionID the ussd session id
     * @param isUssdSessionId the is ussd session id
     * @return the json payload
     */
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

    /**
     * Gets the json payload.
     *
     * @param msisdn the msisdn
     * @param sessionID the session id
     * @param noOfAttempts the no of attempts
     * @param action the action
     * @param notifyUrl the notify url
     * @return the json payload
     */
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


    /**
     * Gets the json payload.
     *
     * @param msisdn the msisdn
     * @param sessionID the session id
     * @param action the action
     * @param notifyUrl the notify url
     * @param message the message
     * @return the json payload
     */
    public static String getJsonPayload(String msisdn, String sessionID, String action, String notifyUrl, String message) {
        USSDRequest req = setOutboundUSSDMessageRequest(msisdn, sessionID, action, notifyUrl, message);
        Gson gson = new GsonBuilder().serializeNulls().create();
        String reqString = gson.toJson(req);
        return reqString;
    }
    
    /**
     * Post request.
     *
     * @param url the url
     * @param requestStr the request str
     * @param operator the operator
     * @return the string
     * @throws IOException Signals that an I/O exception has occurred.
     */
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
    
    /**
     * Send ussd login.
     *
     * @param msisdn the msisdn
     * @param sessionID the session id
     * @param noOfAttempts the no of attempts
     * @param action the action
     * @param operator the operator
     * @return the string
     * @throws IOException Signals that an I/O exception has occurred.
     */
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
