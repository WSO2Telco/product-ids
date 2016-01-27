var msisdn=values["msisdn"];
var tokenVal=values["token"];
console.log(msisdn+" : "+tokenVal);

var timeout = 60000;
var pollingInterval = 2000;
var timeRemaining = timeout;
var hasResponse = false;
var isTimeout = false;
var status='pending';
var sessionId;
console.log(" timeout : " +timeout+" pollingInterval : " +pollingInterval+" timeRemaining : " +timeRemaining+" hasResponse : " +hasResponse+" isTimeout : " +isTimeout+" status : " +status);

var pollingVar = setInterval(pollForStatus, pollingInterval);
console.log("waiting");

/* 
 * Check for USSD response status if timeout not is reached 
 * or user approval status(USSD) is not specified (YES/NO).
 */
 function pollForStatus() {
 	console.log(" timeout : " +timeout+" pollingInterval : " +pollingInterval+" timeRemaining : " +timeRemaining+" hasResponse : " +hasResponse+" isTimeout : " +isTimeout+" status : " +status);


	// If timeout has not reached.
	if(timeRemaining > 0) {
		// If user has not specified a response(YES/NO).
		
		if(!hasResponse) {
			checkUSSDResponseStatus();
			timeRemaining = timeRemaining - pollingInterval;
			
		} else {
			handleTermination();
			
		}
		
	} else {
		isTimeout = true;
		handleTermination();
	}
}

/*
 * Handle polling termination and form submit.
 */
 function handleTermination() {

 	window.clearInterval(pollingVar);
 	var STATUS_PENDING = "pending";
 	if(!status==STATUS_PENDING){
 		$('.page__header').show();
 		$('#sms_fallback').show();
 	}
 	$('.page__header').hide();
 	$('#sms_fallback').hide();

 	setTimeout(function(){
 		redirectBack();
 	}, 5000);



 }

/*
 * Redirect after end of registration
 */

 
 function redirectBack() {
    // Get the value of the 'loginRequestURL' cookie
    var loginURL = decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*" + "loginRequestURL" + "\\s*\\=\\s*([^;]*).*$)|^.*$"), "$1")) || null;


    if(tokenVal){
    	selfAuthorize();
    }else{

    	if(isTimeout){
    		window.location.href = "./landing.jag";
    	}else{
    		window.location.href = "./account-setup-success.jag";
    	}

    } 


}


/*
 * Invoke the endpoint for self authenticate.
 */
 function selfAuthorize(){
 	var callbackURL;
 	var acr;
 	var authendpoint;
 	var token;
 	var scope;
 	var id=tokenVal;
 	var state;
 	var nonce;
 	var username=msisdn;
 	var url = "../UserRegistration-1.0-SNAPSHOT/webresources/endpoint/user/authenticate/get?tokenid="+ id;

 	$.ajax({
 		type: "GET",
 		url:url,
 		async: false,
 		dataType: 'json',
 		success:function(result){
 			if(result != null) {
 				scope = result.scope; 
 				callbackURL = result.redirectUri; 
 				state= result.state;
 				nonce=result.nonce;
 				clientkey = result.clientId; 
 				acr = result.acrValues; 
 				authendpoint = "../oauth2/authorize"; 
 				token = result.tokenID; 
 			}
 		}});

 	var url = authendpoint + "?scope="+encodeURIComponent(scope)+"&response_type=code&redirect_uri="
 	+ encodeURIComponent(callbackURL) + "&client_id=" + clientkey + "&acr_values=" 
 	+ acr+"&tokenid="+token+"&msisdn="+username+"&state="+state+"&nonce="+nonce + "&operator="+values["operator"];
 	console.log("url   " + url);
 	window.location = url;
 }

 function deleteUser(sessionId){
 	var deleteUserUrl = "/dashboard/delete_user.jag?username=" + sessionId;
 	$.ajax({
 		type: "GET",
 		url: deleteUserUrl,
 		async:false,
 	})
 	.done(function (data) {
 	})
 	.fail(function () {
 		console.log('error');
 	})
 	.always(function () {
 		console.log('completed');
 	});
 }

/*
 * Invoke the endpoint to retrieve USSD status.
 */
 function checkUSSDResponseStatus() {
 	
 	sessionId=msisdn;
 	var url = "../UserRegistration-1.0-SNAPSHOT/webresources/endpoint/ussd/status?username=" + sessionId;

 	var STATUS_APPROVED = "Approved";

 	$.ajax({
 		type: "GET",
 		url:url,
 		async: false,
 		success:function(result){
 			if(result != null) {
 				var responseStatus = result.status; 

 				if(responseStatus != null && responseStatus == STATUS_APPROVED) {
 					status = result.status;
 					console.log("status : "+status);
 					hasResponse = true;
 				}
 			}
 		}});

 }


 function resendUSSD(){

 	var strBack = "backend_service.jag?msisdn=" + msisdn;
 	$.ajax({
 		type: "GET",
 		url: strBack
 	})
 }

/*
 * when sms registration starts clear the polling values.
 * if the status is still pending, start the sms registration.
 */
 function handleTerminationSms() {
 	window.clearInterval(pollingVar);
 	var STATUS_PENDING = "pending";
 	console.log(status +" = " +STATUS_PENDING);
 	if(status==STATUS_PENDING){
 		console.log('changed the flow');
 		console.log(" timeout : " +timeout+" pollingInterval : " +pollingInterval+" timeRemaining : " +timeRemaining+" hasResponse : " +hasResponse+" isTimeout : " +isTimeout+" status : " +status);
 		smsClick=true;
 		token=values["token"];
 		acr=values["acr"];
 		operator=values["operator"];
 		registration();

 	}else{
 		/*when sms link clicked if already registered using ussd*/
 		console.log('registered already');
 		pollForStatus();
 	}

 }
