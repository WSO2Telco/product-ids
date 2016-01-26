var timeout = 120000;
var pollingInterval = 2000;
var timeRemaining = timeout;
var hasResponse = false;
var isTimeout = false;
var status;

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
	window.clearInterval(pollingVar);

//	document.getElementById('loginForm').submit();
    //$('#waiting_screen_success').show();
    $('#waiting_screen').hide();
//    setTimeout(function(){window.open("../dashboard/index.jag")}, 5000);
		
		
		//setTimeout was commented out to hide waiting.jsp page 
		//setTimeout(function(){
                 document.getElementById('loginForm').submit();
        //}, 5000);
}

/*
 * Invoke the endpoint to retrieve USSD status.
 */
function checkUSSDResponseStatus() {
	
	var sessionId = document.getElementById('sessionDataKey').value;
	var url = "../SessionUpdater/tnspoints/endpoint/ussd/status?sessionID=" + sessionId;
	var STATUS_PENDING = "PENDING";
	
	$.ajax({
		type: "GET",
		url:url,
		async: false,
		success:function(result){
			if(result != null) {
				var responseStatus = result.status; 
				
				if(responseStatus != null && responseStatus.toUpperCase() != STATUS_PENDING) {
					hasResponse = true;
					status = result.status;
				}
			}
	}});
}


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

function getCookieAndResend() {
	var sessionId=qs('sessionDataKey');
	var name = 'msisdn';
	var msisdn = (name = (document.cookie + ';').match(new RegExp(name + '=.*;'))) && name[0].split(/=|;/)[1];

	$.ajax({
		url: '../UserRegistration-1.0-SNAPSHOT/webresources/endpoint/ussd/pin/resend',
		type: 'POST',
		contentType: "application/json; charset=utf-8",
		data: '{"sessionID":'+sessionId+',"msisdn":"tel:+tel:+'+msisdn+'"}',
		//success: function() { alert('REST Req completed'); }
	});
}