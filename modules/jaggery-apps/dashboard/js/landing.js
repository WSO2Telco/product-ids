/*
 * Cancel registrations  and redirect to call back url
 */
 function cancelProcessToRegister(token) {

    var url="/dashboard/landing.jag";
    var tokenVal = token;
    
    if(tokenVal!=null){
        var callbackURL;
        var id=tokenVal;
        var username=getMSISDN(tokenVal);
        var backendurl = "../UserRegistration-1.0-SNAPSHOT/webresources/endpoint/user/authenticate/get?tokenid="+ id;

        $.ajax({
            type: "GET",
            url:backendurl,
            async: false,
            dataType: 'json',
            success:function(result){
                if(result != null) {
                    callbackURL = result.redirectUri; 

                }
            }});

        url = callbackURL+"?error=access_denied";
        console.log("url   " + url);
    }
    /*redirect to callback url*/
    window.location=url;

}

/*
 * decode window locations params
 */
 function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
    results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

/*
 * for the sms registration get assigned values from waiting jsp 
 * or get values from register request
 */
 var msisdnval='';
 var smsClick=false;
 var token='';
 var acr='';
 var operator='';
 if(!smsClick){
    acr=getParameterByName('acr');
    token=getParameterByName('token');
    operator=getParameterByName('operator');
}


/*
 *  registering process starts and initiates the backend service process and 
 *  forward to waiting jsp if the process is success
 * 
 */
 function registration() {

    var authenticator=getParameterByName('authenticator');
    var callbackUrl=getParameterByName('callback_url');
    var updateProfile=getParameterByName('updateProfile');
    var domain="PRIMARY";
    var pwd="cY4L3dBf@";
    var acr_code;
    
    /*for the inline registration get acr code from acr value and msisdn (username) from token*/
    if(token){
        acr_code=getAcrValue();
        msisdnval=getMSISDN(token);
    }else{
        acr_code="USSDAuthenticator";
    }
    
    if(acr_code=="USSDPinAuthenticator"){
        var selectQ1 = document.getElementsByName('challengeQuestion1')[0];
        var challengeQ1 = selectQ1.options[selectQ1.selectedIndex].value;
        var selectQ2 = document.getElementsByName('challengeQuestion2')[0];
        var challengeQ2 = selectQ2.options[selectQ2.selectedIndex].value;

        var challengeA1 = document.getElementsByName('challengeAns1')[0].value;
        var challengeA2 = document.getElementsByName('challengeAns2')[0].value;

        document.getElementsByName('http://wso2.org/claims/challengeQuestion1')[0].value = challengeQ1 + "!" + challengeA1;
        document.getElementsByName('http://wso2.org/claims/challengeQuestion2')[0].value = challengeQ2 + "!" + challengeA2;

    }

    
    var strBack = "/dashboard/backend_service.jag";

    var values = {};
    values["msisdn"] = msisdnval;
    values["token"] = token;
    values["acr_code"] = acr_code;
    values["authenticator"] = authenticator;
    values["domain"] = domain;
    values["pwd"] = pwd;
    values["http://wso2.org/claims/mobile"] = msisdnval;
    values["http://wso2.org/claims/challengeQuestion1"] = challengeQ1 + "!" + challengeA1;
    values["http://wso2.org/claims/challengeQuestion2"] = challengeQ2 + "!" + challengeA2;
    values["smsClick"] = smsClick;
    values["updateProfile"] = updateProfile;
    values["operator"] = operator;
    values["http://wso2.org/claims/loa"] = acr;

    


    $.ajax({
        type: "GET",
        url: strBack,
        data: values,
        dataType: "json",
        async: false
    }).done(function (data) {

        if (data && data.toString() == 'true') {

            var msg = "User Name is already exist";

            return true;

        }else {
            if(callbackUrl){
              window.location = callbackUrl+"&operator="+operator;
          }else{
            var f = document.createElement('form');
            f.action='waiting.jsp';
            f.method='POST';
            var i;

            for (var key in values) {
                console.log(key +" : "+values[key]);
                /*alert(key +" : "+values[key]);*/
                i=document.createElement('input');
                i.type='hidden';
                i.name=key;
                i.value=values[key];
                f.appendChild(i);
            }

            document.body.appendChild(f);
            f.submit();


        }
    }
});



}

/*
 *  validate the msisdn for the self care registration (dashboard signup)
 *  check if user exists return false
 * 
 */
 function validateUser() {

    var status=false;

    var msisdn = document.getElementsByName("msisdn")[0];
    msisdnval = msisdn.value;

    var checkIfExistUser = "/dashboard/user_service.jag?username=" + msisdnval;
    $.ajax({
        type: "GET",
        url: checkIfExistUser,
        async: false
    }).done(function (data) {
        json = $.parseJSON(data);

        if (json.return == 'true') {

            alert("User Name is already exist");

          //window.location.href = "register.jsp?username="+ msisdnval;
      } else {

        status=true;



    }
});


    return status;
}

/*
 *  send acr value and get the authenticator according to LOA 
 * 
 */
 function getAcrValue(){


    var acrReturn="";
    var url = "../UserRegistration-1.0-SNAPSHOT/webresources/endpoint/loa/authenticator?acr="+acr;

    $.ajax({
        type: "GET",
        url:url,
        async: false,
        success:function(result){
            if(result != null) {

             var responseStatus = result.status; 
             if( result.authenticator.name!= null) {

                acrReturn=result.authenticator.name;


            }
        }
    }});

    if(acrReturn == null | acrReturn == "") {
        acrReturn="USSDAuthenticator";
    }
    return acrReturn;

}

/*
 *  return msisdn from the token using authenticate request values 
 * 
 */
 function getMSISDN(token){

    var msisdn='';
    var url = "../UserRegistration-1.0-SNAPSHOT/webresources/endpoint/user/authenticate/get?tokenid="+token;
    
    $.ajax({
        type: "GET",
        url:url,
        async: false,
        success:function(result){
            if(result != null) {

               if( result.msisdn!= null) {
                msisdn=result.msisdn;
                
            }
        }
    }});

    return msisdn;

}

