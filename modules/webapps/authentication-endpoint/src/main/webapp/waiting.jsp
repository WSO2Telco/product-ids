<script src="js/waiting.js"></script>
<script type="text/javascript">
	$( document ).ready(function() {
		$("#div_waiting").hide();
		$("#div_waiting_sms").hide();
		$("#div_waiting_pin").hide();
		
		var urlz = document.URL;
		if(urlz.indexOf("authenticators=SMSAuthenticator") > -1) {	
			$("#div_waiting_sms").show();
		}
		else if(urlz.indexOf("authenticators=USSDPinAuthenticator") > -1) {	
			$("#div_waiting_pin").show();
		}
		else {
			$("#div_waiting").show();
		}
	});	
</script>
<div id="div_waiting_pin" class="identity-box">
    <!--Waiting-->
    <div class="alert alert-heading" id="waiting_screen">
        <img alt="" src="images/ajax_loader_gray_48.gif">
        <span><fmt:message key='ussd.waiting.message'/></span>

        <input type="hidden" name="sessionDataKey" id="sessionDataKey" value='<%=request.getParameter("sessionDataKey")%>'/>

        <h3>Check your phone and follow the instructions to login</h3>
        <p>We've sent instructions to your phone</p>

        <h4>Instructions</h4>

        <ol>
            <li>Enter 4 Digit Number as PIN you desire. This will be your token to access the system</li>
            <li>Confirm your PIN selection by pressing Send button</li>
        </ol>


        <p><a href="javascript:getCookieAndResend();">Click here</a> to resend the request or <strong>Call #263*#</strong><strong></strong></p>
    </div>
    <div class="alert alert-success" id="waiting_screen_success" style="display: none">
        <h3>Your registration is successful !! </h3>
        <div class="well-small">
            <a class="btn btn-primary btn-large">Click here to go to login screen</a>
            <p>You will be redirected to the login screen in 5 seconds.</p>
        </div>
    </div>
</div>
<div id="div_waiting" class="identity-box">
    <!--Waiting-->
    <div class="alert alert-heading" id="waiting_screen">
        <img alt="" src="images/ajax_loader_gray_48.gif">
        <span><fmt:message key='ussd.waiting.message'/></span>

        <input type="hidden" name="sessionDataKey" id="sessionDataKey" value='<%=request.getParameter("sessionDataKey")%>'/>

        <h3>Check your phone and follow the instructions to login</h3>
        <p>We've sent instructions to your phone</p>

        <h4>Instructions</h4>

        <ol>
            <li>Click ok to continue with your login</li>
            <li>Problems? Did not receive the prompt</li>
        </ol>


        <p><a>Click here</a> to resend the request or <strong>Call #263*#</strong><strong></strong></p>
    </div>
    <div class="alert alert-success" id="waiting_screen_success" style="display: none">
        <h3>Your registration is successful !! </h3>
        <div class="well-small">
            <a class="btn btn-primary btn-large">Click here to go to login screen</a>
            <p>You will be redirected to the login screen in 5 seconds.</p>
        </div>
    </div>
</div>
<div id="div_waiting_sms" class="identity-box">
    <!--Waiting-->
    <div class="alert alert-heading" id="waiting_screen">
        <img alt="" src="images/ajax_loader_gray_48.gif">
        <span><fmt:message key='ussd.waiting.message'/></span>

        <input type="hidden" name="sessionDataKey" id="sessionDataKey" value='<%=request.getParameter("sessionDataKey")%>'/>

        <h3>Check your phone and follow the instructions to login</h3>
        <p>We've sent a link to your phone</p>

        <h4>Instructions</h4>

        <ol>
            <li>Click on the link in the SMS to complete the login</li>
        </ol>
    </div>
    <div class="alert alert-success" id="waiting_screen_success" style="display: none">
        <h3>Your registration is successful !! </h3>
        <div class="well-small">
            <a class="btn btn-primary btn-large">Click here to go to login screen</a>
            <p>You will be redirected to the login screen in 5 seconds.</p>
        </div>
    </div>


</div>
