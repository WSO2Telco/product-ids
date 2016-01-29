<!doctype html>
<html class="site no-js lang--en" lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Mobile Connect</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">

  <link rel="apple-touch-icon" href="apple-touch-icon.png">
  <link rel="stylesheet" href="mcresources/css/style.css">

  
  <!-- load main script early asyncronously -->
  <script type="text/javascript" src="mcresources/js/main.js" async></script>
  <script src="/portal/gadgets/user_profile/js/jquery.min.js" type="text/javascript"></script>
  <script src="/portal/gadgets/user_profile/js/main.js" type="text/javascript"></script>
  <script src="/portal/gadgets/user_profile/js/modal.js" type="text/javascript"></script>
  <script src="/dashboard/js/landing.js" type="text/javascript"></script>



  <noscript>
    <!-- Fallback synchronous download, halt page rendering if load is slow  -->
    <link href="//fonts.googleapis.com/css?family=Roboto:400,300,700,400italic,300italic,700italic" rel="stylesheet" type="text/css">
  </noscript>
  <!-- loads fonts asyncronously preventing font loading from block page render -->
  <script>
    // Config for loading the web fonts
    var WebFontConfig = {
      google: {
        families: ['Roboto:400,300,700,400italic,300italic,700italic']
      },
      active: function() {
        // Set a cookie that the font has been downloaded and should be cached
        var d = new Date();
        d.setTime(d.getTime() + (7 * 86400000)); // plus 7 Days
        document.cookie = "cachedroboto=true; expires=" + d.toGMTString() + "; path=/";
      }
    };
    </script>
    <script src="mcresources/js/vendor/webfontloader.js"></script>
    <!-- Adds IE root class without breaking doctype -->
  <!--[if IE]>
        <script>document.documentElement.className = document.documentElement.className + " ie";</script>
        <![endif]-->
        <script type="text/javascript" src="mcresources/js/vendor/modernizr.js"></script>
        <%
        String acr = request.getParameter("http://wso2.org/claims/loa")!= null ?  request.getParameter("http://wso2.org/claims/loa") : "";
        String token = request.getParameter("token")!= null ?  request.getParameter("token") : "";
        String operator = request.getParameter("operator")!= null ?  request.getParameter("operator") : "";
        String msisdn = request.getParameter("msisdn")!= null ?  request.getParameter("msisdn") : "";
        String acr_code = request.getParameter("acr_code")!= null ?  request.getParameter("acr_code") : "";
        // Boolean smsClick = Boolean.valueOf(request.getParameter("smsClick"))!= null ?  Boolean.valueOf(request.getParameter("smsClick")) : false;
        String smsClick = request.getParameter("smsClick")!= null ?  request.getParameter("smsClick") : "false";


        if(operator != ""){
        %>
        <link href="css/branding/<%=operator%>-style.css" rel="stylesheet">
        <%}%>
        <script type="text/javascript">
        var values = {};
        values["msisdn"] = "<%=msisdn%>";
        values["token"] = "<%=token%>";
        values["acr"] = "<%=acr%>";
        values["smsClick"] = "<%=smsClick%>";
        values["operator"] = "<%=operator%>";

        

        </script> 
        <script src="js/waiting.js"></script>
      </head>

      <body class="theme--light">
        <div class="site__root">
          <header class="site-header">
            <div class="site-header__inner site__wrap">
              <h1 class="visuallyhidden">Mobile&nbsp;Connect</h1>
              <a href="/"><img src="mcresources/img/svg/mobile-connect.svg" alt="Mobile Connect&nbsp;Logo" width="150" class="site-header__logo"></a>
              
              <% if(operator != ""){ 
              String imgPath = "img/branding/" + operator + "_logo.svg";
              %>
              <p class="site-header__powered-by">powered&nbsp;by      
              </p>
              <a >
                <img class="brandLogo" src='<%= imgPath %>' alt='<%= operator %>' >
              </a>
              <% } %>





       <!--  <form action="/lang" class="site-header__lang-menu field--select field--select-plain" novalidate>
          <label for="field-select-lang" class="visuallyhidden">Language:</label>
          <select id="field-select-lang" name="lang" class="field__select-native js-transparent">
            <option value="en" selected>English&nbsp;(UK)</option>
            <option value="de">Deutsche</option>
            <option value="th">ภาษาไทย</option>
          </select>

          

          <input type="hidden" name="return-url" value="/registration/on-device">
          <input type="submit" value="Go" class="btn btn--natural btn--light js-visuallyhidden">
        </form> -->
      </div>
    </header>

    <main class="site__main site__wrap section v-distribute">
      <header class="page__header">
        <h1 class="page__heading">
          We've sent a message to your&nbsp;mobile
        </h1>
        <div id="instruction_USSDAuthenticator">
         <p><strong>Reply with 1 to continue with your Registration.</strong></p>

       </div>
       <div id="instruction_SMSAuthenticator" style="display:none">
         <p><strong>Click on the link in SMS from Mobile Connect to complete Registration.</strong></p>

       </div>
       <div id ="LoA3" style="display:none">
        <p><strong>Please enter your 4-digit Mobile Connect PIN to continue with your Registration.</strong></p>
        <p>Sometimes when using Mobile Connect, you'll need to enter a PIN for extra security. Please follow the instructions on your mobile to create a&nbsp;PIN.</p>
      </div>
    </header>

    <div class="page__illustration v-grow v-align-content">
      <div>

        <div class="timer-spinner-wrap">
          <div class="timer-spinner">
            <div class="pie spinner"></div>
            <div class="pie filler"></div>
            <div class="mask"></div>
          </div>
          <img src="mcresources/img/svg/phone-pin.svg" width="52" height="85">
        </div>
      </div>
    </div>
    <div class="error-copy space--bottom hide" id="timeout-warning">
      Your mobile session is about to&nbsp;timeout.
      <br>Check your&nbsp;device.
    </div>
    <div align="center" id ="sms_fallback" style="display:block">
      <p>No message arrived? <br><u><a onclick="sendSms()" style="cursor: pointer;">Click to get a text message instead.</a><u></p>
    </div>
    <a onclick="cancelProcessToRegister('<%=token%>')" class="btn btn--outline btn--full btn--large">
      Cancel
    </a>
  </main>
</div>




<script type="text/javascript">

var e1 = document.getElementById("sms_fallback");
var e2 = document.getElementById("LoA3");
var instruction_USSDAuthenticator = document.getElementById("instruction_USSDAuthenticator");
var instruction_SMSAuthenticator = document.getElementById("instruction_SMSAuthenticator");
if("<%=acr_code%>"=="USSDPinAuthenticator" ){
  instruction_USSDAuthenticator.style.display = 'none';
  e1.style.display = 'none';
  e2.style.display = 'block';
}
if("<%=acr_code%>"=="USSDAuthenticator" ){
  e1.style.display = 'block';
  e2.style.display = 'none';
}

if(values["smsClick"]=="true"){
  e1.style.display = 'none';
  e2.style.display = 'none';
  instruction_USSDAuthenticator.style.display = 'none';
  instruction_SMSAuthenticator.style.display = 'block';
}

function sendSms(){

  e1.style.display = 'none';
  console.log(isTimeout);

  isTimeout = true;
  handleTerminationSms();

}

</script>
</body>

</html>
