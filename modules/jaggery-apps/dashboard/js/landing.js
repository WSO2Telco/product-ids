$(function () {
    $('.register').click(function () {/*
        var str = "/dashboard/self_registration.jag";

        $.ajax({
            type: "GET",
            url: str

        })
            .done(function (data) {
                json = $.parseJSON(data);
                $('#myModal').modal('show');
                drawPage(json);

            })
            .fail(function () {
                console.log('error');

            })
            .always(function () {
                console.log('completed');
            });
    */});


    $('.login').click(function () {
        window.location = ('index.jag');
    });
});

//function agreedToTerms() {
//
//    if(document.getElementById("tc_checked").checked == true){
//        document.getElementById("validate-btn").disabled = false;
//    }
//    else{
//        document.getElementById("validate-btn").disabled = true;
//    }
//
//}

function drawPage(json) {
    var output = "";
    var body = "";
    var head = "" +
        "            <div class=\"modal-body\" >" +
        "                <form method=\"post\" class=\"form-horizontal\" id=\"selfReg\" name=\"selfReg\" action=\"controllers/user-registration/add.jag?\" >\n" +
        "";
    for (var i in json.pwdRegexps.return) {
        body = body + "                    <input type=\"hidden\" name=\"regExp_" + json.pwdRegexps.return[i].domainName + "\" value=\"" + json.pwdRegexps.return[i].regEx + "\" />\n";
    }
    body = body + "                    <div class=\"control-group\">" +
        //              "                        <label class=\"control-label\" for=\"domain\">Domain Name<span class=\"required\">*</span></label>\n" +
        "                        <div class=\"controls\" style=\"display:none;\" type=\"hidden\">\n" +
        "                            <select class=\"col-lg-3\" name=\"domain\">\n";
    for (var i in json.pwdRegexps.return) {
        body = body + "                                <option value=\"" + json.pwdRegexps.return[i].domainName + "\">" + json.pwdRegexps.return[i].domainName + "</option>\n";
    }
    body = body + "                            </select>\n" +
        "                        </div>\n" +
        "                    </div>\n" +
        "                            <input class=\"col-lg-3\" type=\"hidden\" value=\"\" id=\"user_name\" name=\"userName\"  />\n" +
        "                            <input class=\"col-lg-3\" type=\"hidden\" value=\"\" id=\"password\" name=\"pwd\"  />\n" +
        "                            <input class=\"col-lg-3\" type=\"hidden\" value=\"\" id=\"retype_pwd\" name=\"retypePwd\"  />\n";


    for (var i in json.fieldValues.return) {
        if (json.fieldValues.return[i].required == "true") {
            body = body + "                    <div class=\"control-group\">\n" +
                "                        <label class=\"control-label\" for=\"" + json.fieldValues.return[i].fieldName + "\">" + json.fieldValues.return[i].fieldName;
            if (json.fieldValues.return[i].required == "true") {
                body = body + " <span class=\"required\">*</span>";
                if (json.fieldValues.return[i].regEx != "") {
                    body = body + "      <input type=\"hidden\" name=\"mailRegEx\" value=\"" + json.fieldValues.return[i].regEx + "\" />\n" +
                        "                    <input type=\"hidden\" name=\"mailInput\" value=\"" + json.fieldValues.return[i].claimUri + "\" />\n";
                }

            }

            body = body + "</label>\n" +
                "                        <div class=\"controls\">\n" +
                "                            <input class=\"col-lg-3\" type=\"text\" value=\"\" id=\"" + json.fieldValues.return[i].fieldName + "\" name=\"" + json.fieldValues.return[i].claimUri + "\"  />\n" +
                "                        </div>\n" +
                "                    </div>\n";
        }
    }
    var end = "";

    end = end + "                    <div class=\"control-group\"><div class=\"controls\">" +
        "	               <input type=\"checkbox\" name=\"tc\" id=\"tc_checked\" value=\"tc\" onclick=\"agreedToTerms()\"> By selecting,you agree to our <a href=\"termsConditions.html\" target=\"_blank\" >Terms&Conditions</a> <br>" +

        "<table border=0>"+
                        "<tr>"+
                        "<td>"+
                        "</br>"+
                        "<div>"+
                        "<b>Dialog Mobile Connect Privacy Notice</b>"+
                               "<ul type=\"circle\">"+
                               "       <li>Dialog Mobile Connect Privacy Notice"+
                                       "<li>Mobile Connect service is provided to you by Dialog Axiata PLC. We"+
                                               "care about your privacy and we've kept it Simple<br />"+
                                       "<li>You can login-in privately with Mobile connect and we: <br />"+
                                               "<ul type=\"disc\">"+
                                               "       <li>Never share your phone number with anyone else.<br />"+
                                               "       <li>Never disclose your personal information unless you choose to"+
                                                               "share and give your consent.<br />"+
                                               "</ul>"+
                                       "<li>Click here"+
                                       "       <link to Dialog Mobile connect Privacy Policy> find out how mobile"+
                                      "       connect works and your choices.<br />"+
                                       "<li>We don't want you to worry. You can contact us with any queries or"+
                                       "       concerns about Mobile Connect by sending an email to <contact email>"+
                                       "       <br />"+
                               "</ul>"+
                        "</div>"+
                        "</br>"+
                        "</br>"+
                        "</br>"+
                        "<center>"+
                        "</br>"+
                        "</br>"+
                        "</center>"+
                        "</td>"+
                        "</tr>"+
                        "</table>"+

        "                    </div></div>" +
        "                    </div>" +
        "                   <div class=\"modal-footer\">" +
        "                            <input type=\"button\" id=\"validate-btn\" onclick=\"validate();\" class=\"btn btn-primary\" value=\"Register\" disabled=\"disabled\"/>\n" +
        "                            <input type=\"button\" onclick=\"cancelProcessToLogin();\" class=\"btn\" value=\"Cancel\" data-dismiss=\"modal\" />\n" +
        "                   </div>" +
        "                </form>\n" +
        "    </div>   ";
    output = head + body + end;
    $("#modalData").empty();
    $("#modalData").append(output);

}

/*function cancelProcessToLogin() {
    document.getElementById('light').style.display = 'none';
    document.getElementById('fade').style.display = 'none';

}*/

function cancelProcessToLogin() {
    
    var loginURL = decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*" + "loginRequestURL" + "\\s*\\=\\s*([^;]*).*$)|^.*$"), "$1")) || null;
    var result = {};
    var sp="";
    var url="/dashboard/landing.html";
    
    if(loginURL!=null){
    loginURL.split("&").forEach(function(part) {
    var item = part.split("=");
    result[item[0]] = decodeURIComponent(item[1]);
      if(decodeURIComponent(item[0])=="sp"){
        sp=decodeURIComponent(item[1]);
      }
    });

    var getCallbackURL = "/dashboard/callback.jag?applicationName="+sp;
   
    $.ajax({
        type: "GET",
        url: getCallbackURL,
        async:false,
    }).done(function (data) {
        json = $.parseJSON(data);
        url=json.return.callbackUrl+"?error=access_denied";

         });
    
       }
    //redirect to callback url
    window.location.href =url;

}

var msisdnval='';

 function getParameterByName(name) {
                name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
                return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
            }
            
function validate() {
    var selectQ1 = document.getElementsByName('challengeQuestion1')[0];
    var challengeQ1 = selectQ1.options[selectQ1.selectedIndex].value;
    var selectQ2 = document.getElementsByName('challengeQuestion2')[0];
    var challengeQ2 = selectQ2.options[selectQ2.selectedIndex].value;
    var authenticator=getParameterByName('authenticator');
    var callbackUrl=getParameterByName('callback_url');
    var tokenid=getParameterByName('token');

    var challengeA1 = document.getElementsByName('challengeAns1')[0].value;
    var challengeA2 = document.getElementsByName('challengeAns2')[0].value;

    document.getElementsByName('http://wso2.org/claims/challengeQuestion1')[0].value = challengeQ1 + "!" + challengeA1;
    document.getElementsByName('http://wso2.org/claims/challengeQuestion2')[0].value = challengeQ2 + "!" + challengeA2;
    document.getElementsByName('http://wso2.org/claims/authenticator')[0].value =authenticator; 

    var element = "<div class=\"modal fade\" id=\"messageModal\">\n" +
        "  <div class=\"modal-dialog\">\n" +
        "    <div class=\"modal-content\">\n" +
        "      <div class=\"modal-header\">\n" +
        "        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n" +
        "        <h3 class=\"modal-title\">Modal title</h4>\n" +
        "      </div>\n" +
        "      <div class=\"modal-body\">\n" +
        "        <p>One fine body&hellip;</p>\n" +
        "      </div>\n" +
        "      <div class=\"modal-footer\">\n" +
        "      </div>\n" +
        "    </div>\n" +
        "  </div>\n" +
        "</div>";
    $("#message").empty();
    $("#message").append(element);

    var msisdn = document.getElementsByName("http://wso2.org/claims/mobile")[0];
    msisdnval = msisdn.value;

    if (msisdnval.startsWith('+')) {
        //if user entered value with + (eg: +94XXXXXXXX), remove the '+'
        msisdnval = msisdnval.substring(1, msisdnval.length);
    }

    var fld = document.getElementsByName("userName")[0];
    var value = fld.value;

    //fld.value = "MobileConnect" + Math.floor((Math.random() * 10000) + 1);;
    //var value1 = fld.value;

    fld.value = msisdnval;

    var fldPwd = document.getElementsByName("pwd")[0];
    var value = fldPwd.value;

    fldPwd.value = "cY4L3dBf";
    var value2 = fldPwd.value;

    var fldRe = document.getElementsByName("retypePwd")[0];
    var value = fldRe.value;

    fldRe.value = "cY4L3dBf";
    var value3 = fldRe.value;


    var value4 = msisdnval;


    if (validateEmpty("userName").length > 0) {
        var msg = "Mobile number is required to Register";
        message({
            content: msg, type: 'error', cbk: function () {
            }
        });
        return false;
    }

    if (isNaN(msisdnval)) {
        var msg = "Please enter a valid mobile number to register";
        message({
            content: msg, type: 'error', cbk: function () {
            }
        });
        return false;
    }

    if (validateEmpty("pwd").length > 0) {
        var msg = "Password is required";
        ;
        message({
            content: msg, type: 'error', cbk: function () {
            }
        });
        return false;
    }

    if (validateEmpty("retypePwd").length > 0) {
        var msg = "Password verification is required";
        ;
        message({
            content: '', type: 'error', cbk: function () {
            }
        });
        return false;
    }

    var pwd = $("input[name='pwd']").val();
    var retypePwd = $("input[name='retypePwd']").val();

    if (pwd != retypePwd) {
        var msg = "Password does not match";
        message({
            content: msg, type: 'error', cbk: function () {
            }
        });
        return false;
    }

    var domain = $("select[name='domain']").val();
    var pwdRegex = $("input[name='regExp_" + domain + "']").val();

    var reg = new RegExp(pwdRegex);
    var valid = reg.test(pwd);
    if (pwd != '' && !valid) {
        message({
            content: 'Password does not match with password policy', type: 'error', cbk: function () {
            }
        });
        return false;
    }


    var unsafeCharPattern = /[<>`\"]/;
    var elements = document.getElementsByTagName("input");
    for (i = 0; i < elements.length; i++) {
        if ((elements[i].type === 'text' || elements[i].type === 'password') &&
            elements[i].value != null && elements[i].value.match(unsafeCharPattern) != null) {
            message({
                content: 'Unsafe input found', type: 'error', cbk: function () {
                }
            });
            return false;
        }
    }

    if (!document.getElementsByName("tc")[0].checked) {
        message({
            content: 'Please accept terms & conditions to complete registration',
            type: 'error',
            cbk: function () {
            }
        });
        return false;
    }

    for (i = 0; i < elements.length; i++) {
        if ((elements[i].type === 'text' || elements[i].type === 'password') &&
            (elements[i].value == null || elements[i].value == "" )) {
            message({
                content: 'Input value should not be empty', type: 'error', cbk: function () {
                }
            });
            return false;
        }
    }

    var mailRegex = $("input[name='mailRegEx']").val();
    var mailInputName = $("input[name='mailInput']").val();
    var mailValue = $("input[name='" + mailInputName + "']").val();
    var regMail = new RegExp(mailRegex);
    var validMail = regMail.test(mailValue);
    if (mailValue != '' && !validMail) {
        message({
            content: 'Email is not valid ', type: 'error', cbk: function () {
            }
        });
        return false;
    }
    var strBack;
   if(!tokenid){
      strBack = "/dashboard/backend_service.jag?msisdn=" +msisdnval+"&authenticator="+authenticator;
     }else{
      strBack = "/dashboard/backend_service.jag?msisdn=" +msisdnval+"&authenticator="+authenticator+"&tokenid="+ tokenid;
     }

    var $inputs = $('#selfReg :input');

    // not sure if you wanted this, but I thought I'd add it.
    // get an associative array of just the values.
    var values = {};
    $inputs.each(function () {
        values[this.name] = $(this).val();
    });

    $.ajax({
        type: "GET",
        url: strBack,
        data: values,
        dataType: "json",
        async: false
    }).done(function (data) {
        console.log(data);
        if (data.toString() == 'true') {
            var msg = "User Name is already exist";
            message({
                content: msg, type: 'error', cbk: function () {
                }
            });
            return true;
        }
        else {
            if(callbackUrl){
              window.location = callbackUrl;
            }
            else{
           if(tokenid){
            window.location.href = "waiting.jsp?username=" + msisdnval+"&tokenid="+getParameterByName("token");
                    }else{
            window.location.href = "waiting.jsp?username=" + msisdnval;            
                    }
             }
        }
    });


}
//
//function checkUserRegistered(){
//	//document.selfReg.submit();
//
//	var $inputs = $('#selfReg :input');
//
//    // not sure if you wanted this, but I thought I'd add it.
//    // get an associative array of just the values.
//    var values = {};
//    $inputs.each(function() {
//        values[this.name] = $(this).val();
//    });
//
//	$.ajax({
//		type: "POST",
//		url: "controllers/user-registration/add.jag?",
//		data: values,
//		time: 10000,
//		dataType: "json",
//		cache: false,
//		success: function(data){
//			if(data.status == "ok") {
//				window.location.href = "waiting.jsp?username="+ msisdnval;
//			}
//			else {
//				window.location.href = "index.jag?e=1&error=service_invok_error";
//			}
//		},
//		error: function(data){
//			window.location.href = "index.jag?e=1&error=service_invok_error";
//		}
//	});
//	//window.open("waiting.jsp?username="+ msisdnval);
//       //window.location.href = "waiting.jsp?username="+ msisdnval;
//}
