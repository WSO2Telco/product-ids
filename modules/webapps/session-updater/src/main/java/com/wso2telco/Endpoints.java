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


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.rmi.RemoteException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import org.apache.axis2.AxisFault;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONException;
import org.json.JSONObject;
import org.wso2.carbon.authenticator.stub.LoginAuthenticationExceptionException;
import org.wso2.carbon.identity.mgt.stub.UserIdentityManagementAdminServiceIdentityMgtServiceExceptionException;
import org.wso2.carbon.um.ws.api.stub.RemoteUserStoreManagerServiceUserStoreExceptionException;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wso2telco.cryptosystem.AESencrp;
import com.wso2telco.entity.LoginHistory;




 
// TODO: Auto-generated Javadoc
/**
 * The Class Endpoints.
 */
@Path("/endpoint")
public class Endpoints {

    /** The context. */
    //private static final Logger LOG = Logger.getLogger(Endpoints.class.getName());
    @Context
    private UriInfo context;
    
    /** The success response. */
    String successResponse = "\"" + "amountTransaction" + "\"";
    
    /** The service exception. */
    String serviceException = "\"" + "serviceException" + "\"";
    
    /** The policy exception. */
    String policyException = "\"" + "policyException" + "\"";
    
    /** The error return. */
    String errorReturn = "\"" + "errorreturn" + "\"";
    
    /** The log. */
    private static Log log = LogFactory.getLog(Endpoints.class);
    
    /** The ussd no of attempts. */
    private static Map<String, Integer> ussdNoOfAttempts = new HashMap<String, Integer>();
     
    /**
     * Instantiates a new endpoints.
     */
    public Endpoints() {


    }

    /**
     * Ussd receive.
     *
     * @param jsonBody the json body
     * @return the response
     * @throws SQLException the SQL exception
     * @throws JSONException the JSON exception
     * @throws IOException Signals that an I/O exception has occurred.
     */
    @POST
    @Path("/ussd/receive")
    @Consumes("application/json")
    @Produces("application/json")
    public Response ussdReceive(String jsonBody) throws SQLException, JSONException, IOException {

        log.info("Json Body" +jsonBody);
        Gson gson = new GsonBuilder().serializeNulls().create();
        org.json.JSONObject jsonObj = new org.json.JSONObject(jsonBody);
        String message = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("inboundUSSDMessage");
        String sessionID = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("clientCorrelator");
        String msisdn = extractMsisdn(jsonObj);

        int responseCode = 400;
        String responseString = null;

        String status = null;


        String ussdSessionID = null;
        if (jsonObj.getJSONObject("inboundUSSDMessageRequest").has("sessionID") && !jsonObj.getJSONObject("inboundUSSDMessageRequest").isNull("sessionID")) {
            ussdSessionID = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("sessionID");
            log.info("####### LOGS  ussdSessionID 01 : "+ussdSessionID);
        }
        ussdSessionID=((ussdSessionID!=null)?ussdSessionID:"");
        log.info("####### LOGS  ussdSessionID 02 : "+ussdSessionID);

        //USSD 1 = YES
        //USSD 2 = NO
        if (message.equals("1")) {
            status = "Approved";
            responseCode = 201;
            DatabaseUtils.updateStatus(sessionID, status);
        } else if (message.equals("2")) {
            status = "Rejected";
            responseCode = 201;
            DatabaseUtils.updateStatus(sessionID, status);
        } else {
            responseString = validateUSSDResponse(message, msisdn, sessionID, ussdSessionID);
            if (responseString == null) {
                responseCode = 400;
                status = "Status not updated";
                ussdNoOfAttempts.remove(msisdn);
                responseString = SendUSSD.getUSSDJsonPayload(msisdn, sessionID, 3, "mtfin", ussdSessionID);  //send 3 to show session expire message
                return Response.status(responseCode).entity(responseString).build();
            } else {
                return Response.status(201).entity(responseString).build();
            }
        }

        if (responseCode == 400) {
            responseString = "{" + "\"requestError\":" + "{"
                    + "\"serviceException\":" + "{" + "\"messageId\":\"" + "SVC0275" + "\"" + "," + "\"text\":\"" + "Internal server Error" + "\"" + "}"
                    + "}}";
        } else {
        	responseString = SendUSSD.getUSSDJsonPayload(msisdn, sessionID, 5, "mtfin",ussdSessionID);
        }

        return Response.status(responseCode).entity(responseString).build();
    }

    /**
     * Validate ussd response.
     *
     * @param message the message
     * @param msisdn the msisdn
     * @param sessionID the session id
     * @param ussdSessionID the ussd session id
     * @return the string
     */
    private String validateUSSDResponse(String message, String msisdn, String sessionID, String ussdSessionID) {
    	
    	log.info("message : "+message);
    	log.info("msisdn : "+msisdn);
    	log.info("sessionID : "+sessionID);
    	log.info("ussdSessionID : "+ussdSessionID);
    	
    	
    	
        String responseString = null;
        Integer noOfAttempts = ussdNoOfAttempts.get(msisdn);
        if (noOfAttempts == null) {
            ussdNoOfAttempts.put(msisdn, 1);
            noOfAttempts = 0;
        }
        if (noOfAttempts < 2) {//resend USSD request
            responseString = SendUSSD.getUSSDJsonPayload(msisdn, sessionID, noOfAttempts, "mtcont", ussdSessionID);//
            ussdNoOfAttempts.put(msisdn, noOfAttempts + 1);
        }
        return responseString;
    }

    /**
     * Validate pin.
     *
     * @param pin the pin
     * @param sessionID the session id
     * @param msisdn the msisdn
     * @return the string
     */
    private String validatePIN(String pin, String sessionID, String msisdn) {
        
    	log.info("pin : "+pin);
    	log.info("sessionID : "+sessionID);
    	log.info("msisdn : "+msisdn);
    	
    	String responseString = null;
            try {
                    LoginAdminServiceClient lAdmin = new LoginAdminServiceClient(FileUtil.getApplicationProperty("admin_url"));
                    String sessionCookie = lAdmin.authenticate(FileUtil.getApplicationProperty("adminusername"), FileUtil.getApplicationProperty("adminpassword"));
                    ClaimManagementClient claimManager = new ClaimManagementClient(FileUtil.getApplicationProperty("admin_url"),sessionCookie);
                    String profilePin = claimManager.getPIN(msisdn);
                    String hashedUserPin = getHashedPin(pin);
                    if(hashedUserPin != null && profilePin != null && profilePin.equals(hashedUserPin)) {
                        //success
                        return null;
                    } else {
                        Integer noOfAttempts = DatabaseUtils.readMultiplePasswordNoOfAttempts(sessionID);
                        if(noOfAttempts < 2){//resend USSD
                            responseString = SendUSSD.getJsonPayload(msisdn, sessionID,2, "mtcont");//send 2 to show retry_message
                            log.info("responseString 01: "+responseString);
                            DatabaseUtils.updateMultiplePasswordNoOfAttempts(sessionID, noOfAttempts + 1);
                        } else {//lock user
                            UserIdentityManagementClient identityClient = new UserIdentityManagementClient(FileUtil.getApplicationProperty("admin_url"), sessionCookie);
                            identityClient.lockUser(msisdn);
                            DatabaseUtils.deleteUser(sessionID);
                        }
                    }
            } catch (AxisFault e) {
                    e.printStackTrace();
            } catch (RemoteException e) {
                    e.printStackTrace();
            } catch (LoginAuthenticationExceptionException e) {
                    e.printStackTrace();
            } catch (SQLException ex) {
                Logger.getLogger(Endpoints.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(Endpoints.class.getName()).log(Level.SEVERE, null, ex);
            } catch (UserIdentityManagementAdminServiceIdentityMgtServiceExceptionException ex) {
                Logger.getLogger(Endpoints.class.getName()).log(Level.SEVERE, null, ex);
            } catch (RemoteUserStoreManagerServiceUserStoreExceptionException ex) {
            Logger.getLogger(Endpoints.class.getName()).log(Level.SEVERE, null, ex);
        }
        return responseString;
    }


    /**
     * Validate pin.
     *
     * @param pin the pin
     * @param sessionID the session id
     * @param msisdn the msisdn
     * @param ussdSessionID the ussd session id
     * @return the string
     */
    private String validatePIN(String pin, String sessionID, String msisdn, String ussdSessionID) {
        String responseString = null;
        try {
            log.info("####### validatePIN  : ");
            LoginAdminServiceClient lAdmin = new LoginAdminServiceClient(FileUtil.getApplicationProperty("admin_url"));
            String sessionCookie = lAdmin.authenticate(FileUtil.getApplicationProperty("adminusername"), FileUtil.getApplicationProperty("adminpassword"));
            ClaimManagementClient claimManager = new ClaimManagementClient(FileUtil.getApplicationProperty("admin_url"),sessionCookie);
            String profilePin = claimManager.getPIN(msisdn);

            String hashedUserPin = getHashedPin(pin);


            if(hashedUserPin != null && profilePin != null && profilePin.equals(hashedUserPin)) {
                log.info("####### profilePin status : success");
                //success
                return null;
            } else {
                log.info("####### profilePin status : fail");
                Integer noOfAttempts = DatabaseUtils.readMultiplePasswordNoOfAttempts(sessionID);
                if(noOfAttempts < 2){//resend USSD
                    responseString = SendUSSD.getJsonPayload(msisdn, sessionID,2, "mtcont", ussdSessionID);//send 2 to show retry_message
                    log.info("####### retry request  : "+responseString);
                    DatabaseUtils.updateMultiplePasswordNoOfAttempts(sessionID, noOfAttempts + 1);
                } else {//lock user
                    //log.info("####### locked user  : ");
                    //UserIdentityManagementClient identityClient = new UserIdentityManagementClient(FileUtil.getApplicationProperty("admin_url"), sessionCookie);
                    
                     
                	String failedStatus="FAILED_ATTEMPTS";
                	log.info("Updating the databse with session:"+sessionID+" and status: "+failedStatus);
					DatabaseUtils.updateStatus(sessionID, failedStatus);
                	//DatabaseUtils.updateUSerStatus(sessionID, "FAILED_ATTEMPTS");
					 
					// identityClient.lockUser(msisdn); 
                    DatabaseUtils.deleteUser(sessionID);
                     
                    responseString = SendUSSD.getUSSDJsonPayload(msisdn, sessionID, 9, "mtfin", ussdSessionID);
                }
            }
        } catch (AxisFault e) {
            e.printStackTrace();
        } catch (RemoteException e) {
            e.printStackTrace();
        } catch (LoginAuthenticationExceptionException e) {
            e.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(Endpoints.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Endpoints.class.getName()).log(Level.SEVERE, null, ex);
        }   catch (RemoteUserStoreManagerServiceUserStoreExceptionException ex) {
            Logger.getLogger(Endpoints.class.getName()).log(Level.SEVERE, null, ex);
        }
        return responseString;
    }
    
    /**
     * Ussd pin receive.
     *
     * @param jsonBody the json body
     * @return the response
     * @throws SQLException the SQL exception
     * @throws JSONException the JSON exception
     */
    @POST
    @Path("/ussd/pin")
    @Consumes("application/json")
    @Produces("application/json")
    public Response ussdPinReceive(String jsonBody) throws SQLException, JSONException {
        Gson gson = new GsonBuilder().serializeNulls().create();
        log.info("Json Body pin" +jsonBody);

        org.json.JSONObject jsonObj = new org.json.JSONObject(jsonBody);
        String message = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("inboundUSSDMessage");
        String sessionID = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("clientCorrelator");
        String msisdn = extractMsisdn(jsonObj);

        String ussdSessionID = null;

        if (jsonObj.getJSONObject("inboundUSSDMessageRequest").has("sessionID") && !jsonObj.getJSONObject("inboundUSSDMessageRequest").isNull("sessionID")) {

            ussdSessionID = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("sessionID");

            log.info("####### LOGS  ussdSessionID 01 : "+ussdSessionID);

        }

        ussdSessionID=((ussdSessionID!=null)?ussdSessionID:"");

        log.info("####### LOGS  ussdSessionID 02 : "+ussdSessionID);

        log.info("message>" + message);
        log.info("sessionID>" + sessionID);


        
        int responseCode = 400;
//        String responseString = null;
        //validatePIN returns non null value if USSD push should be done again(in case of incorrect PIN)
        String responseString = validatePIN(message, sessionID, msisdn, ussdSessionID);
        if(responseString != null) {
            return Response.status(201).entity(responseString).build();
        }
        String status = null;
        
        //USSD 1 = YES
        //USSD 2 = NO
        if ( (message != null ) && (!message.isEmpty()) ){
            status = "Approved";
            responseCode = 201;
            DatabaseUtils.updatePinStatus(sessionID, status, message,ussdSessionID);
        }        
        else{
            responseCode = 400;
            status = "Status not updated";
            //nop
        }
        
        if (responseCode == 400){
            responseString = "{" + "\"requestError\":" + "{"
                    + "\"serviceException\":" + "{" + "\"messageId\":\"" + "SVC0275" + "\"" + "," + "\"text\":\"" + "Internal server Error" + "\"" + "}" 
                    + "}}";
        }
        else{
            //responseString = "{" + "\"sessionID\":\"" + sessionID + "\","+ "\"status\":\"" + status + "\"" + "}";
        	responseString = SendUSSD.getUSSDJsonPayload(msisdn, sessionID, 5, "mtfin", ussdSessionID);
        }
        return Response.status(responseCode).entity(responseString).build();
    }
    
    
    /**
     * User status.
     *
     * @param sessionID the session id
     * @param jsonBody the json body
     * @return the response
     * @throws SQLException the SQL exception
     */
    @GET
    @Path("/ussd/status")
   // @Consumes("application/json")
    @Produces("application/json")
    public Response userStatus(@QueryParam("sessionID") String sessionID, String jsonBody) throws SQLException {
        
        String userStatus = null;
        String responseString = null;
        
        userStatus = DatabaseUtils.getUSerStatus(sessionID);
        
        responseString = "{" + "\"sessionID\":\"" + sessionID + "\","
                    + "\"status\":\"" + userStatus + "\"" + "}";
        
               
        return Response.status(200).entity(responseString).build();
    }

    /**
     * Extract msisdn.
     *
     * @param jsonObj the json obj
     * @return the string
     * @throws JSONException the JSON exception
     */
    private String extractMsisdn(JSONObject jsonObj) throws JSONException {
        String address = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("address");
        if(address != null) {//tel:+tel:+94773333428
            return address.split(":\\+")[2];
        }
        return null;
    }
    
    /**
     * Gets the hashed pin.
     *
     * @param pinvalue the pinvalue
     * @return the hashed pin
     */
    private String getHashedPin(String pinvalue){
        String hashString ="";
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(pinvalue.getBytes("UTF-8"));
            
            StringBuilder hexString = new StringBuilder();

            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if(hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            hashString = hexString.toString();        
           
        } catch (UnsupportedEncodingException ex) {
            log.info("Error getHashValue");
        } catch (NoSuchAlgorithmException ex) {
            log.info("Error getHashValue");
        }
        
         return hashString;
        
    }
	
    /**
     * Login history.
     *
     * @param userID the user id
     * @param appID the app id
     * @param strfromDate the strfrom date
     * @param strtoDate the strto date
     * @return the response
     * @throws SQLException the SQL exception
     * @throws ParseException the parse exception
     */
    @GET
    @Path("/login/history")
   // @Consumes("application/json")
    @Produces("application/json")
    public Response loginHistory(@QueryParam("userID") String userID,@QueryParam("appID") String appID, @QueryParam("fromDate") String strfromDate,
                @QueryParam("toDate") String strtoDate ) throws SQLException, ParseException {
        
        String userStatus = null;
        String responseString = null;
        Date fromDate = new java.sql.Date( new SimpleDateFormat("yyyy-MM-dd").parse(strfromDate).getTime());
        Date toDate = new java.sql.Date( new SimpleDateFormat("yyyy-MM-dd").parse(strtoDate).getTime());
        List<LoginHistory> lsthistory = DatabaseUtils.getLoginHistory(userID, appID, fromDate, toDate);
        responseString = new Gson().toJson(lsthistory);       
        return Response.status(200).entity(responseString).build();
    }
    
    /**
     * Login apps.
     *
     * @param userID the user id
     * @return the response
     * @throws SQLException the SQL exception
     * @throws ParseException the parse exception
     */
    @GET
    @Path("/login/applications")
   // @Consumes("application/json")
    @Produces("application/json")
    public Response loginApps(@QueryParam("userID") String userID) throws SQLException, ParseException {
        
        List<String> lsthistory = DatabaseUtils.getLoginApps(userID);
        String responseString = new Gson().toJson(lsthistory);       
        return Response.status(200).entity(responseString).build();
    }

    /**
     * Sms confirm.
     *
     * @param sessionID the session id
     * @return the response
     * @throws SQLException the SQL exception
     */
    @GET
    @Path("/sms/response")
   // @Consumes("application/json")
    @Produces("text/plain")
    public Response smsConfirm(@QueryParam("sessionID") String sessionID) throws SQLException {
    	log.info("sessionID 01: "+sessionID);
        String responseString=null;
        String status=null;
        try {
            sessionID= AESencrp.decrypt(sessionID.replaceAll(" ","+"));
        } catch (Exception e) {
            e.printStackTrace();
            responseString = e.getLocalizedMessage();
            return Response.status(500).entity(responseString).build();
        }
        String userStatus = DatabaseUtils.getUSerStatus(sessionID);
        if(userStatus.equalsIgnoreCase("PENDING")){
        DatabaseUtils.updateStatus(sessionID, "APPROVED");
        status="APPROVED";
        responseString = " You are successfully authenticated via mobile-connect";}
        else if(userStatus.equalsIgnoreCase("EXPIRED")){
          status="EXPIRED";
         responseString = " You are token expired";
        }
        else{
          status="EXPIRED";
         responseString = " You are token already approved";
        }

        responseString = "{" + "\"status\":\"" + status + "\","
                + "\"text\":\"" + responseString + "\"" + "}";

        return Response.status(200).entity(responseString).build();
    }

    /**
     * Mepin confirm.
     *
     * @param identifier the identifier
     * @param transactionId the transaction id
     * @param allow the allow
     * @param transactionStatus the transaction status
     * @return the response
     * @throws SQLException the SQL exception
     */
    @POST
    @Path("/mepin/response")
    @Consumes("application/x-www-form-urlencoded")
    public Response mepinConfirm(@FormParam("identifier") String identifier, @FormParam("transaction_id") String
            transactionId, @FormParam("allow") String allow, @FormParam("transaction_status") String
            transactionStatus) throws SQLException {

        log.info("MePIN transactionID: " + transactionId);
        log.info("MePIN identifier: " + identifier);
        log.info("MePIN transactionStatus: " + transactionStatus);

        MePinStatusRequest mePinStatus = new MePinStatusRequest(transactionId);
        FutureTask<String> futureTask = new FutureTask<String>(mePinStatus);
        ExecutorService executor = Executors.newFixedThreadPool(1);
        executor.execute(futureTask);

        return Response.status(200).build();
    }

}
