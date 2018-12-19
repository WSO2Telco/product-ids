
# Welcome to WSO2Telco Mobile Identity Gateway

The WSO2.Telco Mobile Identity Gateway is a standalone solution capable of being the backbone of a fully integrated ID Strategy including SSO, federated 
ID services and more. The ID Gateway is currently the only fully featured open source GSMA certified ID solution. MNO’s can freely download this component
and deploy Mobile Connect or build a PoC by carrying out integrations to their network elements. Further SPs and enterprises can use this solution to implement 
a federated ID solution for their own use.

For Mobile Connect the WSO2.Telco Identity solution consists of authenticators for Levels of Assurance 2 and 3 (LOA2, LOA3) including Header enrichment, SMS,
 USSD and Smartphone applications. The solution also works with third party SIM applets and is GSMA Mobile Connect, GSMA OneAPI V3 and ETSI 102.204 compliant.

This is based on the revolutionary WSO2 Carbon framework. All the major features have been developed as pluggable Carbon components.


New Features
============

*   Back Channelling  - Server initiated authorize request capability without any browser interaction
*   Attribute sharing - Mobile Connect Attribute Sharing feature enables Operators to share information with Service Providers through acquiring user consent from the end user. This includes information about the user as well as details about their device, their account with the Operator and contextual information provided by the network. Currently, this architecture supports attribute provision (in which attribute values are provided to the SP). In a future phase, there will be ability to verify attribute values passed (attribute verification) by the SP against the Operator’s own user records.
*   Consent management - WSO2.Telco Hub API invocation tokens will be issued, via ID gateway once user provides the consent.  This will facilitate consent management for any API via MC.
*   Smart phone authenticator - Authentication for different business process can be done using biometric options available in Android devices.Currently this authenticator only supports  fingerprint and PIN to get the authentication from end user.

Bug Fixes
=========
    [IDSDEV-1079] - User status is marked as 'Active' in the profile when Auth request is send with combination as 'api+attribute'(sms+phone) for SP type TSP1 or TSP2
    [IDSDEV-1080] - API consent page is displayed for scope 'No-Consnet' when validity type is NOT put as 'Undefined'
    [IDSDEV-1081] - Required roles are not assigned for the users having consent_types Implicit & No consent.
    [IDSDEV-1083] - The user unable to proceed second time if the user select 'Approve Always' at the first time.(SP - Explicit/longlive)
    [IDSDEV-1084] - Back_Channeling - API user roles are not assigning for the users when the request was authenticated via SMS authenticate.
    [IDSDEV-1086] - After accepting the consents, the 'consent_user_history' does not update.
    [IDSDEV-1088] - Proper application name is not displaying in the consent page

Known Issues
============
    [IDSDEV-1082] - Consent page is not displaying for onnet 'mnv' scope and Untrusted(Normal) SP
    [IDSDEV-1085] - Back_Channeling - LOA 3 level is not supported.
    [IDSDEV-1089] - LOA.xml file is depending on the feature
    [IDSDEV-1090] - SAA App - It is not supported for multiple operators and only dialog.
    [IDSDEV-1091] - SAA App - There are several configurations that were hardcoded and it is not possible to change after SAA.apk is built.
    [IDSDEV-1092] - SAA app - SAA app cannot be registered with the msisdn and continue, if the SAA App is configured with TSP1 & TSP2 sp levels.
    [IDSDEV-1093] - SAA App - if there is any interruption while registering, app is waiting forever, no time out
    [IDSDEV-1094] - Contact info are not available retry page in the SAA app
    [IDSDEV-1095] - SAA App - User is unable to receive the request from SP to respond from mobile app..
    [IDSDEV-1096] - SAA App - When resetting the PIN, there is not limitation to re-enter the exisitng PIN.
    [IDSDEV-1097] - SAA App - There is no option to reset the PIN, if the user forget the PIN.
    [IDSDEV-1067] - In Backchannel SMS OTP Authentication OTP entering page should be directed when Click on the sms url
    [IDSDEV-1068] - Implement trusted untrusted sp handling for openid workflow
    [IDSDEV-1069] - Show TnC pages for partially active users and make them active



### Other Key Features

* 100% open source

* Fully GSMA MCX R1 compliant

* Supported authenticators
 	- 	SMS OTP & Click OK URL
	-	USSD Click OK and Enter PIN
	-	Smartphone application or SDK
	-	Supports third-party SIM applets via implementation of ETSI TS 102 204

System Requirements
===================

1. Minimum memory - 2 GB

2. Processor - Pentium 800MHz or equivalent at minimum

3. Java SE Development Kit 1.7 or higher

4. The Management Console requires full Javascript enablement of the Web browser.

5. To build WSO2Telco Mobile Identity Gateway from the Source distribution, it is also necessary that you have Maven 3 or later.

For more details see
   http://docs.wso2telco.com/display/MIG210/Developer+Guide


Project Resources
=================

* Home page          		: http://wso2telco.com/gateways/identity-gateway
* Wiki               		: http://docs.wso2telco.com/display/MIG210/
* JIRA-Issue Tracker 		: https://jira.wso2telco.com/jira/projects/IDSDEV      
* WSO2.Telco  Developer List: dev@wso2telco.org

    
Installation and Running
========================

1. Extract the downloaded zip file
2. Run the wso2server.sh or wso2server.bat file in the /bin directory
3. Once the server starts, point your Web browser to https://localhost:9443/carbon/
4. For more information, see the Installation Guide


WSO2 Telco Mobile Identity Gateway Distribution Directory Structure
====================================================================

            CARBON_HOME
            ├── bin
            ├── dbscripts
            ├── lib
            ├── repository
            │   ├── components
            │   ├── conf
            │   │   └── identity
            │   │       ├── identity-providers
            │   │       └── service-providers
            │   ├── database
            │   ├── deployment
            │   ├── logs
            │   ├── resources
            │   │   ├── identity
            │   │   └── security
            │   └── tenants
            └── tmp


    - bin
      Contains various scripts .sh & .bat scripts.

    - dbscripts
      Contains the database creation & seed data population SQL scripts for
      various supported databases.

    - lib
      Contains the basic set of libraries required to startup Carbon.

    - repository
      The repository where Carbon artifacts & Axis2 services and 
      modules deployed in WSO2 Carbon are stored. 
      In addition to this other custom deployers such as
      dataservices and axis1services are also stored.

    	- components
          Contains all OSGi related libraries and configurations.

        - conf
          Contains server configuration files. Ex: axis2.xml, carbon.xml

	        - identity
	          Contains all configurations related to identity.

	            - identity-providers
	              Identity providers configured using file

	            - service-providers
	              Service providers configured using file

        - database
          Contains the WSO2 Registry & User Manager database.

        - deployment
          Contains server side and client side Axis2 repositories. 
	      All deployment artifacts should go into this directory.

        - logs
          Contains all log files created during execution.

        - resources
          Contains additional resources that may be required.

	- tenants
	  Directory will contain relevant tenant artifacts 
	  in the case of a multitenant deployment.

    - tmp
      Used for storing temporary files, and is pointed to by the
      java.io.tmpdir System property.


    - LICENSE.txt
      Apache License 2.0 under which WSO2 Carbon is distributed.

    - README.txt
      This document.

    - release-notes.html
      Release information for WSO2 Carbon ${carbon.product.version}.



Support
=======
We are committed to ensuring that your enterprise middleware deployment is completely supported from evaluation to production. Our unique approach ensures that all support leverages our open development methodology and is provided by the very same engineers who build the technology.

For more details and to take advantage of this unique opportunity please visit http://wso2telco.com/services.


### Big Thanks

Cross-browser Testing Platform and Open Source &#10084; Provided by 
![Alt text](https://github.com/WSO2Telco/product-ids/blob/master/images/LOGO_Sauce-Labs_Horiz_Red-Grey_RGB.png)
 https://saucelabs.com	

---------------------------------------------------------------------------
(c) Copyright 2018 WSO2Telco
