/*
 * Queries.java
 * Apr 2, 2013  11:20:38 AM
 * Dialog Axiata
 *
 * Copyright (C) Dialog Axiata PLC. All Rights Reserved.
 */
package com.wso2telco;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.rmi.RemoteException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ObjectWriter;
import org.json.JSONException;
import org.wso2.carbon.authenticator.stub.LoginAuthenticationExceptionException;
import org.wso2.carbon.um.ws.api.stub.RemoteUserStoreManagerServiceUserStoreExceptionException;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wso2telco.gsma.shorten.SelectShortUrl;
import com.wso2telco.manager.UserProfileManager;
import com.wso2telco.sms.OutboundSMSMessageRequest;
import com.wso2telco.sms.OutboundSMSTextMessage;
import com.wso2telco.sms.SendSMSRequest;
import com.wso2telco.utils.ConfigLoader;
import com.wso2telco.utils.LOA;
import com.wso2telco.utils.LOA.MIFEAbstractAuthenticator;
import com.wso2telco.utils.LOAConfig;
import com.wso2telco.utils.ReadMobileConnectConfig;

//import org.json.JSONException;
//import Aloo.AdminServicesInvoker.LoginAdminServiceClient;

/**
 * REST Web Service Dialog Axiata
 * 
 * @version $Id: Queries.java,v 1.00.000
 */
@Path("/endpoint")
public class Endpoints {

	@Context
	private UriInfo context;
	private static Log log = LogFactory.getLog(Endpoints.class);
	private static Map<String, UserRegistrationData> userMap = new HashMap<String, UserRegistrationData>();
	// Map to keep msisdns of PIN_RESET requested.
	private static Map<String, String> pinResetRequest = new HashMap<String, String>();
	
	private static UserProfileManager userProfileManager=null;

	String successResponse = "\"" + "amountTransaction" + "\"";
	String serviceException = "\"" + "serviceException" + "\"";
	String policyException = "\"" + "policyException" + "\"";
	String errorReturn = "\"" + "errorreturn" + "\"";

	/**
	 * Creates a new instance of QueriesResource
	 */
	public Endpoints() {
		userProfileManager=UserProfileManager.getInstance();
	}

	@POST
	@Path("/ussd/receive")
	@Consumes("application/json")
	@Produces("application/json")
	public Response ussdReceive(String jsonBody) throws Exception {
		String responseString = null;
		String msisdn = null;
		String notifyUrl = null;

		int responseCode = 201;
		int noOfAttempts = 0;

		log.info(" Json body for ussdReceive :  " + jsonBody);

		org.json.JSONObject jsonObj = new org.json.JSONObject(jsonBody);

		log.info(" Json body for ussdReceive has sessionID :  "
				+ jsonObj.getJSONObject("inboundUSSDMessageRequest").has("sessionID"));
		String ussdSessionID = null;
		if (jsonObj.getJSONObject("inboundUSSDMessageRequest").has("sessionID")
				&& !jsonObj.getJSONObject("inboundUSSDMessageRequest").isNull("sessionID")) {
			ussdSessionID = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("sessionID");
			log.debug("####### LOGS  ussdSessionID 01 : " + ussdSessionID);
		}

		log.debug("####### LOGS  ussdSessionID 02 : " + ussdSessionID);

		// Retrive pin and username
		String message = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("inboundUSSDMessage");
		String sessionID = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("clientCorrelator");

		log.debug("####### LOGS  message : " + message);
		log.debug("####### LOGS  sessionID : " + sessionID);

		noOfAttempts = DatabaseUtils.readMultiplePasswordNoOfAttempts(sessionID);
		log.info("####### LOGS  noOfAttempts : " + noOfAttempts);

		SendUSSD ussdPush = new SendUSSD();

		if (!(message.matches("[0-9]+") && message.length() > 3
				&& message.length() < Integer.parseInt(FileUtil.getApplicationProperty("maxlength")))) {

			log.debug("####### LOGS  within the if >>>>> ");

			notifyUrl = FileUtil.getApplicationProperty("notifyurl");

			if (noOfAttempts == 3) {
				// Session Terminated saying user has entered incorrect pin
				// three times.
				// ussdPush.sendUSSD(msisdn, sessionID, 4,"mtfin");
				responseString = SendUSSD.getJsonPayload(msisdn, sessionID, 6, "mtfin", notifyUrl, ussdSessionID, true);
				DatabaseUtils.updateRegStatus(sessionID, "Approved");
				DatabaseUtils.deleteUser(sessionID);
				return Response.status(responseCode).entity(responseString).build();
			}
			responseString = SendUSSD.getJsonPayload(msisdn, sessionID, 4, "mtcont", notifyUrl, ussdSessionID, true);
			DatabaseUtils.updateMultiplePasswordNoOfAttempts(sessionID, noOfAttempts + 1);

			return Response.status(responseCode).entity(responseString).build();

		}

		log.debug("####### LOGS  within the else --->>> ");
		// Mobile Number = Username
		msisdn = sessionID;

		// First Time PIN Retrival
		if (noOfAttempts == 1 || noOfAttempts == 3 || noOfAttempts == 5) {

			log.debug("####### LOGS  within the 1 or 3 or 5--->>> ");
			if (noOfAttempts == 1) {
				DatabaseUtils.deleteRequestType(msisdn);
			}
			// Update with user entered PIN
			DatabaseUtils.updateMultiplePasswordPIN(sessionID, Integer.parseInt(message));
			// Update user attempts
			DatabaseUtils.updateMultiplePasswordNoOfAttempts(sessionID, noOfAttempts + 1);
			notifyUrl = FileUtil.getApplicationProperty("notifyurl");
			// Send USSD push to user's mobile
			// Ask User to retype password
			// ussdPush.sendUSSD(msisdn, sessionID,2,"mtcont");
			log.debug("####### LOGS  finally  1 or 3 or 5--->>> ");
			responseString = SendUSSD.getJsonPayload(msisdn, sessionID, 2, "mtcont", notifyUrl, ussdSessionID, true);

		} else if (noOfAttempts == 2 || noOfAttempts == 4 || noOfAttempts == 6) {

			if (DatabaseUtils.readMultiplePasswordPIN(sessionID) == Integer.parseInt(message)) {

				// update PIN in IS user profile and usr is deleted
				// addUser(msisdn, message);

				/*
				 * calling add or update user through profile manage holder -
				 * refactoring start
				 */
				UserRegistrationData userRegistrationData = userMap.get(msisdn);
				userRegistrationData.setHashPin(getHashValue(message));

				long waitingTime = Integer.parseInt(FileUtil.getApplicationProperty("waitinTimeInMinutes")) * 1000 * 60;
				long currentTime = System.currentTimeMillis();
				if ((userRegistrationData != null)
						&& (currentTime - userRegistrationData.getUserRegistrationTime()) <= waitingTime) {
					//profileManageHolder.profileManager(userRegistrationData);
					userProfileManager.manageProfile(userRegistrationData);
					responseString = SendUSSD.getJsonPayload(msisdn, sessionID, 5, "mtfin", notifyUrl, ussdSessionID,
							true);
					userMap.remove(msisdn);
				} else {
					responseString = "User Registration Cancelled.";
				}
				/* refactoring finished for USSD PIN profile */

				DatabaseUtils.deleteUser(sessionID);
				log.debug("####### LOGS  finally  --->>> ");

				// check for PIN_RESET flow
				if (pinResetRequest.containsKey(msisdn)) {
					String sessionDK = pinResetRequest.get(msisdn);
					// Update the client status table, which will be used at the
					// USSDPINAuthenticator
					String logTxt = "####____________ found pin reset and inserting to client status. Session_Data_Key: "
							+ sessionDK;
					log.info(logTxt);
					
					DatabaseUtils.insertPinResetRequest(sessionDK, "Approved", message);
					pinResetRequest.remove(msisdn);
				}

			} else {
				if (noOfAttempts == 6) {
					// Session Terminated saying user has entered incorrect pin
					// three times.

					log.debug("####### LOGS  finally  6 if -->>> ");
					SendUSSD.getJsonPayload(msisdn, sessionID, 4, "mtfin", notifyUrl, ussdSessionID, true);
					// Updating reg status to Failed, so the PIN reset flow can
					// be started.
					DatabaseUtils.updateRegStatus(sessionID, "Failed");
					DatabaseUtils.deleteUser(sessionID);
				} else {

					log.debug("####### LOGS  finally  6- else -->>> ");
					notifyUrl = FileUtil.getApplicationProperty("notifyurl");
					// Start new PIN session
					responseString = SendUSSD.getJsonPayload(msisdn, sessionID, 3, "mtcont", notifyUrl, ussdSessionID,
							true);
							// ussdPush.sendUSSD(msisdn, sessionID,1,"mtcont");

					// Update user attempts
					DatabaseUtils.updateMultiplePasswordNoOfAttempts(sessionID, noOfAttempts + 1);

					DatabaseUtils.updateMultiplePasswordPIN(sessionID, 0);
				}
			}

		} else {
			// nop
		}

		return Response.status(responseCode).entity(responseString).build();
	}

	@POST
	@Path("/ussd/push/receive")
	@Consumes("application/json")
	@Produces("application/json")
	public Response ussdPushReceive(String jsonBody) throws Exception {
		log.info("USSD Push received:" + jsonBody);

		org.json.JSONObject jsonObj = new org.json.JSONObject(jsonBody);
		String address = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("address");
		String inboundUSSDMessage = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("inboundUSSDMessage");
		String sessionID = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("clientCorrelator");
		String notifyUrl = FileUtil.getApplicationProperty("ussdPushNotifyUrl");
		String ussdSessionID = null;
		if (jsonObj.getJSONObject("inboundUSSDMessageRequest").has("sessionID")
				&& !jsonObj.getJSONObject("inboundUSSDMessageRequest").isNull("sessionID")) {
			ussdSessionID = jsonObj.getJSONObject("inboundUSSDMessageRequest").getString("sessionID");
			log.debug("####### LOGS  ussdSessionID 01 : " + ussdSessionID);
		}

		log.info("Ussd Push received inboundUSSDMessage:" + inboundUSSDMessage + " ,address:" + address);
		String msisdn = null;
		try {
			msisdn = address.split(":\\+")[2];
		} catch (Exception e) {
			log.error("address split failed");
		}
		boolean ussdOk = false;
		if (inboundUSSDMessage.equals("1")) {
			ussdOk = true;
		}

		log.info("USSD Push received msisdn :" + msisdn);
		UserRegistrationData userRegistrationData = userMap.get(msisdn);
		String responseString = null;
		responseString = "Your registration confirm time has expired. Please register again";
		long waitingTime = Integer.parseInt(FileUtil.getApplicationProperty("waitinTimeInMinutes")) * 1000 * 60;

		long currentTime = System.currentTimeMillis();
		if (ussdOk) {

			if ((userRegistrationData != null)
					&& (currentTime - userRegistrationData.getUserRegistrationTime()) <= waitingTime) {

				/*
				 * calling add user through profile manage holder - refactoring
				 * start
				 */
				userProfileManager.manageProfile(userRegistrationData);
				/* refactoring finished for ussd push */
				
				responseString = SendUSSD.getJsonPayload(msisdn, sessionID, 5, "mtfin", notifyUrl, ussdSessionID, true);
				userMap.remove(msisdn);

			} else {
				responseString = "User Registration Cancelled.";
			}

		}
		return Response.status(200).entity(responseString).build();
	}

	@GET
	@Path("/ussd/pin")
	// @Consumes("application/json")
	@Produces("application/json")
	public Response userPIN(@QueryParam("username") String userName, @QueryParam("msisdn") String msisdn,
			@QueryParam("openId") String openId, @QueryParam("password") String pwd, @QueryParam("claim") String claim,
			@QueryParam("domain") String domain, @QueryParam("params") String params, String jsonBody,
			@QueryParam("operator") String operator, @QueryParam("updateProfile") boolean updateProfile,
			@QueryParam("action") String action, @QueryParam("sessionDataKey") String sessionDataKey)
					throws IOException, SQLException, JSONException {

		log.info(" Json body for ussd pin :  " + jsonBody);

		// If PIN_RESET request record the msisdn
		if (action != null && action.equals("pinreset")) {
			String logTxt = "####____________ PIN Reset flow started, session_data_key: " + sessionDataKey;
			log.info(logTxt);
			
			pinResetRequest.put(msisdn, sessionDataKey);
		}

		UserRegistrationData userRegistrationData = new UserRegistrationData(userName, msisdn, openId, pwd, claim,
				domain, params, updateProfile);
		userMap.put(msisdn, userRegistrationData);

		String responseString = null;

		SendUSSD ussdPush = new SendUSSD();

		if (DatabaseUtils.isExistingUser(userName)) {
			DatabaseUtils.deleteUser(userName);
		}

		String ussdSessionID = null;

		log.info("DB data ------>>>>>" + userName + " : ussdSessionID : " + ussdSessionID);

		DatabaseUtils.insertMultiplePasswordPIN(userName, ussdSessionID);

		if (DatabaseUtils.isExistingUserStatus(userName)) {

			DatabaseUtils.deleteUserStatus(userName);

		}

		DatabaseUtils.insertUserStatus(userName, "pending");

		/*
		 * DatabaseUtils.insertMultiplePasswordPIN(userName);
		 * DatabaseUtils.updateMultiplePasswordNoOfAttempts(userName, 1);
		 * DatabaseUtils.updateMultiplePasswordPIN(userName, 1111); log.info(
		 * "No of Attempts = " +
		 * DatabaseUtils.readMultiplePasswordNoOfAttempts(userName)); log.info(
		 * "User PIN = " + DatabaseUtils.readMultiplePasswordPIN(userName));
		 * DatabaseUtils.deleteUser("94777335365");
		 */

		// Send USSD push to user's mobile
		ussdPush.sendUSSD(msisdn, userName, 1, "mtinit", operator);
		return Response.status(200).entity(responseString).build();
	}

	@GET
	@Path("/ussd/push")
	// @Consumes("application/json")
	@Produces("application/json")
	public Response ussdPush(@QueryParam("username") String userName, @QueryParam("msisdn") String msisdn,
			@QueryParam("openId") String openId, @QueryParam("password") String pwd, @QueryParam("claim") String claim,
			@QueryParam("domain") String domain, @QueryParam("params") String params, String jsonBody,
			@QueryParam("operator") String operator, @QueryParam("updateProfile") boolean updateProfile)
					throws IOException, SQLException, JSONException {

		UserRegistrationData userRegistrationData = new UserRegistrationData(userName, msisdn, openId, pwd, claim,
				domain, params, updateProfile);
		userMap.put(msisdn, userRegistrationData);

		SendUSSD ussdPush = new SendUSSD();
		log.info("Ussd push info usrname:" + userName + " msisdn:" + msisdn);
		DatabaseUtils.insertUserStatus(userName, "pending");
		log.info("DB updated user status PENDING..");
		ussdPush.sendUSSDPush(msisdn, userName, "mtinit", operator);
		log.info("Sent ussd push..");

		return Response.status(200).entity(null).build();
	}

	@GET
	@Path("/ussd/status")
	// @Consumes("application/json")
	@Produces("application/json")
	public Response userStatus(@QueryParam("username") String username, String jsonBody) throws SQLException {

		log.info(username + " Json body for ussd status:  " + jsonBody);

		String userStatus = null;
		String responseString = null;

		userStatus = DatabaseUtils.getUSerStatus(username);

		if (userStatus.equals("Approved")) {

			DatabaseUtils.deleteUserStatus(username);
		}

		responseString = "{" + "\"username\":\"" + username + "\"," + "\"status\":\"" + userStatus + "\"" + "}";

		return Response.status(200).entity(responseString).build();
	}

	@GET
	@Path("/sms/send")
	// @Consumes("application/json")
	@Produces("application/json")
	public Response sendSMS(@QueryParam("username") String userName, @QueryParam("msisdn") String msisdn,
			@QueryParam("openId") String openId, @QueryParam("password") String pwd, @QueryParam("claim") String claim,
			@QueryParam("domain") String domain, @QueryParam("params") String params, String jsonBody,
			@QueryParam("operator") String operator, @QueryParam("updateProfile") boolean updateProfile)
					throws SQLException, RemoteException, Exception {

		UserRegistrationData userRegistrationData = new UserRegistrationData(userName, msisdn, openId, pwd, claim,
				domain, params, updateProfile);
		userMap.put(msisdn, userRegistrationData);

		ReadMobileConnectConfig readMobileConnectConfig = new ReadMobileConnectConfig();
		Map<String, String> readMobileConnectConfigResult;
		readMobileConnectConfigResult = readMobileConnectConfig.query("SMS");
		String messageText = readMobileConnectConfigResult.get("MessageContent");

		List<String> destinationAddresses = new ArrayList<String>();
		destinationAddresses.add("tel:" + msisdn);

		String uuid = DatabaseUtils.insertUserStatus(userName, "pending");

		String message = "Please click following link to complete the Registration ";
		String sendUrl = FileUtil.getApplicationProperty("callbackurl") + "?" + "id="
				+ URLEncoder.encode(uuid, "UTF-8");
		if (readMobileConnectConfigResult.get("IsShortUrl").equalsIgnoreCase("true")) {
			SelectShortUrl selectShortUrl = new SelectShortUrl();
			sendUrl = selectShortUrl.getShortUrl(readMobileConnectConfigResult.get("ShortUrlClass"), sendUrl,
					readMobileConnectConfigResult.get("AccessToken"),
					readMobileConnectConfigResult.get("ShortUrlService"));
			message = "Please click following link to complete the Registration " + sendUrl;
		} else {
			message = message + sendUrl;
		}

		String password = FileUtil.getApplicationProperty("password");
		String applicationId = FileUtil.getApplicationProperty("applicationId");

		SendSMS sms = new SendSMS();

		sms.setAddress(destinationAddresses);
		sms.setMessage(message);
		sms.setPassword(password);
		sms.setApplicationId(applicationId);

		Gson gson = new GsonBuilder().serializeNulls().create();

		String returnString = gson.toJson(sms);

		try {
			postRequest(FileUtil.getApplicationProperty("smsendpoint"), returnString, operator);
		} catch (IOException ex) {
			Logger.getLogger(Endpoints.class.getName()).log(Level.SEVERE, null, ex);
		}

		if (DatabaseUtils.isExistingUserStatus(userName)) {
			DatabaseUtils.deleteUserStatus(userName);
		}

		DatabaseUtils.insertUserStatus(userName, "pending");

		return Response.status(200).entity(returnString).build();
	}

	@GET
	@Path("/sms/oneapi")
	// @Consumes("application/json")
	@Produces("application/json")
	public Response sendSMSOneAPI(@QueryParam("username") String userName, @QueryParam("msisdn") String msisdn,
			@QueryParam("openId") String openId, @QueryParam("password") String pwd, @QueryParam("claim") String claim,
			@QueryParam("domain") String domain, @QueryParam("params") String params, String jsonBody,
			@QueryParam("operator") String operator, @QueryParam("updateProfile") boolean updateProfile)
					throws SQLException, RemoteException, Exception {

		UserRegistrationData userRegistrationData = new UserRegistrationData(userName, msisdn, openId, pwd, claim,
				domain, params, updateProfile);
		userMap.put(msisdn, userRegistrationData);

		ReadMobileConnectConfig readMobileConnectConfig = new ReadMobileConnectConfig();
		Map<String, String> readMobileConnectConfigResult;
		readMobileConnectConfigResult = readMobileConnectConfig.query("SMS");

		List<String> address = new ArrayList<String>();
		address.add("tel:+" + msisdn);

		if (DatabaseUtils.isExistingUserStatus(userName)) {
			DatabaseUtils.deleteUserStatus(userName);
		}

		String uuid = DatabaseUtils.insertUserStatus(userName, "pending");

		String message = "Please click following link to complete the Registration ";
		String sendUrl = FileUtil.getApplicationProperty("callbackurl") + "?" + "id="
				+ URLEncoder.encode(uuid, "UTF-8");
		if (readMobileConnectConfigResult.get("IsShortUrl").equalsIgnoreCase("true")) {
			SelectShortUrl selectShortUrl = new SelectShortUrl();
			sendUrl = selectShortUrl.getShortUrl(readMobileConnectConfigResult.get("ShortUrlClass"), sendUrl,
					readMobileConnectConfigResult.get("AccessToken"),
					readMobileConnectConfigResult.get("ShortUrlService"));
			message = "Please click following link to complete the Registration " + sendUrl;
		} else {
			message = message + sendUrl;
		}

		OutboundSMSTextMessage messageObj = new OutboundSMSTextMessage();
		messageObj.setMessage(message);

		OutboundSMSMessageRequest outbound = new OutboundSMSMessageRequest();

		ReceiptRequest receipt = new ReceiptRequest();

		receipt.setCallbackData("some-data-useful");
		receipt.setNotifyURL("https://india.mconnect.com");
		outbound.setReceiptRequest(receipt);
		outbound.setOutboundTextMessage(messageObj);
		outbound.setAddress(address);
		outbound.setSenderAddress("tel:+26451");

		SendSMSRequest req = new SendSMSRequest();

		req.setOutboundSMSMessageRequest(outbound);

		Gson gson = new GsonBuilder().serializeNulls().create();

		String returnString = gson.toJson(req);

		try {
			postRequest(FileUtil.getApplicationProperty("smsendpoint"), returnString, operator);
		} catch (IOException ex) {
			Logger.getLogger(Endpoints.class.getName()).log(Level.SEVERE, null, ex);
		}

		return Response.status(200).entity(returnString).build();
	}

	@GET
	@Path("/sms/response")
	// @Consumes("application/json")
	// @Produces("text/plain")
	@Produces("text/html; charset=UTF-8")
	public Response smsConfirm(@QueryParam("id") String id) throws Exception {
		String msisdn = DatabaseUtils.getUserNameById(id);
		UserRegistrationData userRegistrationData = userMap.get(msisdn);
		String responseString = null;

		String responseHtmlHeader = "<!doctype html>" + "<html class='site no-js lang--en' lang='en'>"
				+ "<head><meta charset='utf-8'><meta http-equiv='x-ua-compatible' content='ie=edge'><title>Mobile Connect</title><meta name='description' content=''><meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no'>"
				+ "<link rel='apple-touch-icon' href='apple-touch-icon.png'>"
				+ "<link rel='apple-touch-icon' href='apple-touch-icon.png'>"
				+ "<link rel='stylesheet' href='../../../resources/css/style.css'>" + "</head>"
				+ "<body class='theme--light'>" + "<div class='site__root'>" + "<header class='site-header'>"
				+ "<div class='site-header__inner site__wrap'>" + "<h1 class='visuallyhidden'>Mobile&nbsp;Connect</h1>"
				+ "<a href='/'><img src='../../../resources/images/svg/mobile-connect.svg' alt='Mobile Connect&nbsp;Logo' width='150' class='site-header__logo'></a>"
				+ "</div>" + "</header>" + "<main class='site__main site__wrap section v-distribute'>"
				+ "<header class='page__header'>" + "<h1 class='page__heading'>SMS Authenticator</h1>" + "<p>";

		String responseHtmlFooter = "</p>" + "</header>"
				+ "<div class='page__illustration v-grow v-align-content'><div>"
				+ "<img src='../../../resources/images/svg/failed.svg' alt='Reset Fail' width='126' height='126'>"
				+ "</div>" + "</div>" + "</main>" + "</div>" + "</body>" + "</html>";

		responseString = responseHtmlHeader + "Your registration confirm time has expired. Please register again"
				+ responseHtmlFooter;

		long waitingTime = Integer.parseInt(FileUtil.getApplicationProperty("waitinTimeInMinutes")) * 1000 * 60;
		long currentTime = System.currentTimeMillis();
		if ((userRegistrationData != null)
				&& (currentTime - userRegistrationData.getUserRegistrationTime()) <= waitingTime) {

			/*
			 * calling add user through profile manage holder - refactoring
			 * start
			 */
			userProfileManager.manageProfile(userRegistrationData);
			/* refactoring finished for SMS registrationz */
			userMap.remove(msisdn);

			responseHtmlFooter = "</p>" + "</header>" + "<div class='page__illustration v-grow v-align-content'><div>"
					+ "<img src='../../../resources/images/svg/successful-action.svg' alt='Reset successful' width='126' height='126'>"
					+ "</div>" + "</div>" + "</main>" + "</div>" + "</body>" + "</html>";

			responseString = responseHtmlHeader
					+ "Welcome to Mobile Connect !, simple and secure login solution with strong privacy protection"
					+ responseHtmlFooter;
		}

		return Response.status(200).entity(responseString).build();
	}

	@GET
	@Path("/ussd/hash")
	// @Consumes("application/json")
	@Produces("application/json")
	public Response userHash(@QueryParam("answer") String answer1) throws IOException, NoSuchAlgorithmException {
		String responseString = null;

		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] hash = digest.digest(answer1.getBytes("UTF-8"));

		StringBuilder hexString = new StringBuilder();

		for (int i = 0; i < hash.length; i++) {
			String hex = Integer.toHexString(0xff & hash[i]);
			if (hex.length() == 1) {
				hexString.append('0');
			}
			hexString.append(hex);
		}

		log.info("UserHash");

		String hashString = hexString.toString();

		responseString = "{" + "\"hash\":\"" + hashString + "\"" + "}";

		return Response.status(200).entity(responseString).build();
	}

	@GET
	@Path("/ussd/init")
	@Produces("application/json")
	public Response initUSSD(@QueryParam("msisdn") String msisdn) {
		// new SendUSSD().sendUSSD(msisdn, sessionID, 4,"mtfin");
		String responseString = null;

		try {
			Integer requestType = DatabaseUtils.getPendingUSSDRequestType(msisdn);

			if (requestType == 1 || requestType == 3) {// Register or PIN reset
				String notifyUrl = FileUtil.getApplicationProperty("notifyurl");
				responseString = SendUSSD.getJsonPayload(msisdn, msisdn, 1, "mtcont", notifyUrl);// notify
																									// url
																									// ->MediationTest
			} else if (requestType == 2) {// User Login
				String notifyUrl = FileUtil.getApplicationProperty("loginNotifyurl");
				String ussdMessage = FileUtil.getApplicationProperty("loginmessage");
				responseString = SendUSSD.getJsonPayload(msisdn, msisdn, "mtcont", notifyUrl, ussdMessage);// notify
																											// url
																											// ->MavenProj
			}
			if (DatabaseUtils.isExistingUser(msisdn)) {
				DatabaseUtils.deleteUser(msisdn);
			}
			DatabaseUtils.insertMultiplePasswordPIN(msisdn);// set numer of
															// attempt = 1
		} catch (Exception ex) {
			Logger.getLogger(Endpoints.class.getName()).log(Level.SEVERE, null, ex);
			// responseString = "{\"status\":\"-1\",\"message\":\"error\"}";
			responseString = "{\"error\":\"404\"}";
		}
		// String responseString =
		// "{\"status\":\"success\",\"message\":\"\"PIN reset request sent to
		// mobile phone \" + msisdn + \".\"}";
		return Response.status(200).entity(responseString).build();
	}

	@GET
	@Path("/ussd/saverequest")
	@Produces("application/json")
	public Response saveRequestType(@QueryParam("msisdn") String msisdn,
			@QueryParam("requesttype") Integer requestType) {

		String responseString = null;
		int status = -1;
		String message = "error";
		try {
			status = DatabaseUtils.saveRequestType(msisdn, requestType);
			message = "success";
		} catch (Exception ex) {
			Logger.getLogger(Endpoints.class.getName()).log(Level.SEVERE, null, ex);
		}
		responseString = "{\"status\":\"" + status + "\",\"message\":\"" + message + "\"}";
		return Response.status(200).entity(responseString).build();
	}

	private static String getHashValue(String value) throws NoSuchAlgorithmException, UnsupportedEncodingException {

		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] hash = digest.digest(value.getBytes("UTF-8"));

		StringBuilder hexString = new StringBuilder();

		for (int i = 0; i < hash.length; i++) {
			String hex = Integer.toHexString(0xff & hash[i]);
			if (hex.length() == 1) {
				hexString.append('0');
			}
			hexString.append(hex);
		}

		log.info("UserHash");

		String hashString = hexString.toString();

		return hashString;
	}

	protected void postRequest(String url, String requestStr, String operator) throws IOException {

		HttpClient client = new DefaultHttpClient();
		HttpPost postRequest = new HttpPost(url);

		postRequest.addHeader("accept", "application/json");
		postRequest.addHeader("Authorization", "Bearer " + FileUtil.getApplicationProperty("accesstoken"));
		postRequest.addHeader("operator", operator);
		log.info("operator :" + operator);
		StringEntity input = new StringEntity(requestStr);
		input.setContentType("application/json");

		postRequest.setEntity(input);

		HttpResponse response = client.execute(postRequest);

		if ((response.getStatusLine().getStatusCode() != 201)) {
			// log.info("Error occurred while calling end points");
		} else {
			// log.info("Success Request");
		}

	}

	@POST
	@Path("/ussd/pin/resend")
	@Consumes("application/json")
	@Produces("application/json")
	public Response ussdPinResend(@QueryParam("operator") String operator, String jsonBody)
			throws SQLException, JSONException {
		Gson gson = new GsonBuilder().serializeNulls().create();
		org.json.JSONObject jsonObj = new org.json.JSONObject(jsonBody);

		log.info(" Json body for ussdPinResend :  " + jsonBody);
		String sessionID = null;

		if (!jsonObj.isNull("sessionID")) {
			sessionID = jsonObj.getString("sessionID");
		}
		String msisdn = null;
		String msisdnStr = jsonObj.getString("msisdn");
		;
		if (msisdnStr != null) {// tel:+tel:+94773333428
			msisdn = msisdnStr.split(":\\+")[2];
		}
		int noOfAttempts = 1;
		String action = "mtcont";
		String status = "PENDING";

		SendUSSD sendUSSD = new SendUSSD();
		try {
			sendUSSD.sendUSSDLogin(msisdn, sessionID, noOfAttempts, action, operator);
			DatabaseUtils.updateStatus(sessionID, status);
		} catch (IOException ex) {
			Logger.getLogger(Endpoints.class.getName()).log(Level.SEVERE, null, ex);
		}
		return Response.status(200).entity("{message:SUCCESS}").build();
	}

	@GET
	@Path("/user/exists")
	// @Consumes("application/json")
	@Produces("application/json")
	public Response sendSMSOneAPI(@QueryParam("username") String userName, String jsonBody)
			throws SQLException, RemoteException, Exception {

		/*connect to user store through user profile manager*/
		String returnString = String.valueOf(userProfileManager.isUserExists(userName));

		return Response.status(200).entity(returnString).build();
	}

	@GET
	@Path("/user/setclaim")
	@Produces("application/json")
	public Response setUserClaimValue(@QueryParam("msisdn") String msisdn, @QueryParam("claimValue") String claimValue)
			throws SQLException, org.codehaus.jettison.json.JSONException, JSONException, RemoteException,
			LoginAuthenticationExceptionException, RemoteUserStoreManagerServiceUserStoreExceptionException {

		LoginAdminServiceClient lAdmin = new LoginAdminServiceClient(FileUtil.getApplicationProperty("isadminurl"));
		String sessionCookie = lAdmin.authenticate(FileUtil.getApplicationProperty("adminusername"),
				FileUtil.getApplicationProperty("adminpassword"));

		RemoteUserStoreServiceAdminClient remoteUserStoreServiceAdminClient = new RemoteUserStoreServiceAdminClient(
				FileUtil.getApplicationProperty("isadminurl"), sessionCookie);
		remoteUserStoreServiceAdminClient.setUserClaim(msisdn, "http://wso2.org/claims/authenticator", claimValue,
				msisdn);
		return Response.status(200).entity("{message:SUCCESS}").build();

	}

	@GET
	@Path("/user/authenticator")
	@Produces("application/json")
	public Response userAuthenticator(@QueryParam("username") String userName, @QueryParam("msisdn") String msisdn,
			@QueryParam("openId") String openId, @QueryParam("password") String pwd, @QueryParam("claim") String claim,
			@QueryParam("domain") String domain, @QueryParam("params") String params,
			@QueryParam("updateProfile") boolean updateProfile, @QueryParam("authenticator") String authenticator,
			String jsonBody) throws Exception {

		UserRegistrationData userRegistrationData = new UserRegistrationData(userName, msisdn, openId, pwd, claim,
				domain, params, updateProfile);
		userMap.put(msisdn, userRegistrationData);

		String responseString = null;

		if (DatabaseUtils.isExistingUser(userName)) {
			DatabaseUtils.deleteUser(userName);
		}

		DatabaseUtils.insertMultiplePasswordPIN(userName);

		if (DatabaseUtils.isExistingUserStatus(userName)) {
			DatabaseUtils.deleteUserStatus(userName);
		}

		// addUser(msisdn, pwd);
		/* calling add user through profile manage holder - refactoring start */
		userProfileManager.manageProfile(userRegistrationData);
		/* refactoring finished */

		DatabaseUtils.insertUserStatus(userName, "Approved");

		return Response.status(200).entity(responseString).build();

	}

	// add data for in-line authentication
	@GET
	@Path("/user/authenticate/add")
	@Produces("application/json")
	public Response sendAuthatication(@QueryParam("scope") String scope, @QueryParam("redirecturi") String redirectUri,
			@QueryParam("clientid") String clientId, @QueryParam("responsetype") String responseType,
			@QueryParam("acrvalue") String acrValue, @QueryParam("msisdn") String msisdn,
			@QueryParam("state") String state, @QueryParam("nonce") String nonce, String jsonBody)
					throws SQLException, RemoteException, Exception {
		UUID tokenId = UUID.randomUUID();
		AuthenticationData authenticationData = new AuthenticationData();
		authenticationData.setScope(scope);
		authenticationData.setTokenID(tokenId.toString());
		authenticationData.setClientId(clientId);
		authenticationData.setRedirectUri(redirectUri);
		authenticationData.setResponseType(responseType);
		authenticationData.setAcrValues(Integer.parseInt(acrValue));
		authenticationData.setMsisdn(msisdn);
		authenticationData.setNonce(nonce);
		authenticationData.setState(state);
		DatabaseUtils.saveAuthenticateData(authenticationData);
		String responseString = tokenId.toString();
		return Response.status(200).entity(responseString).build();
	}

	// get data for in-line authentication
	@GET
	@Path("/user/authenticate/get")
	@Produces("application/json")
	public Response getAuthatication(@QueryParam("tokenid") String tokenid, String jsonBody)
			throws SQLException, RemoteException, Exception {
		AuthenticationData authenticationData = DatabaseUtils.getAuthenticateData(tokenid);
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json = ow.writeValueAsString(authenticationData);
		return Response.status(200).entity(json.toString()).build();
	}

	@GET
	@Path("/user/authenticate/updatemsisdn")
	@Produces("application/json")
	public Response updateAuthaticationMsisdn(@QueryParam("tokenid") String tokenid,
			@QueryParam("msisdn") String msisdn, String jsonBody) throws SQLException, RemoteException, Exception {
		AuthenticationData authenticationData = DatabaseUtils.getAuthenticateData(tokenid);
		DatabaseUtils.updateAuthenticateDataMsisdn(tokenid, msisdn);
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json = ow.writeValueAsString(authenticationData);
		return Response.status(200).entity(json.toString()).build();
	}

	/**
	 * Return the authenticator, based on the defined order in the LOA.xml and
	 * the given the acr value.
	 * 
	 * @param acr
	 *            value of the acr.
	 * @return Json string with authenticator.
	 * @throws Exception
	 */
	@GET
	@Path("/loa/authenticator")
	@Produces("application/json")
	public Response getCorrectAuthenticator(@QueryParam("acr") String acr) throws Exception {

		String returnJson = null;
		int statusCode = 500;
		try {
			log.info("Searching default Authenticator for acr: " + acr);
			LOAConfig config = ConfigLoader.getInstance().getLoaConfig();
			LOA loa = config.getLOA(acr);

			if (loa.getAuthenticators() == null) {
				log.info("Authenticators null and calling config init");
				config.init();
			}
			String selected = selectDefaultAuthenticator(loa.getAuthenticators());

			if (selected == null) {
				returnJson = "{\"status\":\"error\", \"message\":\"Invalid configuration in LOA.xml, couldn't find valid Authenticator\"}";
				log.warn("Error: " + returnJson);
				log.info("Response: \n" + returnJson);
			} else {
				returnJson = "{" + "\"acr\":\"" + acr + "\", \"" + "authenticator\":{\"" + "name\":\"" + selected
						+ "\"}" + "}";
				log.info("Default authenticator for acr:" + acr + " is \n" + returnJson);
				log.info("Response: \n" + returnJson);
				statusCode = 200;
			}
		} catch (Exception e) {
			log.error("Error occurred:" + e);
			returnJson = "{\"status\":\"error\", \"message\":\"" + e + "\"}";
			// TODO handle exception.
			throw e;
		}
		return Response.status(statusCode).entity(returnJson).build();
	}

	/**
	 * Select the first authenticator from, SMSAuthenticator, USSDAuthenticator
	 * or USSDPinAuthenticator
	 * 
	 * @param name
	 *            name of the authenticator.
	 * @return true if valid authenticator found.
	 */
	private String selectDefaultAuthenticator(List<MIFEAbstractAuthenticator> authenticators) {
		try {
			for (MIFEAbstractAuthenticator a : authenticators) {

				String authenticatorName = a.getAuthenticator().getName();
				if ("SMSAuthenticator".equalsIgnoreCase(authenticatorName)
						|| "USSDAuthenticator".equalsIgnoreCase(authenticatorName)
						|| "USSDPinAuthenticator".equalsIgnoreCase(authenticatorName)) {
					String msg = "Found valid authenticator: " + authenticatorName;
					log.debug(msg);
					log.info(msg);
					return authenticatorName;
				}
			}
		} catch (Exception e) {
			log.error("Error found: " + e);
			log.info("Error found: " + e);
		}
		return null;
	}

	

}
