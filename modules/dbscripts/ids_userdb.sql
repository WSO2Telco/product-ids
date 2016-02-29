-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dev2_userdb
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
-- Table structure for table `REG_ASSOCIATION`
--
CREATE DATABASE ids_userdb;
USE ids_userdb;

DROP TABLE IF EXISTS `REG_ASSOCIATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_ASSOCIATION` (
  `REG_ASSOCIATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_SOURCEPATH` varchar(750) NOT NULL,
  `REG_TARGETPATH` varchar(750) NOT NULL,
  `REG_ASSOCIATION_TYPE` varchar(2000) NOT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_ASSOCIATION_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_ASSOCIATION`
--

LOCK TABLES `REG_ASSOCIATION` WRITE;
/*!40000 ALTER TABLE `REG_ASSOCIATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_ASSOCIATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_CLUSTER_LOCK`
--

DROP TABLE IF EXISTS `REG_CLUSTER_LOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_CLUSTER_LOCK` (
  `REG_LOCK_NAME` varchar(20) NOT NULL DEFAULT '',
  `REG_LOCK_STATUS` varchar(20) DEFAULT NULL,
  `REG_LOCKED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REG_TENANT_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`REG_LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_CLUSTER_LOCK`
--

LOCK TABLES `REG_CLUSTER_LOCK` WRITE;
/*!40000 ALTER TABLE `REG_CLUSTER_LOCK` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_CLUSTER_LOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_COMMENT`
--

DROP TABLE IF EXISTS `REG_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_COMMENT` (
  `REG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_COMMENT_TEXT` varchar(500) NOT NULL,
  `REG_USER_ID` varchar(31) NOT NULL,
  `REG_COMMENTED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_COMMENT`
--

LOCK TABLES `REG_COMMENT` WRITE;
/*!40000 ALTER TABLE `REG_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_CONTENT`
--

DROP TABLE IF EXISTS `REG_CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_CONTENT` (
  `REG_CONTENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_CONTENT_DATA` longblob,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_CONTENT_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_CONTENT`
--

LOCK TABLES `REG_CONTENT` WRITE;
/*!40000 ALTER TABLE `REG_CONTENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_CONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_CONTENT_HISTORY`
--

DROP TABLE IF EXISTS `REG_CONTENT_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_CONTENT_HISTORY` (
  `REG_CONTENT_ID` int(11) NOT NULL,
  `REG_CONTENT_DATA` longblob,
  `REG_DELETED` smallint(6) DEFAULT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_CONTENT_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_CONTENT_HISTORY`
--

LOCK TABLES `REG_CONTENT_HISTORY` WRITE;
/*!40000 ALTER TABLE `REG_CONTENT_HISTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_CONTENT_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_LOG`
--

DROP TABLE IF EXISTS `REG_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_LOG` (
  `REG_LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_PATH` varchar(750) DEFAULT NULL,
  `REG_USER_ID` varchar(31) NOT NULL,
  `REG_LOGGED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REG_ACTION` int(11) NOT NULL,
  `REG_ACTION_DATA` varchar(500) DEFAULT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_LOG_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_LOG`
--

LOCK TABLES `REG_LOG` WRITE;
/*!40000 ALTER TABLE `REG_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_PATH`
--

DROP TABLE IF EXISTS `REG_PATH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_PATH` (
  `REG_PATH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_PATH_VALUE` varchar(750) NOT NULL,
  `REG_PATH_PARENT_ID` int(11) DEFAULT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_PATH_IND_BY_PATH_VALUE` (`REG_PATH_VALUE`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_PATH_IND_BY_PATH_PARENT_ID` (`REG_PATH_PARENT_ID`,`REG_TENANT_ID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_PATH`
--

LOCK TABLES `REG_PATH` WRITE;
/*!40000 ALTER TABLE `REG_PATH` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_PATH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_PROPERTY`
--

DROP TABLE IF EXISTS `REG_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_PROPERTY` (
  `REG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_NAME` varchar(100) NOT NULL,
  `REG_VALUE` varchar(1000) DEFAULT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_PROPERTY`
--

LOCK TABLES `REG_PROPERTY` WRITE;
/*!40000 ALTER TABLE `REG_PROPERTY` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_RATING`
--

DROP TABLE IF EXISTS `REG_RATING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RATING` (
  `REG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_RATING` int(11) NOT NULL,
  `REG_USER_ID` varchar(31) NOT NULL,
  `REG_RATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_RATING`
--

LOCK TABLES `REG_RATING` WRITE;
/*!40000 ALTER TABLE `REG_RATING` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_RATING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_RESOURCE`
--

DROP TABLE IF EXISTS `REG_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RESOURCE` (
  `REG_PATH_ID` int(11) NOT NULL,
  `REG_NAME` varchar(256) DEFAULT NULL,
  `REG_VERSION` int(11) NOT NULL AUTO_INCREMENT,
  `REG_MEDIA_TYPE` varchar(500) DEFAULT NULL,
  `REG_CREATOR` varchar(31) NOT NULL,
  `REG_CREATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REG_LAST_UPDATOR` varchar(31) DEFAULT NULL,
  `REG_LAST_UPDATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REG_DESCRIPTION` varchar(1000) DEFAULT NULL,
  `REG_CONTENT_ID` int(11) DEFAULT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `REG_UUID` varchar(100) NOT NULL,
  PRIMARY KEY (`REG_VERSION`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_FK_BY_PATH_ID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_FK_BY_CONTENT_ID` (`REG_CONTENT_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_IND_BY_NAME` (`REG_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_RESOURCE_IND_BY_PATH_ID_NAME` (`REG_PATH_ID`,`REG_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_RESOURCE_HISTORY_IND_BY_PATH_ID_NAME` (`REG_PATH_ID`,`REG_NAME`,`REG_TENANT_ID`) USING HASH,
  CONSTRAINT `REG_RESOURCE_FK_BY_CONTENT_ID` FOREIGN KEY (`REG_CONTENT_ID`, `REG_TENANT_ID`) REFERENCES `REG_CONTENT` (`REG_CONTENT_ID`, `REG_TENANT_ID`),
  CONSTRAINT `REG_RESOURCE_FK_BY_PATH_ID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_RESOURCE`
--

LOCK TABLES `REG_RESOURCE` WRITE;
/*!40000 ALTER TABLE `REG_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_RESOURCE_COMMENT`
--

DROP TABLE IF EXISTS `REG_RESOURCE_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RESOURCE_COMMENT` (
  `REG_COMMENT_ID` int(11) NOT NULL,
  `REG_VERSION` int(11) DEFAULT NULL,
  `REG_PATH_ID` int(11) DEFAULT NULL,
  `REG_RESOURCE_NAME` varchar(256) DEFAULT NULL,
  `REG_TENANT_ID` int(11) DEFAULT '0',
  KEY `REG_RESOURCE_COMMENT_FK_BY_PATH_ID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_COMMENT_FK_BY_COMMENT_ID` (`REG_COMMENT_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_COMMENT_IND_BY_PATH_ID_AND_RESOURCE_NAME` (`REG_PATH_ID`,`REG_RESOURCE_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_RESOURCE_COMMENT_IND_BY_VERSION` (`REG_VERSION`,`REG_TENANT_ID`) USING HASH,
  CONSTRAINT `REG_RESOURCE_COMMENT_FK_BY_COMMENT_ID` FOREIGN KEY (`REG_COMMENT_ID`, `REG_TENANT_ID`) REFERENCES `REG_COMMENT` (`REG_ID`, `REG_TENANT_ID`),
  CONSTRAINT `REG_RESOURCE_COMMENT_FK_BY_PATH_ID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_RESOURCE_COMMENT`
--

LOCK TABLES `REG_RESOURCE_COMMENT` WRITE;
/*!40000 ALTER TABLE `REG_RESOURCE_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_RESOURCE_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_RESOURCE_HISTORY`
--

DROP TABLE IF EXISTS `REG_RESOURCE_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RESOURCE_HISTORY` (
  `REG_PATH_ID` int(11) NOT NULL,
  `REG_NAME` varchar(256) DEFAULT NULL,
  `REG_VERSION` int(11) NOT NULL,
  `REG_MEDIA_TYPE` varchar(500) DEFAULT NULL,
  `REG_CREATOR` varchar(31) NOT NULL,
  `REG_CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REG_LAST_UPDATOR` varchar(31) DEFAULT NULL,
  `REG_LAST_UPDATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REG_DESCRIPTION` varchar(1000) DEFAULT NULL,
  `REG_CONTENT_ID` int(11) DEFAULT NULL,
  `REG_DELETED` smallint(6) DEFAULT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `REG_UUID` varchar(100) NOT NULL,
  PRIMARY KEY (`REG_VERSION`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_HIST_FK_BY_PATHID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_HIST_FK_BY_CONTENT_ID` (`REG_CONTENT_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_HISTORY_IND_BY_NAME` (`REG_NAME`,`REG_TENANT_ID`) USING HASH,
  CONSTRAINT `REG_RESOURCE_HIST_FK_BY_CONTENT_ID` FOREIGN KEY (`REG_CONTENT_ID`, `REG_TENANT_ID`) REFERENCES `REG_CONTENT_HISTORY` (`REG_CONTENT_ID`, `REG_TENANT_ID`),
  CONSTRAINT `REG_RESOURCE_HIST_FK_BY_PATHID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_RESOURCE_HISTORY`
--

LOCK TABLES `REG_RESOURCE_HISTORY` WRITE;
/*!40000 ALTER TABLE `REG_RESOURCE_HISTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_RESOURCE_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_RESOURCE_PROPERTY`
--

DROP TABLE IF EXISTS `REG_RESOURCE_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RESOURCE_PROPERTY` (
  `REG_PROPERTY_ID` int(11) NOT NULL,
  `REG_VERSION` int(11) DEFAULT NULL,
  `REG_PATH_ID` int(11) DEFAULT NULL,
  `REG_RESOURCE_NAME` varchar(256) DEFAULT NULL,
  `REG_TENANT_ID` int(11) DEFAULT '0',
  KEY `REG_RESOURCE_PROPERTY_FK_BY_PATH_ID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_PROPERTY_FK_BY_TAG_ID` (`REG_PROPERTY_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_PROPERTY_IND_BY_PATH_ID_AND_RESOURCE_NAME` (`REG_PATH_ID`,`REG_RESOURCE_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_RESOURCE_PROPERTY_IND_BY_VERSION` (`REG_VERSION`,`REG_TENANT_ID`) USING HASH,
  CONSTRAINT `REG_RESOURCE_PROPERTY_FK_BY_TAG_ID` FOREIGN KEY (`REG_PROPERTY_ID`, `REG_TENANT_ID`) REFERENCES `REG_PROPERTY` (`REG_ID`, `REG_TENANT_ID`),
  CONSTRAINT `REG_RESOURCE_PROPERTY_FK_BY_PATH_ID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_RESOURCE_PROPERTY`
--

LOCK TABLES `REG_RESOURCE_PROPERTY` WRITE;
/*!40000 ALTER TABLE `REG_RESOURCE_PROPERTY` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_RESOURCE_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_RESOURCE_RATING`
--

DROP TABLE IF EXISTS `REG_RESOURCE_RATING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RESOURCE_RATING` (
  `REG_RATING_ID` int(11) NOT NULL,
  `REG_VERSION` int(11) DEFAULT NULL,
  `REG_PATH_ID` int(11) DEFAULT NULL,
  `REG_RESOURCE_NAME` varchar(256) DEFAULT NULL,
  `REG_TENANT_ID` int(11) DEFAULT '0',
  KEY `REG_RESOURCE_RATING_FK_BY_PATH_ID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_RATING_FK_BY_RATING_ID` (`REG_RATING_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_RATING_IND_BY_PATH_ID_AND_RESOURCE_NAME` (`REG_PATH_ID`,`REG_RESOURCE_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_RESOURCE_RATING_IND_BY_VERSION` (`REG_VERSION`,`REG_TENANT_ID`) USING HASH,
  CONSTRAINT `REG_RESOURCE_RATING_FK_BY_RATING_ID` FOREIGN KEY (`REG_RATING_ID`, `REG_TENANT_ID`) REFERENCES `REG_RATING` (`REG_ID`, `REG_TENANT_ID`),
  CONSTRAINT `REG_RESOURCE_RATING_FK_BY_PATH_ID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_RESOURCE_RATING`
--

LOCK TABLES `REG_RESOURCE_RATING` WRITE;
/*!40000 ALTER TABLE `REG_RESOURCE_RATING` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_RESOURCE_RATING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_RESOURCE_TAG`
--

DROP TABLE IF EXISTS `REG_RESOURCE_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RESOURCE_TAG` (
  `REG_TAG_ID` int(11) NOT NULL,
  `REG_VERSION` int(11) DEFAULT NULL,
  `REG_PATH_ID` int(11) DEFAULT NULL,
  `REG_RESOURCE_NAME` varchar(256) DEFAULT NULL,
  `REG_TENANT_ID` int(11) DEFAULT '0',
  KEY `REG_RESOURCE_TAG_FK_BY_PATH_ID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_TAG_FK_BY_TAG_ID` (`REG_TAG_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_TAG_IND_BY_PATH_ID_AND_RESOURCE_NAME` (`REG_PATH_ID`,`REG_RESOURCE_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_RESOURCE_TAG_IND_BY_VERSION` (`REG_VERSION`,`REG_TENANT_ID`) USING HASH,
  CONSTRAINT `REG_RESOURCE_TAG_FK_BY_TAG_ID` FOREIGN KEY (`REG_TAG_ID`, `REG_TENANT_ID`) REFERENCES `REG_TAG` (`REG_ID`, `REG_TENANT_ID`),
  CONSTRAINT `REG_RESOURCE_TAG_FK_BY_PATH_ID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_RESOURCE_TAG`
--

LOCK TABLES `REG_RESOURCE_TAG` WRITE;
/*!40000 ALTER TABLE `REG_RESOURCE_TAG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_RESOURCE_TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_SNAPSHOT`
--

DROP TABLE IF EXISTS `REG_SNAPSHOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_SNAPSHOT` (
  `REG_SNAPSHOT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_PATH_ID` int(11) NOT NULL,
  `REG_RESOURCE_NAME` varchar(255) DEFAULT NULL,
  `REG_RESOURCE_VIDS` longblob NOT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_SNAPSHOT_ID`,`REG_TENANT_ID`),
  KEY `REG_SNAPSHOT_IND_BY_PATH_ID_AND_RESOURCE_NAME` (`REG_PATH_ID`,`REG_RESOURCE_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_SNAPSHOT_FK_BY_PATH_ID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  CONSTRAINT `REG_SNAPSHOT_FK_BY_PATH_ID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_SNAPSHOT`
--

LOCK TABLES `REG_SNAPSHOT` WRITE;
/*!40000 ALTER TABLE `REG_SNAPSHOT` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_SNAPSHOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REG_TAG`
--

DROP TABLE IF EXISTS `REG_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_TAG` (
  `REG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_TAG_NAME` varchar(500) NOT NULL,
  `REG_USER_ID` varchar(31) NOT NULL,
  `REG_TAGGED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REG_TAG`
--

LOCK TABLES `REG_TAG` WRITE;
/*!40000 ALTER TABLE `REG_TAG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REG_TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_ACCOUNT_MAPPING`
--

DROP TABLE IF EXISTS `UM_ACCOUNT_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_ACCOUNT_MAPPING` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_USER_NAME` varchar(255) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL,
  `UM_USER_STORE_DOMAIN` varchar(100) DEFAULT NULL,
  `UM_ACC_LINK_ID` int(11) NOT NULL,
  PRIMARY KEY (`UM_ID`),
  UNIQUE KEY `UM_USER_NAME` (`UM_USER_NAME`,`UM_TENANT_ID`,`UM_USER_STORE_DOMAIN`,`UM_ACC_LINK_ID`),
  KEY `UM_TENANT_ID` (`UM_TENANT_ID`),
  CONSTRAINT `UM_ACCOUNT_MAPPING_ibfk_1` FOREIGN KEY (`UM_TENANT_ID`) REFERENCES `UM_TENANT` (`UM_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_ACCOUNT_MAPPING`
--

LOCK TABLES `UM_ACCOUNT_MAPPING` WRITE;
/*!40000 ALTER TABLE `UM_ACCOUNT_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `UM_ACCOUNT_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_CLAIM`
--

DROP TABLE IF EXISTS `UM_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_CLAIM` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_DIALECT_ID` int(11) NOT NULL,
  `UM_CLAIM_URI` varchar(255) NOT NULL,
  `UM_DISPLAY_TAG` varchar(255) DEFAULT NULL,
  `UM_DESCRIPTION` varchar(255) DEFAULT NULL,
  `UM_MAPPED_ATTRIBUTE_DOMAIN` varchar(255) DEFAULT NULL,
  `UM_MAPPED_ATTRIBUTE` varchar(255) DEFAULT NULL,
  `UM_REG_EX` varchar(255) DEFAULT NULL,
  `UM_SUPPORTED` smallint(6) DEFAULT NULL,
  `UM_REQUIRED` smallint(6) DEFAULT NULL,
  `UM_DISPLAY_ORDER` int(11) DEFAULT NULL,
  `UM_CHECKED_ATTRIBUTE` smallint(6) DEFAULT NULL,
  `UM_READ_ONLY` smallint(6) DEFAULT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_DIALECT_ID` (`UM_DIALECT_ID`,`UM_CLAIM_URI`,`UM_TENANT_ID`,`UM_MAPPED_ATTRIBUTE_DOMAIN`),
  KEY `UM_DIALECT_ID_2` (`UM_DIALECT_ID`,`UM_TENANT_ID`),
  CONSTRAINT `UM_CLAIM_ibfk_1` FOREIGN KEY (`UM_DIALECT_ID`, `UM_TENANT_ID`) REFERENCES `UM_DIALECT` (`UM_ID`, `UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_CLAIM`
--

LOCK TABLES `UM_CLAIM` WRITE;
/*!40000 ALTER TABLE `UM_CLAIM` DISABLE KEYS */;
INSERT INTO `UM_CLAIM` VALUES (1,1,'phone_number','Phone Number','End-User\'s preferred telephone number. For example, +1 (425) 555-1212 or +56 (2) 687 2400., +1 (604) 555-1234;ext=5678.',NULL,'telephoneNumber',NULL,0,0,0,0,0,-1234),(2,2,'urn:scim:schemas:core:1.0:ims','IMS','IM',NULL,'im',NULL,1,0,5,0,0,-1234),(3,3,'http://wso2.org/claims/region','Region','Region',NULL,'http://wso2.org/claims/region',NULL,0,0,0,0,0,-1234),(5,3,'http://wso2.org/claims/fullname','Full Name','Full Name',NULL,'cn',NULL,0,0,0,0,0,-1234),(6,2,'urn:scim:schemas:core:1.0:active','Active','Active',NULL,'active',NULL,1,1,2,0,0,-1234),(7,3,'http://wso2.org/claims/gender','Gender','Gender',NULL,'gender',NULL,0,0,0,0,0,-1234),(8,4,'http://axschema.org/birthDate','DOB','Date of Birth',NULL,'dateOfBirth',NULL,1,0,0,0,0,-1234),(9,2,'urn:scim:schemas:core:1.0:emails.home','Emails - Home Email','Home Email',NULL,'homeEmail',NULL,1,0,5,0,0,-1234),(10,2,'urn:scim:schemas:core:1.0:id','Id','Id',NULL,'scimId',NULL,1,1,1,0,0,-1234),(11,2,'urn:scim:schemas:core:1.0:phoneNumbers','Phone Numbers','Phone Numbers',NULL,'phoneNumbers','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',1,1,3,0,0,-1234),(12,3,'http://wso2.org/claims/role','Role','Role',NULL,'role',NULL,1,0,0,0,1,-1234),(13,2,'urn:scim:schemas:core:1.0:phoneNumbers.home','Phone Numbers - Home Phone Number','Home Phone',NULL,'homePhone',NULL,1,0,5,0,0,-1234),(14,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/otherphone','Other Phone','Other Phone',NULL,'otherPhone',NULL,0,0,0,0,0,-1234),(15,6,'fullname','Full Name','Full Name',NULL,'cn',NULL,1,1,2,0,0,-1234),(16,2,'urn:scim:schemas:core:1.0:emails.other','Emails - Other Email','Other Email',NULL,'otherEmail',NULL,1,0,5,0,0,-1234),(17,1,'formatted','Address Formatted','Full mailing address, formatted for display or use on a mailing label. This field MAY contain multiple lines, separated by newlines.',NULL,'formatted',NULL,0,0,0,0,0,-1234),(18,2,'urn:scim:schemas:core:1.0:local','Local','Local',NULL,'local',NULL,1,1,2,0,0,-1234),(19,1,'nickname','Nickname','Casual name of the End-User that may or may not be the same as the given_name. For instance, a nickname value of Mike might be returned alongside a given_name value of Michael.',NULL,'nickName',NULL,1,1,6,0,0,-1234),(20,2,'urn:scim:schemas:core:1.0:emails','Emails','Email Addresses',NULL,'mail','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',1,1,3,0,0,-1234),(21,1,'middle_name','Middle Name','Middle name(s) of the End-User. Note that in some cultures, people can have multiple middle names; all can be present, with the names being separated by space characters. Also note that in some cultures, middle names are not used.',NULL,'middleName',NULL,1,0,5,0,0,-1234),(22,1,'phone_number_verified','Phone Number Verified','True if the End-User\'s phone number has been verified; otherwise false.',NULL,'phoneVerififed',NULL,0,0,0,0,0,-1234),(23,2,'urn:scim:schemas:core:1.0:preferredLanguage','Preferred Language','Preferred Language',NULL,'preferredLanguage',NULL,1,1,2,0,0,-1234),(24,6,'postcode','Postalcode','Postalcode',NULL,'postalCode',NULL,1,0,4,0,0,-1234),(25,2,'urn:scim:schemas:core:1.0:userName','User Name','User Name',NULL,'uid',NULL,1,1,2,0,0,-1234),(27,2,'urn:scim:schemas:core:1.0:timeZone','Time Zone','Time Zone',NULL,'timeZone',NULL,1,1,2,0,0,-1234),(28,2,'urn:scim:schemas:core:1.0:addresses','Address','Address',NULL,'addresses',NULL,1,0,5,0,0,-1234),(29,4,'http://axschema.org/contact/postalCode/home','Postalcode','Postalcode',NULL,'postalCode',NULL,1,0,0,0,0,-1234),(30,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname','First Name','First Name',NULL,'givenName',NULL,1,1,0,0,0,-1234),(31,3,'http://wso2.org/claims/identity/accountLocked','Account Locked','Account Locked',NULL,'initials',NULL,0,0,0,0,0,-1234),(32,2,'urn:scim:schemas:core:1.0:addresses.formatted','Address - Formatted','Address - Formatted',NULL,'formattedAddress',NULL,1,0,5,0,0,-1234),(33,6,'language','Language','Language',NULL,'prefferedLanguage',NULL,1,0,7,0,0,-1234),(34,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress','Email','Email Address',NULL,'mail','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',1,1,0,0,0,-1234),(35,2,'urn:scim:schemas:core:1.0:addresses.country','Address - Country','Address - Country',NULL,'country',NULL,1,0,5,0,0,-1234),(36,3,'http://wso2.org/claims/organization','Organization','Organization',NULL,'organizationName',NULL,1,0,3,0,0,-1234),(37,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/postalcode','Postalcode','Postalcode',NULL,'postalCode',NULL,1,0,0,0,0,-1234),(38,3,'http://wso2.org/claims/oneTimePassword','One Time Password','One Time Password',NULL,'postalcode',NULL,0,0,0,0,0,-1234),(39,3,'http://wso2.org/claims/dob','Birth Date','Birth Date',NULL,'dateOfBirth',NULL,0,0,0,0,0,-1234),(40,1,'region','One Time Password','State, province, prefecture, or region component.',NULL,'region',NULL,0,0,0,0,0,-1234),(41,1,'preferred_username','Preferred Username','Shorthand name by which the End-User wishes to be referred to at the RP, such as janedoe or j.doe.',NULL,'cn',NULL,1,0,7,0,0,-1234),(42,4,'http://axschema.org/pref/timezone','Time Zone','Time Zone',NULL,'timeZone',NULL,0,0,0,0,0,-1234),(43,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/homephone','Home Phone','Home Phone',NULL,'homePhone',NULL,1,0,0,0,0,-1234),(44,2,'urn:scim:schemas:core:1.0:userType','User Type','User Type',NULL,'userType',NULL,1,1,2,0,0,-1234),(45,3,'http://wso2.org/claims/primaryChallengeQuestion','Primary Challenge Question','Primary Challenge Question',NULL,'title',NULL,0,0,0,0,0,-1234),(46,2,'urn:scim:schemas:core:1.0:phoneNumbers.work','Phone Numbers - Work Phone Number','Work Phone',NULL,'workPhone',NULL,1,0,5,0,0,-1234),(47,3,'http://wso2.org/claims/nickname','Nick Name','Nick Name',NULL,'nickName',NULL,0,0,0,0,0,-1234),(48,2,'urn:scim:schemas:core:1.0:addresses.locality','Address - Locality','Address - Locality',NULL,'localityAddress',NULL,1,0,5,0,0,-1234),(49,2,'urn:scim:schemas:core:1.0:nickName','Nick Name','Nick Name',NULL,'nickName',NULL,1,1,2,0,0,-1234),(50,2,'urn:scim:schemas:core:1.0:photos','Photo','Photo',NULL,'photos',NULL,1,0,5,0,0,-1234),(51,3,'http://wso2.org/claims/im','IM','IM',NULL,'im',NULL,1,0,9,0,0,-1234),(53,2,'urn:scim:schemas:core:1.0:phoneNumbers.mobile','Phone Numbers - Mobile Number','Mobile Number',NULL,'mobile',NULL,1,0,5,0,0,-1234),(54,2,'urn:scim:schemas:core:1.0:photos.thumbnail','Photo - Thumbnail','Photo - Thumbnail',NULL,'thumbnail',NULL,1,0,5,0,0,-1234),(55,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/dateofbirth','DOB','Date of Birth',NULL,'dateOfBirth',NULL,0,0,0,0,0,-1234),(56,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/stateorprovince','State','State',NULL,'stateOrProvinceName',NULL,0,0,0,0,0,-1234),(57,2,'urn:scim:schemas:core:1.0:name.honorificSuffix','Name - Honoric Suffix','Honoric Suffix',NULL,'honoricSuffix',NULL,1,1,2,0,0,-1234),(58,6,'dob','DOB','Date of Birth',NULL,'dateOfBirth',NULL,1,0,6,0,0,-1234),(59,2,'urn:scim:schemas:core:1.0:addresses.region','Address - Region','Address - Region',NULL,'region',NULL,1,0,5,0,0,-1234),(60,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname','Last Name','Last Name',NULL,'sn',NULL,1,1,0,0,0,-1234),(61,2,'urn:scim:schemas:core:1.0:groups','Groups','Groups',NULL,'groups',NULL,1,0,5,0,0,-1234),(62,2,'urn:scim:schemas:core:1.0:phoneNumbers.other','Phone Numbers - Other','Other Phone Number',NULL,'otherPhoneNumber',NULL,1,0,5,0,0,-1234),(63,1,'zoneinfo','Zone Info','String from zoneinfo time zone database representing the End-User\'s time zone. For example, Europe/Paris or America/Los_Angeles.',NULL,'zone',NULL,0,0,0,0,0,-1234),(64,1,'email_verified','Email Verified','True if the End-User\'s e-mail address has been verified; otherwise false. ',NULL,'emailVerified',NULL,0,0,0,0,0,-1234),(65,2,'urn:scim:schemas:core:1.0:x509Certificates','X509Certificates','X509Certificates',NULL,'x509Certificates',NULL,1,0,5,0,0,-1234),(66,2,'urn:scim:schemas:core:1.0:meta.lastModified','Meta - Last Modified','Meta - Last Modified',NULL,'lastModifiedDate',NULL,1,1,1,0,0,-1234),(67,2,'urn:scim:schemas:core:1.0:phoneNumbers.pager','Phone Numbers - Pager Number','Pager Number',NULL,'pager',NULL,1,0,5,0,0,-1234),(68,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/locality','Locality','Locality',NULL,'localityName',NULL,0,0,0,0,0,-1234),(69,3,'http://wso2.org/claims/stateorprovince','State','State',NULL,'stateOrProvinceName',NULL,0,0,0,0,0,-1234),(70,4,'http://axschema.org/contact/country/home','Country','Country',NULL,'country',NULL,1,0,0,0,0,-1234),(71,6,'timezone','Time Zone','Time Zone',NULL,'timeZone',NULL,1,0,9,0,0,-1234),(72,1,'gender','Gender','End-User\'s gender. Values defined by this specification are female and male. Other values MAY be used when neither of the defined values are applicable.',NULL,'gender',NULL,1,0,0,0,1,-1234),(73,1,'family_name','Surname','Surname(s) or last name(s) of the End-User. Note that in some cultures, people can have multiple family names or no family name; all can be present, with the names being separated by space characters.',NULL,'sn',NULL,1,0,4,0,0,-1234),(74,2,'urn:scim:schemas:core:1.0:addresses.streetAddress','Address - Street','Address - Street',NULL,'streetAddress',NULL,1,0,5,0,0,-1234),(75,2,'urn:scim:schemas:core:1.0:name.familyName','Name - Family Name','Family Name',NULL,'sn',NULL,1,1,2,0,0,-1234),(77,2,'urn:scim:schemas:core:1.0:externalId','External Id','External Id',NULL,'externalId',NULL,1,1,1,0,0,-1234),(79,2,'urn:scim:schemas:core:1.0:profileUrl','Profile URL','Profile URL',NULL,'url',NULL,1,1,2,0,0,-1234),(80,4,'http://axschema.org/person/gender','Gender','Gender',NULL,'gender',NULL,1,0,0,0,0,-1234),(81,3,'http://wso2.org/claims/locality','Locality','Locality',NULL,'localityName',NULL,0,0,0,0,0,-1234),(82,2,'urn:scim:schemas:core:1.0:ims.gtalk','IM - Gtalk','IM - Gtalk',NULL,'imGtalk',NULL,1,0,5,0,0,-1234),(83,3,'http://wso2.org/claims/telephone','Telephone','Telephone',NULL,'telephoneNumber',NULL,1,0,7,0,0,-1234),(84,2,'urn:scim:schemas:core:1.0:entitlements','Entitlements','Entitlements',NULL,'entitlements',NULL,1,0,5,0,0,-1234),(85,3,'http://wso2.org/claims/postalcode','Postal Code','Postal Code',NULL,'postalcode',NULL,0,0,0,0,0,-1234),(86,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/privatepersonalidentifier',NULL,'PPID',NULL,'privatePersonalIdentifier',NULL,1,1,0,0,0,-1234),(87,1,'country','Country','Country name component',NULL,'country',NULL,0,0,0,0,0,-1234),(88,1,'picture','Picture','URL of the End-User\'s profile picture. This URL MUST refer to an image file (for example, a PNG, JPEG, or GIF image file)',NULL,'image',NULL,1,0,9,0,0,-1234),(89,1,'updated_at','Updated At','Time the End-User\'s information was last updated. Its value is a JSON number representing the number of seconds from 1970-01-01T0:0:0Z as measured in UTC until the date/time.',NULL,'updated',NULL,0,0,0,0,0,-1234),(90,1,'email','Email','End-User\'s preferred e-mail address.',NULL,'mail',NULL,0,0,0,0,0,-1234),(91,3,'http://wso2.org/claims/challengeQuestionUris','Challenge Question','Challenge Question',NULL,'stateOrProvinceName',NULL,0,0,0,0,0,-1234),(93,1,'postal_code','Postal Code','Zip code or postal code component.',NULL,'postalcode',NULL,0,0,0,0,0,-1234),(94,2,'urn:scim:schemas:core:1.0:phoneNumbers.fax','Phone Numbers - Fax Number','Fax Number',NULL,'fax',NULL,1,0,5,0,0,-1234),(96,3,'http://wso2.org/claims/otherphone','Other Phone','Other Phone',NULL,'otherPhone',NULL,0,0,0,0,0,-1234),(97,1,'sub','Subject','Identifier for the End-User at the Issuer',NULL,'uid',NULL,1,1,1,0,0,-1234),(98,1,'locale','Locale','End-User\'s locale, For example, en-US or fr-CA, en_US',NULL,'locale',NULL,0,0,0,0,0,-1234),(99,2,'urn:scim:schemas:core:1.0:title','Title','Title',NULL,'title',NULL,1,1,2,0,0,-1234),(100,1,'given_name','Given Name','Given name(s) or first name(s) of the End-User. Note that in some cultures, people can have multiple given names; all can be present, with the names being separated by space characters.',NULL,'cn',NULL,1,0,3,0,0,-1234),(102,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/country','Country','Country',NULL,'country',NULL,1,0,0,0,0,-1234),(103,1,'name','Full Name','End-User\'s full name in displayable form including all name parts, possibly including titles and suffixes, ordered according to the End-User\'s locale and preferences',NULL,'cn',NULL,1,1,2,0,0,-1234),(104,2,'urn:scim:schemas:core:1.0:ims.skype','IM - Skype','IM - Skype',NULL,'imSkype',NULL,1,0,5,0,0,-1234),(105,2,'urn:scim:schemas:core:1.0:name.honorificPrefix','Name - Honoric Prefix','Honoric Prefix',NULL,'honoricPrefix',NULL,1,1,2,0,0,-1234),(106,3,'http://wso2.org/claims/title','Title','Title',NULL,'title',NULL,0,0,0,0,0,-1234),(107,1,'birthdate','Birth Date','End-User\'s birthday, represented as an ISO 8601:2004 [ISO8601?2004] YYYY-MM-DD format. The year MAY be 0000, indicating that it is omitted. To represent only the year, YYYY format is allowed.',NULL,'birthDate',NULL,0,0,0,0,0,-1234),(108,2,'urn:scim:schemas:core:1.0:name.middleName','Name - Middle Name','Middle Name',NULL,'middleName',NULL,1,1,2,0,0,-1234),(110,4,'http://axschema.org/namePerson/last','Last Name','Last Name',NULL,'sn',NULL,1,1,0,0,0,-1234),(111,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nickname','Nick Name','Nick Name',NULL,'nickName',NULL,0,0,0,0,0,-1234),(112,1,'profile','Profile','URL of the End-User\'s profile page. The contents of this Web page SHOULD be about the End-User.',NULL,'url',NULL,1,0,8,0,0,-1234),(113,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/mobile','Mobile','Mobile',NULL,'mobile',NULL,0,0,0,0,0,-1234),(114,2,'urn:scim:schemas:core:1.0:name.formatted','Name - Formatted Name','Formatted Name',NULL,'formattedName',NULL,1,1,2,0,0,-1234),(115,2,'urn:scim:schemas:core:1.0:addresses.postalCode','Address - Postal Code','Address - Postal Code',NULL,'postalCode',NULL,1,0,5,0,0,-1234),(116,1,'website','URL','URL of the End-User\'s Web page or blog. This Web page SHOULD contain information published by the End-User or an organization that the End-User is affiliated with.',NULL,'url',NULL,1,0,10,0,0,-1234),(117,4,'http://axschema.org/namePerson/first','Nick Name','Nick Name',NULL,'nickName',NULL,1,1,0,0,0,-1234),(118,3,'http://wso2.org/claims/passwordTimestamp','Password Time Stamp','Password Time Stamp',NULL,'nickName',NULL,0,0,0,0,0,-1234),(119,2,'urn:scim:schemas:core:1.0:photos.photo','Photo','Photo',NULL,'photoUrl',NULL,1,0,5,0,0,-1234),(120,2,'urn:scim:schemas:core:1.0:emails.work','Emails - Work Email','Work Email',NULL,'workEmail',NULL,1,0,5,0,0,-1234),(121,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/gender','Gender','Gender',NULL,'gender',NULL,0,0,0,0,0,-1234),(122,2,'urn:scim:schemas:core:1.0:roles','Roles','Roles',NULL,'roles',NULL,1,0,5,0,0,-1234),(123,1,'address','Address','True if the End-User\'s phone number has been verified; otherwise false. ',NULL,'address',NULL,0,0,0,0,0,-1234),(124,5,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/streetaddress','Street Address','Street Address',NULL,'streetAddress',NULL,0,0,0,0,0,-1234),(125,2,'urn:scim:schemas:core:1.0:meta.created','Meta - Created','Meta - Created',NULL,'createdDate',NULL,1,1,1,0,0,-1234),(126,1,'locality','Locality','City or locality component.',NULL,'localityName',NULL,0,0,0,0,0,-1234),(127,2,'urn:scim:schemas:core:1.0:name.givenName','Name - Given Name','Given Name',NULL,'givenName',NULL,1,1,1,0,0,-1234),(128,4,'http://axschema.org/contact/email','Email','Email Address',NULL,'mail','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',1,1,0,0,0,-1234),(129,2,'urn:scim:schemas:core:1.0:displayName','Display Name','Display Name',NULL,'displayName',NULL,1,1,2,0,0,-1234),(130,4,'http://axschema.org/pref/language','Language','Language',NULL,'prefferedLanguage',NULL,1,0,0,0,0,-1234),(131,1,'street_address','Street Address','Full street address component, which MAY include house number, street name, Post Office Box, and multi-line extended street address information.',NULL,'street',NULL,0,0,0,0,0,-1234),(132,2,'urn:scim:schemas:core:1.0:meta.location','Meta - Location','Meta - Location',NULL,'location',NULL,1,1,1,0,0,-1234),(133,3,'http://wso2.org/claims/givenname','First Name','First Name',NULL,'givenName','',0,0,1,0,0,-1234),(134,3,'http://wso2.org/claims/lastname','Last Name','Last Name',NULL,'sn','',0,0,2,0,0,-1234),(135,3,'http://wso2.org/claims/country','Country','Country',NULL,'country','',0,0,5,0,0,-1234),(136,3,'http://wso2.org/claims/emailaddress','Email','Email Address',NULL,'mail','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',0,0,6,0,0,-1234),(137,3,'http://wso2.org/claims/url','URL','URL',NULL,'url','',0,0,10,0,0,-1234),(138,3,'http://wso2.org/claims/streetaddress','Address','Address',NULL,'streetAddress','',0,0,4,0,0,-1234),(140,3,'http://wso2.org/claims/mobile','Mobile','Mobile',NULL,'mobile','',1,1,1,0,0,-1234),(141,3,'http://wso2.org/claims/challengeQuestion1','Challenge Question1','Challenge Question1',NULL,'gender','',1,1,2,0,0,-1234),(142,3,'http://wso2.org/claims/challengeQuestion2','Challenge Question2','Challenge Question2',NULL,'localityName','',1,1,3,0,0,-1234),(143,3,'http://wso2.org/claims/pin','pin','USSD pin',NULL,NULL,'',1,0,0,0,0,-1234);
/*!40000 ALTER TABLE `UM_CLAIM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_DIALECT`
--

DROP TABLE IF EXISTS `UM_DIALECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_DIALECT` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_DIALECT_URI` varchar(255) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_DIALECT_URI` (`UM_DIALECT_URI`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_DIALECT`
--

LOCK TABLES `UM_DIALECT` WRITE;
/*!40000 ALTER TABLE `UM_DIALECT` DISABLE KEYS */;
INSERT INTO `UM_DIALECT` VALUES (4,'http://axschema.org',-1234),(6,'http://schema.openid.net/2007/05/claims',-1234),(5,'http://schemas.xmlsoap.org/ws/2005/05/identity',-1234),(3,'http://wso2.org/claims',-1234),(1,'http://wso2.org/oidc/claim',-1234),(2,'urn:scim:schemas:core:1.0',-1234);
/*!40000 ALTER TABLE `UM_DIALECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_DOMAIN`
--

DROP TABLE IF EXISTS `UM_DOMAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_DOMAIN` (
  `UM_DOMAIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_DOMAIN_NAME` varchar(255) DEFAULT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_DOMAIN_ID`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_DOMAIN`
--

LOCK TABLES `UM_DOMAIN` WRITE;
/*!40000 ALTER TABLE `UM_DOMAIN` DISABLE KEYS */;
INSERT INTO `UM_DOMAIN` VALUES (1,'PRIMARY',-1234),(2,'SYSTEM',-1234),(3,'INTERNAL',-1234);
/*!40000 ALTER TABLE `UM_DOMAIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_HYBRID_REMEMBER_ME`
--

DROP TABLE IF EXISTS `UM_HYBRID_REMEMBER_ME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_HYBRID_REMEMBER_ME` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_USER_NAME` varchar(255) NOT NULL,
  `UM_COOKIE_VALUE` varchar(1024) DEFAULT NULL,
  `UM_CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_HYBRID_REMEMBER_ME`
--

LOCK TABLES `UM_HYBRID_REMEMBER_ME` WRITE;
/*!40000 ALTER TABLE `UM_HYBRID_REMEMBER_ME` DISABLE KEYS */;
/*!40000 ALTER TABLE `UM_HYBRID_REMEMBER_ME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_HYBRID_ROLE`
--

DROP TABLE IF EXISTS `UM_HYBRID_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_HYBRID_ROLE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_ROLE_NAME` varchar(255) DEFAULT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_HYBRID_ROLE`
--

LOCK TABLES `UM_HYBRID_ROLE` WRITE;
/*!40000 ALTER TABLE `UM_HYBRID_ROLE` DISABLE KEYS */;
INSERT INTO `UM_HYBRID_ROLE` VALUES (1,'everyone',-1234),(2,'subscriber',-1234),(3,'SP1',-1234);
/*!40000 ALTER TABLE `UM_HYBRID_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_HYBRID_USER_ROLE`
--

DROP TABLE IF EXISTS `UM_HYBRID_USER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_HYBRID_USER_ROLE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_USER_NAME` varchar(255) DEFAULT NULL,
  `UM_ROLE_ID` int(11) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `UM_DOMAIN_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_USER_NAME` (`UM_USER_NAME`,`UM_ROLE_ID`,`UM_TENANT_ID`,`UM_DOMAIN_ID`),
  KEY `UM_ROLE_ID` (`UM_ROLE_ID`,`UM_TENANT_ID`),
  KEY `UM_DOMAIN_ID` (`UM_DOMAIN_ID`,`UM_TENANT_ID`),
  CONSTRAINT `UM_HYBRID_USER_ROLE_ibfk_1` FOREIGN KEY (`UM_ROLE_ID`, `UM_TENANT_ID`) REFERENCES `UM_HYBRID_ROLE` (`UM_ID`, `UM_TENANT_ID`),
  CONSTRAINT `UM_HYBRID_USER_ROLE_ibfk_2` FOREIGN KEY (`UM_DOMAIN_ID`, `UM_TENANT_ID`) REFERENCES `UM_DOMAIN` (`UM_DOMAIN_ID`, `UM_TENANT_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_HYBRID_USER_ROLE`
--

LOCK TABLES `UM_HYBRID_USER_ROLE` WRITE;
/*!40000 ALTER TABLE `UM_HYBRID_USER_ROLE` DISABLE KEYS */;
INSERT INTO `UM_HYBRID_USER_ROLE` VALUES (1,'admin',2,-1234,1),(2,'admin',3,-1234,1);
/*!40000 ALTER TABLE `UM_HYBRID_USER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_MODULE`
--

DROP TABLE IF EXISTS `UM_MODULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_MODULE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_MODULE_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UM_ID`),
  UNIQUE KEY `UM_MODULE_NAME` (`UM_MODULE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_MODULE`
--

LOCK TABLES `UM_MODULE` WRITE;
/*!40000 ALTER TABLE `UM_MODULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `UM_MODULE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_MODULE_ACTIONS`
--

DROP TABLE IF EXISTS `UM_MODULE_ACTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_MODULE_ACTIONS` (
  `UM_ACTION` varchar(255) NOT NULL,
  `UM_MODULE_ID` int(11) NOT NULL,
  PRIMARY KEY (`UM_ACTION`,`UM_MODULE_ID`),
  KEY `UM_MODULE_ID` (`UM_MODULE_ID`),
  CONSTRAINT `UM_MODULE_ACTIONS_ibfk_1` FOREIGN KEY (`UM_MODULE_ID`) REFERENCES `UM_MODULE` (`UM_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_MODULE_ACTIONS`
--

LOCK TABLES `UM_MODULE_ACTIONS` WRITE;
/*!40000 ALTER TABLE `UM_MODULE_ACTIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `UM_MODULE_ACTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_PERMISSION`
--

DROP TABLE IF EXISTS `UM_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_PERMISSION` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_RESOURCE_ID` varchar(255) NOT NULL,
  `UM_ACTION` varchar(255) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `UM_MODULE_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  KEY `INDEX_UM_PERMISSION_UM_RESOURCE_ID_UM_ACTION` (`UM_RESOURCE_ID`,`UM_ACTION`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_PERMISSION`
--

LOCK TABLES `UM_PERMISSION` WRITE;
/*!40000 ALTER TABLE `UM_PERMISSION` DISABLE KEYS */;
INSERT INTO `UM_PERMISSION` VALUES (1,'/permission','ui.execute',-1234,0),(2,'/','http://www.wso2.org/projects/registry/actions/get',-1234,0),(3,'/','http://www.wso2.org/projects/registry/actions/add',-1234,0),(4,'/','http://www.wso2.org/projects/registry/actions/delete',-1234,0),(5,'/','authorize',-1234,0),(6,'/_system/governance/apimgt/applicationdata/icons','http://www.wso2.org/projects/registry/actions/get',-1234,0),(7,'/permission/admin/login','ui.execute',-1234,0),(8,'/permission/admin/manage/api/subscribe','ui.execute',-1234,0),(9,'/_system/config/repository/components/org.wso2.carbon.captcha-images','http://www.wso2.org/projects/registry/actions/get',-1234,0),(10,'/_system/config/repository/components/org.wso2.carbon.captcha-images','http://www.wso2.org/projects/registry/actions/add',-1234,0),(11,'/_system/config/repository/components/org.wso2.carbon.captcha-images','http://www.wso2.org/projects/registry/actions/delete',-1234,0),(12,'/_system/config/repository/components/org.wso2.carbon.captcha-images','authorize',-1234,0),(13,'event/topics','subscribe',-1234,0),(14,'event/topics','publish',-1234,0),(15,'/_system/governance/repository/components/org.wso2.carbon.all-themes','http://www.wso2.org/projects/registry/actions/get',-1234,0),(16,'/_system/governance/repository/components/org.wso2.carbon.all-themes','http://www.wso2.org/projects/registry/actions/add',-1234,0),(17,'/_system/governance/repository/components/org.wso2.carbon.all-themes','http://www.wso2.org/projects/registry/actions/delete',-1234,0),(18,'/_system/governance/repository/components/org.wso2.carbon.all-themes','authorize',-1234,0);
/*!40000 ALTER TABLE `UM_PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_PROFILE_CONFIG`
--

DROP TABLE IF EXISTS `UM_PROFILE_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_PROFILE_CONFIG` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_DIALECT_ID` int(11) NOT NULL,
  `UM_PROFILE_NAME` varchar(255) DEFAULT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  KEY `UM_DIALECT_ID` (`UM_DIALECT_ID`,`UM_TENANT_ID`),
  CONSTRAINT `UM_PROFILE_CONFIG_ibfk_1` FOREIGN KEY (`UM_DIALECT_ID`, `UM_TENANT_ID`) REFERENCES `UM_DIALECT` (`UM_ID`, `UM_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_PROFILE_CONFIG`
--

LOCK TABLES `UM_PROFILE_CONFIG` WRITE;
/*!40000 ALTER TABLE `UM_PROFILE_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `UM_PROFILE_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_ROLE`
--

DROP TABLE IF EXISTS `UM_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_ROLE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_ROLE_NAME` varchar(255) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `UM_SHARED_ROLE` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_ROLE_NAME` (`UM_ROLE_NAME`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_ROLE`
--

LOCK TABLES `UM_ROLE` WRITE;
/*!40000 ALTER TABLE `UM_ROLE` DISABLE KEYS */;
INSERT INTO `UM_ROLE` VALUES (1,'admin',-1234,0);
/*!40000 ALTER TABLE `UM_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_ROLE_PERMISSION`
--

DROP TABLE IF EXISTS `UM_ROLE_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_ROLE_PERMISSION` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_PERMISSION_ID` int(11) NOT NULL,
  `UM_ROLE_NAME` varchar(255) NOT NULL,
  `UM_IS_ALLOWED` smallint(6) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `UM_DOMAIN_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_PERMISSION_ID` (`UM_PERMISSION_ID`,`UM_ROLE_NAME`,`UM_TENANT_ID`,`UM_DOMAIN_ID`),
  KEY `UM_PERMISSION_ID_2` (`UM_PERMISSION_ID`,`UM_TENANT_ID`),
  KEY `UM_DOMAIN_ID` (`UM_DOMAIN_ID`,`UM_TENANT_ID`),
  CONSTRAINT `UM_ROLE_PERMISSION_ibfk_1` FOREIGN KEY (`UM_PERMISSION_ID`, `UM_TENANT_ID`) REFERENCES `UM_PERMISSION` (`UM_ID`, `UM_TENANT_ID`),
  CONSTRAINT `UM_ROLE_PERMISSION_ibfk_2` FOREIGN KEY (`UM_DOMAIN_ID`, `UM_TENANT_ID`) REFERENCES `UM_DOMAIN` (`UM_DOMAIN_ID`, `UM_TENANT_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_ROLE_PERMISSION`
--

LOCK TABLES `UM_ROLE_PERMISSION` WRITE;
/*!40000 ALTER TABLE `UM_ROLE_PERMISSION` DISABLE KEYS */;
INSERT INTO `UM_ROLE_PERMISSION` VALUES (1,1,'admin',1,-1234,1),(2,2,'admin',1,-1234,1),(3,3,'admin',1,-1234,1),(4,4,'admin',1,-1234,1),(5,5,'admin',1,-1234,1),(6,2,'everyone',1,-1234,3),(7,6,'wso2.anonymous.role',1,-1234,2),(8,7,'subscriber',1,-1234,3),(9,8,'subscriber',1,-1234,3),(70,9,'wso2.anonymous.role',1,-1234,2),(71,10,'wso2.anonymous.role',0,-1234,2),(72,11,'wso2.anonymous.role',0,-1234,2),(73,12,'wso2.anonymous.role',0,-1234,2),(74,13,'admin',1,-1234,1),(75,14,'admin',1,-1234,1),(76,13,'everyone',1,-1234,3),(77,14,'everyone',1,-1234,3),(78,13,'subscriber',1,-1234,3),(79,14,'subscriber',1,-1234,3),(80,13,'sp1',1,-1234,3),(81,14,'sp1',1,-1234,3),(82,15,'wso2.anonymous.role',1,-1234,2),(83,16,'wso2.anonymous.role',0,-1234,2),(84,17,'wso2.anonymous.role',0,-1234,2),(85,18,'wso2.anonymous.role',0,-1234,2);
/*!40000 ALTER TABLE `UM_ROLE_PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_SHARED_USER_ROLE`
--

DROP TABLE IF EXISTS `UM_SHARED_USER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_SHARED_USER_ROLE` (
  `UM_ROLE_ID` int(11) NOT NULL,
  `UM_USER_ID` int(11) NOT NULL,
  `UM_USER_TENANT_ID` int(11) NOT NULL,
  `UM_ROLE_TENANT_ID` int(11) NOT NULL,
  UNIQUE KEY `UM_USER_ID` (`UM_USER_ID`,`UM_ROLE_ID`,`UM_USER_TENANT_ID`,`UM_ROLE_TENANT_ID`),
  KEY `UM_ROLE_ID` (`UM_ROLE_ID`,`UM_ROLE_TENANT_ID`),
  KEY `UM_USER_ID_2` (`UM_USER_ID`,`UM_USER_TENANT_ID`),
  CONSTRAINT `UM_SHARED_USER_ROLE_ibfk_1` FOREIGN KEY (`UM_ROLE_ID`, `UM_ROLE_TENANT_ID`) REFERENCES `UM_ROLE` (`UM_ID`, `UM_TENANT_ID`) ON DELETE CASCADE,
  CONSTRAINT `UM_SHARED_USER_ROLE_ibfk_2` FOREIGN KEY (`UM_USER_ID`, `UM_USER_TENANT_ID`) REFERENCES `UM_USER` (`UM_ID`, `UM_TENANT_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_SHARED_USER_ROLE`
--

LOCK TABLES `UM_SHARED_USER_ROLE` WRITE;
/*!40000 ALTER TABLE `UM_SHARED_USER_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `UM_SHARED_USER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_SYSTEM_ROLE`
--

DROP TABLE IF EXISTS `UM_SYSTEM_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_SYSTEM_ROLE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_ROLE_NAME` varchar(255) DEFAULT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_SYSTEM_ROLE`
--

LOCK TABLES `UM_SYSTEM_ROLE` WRITE;
/*!40000 ALTER TABLE `UM_SYSTEM_ROLE` DISABLE KEYS */;
INSERT INTO `UM_SYSTEM_ROLE` VALUES (1,'wso2.anonymous.role',-1234);
/*!40000 ALTER TABLE `UM_SYSTEM_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_SYSTEM_USER`
--

DROP TABLE IF EXISTS `UM_SYSTEM_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_SYSTEM_USER` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_USER_NAME` varchar(255) NOT NULL,
  `UM_USER_PASSWORD` varchar(255) NOT NULL,
  `UM_SALT_VALUE` varchar(31) DEFAULT NULL,
  `UM_REQUIRE_CHANGE` tinyint(1) DEFAULT '0',
  `UM_CHANGED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_USER_NAME` (`UM_USER_NAME`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_SYSTEM_USER`
--

LOCK TABLES `UM_SYSTEM_USER` WRITE;
/*!40000 ALTER TABLE `UM_SYSTEM_USER` DISABLE KEYS */;
INSERT INTO `UM_SYSTEM_USER` VALUES (1,'wso2.anonymous.user','kbGK6CF3wzROMxotCZUXsoB7OvCgDo/8LuiEhtPcixQ=','Py8l6WDGx5WjG8G1Xp6kvA==',0,'2015-04-21 06:12:49',-1234);
/*!40000 ALTER TABLE `UM_SYSTEM_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_SYSTEM_USER_ROLE`
--

DROP TABLE IF EXISTS `UM_SYSTEM_USER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_SYSTEM_USER_ROLE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_USER_NAME` varchar(255) DEFAULT NULL,
  `UM_ROLE_ID` int(11) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_USER_NAME` (`UM_USER_NAME`,`UM_ROLE_ID`,`UM_TENANT_ID`),
  KEY `UM_ROLE_ID` (`UM_ROLE_ID`,`UM_TENANT_ID`),
  CONSTRAINT `UM_SYSTEM_USER_ROLE_ibfk_1` FOREIGN KEY (`UM_ROLE_ID`, `UM_TENANT_ID`) REFERENCES `UM_SYSTEM_ROLE` (`UM_ID`, `UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_SYSTEM_USER_ROLE`
--

LOCK TABLES `UM_SYSTEM_USER_ROLE` WRITE;
/*!40000 ALTER TABLE `UM_SYSTEM_USER_ROLE` DISABLE KEYS */;
INSERT INTO `UM_SYSTEM_USER_ROLE` VALUES (1,'wso2.anonymous.user',1,-1234);
/*!40000 ALTER TABLE `UM_SYSTEM_USER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_TENANT`
--

DROP TABLE IF EXISTS `UM_TENANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_TENANT` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_DOMAIN_NAME` varchar(255) NOT NULL,
  `UM_EMAIL` varchar(255) DEFAULT NULL,
  `UM_ACTIVE` tinyint(1) DEFAULT '0',
  `UM_CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UM_USER_CONFIG` longblob,
  PRIMARY KEY (`UM_ID`),
  UNIQUE KEY `UM_DOMAIN_NAME` (`UM_DOMAIN_NAME`),
  UNIQUE KEY `INDEX_UM_TENANT_UM_DOMAIN_NAME` (`UM_DOMAIN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_TENANT`
--

LOCK TABLES `UM_TENANT` WRITE;
/*!40000 ALTER TABLE `UM_TENANT` DISABLE KEYS */;
/*!40000 ALTER TABLE `UM_TENANT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_USER`
--

DROP TABLE IF EXISTS `UM_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_USER` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_USER_NAME` varchar(255) NOT NULL,
  `UM_USER_PASSWORD` varchar(255) NOT NULL,
  `UM_SALT_VALUE` varchar(31) DEFAULT NULL,
  `UM_REQUIRE_CHANGE` tinyint(1) DEFAULT '0',
  `UM_CHANGED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_USER_NAME` (`UM_USER_NAME`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_USER`
--

LOCK TABLES `UM_USER` WRITE;
/*!40000 ALTER TABLE `UM_USER` DISABLE KEYS */;
INSERT INTO `UM_USER` VALUES (1,'admin','lpA5955khgQQEVLkf69ShtRw35wD1nvIpRzL1QHcpaI=','9irRaovzpkNQd9ZdlpmPvQ==',0,'2015-04-21 06:12:49',-1234);
/*!40000 ALTER TABLE `UM_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `UM_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_USER_ATTRIBUTE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_ATTR_NAME` varchar(255) NOT NULL,
  `UM_ATTR_VALUE` varchar(1024) DEFAULT NULL,
  `UM_PROFILE_ID` varchar(255) DEFAULT NULL,
  `UM_USER_ID` int(11) DEFAULT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  KEY `UM_USER_ID` (`UM_USER_ID`,`UM_TENANT_ID`),
  CONSTRAINT `UM_USER_ATTRIBUTE_ibfk_1` FOREIGN KEY (`UM_USER_ID`, `UM_TENANT_ID`) REFERENCES `UM_USER` (`UM_ID`, `UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_USER_ATTRIBUTE`
--

LOCK TABLES `UM_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `UM_USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `UM_USER_ATTRIBUTE` VALUES (1,'initials','false','default',1,-1234);
/*!40000 ALTER TABLE `UM_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_USER_PERMISSION`
--

DROP TABLE IF EXISTS `UM_USER_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_USER_PERMISSION` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_PERMISSION_ID` int(11) NOT NULL,
  `UM_USER_NAME` varchar(255) NOT NULL,
  `UM_IS_ALLOWED` smallint(6) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  KEY `UM_PERMISSION_ID` (`UM_PERMISSION_ID`,`UM_TENANT_ID`),
  CONSTRAINT `UM_USER_PERMISSION_ibfk_1` FOREIGN KEY (`UM_PERMISSION_ID`, `UM_TENANT_ID`) REFERENCES `UM_PERMISSION` (`UM_ID`, `UM_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_USER_PERMISSION`
--

LOCK TABLES `UM_USER_PERMISSION` WRITE;
/*!40000 ALTER TABLE `UM_USER_PERMISSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `UM_USER_PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM_USER_ROLE`
--

DROP TABLE IF EXISTS `UM_USER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_USER_ROLE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_ROLE_ID` int(11) NOT NULL,
  `UM_USER_ID` int(11) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_USER_ID` (`UM_USER_ID`,`UM_ROLE_ID`,`UM_TENANT_ID`),
  KEY `UM_ROLE_ID` (`UM_ROLE_ID`,`UM_TENANT_ID`),
  KEY `UM_USER_ID_2` (`UM_USER_ID`,`UM_TENANT_ID`),
  CONSTRAINT `UM_USER_ROLE_ibfk_1` FOREIGN KEY (`UM_ROLE_ID`, `UM_TENANT_ID`) REFERENCES `UM_ROLE` (`UM_ID`, `UM_TENANT_ID`),
  CONSTRAINT `UM_USER_ROLE_ibfk_2` FOREIGN KEY (`UM_USER_ID`, `UM_TENANT_ID`) REFERENCES `UM_USER` (`UM_ID`, `UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM_USER_ROLE`
--

LOCK TABLES `UM_USER_ROLE` WRITE;
/*!40000 ALTER TABLE `UM_USER_ROLE` DISABLE KEYS */;
INSERT INTO `UM_USER_ROLE` VALUES (1,1,1,-1234);
/*!40000 ALTER TABLE `UM_USER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-23  8:26:05
