


<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Login with WSO2 Identity Server</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/dashboard/assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="/portal/gadgets/user_profile/js/jquery.min.js" type="text/javascript"></script>
    <script src="/portal/gadgets/user_profile/js/main.js" type="text/javascript"></script>
    <script src="/portal/gadgets/user_profile/js/modal.js" type="text/javascript"></script>
    <script src="/dashboard/js/landing.js" type="text/javascript"></script>
    <link href="css/styles-axiata-dashboard.css" rel="stylesheet" type="text/css" />

	<script src="/portal/gadgets/user_profile/js/jquery.min.js" type="text/javascript"></script>
	<script src="js/waiting.js"></script>
<script type="text/javascript">
	$( document ).ready(function() {
		$("#div_waiting").hide();
		$("#div_waiting_sms").show();
	});	
</script>
</head>

<body>


<div id="wrap">
    <a class="brand"
       href="/dashboard/landing.html?"
       onclick="jagg.sessionAwareJS({redirect:'/dashboard/landing.html?',e:event})">
        <img
                alt="API Store"
                src="/authenticationendpoint/images/logo.png"
                >
    </a>

    <div class="navbar main-menu">
        <div class="navbar-inner main-menu-navbar">

            <ul class="nav orderFix">

                <li>
                    <a class="link-home" href="landing.html" title="WSO2Telco home page.">
                        Home
                    </a>
                </li>
                <li>
                    <a href="index.jag" >Login</a>
                </li>
                <li class="active">
                    <a href="register.jag" >Sign-up</a>
                </li>
            </ul>


        </div>
    </div>



    <div class="container-fluid">
        <div class="row-fluid">


            <div class="span12">



                <div class="container login-container">
                    <div class="row-fluid">
                        <div class="span12 login-content">

                            <div class="clear"></div>
                            <div class="content-data">
                                <div id="local_auth_div">

                                    <div class="listing" id="listing">
                                        <div class="title-section">
										<!--<h2>Register</h2> -->
                                        </div>


                                        
                                        
                                        
                                        
<div id="div_waiting" class="identity-box">
    <!--Waiting-->
    <div class="alert alert-heading" id="waiting_screen">
        <img alt="" src="img/ajax_loader_gray_48.gif">
        <span>Waiting for user response</span>

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


</div>
 <div id="div_waiting_sms" class="identity-box">
    <!--Waiting-->
    <div class="alert alert-heading" id="waiting_screen">
        <img alt="" src="img/ajax_loader_gray_48.gif">
        <span><fmt:message key='ussd.waiting.message'/></span>

        <input type="hidden" name="sessionDataKey" id="sessionDataKey" value='<%=request.getParameter("sessionDataKey")%>'/>

        <h3>Check your phone and follow the instructions to complete login</h3>
        <p>We've sent a link to your phone</p>

        <h4>Instructions</h4>

        <ol>
		    <li>Enter 4 Digit Number as PIN you desire. This will be your token to access the system</li>
            <li>Confirm your PIN selection by pressing Send button</li>
            <li>Problems? Didn't receive the PIN Request</li>

        </ol>
		<p><a href="javascript:resendUSSD();">Click here</a> to resend the PIN prompt or <strong></strong><strong>Change the Number</strong></p>

    </div>
    <div class="alert alert-success" id="waiting_screen_success" style="display: none">
        <h3>Your registration is successful !! </h3>
        <div class="well-small">
            <a class="btn btn-primary btn-large">Click here to go to login screen</a>
            <p>You will be redirected to the login screen in 5 seconds.</p>
        </div>
    </div>
</div>                                      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                  
    		
                  
                                    
                                    
                                    
                                    
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>


        </div>
    </div>
    <div id="push"></div>
</div>

<div id="footer" class="footer-main">
         <div class="row-fluid">
                   <div class="span12">
                           <div class="container-fluid">
		                      <div class="row-fluid">
				                   <div class="span3 footer-left-most">
				                          <ul class="help-links">
				                                <li><h5><a href="http://wso2telco.com" target="_blank">About Us</a></h5></li>
				                          </ul>
				                     </div>
				                     <div class="span9 help-and-links">

						                <div class="span3">
						                  <ul class="help-links">
						                        <li><h5><a href="http://wso2.com/privacy-policy" target="_blank">Privacy Policy</a></h5></li>
						                        <li><h5><a href="http://wso2.com/terms-of-use" target="_blank">Terms and Conditions</a></h5></li>

						                  </ul>
						                </div>
						                <div class="span3">
						                  <ul class="help-links">
						                        <li><h5>Social Networking</h5></li>
						                        <li>
						                        <h5>
						                        <table class="share-pane">
						                      <tr>
						                          <td><a class="facebook" target="_blank" rel="external nofollow" href="https://www.facebook.com/wso2telco" title="Share with your friends on Facebook"></a></td>
						                          <td><a class="twitter" target="_blank" rel="external nofollow" href="http://twitter.com/wso2telco" title="Twitter"></a></td>
						                          <td><a class="linkedin" target="_blank" rel="external nofollow" href="https://www.linkedin.com/groups/WSO2-Telco-8263390?gid=8263390&mostPopular=&trk=tyah&trkInfo=idx%3A1-1-1%2CtarId%3A1425100882984%2Ctas%3Awso2.telco" title="Share this post on linkedin" title="Share this post on linkedin"></a></td>
						                      </tr>
						                    </table>
						                   </li>
						                   </ul>
						                 </div>

						                 <div class="span3">
						                  <ul class="help-links">
						                        <li><h5><a href="http://wso2telco.com" target="_blank">Contact Us</a></h5></li>
						                        <li><h5><a href="http://wso2.com/support" target="_blank">Support</a></h5></li>
						                  </ul>
						                </div>
						    		<div  style="clear:both">
								</div>   <hr />  <a class="powered-by-logo pull-right" href="http://wso2telco.com" target="_blank"></a>
						            
							</div>
		                            </div>
                                   </div>
                      </div>
          </div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Register</h4>
            </div>
            <div id="modalData">

            </div>
        </div>
    </div>
</div>


<div id="message"></div>
<script src="/portal/gadgets/user_profile/js/modal.js" type="text/javascript"></script>


<div id="gadgetBody"></div>
<div id="message"></div>

</body>
</html>
