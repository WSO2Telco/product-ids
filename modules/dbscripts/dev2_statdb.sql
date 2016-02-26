-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dev2_statdb
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
-- Table structure for table `SB_API_REQUEST_SUMMARY`
--

DROP TABLE IF EXISTS `SB_API_REQUEST_SUMMARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SB_API_REQUEST_SUMMARY` (
  `messageRowID` varchar(100) NOT NULL,
  `api` varchar(100) DEFAULT NULL,
  `api_version` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `apiPublisher` varchar(100) DEFAULT NULL,
  `consumerKey` varchar(100) DEFAULT NULL,
  `userId` varchar(100) DEFAULT NULL,
  `context` varchar(100) DEFAULT NULL,
  `request_count` int(11) DEFAULT NULL,
  `hostName` varchar(100) DEFAULT NULL,
  `resourcePath` varchar(100) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `requestId` varchar(100) DEFAULT NULL,
  `operatorId` varchar(100) DEFAULT NULL,
  `chargeAmount` varchar(20) DEFAULT NULL,
  `purchaseCategoryCode` varchar(40) DEFAULT NULL,
  `jsonBody` text,
  `year` smallint(6) DEFAULT NULL,
  `month` smallint(6) DEFAULT NULL,
  `day` smallint(6) DEFAULT NULL,
  `time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`messageRowID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SB_API_REQUEST_SUMMARY`
--

LOCK TABLES `SB_API_REQUEST_SUMMARY` WRITE;
/*!40000 ALTER TABLE `SB_API_REQUEST_SUMMARY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SB_API_REQUEST_SUMMARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SB_API_RESPONSE_SUMMARY`
--

DROP TABLE IF EXISTS `SB_API_RESPONSE_SUMMARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SB_API_RESPONSE_SUMMARY` (
  `messageRowID` varchar(100) NOT NULL,
  `api` varchar(100) DEFAULT NULL,
  `api_version` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `apiPublisher` varchar(100) DEFAULT NULL,
  `consumerKey` varchar(100) DEFAULT NULL,
  `userId` varchar(100) DEFAULT NULL,
  `context` varchar(100) DEFAULT NULL,
  `serviceTime` int(11) DEFAULT NULL,
  `response_count` int(11) DEFAULT NULL,
  `hostName` varchar(100) DEFAULT NULL,
  `resourcePath` varchar(100) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `requestId` varchar(100) DEFAULT NULL,
  `operatorId` varchar(100) DEFAULT NULL,
  `responseCode` varchar(5) DEFAULT NULL,
  `msisdn` varchar(20) DEFAULT NULL,
  `operatorRef` varchar(100) DEFAULT NULL,
  `chargeAmount` varchar(20) DEFAULT NULL,
  `purchaseCategoryCode` varchar(40) DEFAULT NULL,
  `exceptionId` varchar(10) DEFAULT NULL,
  `exceptionMessage` varchar(255) DEFAULT NULL,
  `jsonBody` text,
  `year` smallint(6) DEFAULT NULL,
  `month` smallint(6) DEFAULT NULL,
  `day` smallint(6) DEFAULT NULL,
  `time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`messageRowID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SB_API_RESPONSE_SUMMARY`
--

LOCK TABLES `SB_API_RESPONSE_SUMMARY` WRITE;
/*!40000 ALTER TABLE `SB_API_RESPONSE_SUMMARY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SB_API_RESPONSE_SUMMARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_comments`
--

DROP TABLE IF EXISTS `admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_comments` (
  `TaskID` int(11) NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`TaskID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_comments`
--

LOCK TABLES `admin_comments` WRITE;
/*!40000 ALTER TABLE `admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_approval_audit`
--

DROP TABLE IF EXISTS `app_approval_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_approval_audit` (
  `APP_APPROVAL_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `APP_NAME` varchar(100) DEFAULT NULL,
  `APP_CREATOR` varchar(50) DEFAULT NULL,
  `APP_STATUS` varchar(50) DEFAULT 'ON_HOLD',
  `APP_APPROVAL_TYPE` varchar(50) DEFAULT NULL,
  `COMPLETED_BY_ROLE` varchar(50) DEFAULT NULL,
  `COMPLETED_BY_USER` varchar(50) DEFAULT NULL,
  `COMPLETED_ON` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`APP_APPROVAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_approval_audit`
--

LOCK TABLES `app_approval_audit` WRITE;
/*!40000 ALTER TABLE `app_approval_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_approval_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklistmsisdn`
--

DROP TABLE IF EXISTS `blacklistmsisdn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklistmsisdn` (
  `Index` int(11) NOT NULL AUTO_INCREMENT,
  `MSISDN` varchar(45) NOT NULL,
  `API_ID` varchar(45) NOT NULL,
  `API_NAME` varchar(45) NOT NULL,
  `USER_ID` varchar(45) NOT NULL,
  PRIMARY KEY (`Index`),
  UNIQUE KEY `MSISDN` (`MSISDN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklistmsisdn`
--

LOCK TABLES `blacklistmsisdn` WRITE;
/*!40000 ALTER TABLE `blacklistmsisdn` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklistmsisdn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_approval_audit`
--

DROP TABLE IF EXISTS `sub_approval_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_approval_audit` (
  `API_PROVIDER` varchar(200) NOT NULL DEFAULT '',
  `API_NAME` varchar(200) NOT NULL DEFAULT '',
  `API_VERSION` varchar(30) NOT NULL DEFAULT '',
  `APP_ID` int(11) NOT NULL,
  `SUB_STATUS` varchar(50) DEFAULT 'ON_HOLD',
  `SUB_APPROVAL_TYPE` varchar(50) DEFAULT NULL,
  `COMPLETED_BY_ROLE` varchar(50) NOT NULL DEFAULT '',
  `COMPLETED_BY_USER` varchar(50) DEFAULT NULL,
  `COMPLETED_ON` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`APP_ID`,`API_PROVIDER`,`API_NAME`,`API_VERSION`,`COMPLETED_BY_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_approval_audit`
--

LOCK TABLES `sub_approval_audit` WRITE;
/*!40000 ALTER TABLE `sub_approval_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_approval_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_WhiteList`
--

DROP TABLE IF EXISTS `subscription_WhiteList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_WhiteList` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `subscriptionID` varchar(45) NOT NULL,
  `msisdn` varchar(45) NOT NULL,
  `api_id` varchar(45) NOT NULL,
  `application_id` varchar(45) NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `msisdn` (`msisdn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_WhiteList`
--

LOCK TABLES `subscription_WhiteList` WRITE;
/*!40000 ALTER TABLE `subscription_WhiteList` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_WhiteList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_comments`
--

DROP TABLE IF EXISTS `subscription_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_comments` (
  `TaskID` varchar(255) NOT NULL,
  `Comment` varchar(1024) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Description` varchar(1024) NOT NULL,
  PRIMARY KEY (`TaskID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_comments`
--

LOCK TABLES `subscription_comments` WRITE;
/*!40000 ALTER TABLE `subscription_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_rates`
--

DROP TABLE IF EXISTS `subscription_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_rates` (
  `application_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `operator_name` varchar(45) NOT NULL,
  `rate_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`application_id`,`api_id`,`operator_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_rates`
--

LOCK TABLES `subscription_rates` WRITE;
/*!40000 ALTER TABLE `subscription_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_tax`
--

DROP TABLE IF EXISTS `subscription_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_tax` (
  `application_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `tax_type` varchar(25) NOT NULL,
  PRIMARY KEY (`application_id`,`api_id`,`tax_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_tax`
--

LOCK TABLES `subscription_tax` WRITE;
/*!40000 ALTER TABLE `subscription_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(25) NOT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `value` decimal(7,6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax`
--

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-23  8:25:43
