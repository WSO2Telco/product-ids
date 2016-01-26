$(document).ready(function() {
	var msisdn = getCookie("msisdn");

        /*
	if(msisdn != null && msisdn.length != 0) {
		document.getElementById('msisdn').value = msisdn;
		document.getElementById('loginForm').submit();

	} else {
		document.getElementById('loginForm').submit();
	}
	//submitLoginForm();
        */
       document.getElementById('loginForm').submit();
	
});

function setCookie(cname, expirydays) {

	var cvalue = document.getElementById('msisdn').value;

    var date = new Date();
    date.setTime(date.getTime() + (expirydays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + date.toGMTString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var cookieArray = document.cookie.split(';');
    for(var i = 0; i < cookieArray.length; i++) {
        var cookie = cookieArray[i];
        while (cookie.charAt(0) == ' ') {
        	cookie = cookie.substring(1);
        }
        if (cookie.indexOf(name) != -1) {
        	return cookie.substring(name.length,cookie.length);
        }
    }
    return "";
}

function submitLoginForm() {
	setCookie("msisdn", 1);
	document.getElementById('loginForm').submit();
}