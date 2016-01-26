<div id="div_waiting" class="identity-box">
    <!--Waiting-->
    <div class="alert alert-heading" id="waiting_screen">
        <img alt="" src="images/ajax_loader_gray_48.gif">
        <span><fmt:message key='ussd.waiting.message'/></span>

        <input type="hidden" name="sessionDataKey" id="sessionDataKey" value='<%=request.getParameter("sessionDataKey")%>'/>

        <h3>Check your phone and follow the instructions to setup your pin</h3>
        <p>We've sent instructions to your phone (+XX XXX***XXX )</p>

        <h4>Instructions</h4>

        <ol>
            <li>Enter 4 Digit Number as PIN you desire. This will be your token to access the system</li>
            <li>Confirm your PIN selection by pressing Send button</li>
            <li>Problems? Didn't receive the PIN Request</li>
        </ol>


        <p><a>Click here</a> to resend the PIN prompt or <strong>Call #263*#</strong> or <strong>Change the Number</strong></p>
    </div>
    <div class="alert alert-success" id="waiting_screen_success" style="display: none">
        <h3>Your registration is successful !! </h3>
        <div class="well-small">
            <a class="btn btn-primary btn-large">Click here to go to login screen</a>
            <p>You will be redirected to the login screen in 5 seconds.</p>
        </div>
    </div>
      <script type="text/javascript">

         setTimeout(myFunction,100);
         function  myFunction(){
         document.getElementById("loginForm").submit();
      }

      </script>


