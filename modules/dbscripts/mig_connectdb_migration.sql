CREATE TABLE `sp_configuration` (
  `client_id` varchar(100) NOT NULL DEFAULT '',
  `config_key` varchar(100) NOT NULL DEFAULT '',
  `config_value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`client_id`,`config_key`,`config_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `allowed_authenticators_sp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) DEFAULT NULL,
  `allowed_authenticator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `allowed_authenticators_sp_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `sp_configuration` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `allowed_authenticators_mno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile_network_operator` varchar(255) DEFAULT NULL,
  `allowed_authenticator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_STATUS` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` varchar(45) NOT NULL,
  `Msisdn` varchar(255) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Nonce` varchar(100) DEFAULT NULL,
  `Scope` varchar(25) DEFAULT NULL,
  `AcrValue` varchar(10) DEFAULT NULL,
  `SessionId` varchar(45) DEFAULT NULL,
  `IsMsisdnHeader` int(1) DEFAULT NULL,
  `IpHeader` varchar(45) DEFAULT NULL,
  `IsNewUser` int(1) DEFAULT NULL,
  `LoginHint` varchar(255) DEFAULT NULL,
  `Operator` varchar(25) DEFAULT NULL,
  `UserAgent` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `ConsumerKey` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6634 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  requiredIPValidation char(1) NOT NULL DEFAULT '0',
  ipHeader varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY operatorname (operatorname)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--

LOCK TABLES `operators` WRITE;
/*!40000 ALTER TABLE `operators` DISABLE KEYS */;
INSERT INTO `operators` VALUES (1,'spark','Spark Opearator','user',NULL,'user',NULL,
                                  'gGgvUANAGhRUzWTyXwYoGuk3WzQa',157680000,1395135145139,'4fb164d70def9f37b2f8e2f1daf467',
                                'http://localhost:8281/token','Basic U1JObDQzXzRTVks5MjZaVnNteXExOU1JNVFRYTpEV1Flb2NDeUVyN0lHYk8zRHJxRDc5SmtzVFVh',0,
                                NULL);
/*!40000 ALTER TABLE `operators` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `operators_msisdn_headers_properties`
--


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
  PRIMARY KEY (`param_id`),
  UNIQUE(`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result)
VALUES(1,'openid',0,0,1,'CONTINUE_WITH_HEADER','TRUST_LOGINHINT_MSISDN');

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result)
VALUES(2,'mnv',1,0,0,'ERROR_RETURN','BREAK');

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result)
VALUES(3,'mc_mnv_validate',1,0,0,'OFFNET_FALLBACK_TRUST_LOGINHINT','TRUST_LOGINHINT_MSISDN');

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result)
VALUES(4,'mc_mnv_validate_plus',1,1,0,'ERROR_RETURN','BREAK');

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result)
VALUES(5,'mnv_tc',1,0,1,'OFFNET_FALLBACK_TRUST_LOGINHINT','TRUST_LOGINHINT_MSISDN');

--
-- Table structure for table `login_hint_format`
--

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


CREATE TABLE `sms_hashkey_contextid_mapping` (
  `hashkey` varchar(255) DEFAULT NULL,
  `contextid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE clients (
  client_device_id VARCHAR(500) PRIMARY KEY,
  platform         VARCHAR(10),
  push_token       VARCHAR(500),
  date_time        DATETIME,
  msisdn           VARCHAR(20)
);


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
