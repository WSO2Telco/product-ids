
DROP DATABASE  IF EXISTS  mig_connectdb;
CREATE DATABASE mig_connectdb;
USE mig_connectdb;



DROP TABLE IF EXISTS `authenticated_login`;

CREATE TABLE `authenticated_login` (
    `tokenID` VARCHAR(255) NOT NULL,
    `client_id` VARCHAR(255) DEFAULT NULL,
    `redirect_uri` VARCHAR(255) DEFAULT NULL,
    `response_type` VARCHAR(255) DEFAULT '0',
    `scope` VARCHAR(255) DEFAULT NULL,
    `status` VARCHAR(255) DEFAULT '0',
    `msisdn` VARCHAR(255) DEFAULT NULL,
    `acr_value` INT(11) NOT NULL DEFAULT '0',
    `nonce` VARCHAR(255) DEFAULT '0',
    `state` VARCHAR(255) DEFAULT '0',
    PRIMARY KEY (`tokenID`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;

DROP TABLE IF EXISTS consent_type;

CREATE TABLE consent_type (
    consent_typeID INT(11) NOT NULL,
    consent_type VARCHAR(45),
    PRIMARY KEY (consent_typeID)
)  ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO consent_type(consent_typeID,consent_type) VALUES(1,'implicit');
INSERT INTO consent_type(consent_typeID,consent_type) VALUES(2,'explicit');
INSERT INTO consent_type(consent_typeID,consent_type) VALUES(3,'no_consent');

DROP TABLE IF EXISTS consent_validity_type;

CREATE TABLE consent_validity_type (
    validity_id INT(11) NOT NULL,
    validity_type VARCHAR(50),
    has_exp_period SMALLINT(6),
    default_exp_period INT(11),
    PRIMARY KEY (validity_id)
)  ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO consent_validity_type(validity_id,validity_type,has_exp_period,default_exp_period) VALUES(1,'transactional',0,0);
INSERT INTO consent_validity_type(validity_id,validity_type,has_exp_period,default_exp_period) VALUES(2,'long_live',1,30);
INSERT INTO consent_validity_type(validity_id,validity_type,has_exp_period,default_exp_period) VALUES(3,'undefined',0,0);

DROP TABLE IF EXISTS scope_types;

CREATE TABLE scope_types (
    scope_type VARCHAR(30) NOT NULL,
    description VARCHAR(30) NOT NULL,
    PRIMARY KEY (scope_type)
)  ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO scope_types(scope_type,description) VALUES('APICONSENT','Api Consent Requesting Scope');
INSERT INTO scope_types(scope_type,description) VALUES('ATT_SHARE','Attribute Sharing Scopes');
INSERT INTO scope_types(scope_type,description) VALUES('ATT_VERIFICATION','Attribute verification Scopes');
INSERT INTO scope_types(scope_type,description) VALUES('MAIN','Main Scopes');
INSERT INTO scope_types(scope_type,description) VALUES('OTHER','Other Scopes');

DROP TABLE IF EXISTS trustedstatus;

CREATE TABLE trustedstatus (
    id_Trusted_type INT(11) NOT NULL,
    status VARCHAR(255),
    isMsisdnMandatory TINYINT(1),
    sptype VARCHAR(255),
    description VARCHAR(255),
    PRIMARY KEY (id_Trusted_type)
)  ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO trustedstatus(id_Trusted_type,status,isMsisdnMandatory,sptype,description) VALUES(1,'fullytrusted',1,'tsp1','have rights to both authenticate and get cons');
INSERT INTO trustedstatus(id_Trusted_type,status,isMsisdnMandatory,sptype,description) VALUES(2,'trusted',1,'tsp2','have rights to authenticate user');
INSERT INTO trustedstatus(id_Trusted_type,status,isMsisdnMandatory,sptype,description) VALUES(3,'normal',0,'normal','no right for authenticate nor get consent');


DROP TABLE IF EXISTS `clientstatus`;

CREATE TABLE `clientstatus` (
    `SessionID` VARCHAR(255) DEFAULT NULL,
    `Status` VARCHAR(255) DEFAULT NULL,
    `pin` VARCHAR(10) DEFAULT '0',
    `ussdsessionid` VARCHAR(256) DEFAULT NULL
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;


DROP TABLE IF EXISTS `mcx_cross_operator_transaction_log`;

CREATE TABLE `mcx_cross_operator_transaction_log` (
    `tx_id` VARCHAR(200) NOT NULL,
    `tx_status` VARCHAR(25) DEFAULT NULL,
    `batch_id` VARCHAR(200) DEFAULT NULL,
    `api_id` VARCHAR(25) DEFAULT NULL,
    `client_id` VARCHAR(200) NOT NULL,
    `application_state` VARCHAR(25) DEFAULT NULL,
    `sub_op_mcc` VARCHAR(25) DEFAULT NULL,
    `sub_op_mnc` VARCHAR(25) DEFAULT NULL,
    `timestamp_start` VARCHAR(25) DEFAULT NULL,
    `timestamp_end` VARCHAR(25) DEFAULT NULL,
    `exchange_response_code` INT(25) DEFAULT NULL,
    PRIMARY KEY (`tx_id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;


DROP TABLE IF EXISTS `mepin_accounts`;

CREATE TABLE `mepin_accounts` (
    `user_id` VARCHAR(25) NOT NULL DEFAULT '',
    `mepin_id` VARCHAR(255) DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`user_id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;



DROP TABLE IF EXISTS `mepin_transactions`;

CREATE TABLE `mepin_transactions` (
    `session_id` VARCHAR(255) NOT NULL DEFAULT '',
    `transaction_id` VARCHAR(255) DEFAULT NULL,
    `mepin_id` VARCHAR(255) DEFAULT NULL,
    `status` VARCHAR(50) DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`session_id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;


DROP TABLE IF EXISTS `multiplepasswords`;

CREATE TABLE `multiplepasswords` (
    `username` VARCHAR(255) NOT NULL,
    `pin` INT(11) DEFAULT NULL,
    `attempts` INT(11) NOT NULL,
    `ussdsessionid` VARCHAR(256) NOT NULL,
    PRIMARY KEY (`ussdsessionid`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;


DROP TABLE IF EXISTS `pendingussd`;

CREATE TABLE `pendingussd` (
    `msisdn` BIGINT(20) UNSIGNED NOT NULL,
    `requesttype` INT(1) NOT NULL COMMENT '1-register, 2-login, 3-pinreset',
    PRIMARY KEY (`msisdn`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;


DROP TABLE IF EXISTS `persons`;

CREATE TABLE `persons` (
    `PersonID` INT(11) DEFAULT NULL,
    `LastName` VARCHAR(255) DEFAULT NULL,
    `FirstName` VARCHAR(255) DEFAULT NULL,
    `Address` VARCHAR(255) DEFAULT NULL,
    `City` VARCHAR(255) DEFAULT NULL
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;


DROP TABLE IF EXISTS `pin`;

CREATE TABLE `pin` (
    `username` VARCHAR(255) DEFAULT NULL,
    `pin` VARCHAR(255) DEFAULT NULL
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;


DROP TABLE IF EXISTS `regstatus`;

CREATE TABLE `regstatus` (
    `username` VARCHAR(255) DEFAULT NULL,
    `status` VARCHAR(255) DEFAULT NULL,
    `pin` VARCHAR(10) DEFAULT '0',
    `uuid` VARCHAR(255) DEFAULT '0'
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;

CREATE INDEX uuid_index ON `regstatus`(uuid);


DROP TABLE IF EXISTS `sp_login_history`;

CREATE TABLE `sp_login_history` (
    `id` INT(20) NOT NULL AUTO_INCREMENT,
    `reqtype` VARCHAR(20) DEFAULT NULL,
    `application_id` VARCHAR(45) DEFAULT NULL,
    `authenticated_user` VARCHAR(45) DEFAULT NULL,
    `isauthenticated` INT(5) DEFAULT NULL,
    `authenticators` VARCHAR(255) DEFAULT NULL,
    `ipaddress` VARCHAR(20) DEFAULT NULL,
    `created` VARCHAR(25) DEFAULT NULL,
    `created_date` TIMESTAMP NULL DEFAULT NULL,
    `lastupdated` VARCHAR(25) DEFAULT NULL,
    `lastupdated_date` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;

DROP TABLE IF EXISTS `sp_configuration`;

CREATE TABLE `sp_configuration` (
    `client_id` VARCHAR(100) NOT NULL,
    `config_key` VARCHAR(100) NOT NULL,
    `config_value` VARCHAR(255) NOT NULL,
    `operator` VARCHAR(100) NOT NULL DEFAULT 'ALL',
    PRIMARY KEY (`client_id` , `config_key` , `config_value` , `operator`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;

DROP TABLE IF EXISTS `allowed_authenticators_sp`;

CREATE TABLE `allowed_authenticators_sp` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `client_id` VARCHAR(100) DEFAULT NULL,
    `allowed_authenticator` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `client_id` (`client_id`),
    CONSTRAINT `allowed_authenticators_sp_ibfk_1` FOREIGN KEY (`client_id`)
        REFERENCES `sp_configuration` (`client_id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;

DROP TABLE IF EXISTS `allowed_authenticators_mno`;

CREATE TABLE `allowed_authenticators_mno` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `mobile_network_operator` VARCHAR(255) DEFAULT NULL,
    `allowed_authenticator` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;


DROP TABLE IF EXISTS `operators`;

CREATE TABLE operators (
    ID INT(20) NOT NULL AUTO_INCREMENT,
    operatorname VARCHAR(45) DEFAULT NULL,
    description VARCHAR(255) DEFAULT NULL,
    created VARCHAR(25) DEFAULT NULL,
    created_date TIMESTAMP NULL DEFAULT NULL,
    lastupdated VARCHAR(25) DEFAULT NULL,
    lastupdated_date TIMESTAMP NULL DEFAULT NULL,
    refreshtoken VARCHAR(255) DEFAULT NULL,
    tokenvalidity DOUBLE DEFAULT NULL,
    tokentime DOUBLE DEFAULT NULL,
    token VARCHAR(255) DEFAULT NULL,
    tokenurl VARCHAR(255) DEFAULT NULL,
    tokenauth VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (ID),
    UNIQUE KEY operatorname (operatorname)
)  ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=LATIN1;


INSERT INTO `operators` VALUES (1,'spark','Spark Opearator','user',NULL,'user',NULL,
                                  'gGgvUANAGhRUzWTyXwYoGuk3WzQa',157680000,1395135145139,'4fb164d70def9f37b2f8e2f1daf467',
                                'http://localhost:8281/token','Basic U1JObDQzXzRTVks5MjZaVnNteXExOU1JNVFRYTpEV1Flb2NDeUVyN0lHYk8zRHJxRDc5SmtzVFVh');


DROP TABLE IF EXISTS operators_msisdn_headers_properties;

CREATE TABLE operators_msisdn_headers_properties (
    operatorId INT(20) NOT NULL,
    msisdnHeaderName VARCHAR(256) NOT NULL,
    isHeaderEncrypted CHAR(1) NOT NULL DEFAULT '0',
    encryptionImplementation VARCHAR(256),
    msisdnEncryptionKey VARCHAR(512),
    priority INT(3),
    PRIMARY KEY (operatorId , msisdnHeaderName),
    FOREIGN KEY (operatorId)
        REFERENCES operators (ID)
        ON DELETE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

INSERT INTO operators_msisdn_headers_properties VALUES (1,'msisdn','0','','',1),(1,'msisdn_header_1','1','DecryptMsisdn','wdTDoh8YxYcd3p',2);

DROP TABLE IF EXISTS scope_parameter;

CREATE TABLE `scope_parameter` (
    `param_id` INT(20) NOT NULL,
    `scope` VARCHAR(255) NOT NULL,
    `is_login_hint_mandatory` TINYINT DEFAULT 0,
    `is_header_msisdn_mandatory` TINYINT DEFAULT 0,
    `is_tnc_visible` TINYINT DEFAULT 0,
    `msisdn_mismatch_result` VARCHAR(255),
    `he_failure_result` VARCHAR(255),
    `is_multiscope` TINYINT DEFAULT 0,
    `is_consent_page` TINYINT NOT NULL DEFAULT 0,
    `description` VARCHAR(255),
    `scope_type` VARCHAR(30),
    `is_backchannel_allowed` TINYINT DEFAULT 0,
    `scope_role` VARCHAR(30),
    PRIMARY KEY (`param_id`),
    FOREIGN KEY (`scope_type`) REFERENCES `scope_types`(`scope_type`),
    UNIQUE KEY `scope` (`scope`),
    KEY `scope_type` (`scope_type`),
    CONSTRAINT `scope_parameter_ibfk_3` FOREIGN KEY (`scope_type`) REFERENCES `scope_types` (`scope_type`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope,scope_type)
VALUES(1,'openid',0,0,1,'CONTINUE_WITH_HEADER','TRUST_LOGINHINT_MSISDN',0,"MAIN");

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope,scope_type)
VALUES(2,'mnv',1,0,0,'ERROR_RETURN','BREAK',0,"MAIN");

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope,scope_type)
VALUES(3,'mc_mnv_validate',1,0,0,'OFFNET_FALLBACK_TRUST_LOGINHINT','TRUST_LOGINHINT_MSISDN',0,"MAIN");

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope,scope_type)
VALUES(4,'mc_mnv_validate_plus',1,1,0,'ERROR_RETURN','BREAK',0,"MAIN");

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope,scope_type)
VALUES(5,'mnv_tc',1,0,1,'OFFNET_FALLBACK_TRUST_LOGINHINT','TRUST_LOGINHINT_MSISDN',0,"MAIN");

INSERT INTO scope_parameter(param_id,scope,scope_type,is_multiscope)
VALUES(6,'phone','OTHER',1);

INSERT INTO scope_parameter(param_id,scope,scope_type,is_multiscope)
VALUES(7,'profile','OTHER',1);

INSERT INTO scope_parameter(param_id,scope,scope_type,is_multiscope)
VALUES(8,'email','OTHER',1);

INSERT INTO scope_parameter(param_id,scope,scope_type,is_multiscope)
VALUES(9,'address','OTHER',1);

INSERT INTO scope_parameter(param_id,scope,scope_type,is_multiscope)
VALUES(10,'mc_identity_phonenumber_hashed','OTHER',1);

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope,is_consent_page,scope_type)
VALUES(11,'api',0,0,1,'CONTINUE_WITH_HEADER','TRUST_LOGINHINT_MSISDN',0,1,"MAIN");

INSERT INTO scope_parameter(param_id,scope,is_multiscope,is_consent_page,description,scope_type,scope_role)
VALUES(12,'sms',1,1,'SMS is Charged 5 per sms',"APICONSENT","mig_sp_sms");

INSERT INTO scope_parameter(param_id,scope,is_multiscope,is_consent_page,description,scope_type,scope_role)
VALUES(13,'charge',1,1,'Charge API will be charged per transaction',"APICONSENT","mig_sp_charge");

INSERT INTO scope_parameter(param_id,scope,is_multiscope,is_consent_page,description,scope_type,scope_role)
VALUES(14,'payment',1,1,'A convenient fee of 1% charged',"APICONSENT","mig_sp_payment");

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope,is_consent_page,description,scope_type)
VALUES(15,'p_form_fill',0,0,0,NULL,NULL,1,1,'p_form_fill','ATT_SHARE');

INSERT INTO scope_parameter(param_id,scope,is_login_hint_mandatory,is_header_msisdn_mandatory,is_tnc_visible,msisdn_mismatch_result,he_failure_result,is_multiscope,is_consent_page,description,scope_type)
VALUES(16,'p_anti_fraud',0,0,0,NULL,NULL,1,1,'p_anti_fraud','ATT_SHARE');

DROP TABLE IF EXISTS consent;

CREATE TABLE `consent` (
  `consent_id` int(20) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `scope_id` int(20) NOT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `approve_status` varchar(45) DEFAULT NULL,
  `exp_period` int(11) DEFAULT NULL,
  `consent_type` int(11) DEFAULT NULL,
  `consent_validity_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`consent_id`),
  UNIQUE KEY `client_id` (`client_id`,`scope_id`,`operator_id`),
  KEY `scope_id` (`scope_id`),
  KEY `consent_ibfk_2` (`consent_type`),
  KEY `consent_ibfk_3` (`consent_validity_type`),
  CONSTRAINT `consent_ibfk_1` FOREIGN KEY (`scope_id`) REFERENCES `scope_parameter` (`param_id`),
  CONSTRAINT `consent_ibfk_2` FOREIGN KEY (`consent_type`) REFERENCES `consent_type` (`consent_typeID`),
  CONSTRAINT `consent_ibfk_3` FOREIGN KEY (`consent_validity_type`) REFERENCES `consent_validity_type` (`validity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `user_consent`;

CREATE TABLE `user_consent` (
  `user_consent_id` int(20) NOT NULL AUTO_INCREMENT,
  `consent_id` int(20) NOT NULL,
  `msisdn` varchar(45) NOT NULL,
  `expire_time` timestamp NULL DEFAULT NULL,
  `consent_status` tinyint(4) DEFAULT '0',
  `client_id` varchar(100) NOT NULL,
  `operator` varchar(100) NOT NULL,
  PRIMARY KEY (`user_consent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `consent_configuration`;

CREATE TABLE `consent_configuration` (
    `consent_id` INT(20) NOT NULL AUTO_INCREMENT,
    `client_id` VARCHAR(100) NOT NULL,
    `scope_id` INT(20) NOT NULL,
    `operator_id` INT(20) NOT NULL,
    `approve_status` VARCHAR(45),
    PRIMARY KEY (`consent_id`),
    FOREIGN KEY (`scope_id`) REFERENCES `scope_parameter`(`param_id`),
    UNIQUE (`client_id`,`scope_id`,`operator_id`)
)  ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `consent_given_user_lifetime`;

CREATE TABLE `consent_given_user_lifetime` (
    `user_consent_id` INT(20) NOT NULL AUTO_INCREMENT,
    `msisdn` VARCHAR(255) NOT NULL,
    `consent_id` INT(20),
    `approve` TINYINT DEFAULT 0,
    PRIMARY KEY (`user_consent_id`),
    FOREIGN KEY (`consent_id`) REFERENCES `consent_configuration`(`consent_id`)
)  ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `consent_user_history`;

CREATE TABLE `consent_user_history` (
    `id` INT(20) NOT NULL AUTO_INCREMENT,
    `msisdn` VARCHAR(255) NOT NULL,
    `consent_id` INT(20),
    `approve_status` VARCHAR(45),
    `consent_date` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`consent_id`) REFERENCES `consent_configuration`(`consent_id`)
)  ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `prompt_configuration`;

CREATE TABLE `prompt_configuration` (
    `scope` VARCHAR(255) NOT NULL,
    `prompt_value` VARCHAR(255) NOT NULL,
    `is_login_hint_exists` TINYINT DEFAULT 0,
    `behaviour` VARCHAR(255),
    PRIMARY KEY (scope , prompt_value , is_login_hint_exists)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;


INSERT INTO prompt_configuration VALUES ('openid', 'login', 1, 'OFFNET_TRUST_LOGIN_HINT'),
('openid', 'no_seam', 1, 'OFFNET_TRUST_LOGIN_HINT'),
('mnv', 'no_seam', 1, 'OFFNET_TRUST_LOGIN_HINT'),
('mc_mnv_validate', 'no_seam', 1, 'OFFNET_TRUST_LOGIN_HINT'),
('mnv_tc', 'no_seam', 1, 'OFFNET_TRUST_LOGIN_HINT'),
('mc_mnv_validate_plus', 'no_seam', 1, 'OFFNET_TRUST_LOGIN_HINT'),
('openid', 'no_seam', 0, 'OFFNET_TRUST_LOGIN_HINT');


DROP TABLE IF EXISTS `login_hint_format`;

CREATE TABLE `login_hint_format` (
    `format_id` INT(20) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `is_encrypted` TINYINT DEFAULT 0,
    `decrypt_algorithm` VARCHAR(255),
    PRIMARY KEY (`format_id`),
    UNIQUE (`type`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;


INSERT INTO login_hint_format(format_id,type,is_encrypted,decrypt_algorithm) VALUES(1,'PLAINTEXT',0,NULL);
INSERT INTO login_hint_format(format_id,type,is_encrypted,decrypt_algorithm) VALUES(2,'ENCRYPTED',1,'RSA');
INSERT INTO login_hint_format(format_id,type,is_encrypted,decrypt_algorithm) VALUES(3,'MSISDN',0,NULL);


DROP TABLE IF EXISTS `scope_supp_login_hint_format`;

CREATE TABLE `scope_supp_login_hint_format` (
    `param_id` INT(20) NOT NULL,
    `format_id` INT(20) NOT NULL,
    PRIMARY KEY (`param_id` , `format_id`),
    FOREIGN KEY (`param_id`)
        REFERENCES `scope_parameter` (`param_id`),
    FOREIGN KEY (`format_id`)
        REFERENCES `login_hint_format` (`format_id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;


INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(1,1);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(2,1);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(3,1);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(4,1);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(5,1);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(11,1);

INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(1,2);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(2,2);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(3,2);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(4,2);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(5,2);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(11,2);

INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(1,3);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(2,3);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(3,3);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(4,3);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(5,3);
INSERT INTO `scope_supp_login_hint_format`(param_id,format_id) VALUES(11,3);

DROP TABLE IF EXISTS `sms_hashkey_contextid_mapping`;
CREATE TABLE `sms_hashkey_contextid_mapping` (
    `hashkey` VARCHAR(255) DEFAULT NULL,
    `contextid` VARCHAR(255) DEFAULT NULL
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;

DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
    client_device_id VARCHAR(500) PRIMARY KEY,
    platform VARCHAR(10),
    push_token VARCHAR(500),
    date_time DATETIME,
    msisdn VARCHAR(20)
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ref_id VARCHAR(200),
    client_device_id VARCHAR(500),
    message VARCHAR(1000),
    req_date_time DATETIME,
    res_date_time DATETIME,
    status CHAR,
    FOREIGN KEY (client_device_id)
        REFERENCES clients (client_device_id)
        ON DELETE CASCADE
);



DROP TABLE IF EXISTS `scope_log`;

CREATE TABLE `scope_log` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `access_token` VARCHAR(125) DEFAULT NULL,
    `created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `sub` VARCHAR(200) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `accessToken` (`access_token`)
)  ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=LATIN1;

DROP TABLE IF EXISTS `sms_otp`;

CREATE TABLE `sms_otp` (
    `session_id` VARCHAR(255),
    `otp` VARCHAR(65) DEFAULT NULL,
    `status` VARCHAR(15) DEFAULT NULL,
  PRIMARY KEY (`session_id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;

DROP TABLE IF EXISTS `federated_idp_mappings`;

CREATE TABLE `federated_idp_mappings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(45) DEFAULT NULL,
  `federated_authcode` varchar(255) DEFAULT NULL,
  `accesstoken` varchar(255) DEFAULT NULL,
  `federated_accesstoken` varchar(255) DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `idx_accesstoken` (`accesstoken`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS backchannel_request_details;

CREATE TABLE backchannel_request_details (
    correlation_id varchar(255),
    session_id varchar(255) UNIQUE,
    msisdn varchar(20),
    notification_bearer_token varchar(255),
    notification_url varchar(255) NOT NULL,
    auth_code varchar(50),
    request_initiated_time DATETIME,
    client_id varchar(50),
    redirect_url varchar(255),
    scopes varchar(255) NOT NULL,
    operator varchar(20) NOT NULL,
    isNewUser BOOLEAN NOT NULL DEFAULT 0,
    spName varchar(50),
    isLongLive BOOLEAN DEFAULT 0,
    PRIMARY KEY(correlation_id)
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

DROP TABLE IF EXISTS sp_notification_url;

CREATE TABLE sp_notification_url (
    client_id varchar(100),
    notification_url varchar(255)
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

