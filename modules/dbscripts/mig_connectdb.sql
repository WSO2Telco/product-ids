-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dev2_connectdb
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
-- Table structure for table `clientstatus`
--
DROP DATABASE  IF EXISTS  mig_connectdb;
CREATE DATABASE mig_connectdb;
USE mig_connectdb;


--
-- Table structure for table `authenticated_login`
--

DROP TABLE IF EXISTS `authenticated_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticated_login` (
  `tokenID` varchar(255) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(255) DEFAULT NULL,
  `response_type` varchar(255) DEFAULT '0',
  `scope` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  `msisdn` varchar(255) DEFAULT NULL,
  `acr_value` int(11) NOT NULL DEFAULT '0',
  `nonce` varchar(255) DEFAULT '0',
  `state` varchar(255) DEFAULT '0',
  PRIMARY KEY (`tokenID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `clientstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientstatus` (
  `SessionID` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `pin` varchar(10) DEFAULT '0',
  `ussdsessionid` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientstatus`
--

LOCK TABLES `clientstatus` WRITE;
/*!40000 ALTER TABLE `clientstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcx_cross_operator_transaction_log`
--

DROP TABLE IF EXISTS `mcx_cross_operator_transaction_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcx_cross_operator_transaction_log` (
  `tx_id` varchar(200) NOT NULL,
  `tx_status` varchar(25) DEFAULT NULL,
  `batch_id` varchar(200) DEFAULT NULL,
  `api_id` varchar(25) DEFAULT NULL,
  `client_id` varchar(200) NOT NULL,
  `application_state` varchar(25) DEFAULT NULL,
  `sub_op_mcc` varchar(25) DEFAULT NULL,
  `sub_op_mnc` varchar(25) DEFAULT NULL,
  `timestamp_start` varchar(25) DEFAULT NULL,
  `timestamp_end` varchar(25) DEFAULT NULL,
  `exchange_response_code` int(25) DEFAULT NULL,
  PRIMARY KEY (`tx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcx_cross_operator_transaction_log`
--

LOCK TABLES `mcx_cross_operator_transaction_log` WRITE;
/*!40000 ALTER TABLE `mcx_cross_operator_transaction_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcx_cross_operator_transaction_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mepin_accounts`
--

DROP TABLE IF EXISTS `mepin_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mepin_accounts` (
  `user_id` varchar(25) NOT NULL DEFAULT '',
  `mepin_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mepin_accounts`
--

LOCK TABLES `mepin_accounts` WRITE;
/*!40000 ALTER TABLE `mepin_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mepin_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mepin_transactions`
--

DROP TABLE IF EXISTS `mepin_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mepin_transactions` (
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `transaction_id` varchar(255) DEFAULT NULL,
  `mepin_id` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mepin_transactions`
--

LOCK TABLES `mepin_transactions` WRITE;
/*!40000 ALTER TABLE `mepin_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mepin_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiplepasswords`
--

DROP TABLE IF EXISTS `multiplepasswords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multiplepasswords` (
  `username` varchar(255) NOT NULL,
  `pin` int(11) DEFAULT NULL,
  `attempts` int(11) NOT NULL,
  `ussdsessionid` varchar(256) NOT NULL,
  PRIMARY KEY (`ussdsessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiplepasswords`
--

LOCK TABLES `multiplepasswords` WRITE;
/*!40000 ALTER TABLE `multiplepasswords` DISABLE KEYS */;
/*!40000 ALTER TABLE `multiplepasswords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendingussd`
--

DROP TABLE IF EXISTS `pendingussd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pendingussd` (
  `msisdn` bigint(20) unsigned NOT NULL,
  `requesttype` int(1) NOT NULL COMMENT '1-register, 2-login, 3-pinreset',
  PRIMARY KEY (`msisdn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendingussd`
--

LOCK TABLES `pendingussd` WRITE;
/*!40000 ALTER TABLE `pendingussd` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendingussd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `PersonID` int(11) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pin`
--

DROP TABLE IF EXISTS `pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pin` (
  `username` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pin`
--

LOCK TABLES `pin` WRITE;
/*!40000 ALTER TABLE `pin` DISABLE KEYS */;
/*!40000 ALTER TABLE `pin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regstatus`
--

DROP TABLE IF EXISTS `regstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regstatus` (
  `username` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `pin` varchar(10) DEFAULT '0',
  `uuid` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regstatus`
--

LOCK TABLES `regstatus` WRITE;
/*!40000 ALTER TABLE `regstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `regstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_login_history`
--

DROP TABLE IF EXISTS `sp_login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_login_history` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `reqtype` varchar(20) DEFAULT NULL,
  `application_id` varchar(45) DEFAULT NULL,
  `authenticated_user` varchar(45) DEFAULT NULL,
  `isauthenticated` int(5) DEFAULT NULL,
  `authenticators` varchar(255) DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `created` varchar(25) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `lastupdated` varchar(25) DEFAULT NULL,
  `lastupdated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `sp_configuration`;

CREATE TABLE `sp_configuration` (
 `client_id` varchar(100) NOT NULL,
 `config_key` varchar(100) NOT NULL,
 `config_value` varchar(255) NOT NULL,
 `operator` varchar(100) NOT NULL DEFAULT 'ALL',
 PRIMARY KEY (`client_id`,`config_key`,`config_value`,`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `allowed_authenticators_sp`;

CREATE TABLE `allowed_authenticators_sp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) DEFAULT NULL,
  `allowed_authenticator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `allowed_authenticators_sp_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `sp_configuration` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `allowed_authenticators_mno`;

CREATE TABLE `allowed_authenticators_mno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile_network_operator` varchar(255) DEFAULT NULL,
  `allowed_authenticator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_login_history`
--

LOCK TABLES `sp_login_history` WRITE;
/*!40000 ALTER TABLE `sp_login_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operators`
--

DROP TABLE IF EXISTS `operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE operators (
  ID int(20) NOT NULL AUTO_INCREMENT,
  operatorname varchar(45) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  created varchar(25) DEFAULT NULL,
  created_date timestamp NULL DEFAULT NULL,
  lastupdated varchar(25) DEFAULT NULL,
  lastupdated_date timestamp NULL DEFAULT NULL,
  refreshtoken varchar(255) DEFAULT NULL,
  tokenvalidity double DEFAULT NULL,
  tokentime double DEFAULT NULL,
  token varchar(255) DEFAULT NULL,
  tokenurl varchar(255) DEFAULT NULL,
  tokenauth varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY operatorname (operatorname)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operators`
--

LOCK TABLES `operators` WRITE;
/*!40000 ALTER TABLE `operators` DISABLE KEYS */;
INSERT INTO `operators` VALUES (1,'spark','Spark Opearator','user',NULL,'user',NULL,
                                  'gGgvUANAGhRUzWTyXwYoGuk3WzQa',157680000,1395135145139,'4fb164d70def9f37b2f8e2f1daf467',
                                'http://localhost:8281/token','Basic U1JObDQzXzRTVks5MjZaVnNteXExOU1JNVFRYTpEV1Flb2NDeUVyN0lHYk8zRHJxRDc5SmtzVFVh');
/*!40000 ALTER TABLE `operators` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `operators_msisdn_headers_properties`
--

DROP TABLE IF EXISTS operators_msisdn_headers_properties;

CREATE TABLE operators_msisdn_headers_properties (
  operatorId int(20) NOT NULL,
  msisdnHeaderName VARCHAR(256) NOT NULL,
  isHeaderEncrypted char(1) NOT NULL DEFAULT '0',
  encryptionImplementation VARCHAR(256),
  msisdnEncryptionKey varchar(512),
  priority int(3),
  PRIMARY KEY (operatorId, msisdnHeaderName),
  FOREIGN KEY (operatorId) REFERENCES operators(ID) ON DELETE CASCADE
)ENGINE INNODB;

INSERT INTO operators_msisdn_headers_properties VALUES (1,'msisdn','0','','',1),(1,'msisdn_header_1','1','DecryptMsisdn','wdTDoh8YxYcd3p',2);


--
-- Table structure for table `scope_parameter`
--

DROP TABLE IF EXISTS `scope_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope_parameter` (
  `param_id` int(20) NOT NULL,
  `scope` varchar(255) NOT NULL,
  `is_login_hint_mandatory` TINYINT DEFAULT 0,
  `is_header_msisdn_mandatory` TINYINT DEFAULT 0,
  `is_tnc_visible` TINYINT DEFAULT 0,
  `msisdn_mismatch_result` varchar(255),
  `he_failure_result` varchar(255),
  `is_multiscope` TINYINT DEFAULT 0,
  PRIMARY KEY (`param_id`),
  UNIQUE(`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope)
VALUES(1,'openid',0,0,1,'CONTINUE_WITH_HEADER','TRUST_LOGINHINT_MSISDN',0);

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope)
VALUES(2,'mnv',1,0,0,'ERROR_RETURN','BREAK',0);

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope)
VALUES(3,'mc_mnv_validate',1,0,0,'OFFNET_FALLBACK_TRUST_LOGINHINT','TRUST_LOGINHINT_MSISDN',0);

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope)
VALUES(4,'mc_mnv_validate_plus',1,1,0,'ERROR_RETURN','BREAK',0);

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope)
VALUES(5,'mnv_tc',1,0,1,'OFFNET_FALLBACK_TRUST_LOGINHINT','TRUST_LOGINHINT_MSISDN',0);

INSERT INTO scope_parameter(param_id,scope,is_multiscope)
VALUES(6,'phone',1);

INSERT INTO scope_parameter(param_id,scope,is_multiscope)
VALUES(7,'profile',1);

INSERT INTO scope_parameter(param_id,scope,is_multiscope)
VALUES(8,'email',1);

INSERT INTO scope_parameter(param_id,scope,is_multiscope)
VALUES(9,'address',1);

INSERT INTO scope_parameter(param_id,scope,is_multiscope)
VALUES(10,'mc_identity_phonenumber_hashed',1);


DROP TABLE IF EXISTS `prompt_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prompt_configuration` (
  `scope` varchar(255) NOT NULL,
  `prompt_value` varchar(255) NOT NULL,
  `is_login_hint_exists` TINYINT DEFAULT 0,
  `behaviour` varchar(255),
  PRIMARY KEY (scope, prompt_value, is_login_hint_exists)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO prompt_configuration VALUES ('openid', 'login', 1, 'OFFNET_TRUST_LOGIN_HINT'),
('openid', 'no_seam', 1, 'OFFNET_TRUST_LOGIN_HINT'),
('mnv', 'no_seam', 1, 'OFFNET_TRUST_LOGIN_HINT'),
('mc_mnv_validate', 'no_seam', 1, 'OFFNET_TRUST_LOGIN_HINT'),
('mnv_tc', 'no_seam', 1, 'OFFNET_TRUST_LOGIN_HINT'),
('mc_mnv_validate_plus', 'no_seam', 1, 'OFFNET_TRUST_LOGIN_HINT'),
('openid', 'no_seam', 0, 'OFFNET_TRUST_LOGIN_HINT');
--
-- Table structure for table `login_hint_format`
--

DROP TABLE IF EXISTS `login_hint_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_hint_format` (
  `format_id` int(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `is_encrypted` TINYINT DEFAULT 0,
  `decrypt_algorithm` varchar(255),
  PRIMARY KEY (`format_id`),
  UNIQUE(`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO login_hint_format(format_id,type,is_encrypted,decrypt_algorithm) VALUES(1,'PLAINTEXT',0,NULL);
INSERT INTO login_hint_format(format_id,type,is_encrypted,decrypt_algorithm) VALUES(2,'ENCRYPTED',1,'RSA');
INSERT INTO login_hint_format(format_id,type,is_encrypted,decrypt_algorithm) VALUES(3,'MSISDN',0,NULL);


--
-- Table structure for table `scope_supp_login_hint_format`
--

DROP TABLE IF EXISTS `scope_supp_login_hint_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope_supp_login_hint_format` (
  `param_id` int(20) NOT NULL,
  `format_id` int(20) NOT NULL,
  PRIMARY KEY (`param_id`,`format_id`),
  FOREIGN KEY (`param_id`) REFERENCES `scope_parameter`(`param_id`),
  FOREIGN KEY (`format_id`) REFERENCES `login_hint_format`(`format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(1,1);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(2,1);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(3,1);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(4,1);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(5,1);

INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(1,2);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(2,2);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(3,2);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(4,2);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(5,2);

INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(1,3);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(2,3);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(3,3);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(4,3);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(5,3);

DROP TABLE IF EXISTS `sms_hashkey_contextid_mapping`;
CREATE TABLE `sms_hashkey_contextid_mapping` (
  `hashkey` varchar(255) DEFAULT NULL,
  `contextid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
  client_device_id VARCHAR(500) PRIMARY KEY,
  platform         VARCHAR(10),
  push_token       VARCHAR(500),
  date_time        DATETIME,
  msisdn           VARCHAR(20)
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  id               INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ref_id           VARCHAR(200),
  client_device_id VARCHAR(500),
  message          VARCHAR(1000),
  req_date_time    DATETIME,
  res_date_time    DATETIME,
  status           CHAR,
  FOREIGN KEY (client_device_id) REFERENCES clients (client_device_id)
    ON DELETE CASCADE
);

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `scope_log`
--

DROP TABLE IF EXISTS `scope_log`;

 CREATE TABLE `scope_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(125) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sub` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accessToken` (`access_token`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1
