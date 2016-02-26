-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dev2_axiatadb
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `endpointapps`
--
CREATE DATABASE ids_operatorsdb;
USE ids_operatorsdb;

DROP TABLE IF EXISTS `endpointapps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endpointapps` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `endpointid` int(11) DEFAULT NULL,
  `applicationid` int(11) DEFAULT NULL,
  `isactive` int(11) DEFAULT '0',
  `created` varchar(25) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastupdated` varchar(25) DEFAULT NULL,
  `lastupdated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_apps_endpoint` (`endpointid`,`applicationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpointapps`
--

LOCK TABLES `endpointapps` WRITE;
/*!40000 ALTER TABLE `endpointapps` DISABLE KEYS */;
/*!40000 ALTER TABLE `endpointapps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcc_number_ranges`
--

DROP TABLE IF EXISTS `mcc_number_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcc_number_ranges` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `mcccode` varchar(10) DEFAULT NULL,
  `rangefrom` decimal(20,0) DEFAULT NULL,
  `rangeto` decimal(20,0) DEFAULT NULL,
  `mnccode` varchar(20) DEFAULT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `isactive` int(2) DEFAULT '1',
  `note` varchar(255) DEFAULT NULL,
  `created` varchar(25) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastupdated` varchar(25) DEFAULT NULL,
  `lastupdated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcc_number_ranges`
--

LOCK TABLES `mcc_number_ranges` WRITE;
/*!40000 ALTER TABLE `mcc_number_ranges` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcc_number_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantopco_blacklist`
--

DROP TABLE IF EXISTS `merchantopco_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchantopco_blacklist` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `application_id` int(20) DEFAULT NULL,
  `operator_id` int(20) DEFAULT NULL,
  `subscriber` varchar(40) DEFAULT NULL,
  `merchant` varchar(255) DEFAULT NULL,
  `isactive` int(11) DEFAULT '1',
  `note` varchar(255) DEFAULT NULL,
  `created` varchar(25) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastupdated` varchar(25) DEFAULT NULL,
  `lastupdated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `constr_ID` (`application_id`,`operator_id`,`subscriber`,`merchant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantopco_blacklist`
--

LOCK TABLES `merchantopco_blacklist` WRITE;
/*!40000 ALTER TABLE `merchantopco_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchantopco_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operatorapps`
--

DROP TABLE IF EXISTS `operatorapps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operatorapps` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `applicationid` int(11) DEFAULT NULL,
  `operatorid` int(11) DEFAULT NULL,
  `isactive` int(11) DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  `created` varchar(25) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastupdated` varchar(25) DEFAULT NULL,
  `lastupdated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatorapps`
--

LOCK TABLES `operatorapps` WRITE;
/*!40000 ALTER TABLE `operatorapps` DISABLE KEYS */;
/*!40000 ALTER TABLE `operatorapps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operatorendpoints`
--

DROP TABLE IF EXISTS `operatorendpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operatorendpoints` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `operatorid` int(11) DEFAULT NULL,
  `api` varchar(25) DEFAULT NULL,
  `isactive` int(11) DEFAULT '0',
  `endpoint` varchar(255) DEFAULT NULL,
  `created` varchar(25) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastupdated` varchar(25) DEFAULT NULL,
  `lastupdated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatorendpoints`
--

LOCK TABLES `operatorendpoints` WRITE;
/*!40000 ALTER TABLE `operatorendpoints` DISABLE KEYS */;
INSERT INTO `operatorendpoints` VALUES (1,1,'smsmessaging',1,'http://localhost:9763/mifesandbox/SandboxController/smsmessaging/1',NULL,'2014-03-04 06:06:23',NULL,NULL),(2,1,'payment',1,'http://localhost:9763/mifesandbox/SandboxController/payment/1',NULL,'2014-03-04 06:06:58',NULL,NULL),(3,3,'location',1,'http://localhost:9763/mifesandbox/SandboxController/location/1',NULL,'2014-10-02 05:03:41',NULL,NULL);
/*!40000 ALTER TABLE `operatorendpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operators`
--

DROP TABLE IF EXISTS `operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operators` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `operatorname` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` varchar(25) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `lastupdated` varchar(25) DEFAULT NULL,
  `lastupdated_date` timestamp NULL DEFAULT NULL,
  `refreshtoken` varchar(255) DEFAULT NULL,
  `tokenvalidity` double DEFAULT NULL,
  `tokentime` double DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `tokenurl` varchar(255) DEFAULT NULL,
  `tokenauth` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `operatorname` (`operatorname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operators`
--

LOCK TABLES `operators` WRITE;
/*!40000 ALTER TABLE `operators` DISABLE KEYS */;
INSERT INTO `operators` VALUES (1,'DIALOG','Dialog Opearator','axatauser',NULL,'axatauser',NULL,'gGgvUANAGhRUzWTyXwYoGuk3WzQa',157680000,1395135145139,'4fb164d70def9f37b2f8e2f1daf467','http://localhost:8281/token','Basic U1JObDQzXzRTVks5MjZaVnNteXExOU1JNVFRYTpEV1Flb2NDeUVyN0lHYk8zRHJxRDc5SmtzVFVh'),(2,'CELCOM','Celcom Opearator','axatauser',NULL,'axatauser',NULL,'gGgvUANAGhRUzWTyXwYoGuk3WzQa',157680000,1395135145139,'4fb164d70def9f37b2f8e2f1daf467','http://localhost:8281/token','Basic U1JObDQzXzRTVks5MjZaVnNteXExOU1JNVFRYTpEV1Flb2NDeUVyN0lHYk8zRHJxRDc5SmtzVFVh'),(3,'ROBI','Robi Opearator','axatauser',NULL,'axatauser',NULL,'gGgvUANAGhRUzWTyXwYoGuk3WzQa',157680000,1395135145139,'4fb164d70def9f37b2f8e2f1daf467','http://localhost:8281/token','Basic U1JObDQzXzRTVks5MjZaVnNteXExOU1JNVFRYTpEV1Flb2NDeUVyN0lHYk8zRHJxRDc5SmtzVFVh');
/*!40000 ALTER TABLE `operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operatorsubs`
--

DROP TABLE IF EXISTS `operatorsubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operatorsubs` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `axiataid` int(11) DEFAULT NULL,
  `domainurl` varchar(255) DEFAULT NULL,
  `operator` varchar(45) DEFAULT NULL,
  `created` varchar(25) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `lastupdated` varchar(25) DEFAULT NULL,
  `lastupdated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatorsubs`
--

LOCK TABLES `operatorsubs` WRITE;
/*!40000 ALTER TABLE `operatorsubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `operatorsubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendsms_reqid`
--

DROP TABLE IF EXISTS `sendsms_reqid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendsms_reqid` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `hub_requestid` varchar(255) DEFAULT NULL,
  `sender_address` varchar(40) DEFAULT NULL,
  `delivery_address` varchar(40) DEFAULT NULL,
  `plugin_requestid` varchar(255) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendsms_reqid`
--

LOCK TABLES `sendsms_reqid` WRITE;
/*!40000 ALTER TABLE `sendsms_reqid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendsms_reqid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spendlimitexceeded_application`
--

DROP TABLE IF EXISTS `spendlimitexceeded_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spendlimitexceeded_application` (
  `consumerKey` varchar(255) DEFAULT NULL,
  `amount` decimal(40,15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spendlimitexceeded_application`
--

LOCK TABLES `spendlimitexceeded_application` WRITE;
/*!40000 ALTER TABLE `spendlimitexceeded_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `spendlimitexceeded_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spendlimitexceeded_msisdn`
--

DROP TABLE IF EXISTS `spendlimitexceeded_msisdn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spendlimitexceeded_msisdn` (
  `msisdn` varchar(255) DEFAULT NULL,
  `amount` decimal(40,15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spendlimitexceeded_msisdn`
--

LOCK TABLES `spendlimitexceeded_msisdn` WRITE;
/*!40000 ALTER TABLE `spendlimitexceeded_msisdn` DISABLE KEYS */;
/*!40000 ALTER TABLE `spendlimitexceeded_msisdn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spendlimitexceeded_operator`
--

DROP TABLE IF EXISTS `spendlimitexceeded_operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spendlimitexceeded_operator` (
  `operatorId` varchar(255) DEFAULT NULL,
  `amount` decimal(40,15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spendlimitexceeded_operator`
--

LOCK TABLES `spendlimitexceeded_operator` WRITE;
/*!40000 ALTER TABLE `spendlimitexceeded_operator` DISABLE KEYS */;
/*!40000 ALTER TABLE `spendlimitexceeded_operator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_approval_operators`
--

DROP TABLE IF EXISTS `sub_approval_operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_approval_operators` (
  `API_NAME` varchar(200) NOT NULL DEFAULT '',
  `API_VERSION` varchar(30) NOT NULL DEFAULT '',
  `API_PROVIDER` varchar(200) NOT NULL DEFAULT '',
  `APP_ID` int(11) NOT NULL DEFAULT '0',
  `OPERATOR_LIST` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`API_NAME`,`API_VERSION`,`API_PROVIDER`,`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_approval_operators`
--

LOCK TABLES `sub_approval_operators` WRITE;
/*!40000 ALTER TABLE `sub_approval_operators` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_approval_operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_validator`
--

DROP TABLE IF EXISTS `subscription_validator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_validator` (
  `application_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `validator_id` int(11) NOT NULL,
  PRIMARY KEY (`application_id`,`api_id`),
  KEY `validator_id` (`validator_id`),
  CONSTRAINT `subscription_validator_ibfk_1` FOREIGN KEY (`validator_id`) REFERENCES `validator` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_validator`
--

LOCK TABLES `subscription_validator` WRITE;
/*!40000 ALTER TABLE `subscription_validator` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_validator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `axiataid` int(11) DEFAULT NULL,
  `notifyurl` varchar(255) DEFAULT NULL,
  `created` varchar(25) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `lastupdated` varchar(25) DEFAULT NULL,
  `lastupdated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ussd_request_entry`
--

DROP TABLE IF EXISTS `ussd_request_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ussd_request_entry` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `axiataid` int(11) DEFAULT NULL,
  `notifyurl` varchar(255) DEFAULT NULL,
  `created` varchar(25) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `lastupdated` varchar(25) DEFAULT NULL,
  `lastupdated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ussd_request_entry`
--

LOCK TABLES `ussd_request_entry` WRITE;
/*!40000 ALTER TABLE `ussd_request_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `ussd_request_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valid_payment_categories`
--

DROP TABLE IF EXISTS `valid_payment_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valid_payment_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `Note` varchar(255) NOT NULL,
  `created` varchar(25) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `lastupdated` varchar(25) DEFAULT NULL,
  `lastupdated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valid_payment_categories`
--

LOCK TABLES `valid_payment_categories` WRITE;
/*!40000 ALTER TABLE `valid_payment_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `valid_payment_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validator`
--

DROP TABLE IF EXISTS `validator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `validator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validator`
--

LOCK TABLES `validator` WRITE;
/*!40000 ALTER TABLE `validator` DISABLE KEYS */;
INSERT INTO `validator` VALUES (1,'passthru','com.axiata.dialog.mife.validators.PassThroughValidator'),(2,'msisdn','com.axiata.dialog.mife.validators.MSISDNValidator');
/*!40000 ALTER TABLE `validator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_api_key_mappings`
--

DROP TABLE IF EXISTS `workflow_api_key_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_api_key_mappings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_NAME` varchar(200) NOT NULL,
  `API_KEY` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_api_key_mappings`
--

LOCK TABLES `workflow_api_key_mappings` WRITE;
/*!40000 ALTER TABLE `workflow_api_key_mappings` DISABLE KEYS */;
INSERT INTO `workflow_api_key_mappings` VALUES (1,'smsmessaging','sms'),(2,'payment','payment'),(3,'location','location');
/*!40000 ALTER TABLE `workflow_api_key_mappings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-23  8:24:13
