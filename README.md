
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
    [IDSDEV-839] - NPE occurred when refreshing a token
    [IDSDEV-840] - Database table improvements
    [IDSDEV-841] - User cannot come back to the authentication flow, once he clicks links contained in T&C page. (Specially Mobile Phones)
    [IDSDEV-855] - Some Strings in waiting.jsp don't convert to Portuguese in Voice Authenticator
    [IDSDEV-859] - User Info log entry MSISDN and MSISDN claim not the same
    [IDSDEV-870] - Skipping user registration in API Consent page if user has already been created

Epics
=====
    [IDSDEV-620] - This epic for the tasks which related to attibute sharing freature in mig open source release
    [IDSDEV-884] - Fix SAML SSO and SLO issues in MIG product

Stories
=======
    [IDSDEV-592] - Create rest web-service for off-line user registration
    [IDSDEV-845] - Back channel Implementation

Tasks
=====
    [IDSDEV-621] - User registration flow change based on the user registered status
    [IDSDEV-622] - Customization on user consent mechanisam
    [IDSDEV-702] - Implementing a validation layer for attribute sharing requests
    [IDSDEV-829] - Update Attribute Sharing feature to work with different SPs and Operators

Sub-tasks
=========
    [IDSDEV-623] - Implementing DB services for maintain the user status
    [IDSDEV-624] - Create Rest service for Revoke Consent by Service provider
    [IDSDEV-625] - Create rest service for Revoke Consent by Operator
    [IDSDEV-626] - UI - Customization on user consent page
    [IDSDEV-636] - Document scopes and their related consents to use in attribute sharing
    [IDSDEV-647] - Clam creation automation
    [IDSDEV-648] - Service Provider type Validation
    [IDSDEV-659] - User info endpoint change
    [IDSDEV-669] - Service Provider type validation
    [IDSDEV-671] - Implementing Long-Lived/One-Time consent approaches
    [IDSDEV-675] - Updated the user status according to the scope
    [IDSDEV-677] - Validate the Authorize Request
    [IDSDEV-681] - Implementing DB services for store user consented attributes
    [IDSDEV-695] - Display user consent page for implicit attributes
    [IDSDEV-696] - implement user consent flow for registered user
    [IDSDEV-697] - Update the user consent page to display multiple attributes related to scopes
    [IDSDEV-698] - Implement Off-net user consent flow
    [IDSDEV-703] - Validate mandatory attributes in attribute sharing scope requests and validate SP type
    [IDSDEV-704] - Validate the authorization request for provisioning scopes
    [IDSDEV-707] - Validate attribute sharing scopes against the SPs
    [IDSDEV-708] - Add KYC match related scopes and attributes to Scope-config.xml
    [IDSDEV-713] - Add isHashed tag to the scope-config.xml and update core-util accordingly
    [IDSDEV-723] - Customize the Authentication Flow based on the Service provider type
    [IDSDEV-725] - Code integration of Premium Info Implementation
    [IDSDEV-738] - Bug Fixes for premium info endpoint implementation
    [IDSDEV-746] - PremiumInfo feature creation and bundling to product-ids
    [IDSDEV-747] - Update DB Scripts for Attribute sharing feature
    [IDSDEV-753] - Remove Password field value from master-datasources.xml
    [IDSDEV-754] - Documentation
    [IDSDEV-772] - Bug Fix : LOA level doesn't update from 2 to 3
    [IDSDEV-773] - commit attribute all attribute sharing changes from mig-release-2.1.0-ext-m3 branch to mig-release-2.3.0-attr branch
    [IDSDEV-777] - Test data publishing in Attribute Sharing
    [IDSDEV-842] - Change the customer Info API interface in premiumInfo endpoint implementation
    [IDSDEV-844] - Bug Fixes for Attribute Sharing Feature when merge the code with master
    [IDSDEV-847] - In Proxy level store the Request URl prams details (eg: msisdn/operator/notificationUrl etc) in the DB against a UUID
    [IDSDEV-848] - Pass the BC UUID to IS framwwork and in LOA Composite authenticator Store sessionid against the BC UUID
    [IDSDEV-849] - When the httpClient recieves the code, store Auth Code against the BC UUID Generate a token and save against the BC UUID
    [IDSDEV-850] - Retrieve the signed key from sp_configuratation table (need to store when onboarding a SP) and complete funtion - getSharedKey()
    [IDSDEV-852] - Implement BC SMS authenticator
    [IDSDEV-853] - Implement BC SMSOTP authenticator
    [IDSDEV-854] - Implement support for multiple notification urls
    [IDSDEV-857] - Create generic payload to pass the token to the user
    [IDSDEV-861] - Configurable endpoints
    [IDSDEV-862] - Implement proper error handling and passing response to SP
    [IDSDEV-864] - move token generation call to session updator
    [IDSDEV-865] - update database scripts in product ids
    [IDSDEV-866] - si-endpoint validation for the users and scopes
    [IDSDEV-886] - Unable to do automatic account login for all WSO2Telco products by providing user credentials once.
    [IDSDEV-887] - No option for the users to redirect back to login page after the account locking timeout
    [IDSDEV-888] - Remaining time for enabling account in the Account locking notification is not updating.
    [IDSDEV-891] - Fix api store related issues when SSO enabled in IS


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
