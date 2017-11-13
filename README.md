
# Welcome to WSO2Telco Mobile Identity Gateway

The WSO2.Telco Mobile Identity Gateway is a standalone solution capable of being the backbone of a fully integrated ID Strategy including SSO, federated 
ID services and more. The ID Gateway is currently the only fully featured open source GSMA certified ID solution. MNO’s can freely download this component
and deploy Mobile Connect or build a PoC by carrying out integrations to their network elements. Further SPs and enterprises can use this solution to implement 
a federated ID solution for their own use.

For Mobile Connect the WSO2.Telco Identity solution consists of authenticators for Levels of Assurance 2 and 3 (LOA2, LOA3) including Header enrichment, SMS,
 USSD and Smartphone applications. The solution also works with third party SIM applets and is GSMA Mobile Connect, GSMA OneAPI V3 and ETSI 102.204 compliant.

This is based on the revolutionary WSO2 Carbon framework. All the major features have been developed as pluggable Carbon components.

## New Features

* Dynamic Authenticator Selection with MNO and SP Level Configuration

* Enhanced Security with IP Validation for Header Enrichment Authenticator

* Custom Scope Configuration Support

* Scope Validation at SP Level

* Enhanced Configurability for USSD/SMS Messages

* Configurable User Inputs for USSD Authenticator

* GSMA Standardized UUID Based PCR Support [Mobile Connect R2 feature]

* Enhanced Compatibility to Support WSO2.Telco Smart Phone Authenticator App

* WSO2 Data Analytics Server powered analytics


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

---------------------------------------------------------------------------
(c) Copyright 2017 WSO2Telco
