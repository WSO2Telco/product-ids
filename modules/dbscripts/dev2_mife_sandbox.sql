-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dev2_mife_sandbox
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
-- Table structure for table `charge_amount_request`
--

DROP TABLE IF EXISTS `charge_amount_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_amount_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `effect_date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `client_correlator` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_user_id` varchar(255) DEFAULT NULL,
  `notify_url` varchar(255) DEFAULT NULL,
  `on_behalf_of` varchar(255) DEFAULT NULL,
  `purchase_cat_code` varchar(255) DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `tran_oper_status` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `callback_data` varchar(255) DEFAULT NULL,
  `mandate_id` varchar(255) DEFAULT NULL,
  `notification_format` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `reference_sequence` int(11) DEFAULT NULL,
  `original_server_reference_code` varchar(255) DEFAULT NULL,
  `service_id` varchar(255) DEFAULT NULL,
  `total_amount_charged` double DEFAULT NULL,
  `amount_reserved` double DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `payment_transaction_type` int(11) DEFAULT NULL,
  `refund_status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_haok1xtx5f32qy18r9yt06p31` (`client_correlator`),
  KEY `FKB48C1E939E083448` (`user_id`),
  CONSTRAINT `FKB48C1E939E083448` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_amount_request`
--

LOCK TABLES `charge_amount_request` WRITE;
/*!40000 ALTER TABLE `charge_amount_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge_amount_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locationparam`
--

DROP TABLE IF EXISTS `locationparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locationparam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `altitude` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `loc_ret_status` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `locationparam_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationparam`
--

LOCK TABLES `locationparam` WRITE;
/*!40000 ALTER TABLE `locationparam` DISABLE KEYS */;
/*!40000 ALTER TABLE `locationparam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locationtransactionlog`
--

DROP TABLE IF EXISTS `locationtransactionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locationtransactionlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `requested_accuracy` double DEFAULT NULL,
  `tran_oper_status` varchar(255) DEFAULT NULL,
  `effect_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `locationtransactionlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationtransactionlog`
--

LOCK TABLES `locationtransactionlog` WRITE;
/*!40000 ALTER TABLE `locationtransactionlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `locationtransactionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobileidapiencoderequest`
--

DROP TABLE IF EXISTS `mobileidapiencoderequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobileidapiencoderequest` (
  `mobIdApiId` int(11) NOT NULL AUTO_INCREMENT,
  `consumerkey` varchar(255) DEFAULT NULL,
  `consumersecret` varchar(255) DEFAULT NULL,
  `authcode` varchar(255) DEFAULT NULL,
  `granttype` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `scope` varchar(45) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `refreshToken` varchar(45) DEFAULT NULL,
  `accessToken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mobIdApiId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobileidapiencoderequest`
--

LOCK TABLES `mobileidapiencoderequest` WRITE;
/*!40000 ALTER TABLE `mobileidapiencoderequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobileidapiencoderequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numbers`
--

DROP TABLE IF EXISTS `numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `num_balance` double DEFAULT NULL,
  `reserved_amount` double NOT NULL DEFAULT '0',
  `num_description` varchar(255) DEFAULT NULL,
  `num_status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK88C28E4A9E083448` (`user_id`),
  CONSTRAINT `FK88C28E4A9E083448` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numbers`
--

LOCK TABLES `numbers` WRITE;
/*!40000 ALTER TABLE `numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_gen`
--

DROP TABLE IF EXISTS `payment_gen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_gen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_status` varchar(255) DEFAULT NULL,
  `max_pay_amount` varchar(255) DEFAULT NULL,
  `max_tx_perday` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA4347D979E083448` (`user_id`),
  CONSTRAINT `FKA4347D979E083448` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_gen`
--

LOCK TABLES `payment_gen` WRITE;
/*!40000 ALTER TABLE `payment_gen` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_gen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transaction`
--

DROP TABLE IF EXISTS `payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_transaction` (
  `transaction_id` varchar(255) NOT NULL,
  `effect_date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `end_user_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `FKB154785395263845` (`user_id`),
  CONSTRAINT `FKB48C1E55465448` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction`
--

LOCK TABLES `payment_transaction` WRITE;
/*!40000 ALTER TABLE `payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentparam`
--

DROP TABLE IF EXISTS `paymentparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentparam` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastupdated` varchar(255) DEFAULT NULL,
  `lastupdated_date` datetime DEFAULT NULL,
  `maxamt` double(11,2) DEFAULT NULL,
  `maxtrn` int(11) DEFAULT NULL,
  `paystatus` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentparam`
--

LOCK TABLES `paymentparam` WRITE;
/*!40000 ALTER TABLE `paymentparam` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentparam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `send_sms_to_application`
--

DROP TABLE IF EXISTS `send_sms_to_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `send_sms_to_application` (
  `sms_id` int(11) NOT NULL AUTO_INCREMENT,
  `effect_date` date DEFAULT NULL,
  `destination_address` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `sender_address` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sms_id`),
  KEY `FKEBE4BF499E083448` (`user_id`),
  CONSTRAINT `FKEBE4BF499E083448` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `send_sms_to_application`
--

LOCK TABLES `send_sms_to_application` WRITE;
/*!40000 ALTER TABLE `send_sms_to_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `send_sms_to_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sender_address`
--

DROP TABLE IF EXISTS `sender_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sender_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `shortcode` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB79857EA9E083448` (`user_id`),
  CONSTRAINT `FKB79857EA9E083448` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sender_address`
--

LOCK TABLES `sender_address` WRITE;
/*!40000 ALTER TABLE `sender_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `sender_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms`
--

DROP TABLE IF EXISTS `sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deliveryStatus` varchar(255) DEFAULT NULL,
  `maxNotifications` varchar(255) DEFAULT NULL,
  `notificationDelay` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1BD599E083448` (`user_id`),
  CONSTRAINT `FK1BD599E083448` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms`
--

LOCK TABLES `sms` WRITE;
/*!40000 ALTER TABLE `sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_delivery_status`
--

DROP TABLE IF EXISTS `sms_delivery_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_delivery_status` (
  `transaction_id` varchar(255) NOT NULL,
  `sender_address` varchar(255) DEFAULT NULL,
  `delivery_status` varchar(255) DEFAULT NULL,
  `effect_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `FK_sycg0sik20gocmm2v5oqwh2o8` (`user_id`),
  CONSTRAINT `FK_sycg0sik20gocmm2v5oqwh2o8` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_delivery_status`
--

LOCK TABLES `sms_delivery_status` WRITE;
/*!40000 ALTER TABLE `sms_delivery_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_delivery_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_delivery_subscription`
--

DROP TABLE IF EXISTS `sms_delivery_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_delivery_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `sender_address` varchar(225) DEFAULT NULL,
  `sub_status` int(11) NOT NULL DEFAULT '0',
  `notify_url` varchar(225) DEFAULT NULL,
  `filter` varchar(225) DEFAULT NULL,
  `callbackdata` varchar(225) DEFAULT NULL,
  `clientcorrelator` varchar(225) DEFAULT NULL,
  `request` longtext,
  PRIMARY KEY (`id`),
  KEY `FK_adwhr1k8dr8pdh9osopmeg6b6` (`user_id`),
  CONSTRAINT `FK_adwhr1k8dr8pdh9osopmeg6b6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_delivery_subscription`
--

LOCK TABLES `sms_delivery_subscription` WRITE;
/*!40000 ALTER TABLE `sms_delivery_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_delivery_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_subscription`
--

DROP TABLE IF EXISTS `sms_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_number` varchar(255) DEFAULT NULL,
  `sub_status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA48A3E439E083448` (`user_id`),
  CONSTRAINT `FKA48A3E439E083448` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_subscription`
--

LOCK TABLES `sms_subscription` WRITE;
/*!40000 ALTER TABLE `sms_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsparam`
--

DROP TABLE IF EXISTS `smsparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsparam` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `deliveryStatus` varchar(45) DEFAULT NULL,
  `maxNotifications` varchar(11) DEFAULT NULL,
  `notificationDelay` varchar(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastupdated` varchar(255) DEFAULT NULL,
  `lastupdated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsparam`
--

LOCK TABLES `smsparam` WRITE;
/*!40000 ALTER TABLE `smsparam` DISABLE KEYS */;
/*!40000 ALTER TABLE `smsparam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smstransactionlog`
--

DROP TABLE IF EXISTS `smstransactionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smstransactionlog` (
  `sms_id` int(11) NOT NULL AUTO_INCREMENT,
  `effect_date` date DEFAULT NULL,
  `addresses` varchar(255) DEFAULT NULL,
  `callback_data` varchar(255) DEFAULT NULL,
  `client_correlator` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `notify_url` varchar(255) DEFAULT NULL,
  `sender_address` varchar(255) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `batchsize` int(11) DEFAULT NULL,
  `criteria` varchar(255) DEFAULT NULL,
  `notificationFormat` varchar(255) DEFAULT NULL,
  `trnstatus` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `request_id` varchar(255) DEFAULT NULL,
  `txntype` int(11) DEFAULT NULL,
  PRIMARY KEY (`sms_id`),
  KEY `FK2A1D0F729E083448` (`user_id`),
  CONSTRAINT `FK2A1D0F729E083448` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smstransactionlog`
--

LOCK TABLES `smstransactionlog` WRITE;
/*!40000 ALTER TABLE `smstransactionlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `smstransactionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe_sms_request`
--

DROP TABLE IF EXISTS `subscribe_sms_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribe_sms_request` (
  `subscribe_id` int(11) NOT NULL AUTO_INCREMENT,
  `effect_date` date DEFAULT NULL,
  `callback_data` varchar(255) DEFAULT NULL,
  `client_correlator` varchar(255) DEFAULT NULL,
  `criteria` varchar(255) DEFAULT NULL,
  `destination_address` varchar(255) DEFAULT NULL,
  `notification_format` varchar(255) DEFAULT NULL,
  `notify_url` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`subscribe_id`),
  KEY `FKC8368A349E083448` (`user_id`),
  CONSTRAINT `FKC8368A349E083448` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe_sms_request`
--

LOCK TABLES `subscribe_sms_request` WRITE;
/*!40000 ALTER TABLE `subscribe_sms_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribe_sms_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_lqjrcobrh9jc8wpcar64q1bfh` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ussd_subscription`
--

DROP TABLE IF EXISTS `ussd_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ussd_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `callbackData` varchar(255) DEFAULT NULL,
  `clientCorrelator` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `destinationAddress` varchar(255) DEFAULT NULL,
  `effect_date` date DEFAULT NULL,
  `notifyUrl` varchar(255) DEFAULT NULL,
  `resourceUrl` varchar(255) DEFAULT NULL,
  `subscriptionId` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subStatus` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ec81kos30iygc5p1gcfq0m9md` (`user_id`),
  CONSTRAINT `FK_ec81kos30iygc5p1gcfq0m9md` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ussd_subscription`
--

LOCK TABLES `ussd_subscription` WRITE;
/*!40000 ALTER TABLE `ussd_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `ussd_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ussd_transactions`
--

DROP TABLE IF EXISTS `ussd_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ussd_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actionStatus` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `callbackData` varchar(255) DEFAULT NULL,
  `clientCorrelator` varchar(255) DEFAULT NULL,
  `effect_date` date DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `notifyUrl` varchar(255) DEFAULT NULL,
  `sessionId` varchar(255) DEFAULT NULL,
  `shortCode` varchar(255) DEFAULT NULL,
  `ussdAction` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f6e3wvsa0gqeft93d6r8uo4qx` (`user_id`),
  CONSTRAINT `FK_f6e3wvsa0gqeft93d6r8uo4qx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ussd_transactions`
--

LOCK TABLES `ussd_transactions` WRITE;
/*!40000 ALTER TABLE `ussd_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ussd_transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-23  8:25:00
