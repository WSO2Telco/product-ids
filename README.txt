==========================
WSO2Telco Mobile Identity Gateway ${product.version}
==========================

Welcome to the WSO2Telco Mobile Identity Gateway ${product.version} release.

WSO2Telco Mobile Identity Gateway is an open source Identity and Entitlement management server. It supports a wide array of authentication 
protocols such as SAML 2.0 Web SSO, OAuth 2.0/1.0a, OpenID Connect and WS-Federation Passive.
It supports role based authorization and fined grained authorization with XACML 2.0/3.0 while inbound/outbound provisioning is 
supported through SCIM and SPML.

This is based on the revolutionary WSO2 Carbon framework. All the major features have been developed as pluggable Carbon components.

New Features
============

*   Support for Federated MCX

        Federated MCX feature allow Wso2Telco IDS to call different MCX providers. This feature can be easily configured to specific mobile
        network operator to act as federated MCX provider.This allows Service providers to access other MCX providers via wso2telcoids with ease.

*   Support for OAuth 2.0 Token Introspection

        OAuth 2.0 Token Introspection  defines a method for a protected resource to query an OAuth 2.0 authorization server to determine the active
        state of an OAuth 2.0 token and to determine meta-information about this token. meta-information includes current validity, approved scopes,
        and information about the context in which the token was issued.

*   Support for Internationalization

        Language can be switched as per configurations.

*   Support for SMS OTP Authenticator

        This is a secured user authentication service based on a one time password received to user's mobile.

Bug Fixes
=========

    [IDSDEV-628] - HazelcastSerializationException on clustered setup
    [IDSDEV-662] - No error message is displayed for a wrong OTP attempt
    [IDSDEV-668] - If user clicks enter button on OTP field, session is getting crashed (retry.do)
    [IDSDEV-673] - Some fields are not localized in Questions Asking page
    [IDSDEV-687] - HE flow needs new configuration value for IP header
    [IDSDEV-690] - LOA 3 Pin reset flow last USSD message error
    [IDSDEV-700] - FederatedAuthenticator Triggered for other operators
    [IDSDEV-715] - [FederatedIDP] - Production Integration Issues
    [IDSDEV-739] - Waiting page of registration flow contains an invalid character
    [IDSDEV-740] - PIN reset flow is not functioning
    [IDSDEV-741] - User navigates to number entering page when user tries with a login_hint PCR for irrelevant application
    [IDSDEV-742] - SMS login url is not working when shorten url is disabled.
    [IDSDEV-756] - SP Scope validation enabled issue
    [IDSDEV-760] - Dropouts of waiting page during sms process is not counting for DAS reporting
    [IDSDEV-776] - Clustering enabled data publishing issue
    [IDSDEV-787] - SP creates in IS for every registration request in voice authenticator
    [IDSDEV-801] - Duplicates in data publishing for single sessionID
    [IDSDEV-809] - Session time out notification is missing for registration flow
    [IDSDEV-812] - Operator based Authenticators disabling is not applied for 'USSDAuthenticator,'USSDPinAuthenticator',''SMSAuthenticator'.
    [IDSDEV-815] - REDIRECT_TO_CONSENT_PAGE status publish for both Login and Registration Flows
    [IDSDEV-831] - Analytics - Auth Code Success-SMS mismatch
    [IDSDEV-832] - Kibana - State Attribute
    [IDSDEV-833] - User info doesn't response correctly according to the given multi scope
    [IDSDEV-834] - Redirects to an error page when user click cancel or No Thanks button in auth flow
    [IDSDEV-836] - Clicking on link in SMS after reaching expiration time
    [IDSDEV-837] - Click on the expired link in SMS redirects to an empty page with "SMS Authenticator" heading
    [IDSDEV-838] - User gets "authErrorMsg=No+valid+session+found" error for federated IDP

Improvements
=============

*   Display Term and Condition Page per MNO
*   Improved data publishing in the product
*   Supports to extract MSISDN from the login_hint PCR sent by the service providers

Other Key Features
=============

*    Dynamic Authenticator Selection with MNO and SP Level Configuration
*    Enhanced Security with IP Validation for Header Enrichment Authenticator
*    Custom Scope Configuration Support
*    Scope Validation at SP Level
*    Enhanced Configurability for USSD/SMS Messages
*    Configurable User Inputs for USSD Authenticator
*    GSMA Standardized UUID Based PCR Support [Mobile Connect R2 feature]
*    Enhanced Compatibility to Support WSO2.Telco Smart Phone Authenticator App
*    WSO2 Data Analytics Server powered analytics
*    100% open source
*    Fully GSMA MCX R1 compliant
*    Supported authenticators
    - SMS Click OK URL
    - USSD Click OK and Enter PIN
    - Smartphone application or SDK
    - Supports third-party SIM applets via implementation of ETSI TS 102 204


System Requirements
===================

1. Minimum memory - 2 GB

2. Processor - Pentium 800MHz or equivalent at minimum

3. Java SE Development Kit 1.8 or higher

4. The Management Console requires full Javascript enablement of the Web browser.

5. To build WSO2Telco Mobile Identity Gateway from the Source distribution, it is also necessary that you have Maven 3 or later.

    
Installation and Running
========================

1. Extract the downloaded zip file
2. Run the wso2server.sh or wso2server.bat file in the /bin directory
3. Once the server starts, point your Web browser to https://localhost:9443/carbon/
4. User dashboard is available at https://localhost:9443/dashboard
5. For more information, see the Installation Guide

Documentation
=============

Please refer http://docs.wso2telco.com/display/HG/MIG+2.3.0

Reporting Issues
================

We encourage you to report issues, documentation faults and feature requests regarding WSO2Telco Mobile Identiry Gateway through https://jira.wso2telco.com/jira/secure/Dashboard.jspa?selectPageId=10401

WSO2Telco Mobile Identity Gateway Distribution Directory Structure
==================================================================


            CARBON_HOME
                    |--- bin
                    |--- dbscripts
                    |--- lib
                    |--- repository
                    |       |--- components
                    |       |--- conf
                    |       |       |--- identity
                    |       |       |--- identity-providers
                    |       |       |--- service-providers
                    |       |--- database
                    |       |--- deployment
                    |       |--- logs
                    |       |--- resources
                    |       |       |--- identity
                    |       |       |--- security
                    |       |--- tenants
                    |--- tmp


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
      Release information for WSO2 Carbon 5.2.0.

Secure sensitive information in carbon configuration files
----------------------------------------------------------

There are sensitive information such as passwords in the carbon configuration. 
You can secure them by using secure vault. Please go through following steps to 
secure them with default mode. 

1. Configure secure vault with default configurations by running ciphertool 
	script from bin directory.  

> ciphertool.sh -Dconfigure   (in UNIX)  

This script would do following configurations that you need to do by manually 

(i) Replaces sensitive elements in configuration files,  that have been defined in
		 cipher-tool.properties, with alias token values.  
(ii) Encrypts plain text password which is defined in cipher-text.properties file.
(iii) Updates secret-conf.properties file with default keystore and callback class. 

cipher-tool.properties, cipher-text.properties and secret-conf.properties files 
			can be found at repository/conf/security directory. 

2. Start server by running wso2server script from bin directory

> wso2server.sh   (in UNIX)

By default mode, it would ask you to enter the master password 
(By default, master password is the password of carbon keystore and private key) 

3. Change any password by running ciphertool script from bin directory.  

> ciphertool -Dchange  (in UNIX)

For more details see
https://docs.wso2.com/display/Carbon443/WSO2+Carbon+Secure+Vault

Support
=======
We are committed to ensuring that your enterprise middleware deployment is completely supported from
evaluation to production. Our unique approach ensures that all support leverages our open development
methodology and is provided by the very same engineers who build the technology.

For more details and to take advantage of this unique opportunity, visit http://wso2telco.com/services. 


Crypto Notice
=============

This distribution includes cryptographic software.  The country in
which you currently reside may have restrictions on the import,
possession, use, and/or re-export to another country, of
encryption software.  Before using any encryption software, please
check your country's laws, regulations and policies concerning the
import, possession, or use, and re-export of encryption software, to
see if this is permitted.  See <http://www.wassenaar.org/> for more
information.

The U.S. Government Department of Commerce, Bureau of Industry and
Security (BIS), has classified this software as Export Commodity
Control Number (ECCN) 5D002.C.1, which includes information security
software using or performing cryptographic functions with asymmetric
algorithms.  The form and manner of this Apache Software Foundation
distribution makes it eligible for export under the License Exception
ENC Technology Software Unrestricted (TSU) exception (see the BIS
Export Administration Regulations, Section 740.13) for both object
code and source code.

The following provides more details on the included cryptographic
software:

Apacge Rampart   : http://ws.apache.org/rampart/
Apache WSS4J     : http://ws.apache.org/wss4j/
Apache Santuario : http://santuario.apache.org/
Bouncycastle     : http://www.bouncycastle.org/

---------------------------------------------------------------------------
(c) Copyright 2018 WSO2TELCO Inc.
