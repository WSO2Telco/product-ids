var timeout = 60000;
var pollingInterval = 2000;
var timeRemaining = timeout;
var hasResponse = false;
var isTimeout = false;
var status='pending';
var sessionId;

var pollingVar = setInterval(pollForStatus, pollingInterval);

/* 
 * Check for USSD response status if timeout not is reached 
 * or user approval status(USSD) is not specified (YES/NO).
 */
function pollForStatus() {

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
	//window.clearInterval(pollingVar);
	//window.open("./landing.html",'_self',"User Registration");
	
	window.clearInterval(pollingVar);
	var STATUS_PENDING = "pending";
	if(!status==STATUS_PENDING){
		$('#waiting_screen_success').show();
	}
	$('#waiting_screen').hide();
	//setTimeout(redirectBack(), 5000);
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
    if(!loginURL) {
    	window.location.href = "./landing.html";
    } else {
    	if(tokenid){
    	selfAuthorize();
                 }else{
    	window.location.href = loginURL;
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
      var id=qs("tokenid");
      var username=qs("username");
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
                clientkey = result.clientId; 
                acr = result.acrValues; 
                authendpoint = "../oauth2/authorize"; 
                token = result.tokenID; 
        }
	}});

   var url = authendpoint + "?scope="+encodeURIComponent(scope)+"&response_type=code&redirect_uri="
          + encodeURIComponent(callbackURL) + "&client_id=" + clientkey + "&acr_values=" 
          + acr+"&tokenid="+token+"&msisdn="+username;
      
       window.location = url;
}

/*
 * Invoke the endpoint to retrieve USSD status.
 */

function qs(key) {
	
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars[key];
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

function checkUSSDResponseStatus() {
	
	//var sessionId = document.getElementById('username').value;
	sessionId=qs('username');
	
	///var url = "../MediationTest/tnspoints/endpoint/ussd/status?sessionID=" + sessionId;
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
					hasResponse = true;
				}
			}
	}});
}


function resendUSSD(){
	var msisdn=qs('username');
	/*
	$.ajax({
    url: 'backend_service.jag',
    type: 'GET',
    error: function(){
        alert('NOT EXISTS');
    },
    success: function(){
        alert('EXISTS');
    }
	});
	*/
	var strBack = "backend_service.jag?msisdn=" + msisdn;
	$.ajax({
	    type: "GET",
	    url: strBack
	})
}
