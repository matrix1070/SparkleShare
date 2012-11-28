-- MySQL dump 10.13  Distrib 5.1.52, for redhat-linux-gnu (i386)
--
-- Host: localhost    Database: courier5
-- ------------------------------------------------------
-- Server version	5.1.52

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
-- Current Database: `courier5`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `courier5` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `courier5`;

--
-- Table structure for table `adminlog`
--

DROP TABLE IF EXISTS `adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminlog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admid` int(10) unsigned NOT NULL,
  `adate` datetime NOT NULL,
  `tablename` varchar(40) NOT NULL,
  `recordid` varchar(11) NOT NULL,
  `fchanges` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adate` (`adate`),
  KEY `admid` (`admid`),
  KEY `tablename` (`tablename`(10))
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlog`
--

LOCK TABLES `adminlog` WRITE;
/*!40000 ALTER TABLE `adminlog` DISABLE KEYS */;
INSERT INTO `adminlog` VALUES (1,1,'2012-06-09 23:21:12','Gridcards','0','2 card records imported sucessfully.'),(2,1,'2012-06-09 23:24:21','Publishers','2','Added publisher  ISEEU Admin.<br />orgname = ISEEU Global Limited<br />email = admin@iseeuglobal.com, phone = 07982462531, pager = , cardid = 0, cardlen = 0, password <br />access = 8, authneed = 0, expiry = 0000-00-00, password = new password, pwdexpirydays = 0,  graceallow = 3, maxkilldays = 7, maxfilesize = 1048576000, upldsallowed = 0, dnldsallowed = 0, msgsallowed = 0, transallowed = 0, notext = 1'),(3,1,'2012-06-09 23:28:23','System Settings','1','Data changed to:<br />killdays = 7, otpmethod = 2, maxfilesize = 2145386496, lefttit = ISEEU Global Limited, lefturl = http://www.iseeuglobal.com, lefttit = ISEEU Global Limited, righttit = ISEEU Global Limited, righturl = http://www.iseeuglobal.com, '),(4,1,'2012-06-09 23:29:49','Publishers','2','Edited publisher  ISEEU Admin, data changed to:<br />maxfilesize = 2145386496, '),(5,1,'2012-06-09 23:30:16','System Settings','1','Data changed to:<br />loginfails = 5, '),(6,1,'2012-06-09 23:31:44','Publishers','2','Edited publisher  ISEEU Admin, data changed to:<br />maxkilldays = 10, ');
/*!40000 ALTER TABLE `adminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `id` bigint(20) unsigned NOT NULL COMMENT 'id of file',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id of transaction',
  `pubid` varchar(20) NOT NULL COMMENT 'id of publication session',
  `recipient` varchar(64) NOT NULL DEFAULT '',
  `orgname` varchar(64) NOT NULL DEFAULT '',
  `fsource` char(2) NOT NULL COMMENT 'DL=library, MU=upload  RR=reply',
  `fname` varchar(200) NOT NULL DEFAULT '',
  `fdescr` text NOT NULL,
  `ftype` varchar(20) NOT NULL DEFAULT '',
  `fsize` varchar(20) NOT NULL DEFAULT '0',
  `fbytes` bigint(20) unsigned NOT NULL,
  `fhandling` text NOT NULL,
  `operatorto` int(10) unsigned NOT NULL COMMENT 'if file sent to an operator their id from password',
  `publisher` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'operator who published files',
  `authoriser` int(10) unsigned NOT NULL DEFAULT '0',
  `authorised` tinyint(4) NOT NULL DEFAULT '0',
  `pubdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` varchar(30) NOT NULL,
  `actdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actor` int(10) unsigned NOT NULL DEFAULT '0',
  `actnote` text NOT NULL,
  KEY `pid` (`pid`),
  KEY `actdate` (`actdate`),
  KEY `pubdate` (`pubdate`),
  KEY `id` (`id`),
  KEY `pubid` (`pubid`),
  KEY `operatorto` (`operatorto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audeny`
--

DROP TABLE IF EXISTS `audeny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audeny` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL COMMENT 'for both',
  `first` text NOT NULL COMMENT 'for approval',
  `last` text NOT NULL COMMENT 'for denial',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audeny`
--

LOCK TABLES `audeny` WRITE;
/*!40000 ALTER TABLE `audeny` DISABLE KEYS */;
INSERT INTO `audeny` VALUES (1,'Re: Authorisation Request for %TRANSID%','%SENDER%\r\n\r\nI have approved this transaction and the files have been sent to %RECIP%.\r\n\r\n\r\n%AUTHORISER%','%SENDER%\r\n\r\nI deny authorisation for this transaction to %RECIP% involving the following files:\r\n\r\n%HANDLE%\r\n\r\n%REFUSE%\r\n\r\n\r\n%AUTHORISER%');
/*!40000 ALTER TABLE `audeny` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autext`
--

DROP TABLE IF EXISTS `autext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autext` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `first` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autext`
--

LOCK TABLES `autext` WRITE;
/*!40000 ALTER TABLE `autext` DISABLE KEYS */;
INSERT INTO `autext` VALUES (1,'Authorisation needed for %TRANSID% within %EXP% days','The files listed below have been uploaded by %SENDER% of %SEND-ORG% but they need your authorisation before they can be made available to the recipient %RECIP%.\r\n\r\n%HANDLE%\r\n\r\nYou can access them in your Authorisation Box option in Courier.\r\n\r\nIt\'s essential that you check these files ASAP to avoid delaying action by the recipient.\r\n\r\nRegards\r\n\r\nCourier System Administrator');
/*!40000 ALTER TABLE `autext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csssettings`
--

DROP TABLE IF EXISTS `csssettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csssettings` (
  `sheet` char(25) NOT NULL,
  `setting` char(20) NOT NULL,
  `value` char(25) NOT NULL,
  KEY `sheet` (`sheet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csssettings`
--

LOCK TABLES `csssettings` WRITE;
/*!40000 ALTER TABLE `csssettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `csssettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `errorlog`
--

DROP TABLE IF EXISTS `errorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `errorlog` (
  `actid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sequential number',
  `acttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fullname` varchar(64) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id of recipient from recipass',
  `operator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id of operator from password',
  `errdescr` varchar(32) NOT NULL,
  `reviewed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`actid`),
  KEY `acttime` (`acttime`),
  KEY `pid` (`pid`),
  KEY `reviewed` (`reviewed`),
  KEY `operator` (`operator`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `errorlog`
--

LOCK TABLES `errorlog` WRITE;
/*!40000 ALTER TABLE `errorlog` DISABLE KEYS */;
INSERT INTO `errorlog` VALUES (1,'2012-06-09 23:15:43','  sysadmin',0,1,'Invalid password',0),(2,'2012-06-09 23:17:39','  sysadmin',0,1,'Login Successful (OTP)',0),(3,'2012-06-09 23:55:19','  sysadmin',0,1,'Invalid password',0),(4,'2012-06-09 23:56:39','  sysadmin',0,1,'Login Successful (OTP)',0);
/*!40000 ALTER TABLE `errorlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldlabel` text NOT NULL,
  `datalen` smallint(5) unsigned NOT NULL DEFAULT '20',
  `pick` enum('N','S','R') NOT NULL DEFAULT 'N',
  `dispord` tinyint(3) unsigned NOT NULL DEFAULT '5',
  `live` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field`
--

LOCK TABLES `field` WRITE;
/*!40000 ALTER TABLE `field` DISABLE KEYS */;
/*!40000 ALTER TABLE `field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filetypes`
--

DROP TABLE IF EXISTS `filetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filetypes` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(4) NOT NULL,
  `descr` varchar(30) NOT NULL,
  `filewords` varchar(100) NOT NULL,
  `forbidden` char(3) NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`),
  KEY `forbidden` (`forbidden`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filetypes`
--

LOCK TABLES `filetypes` WRITE;
/*!40000 ALTER TABLE `filetypes` DISABLE KEYS */;
INSERT INTO `filetypes` VALUES (1,'exe','Windows Program (exe)','PE32 executable for MS Windows','No'),(2,'com','Windows Program (com)','DOS executable (COM)','No'),(3,'dll','Windows dll','PE32 executable for MS Windows','No'),(4,'','Linux Program','LSB executable','Yes'),(5,'cmd','Windows Batch File','DOS batch file text','No'),(6,'bat','DOS Batch File','DOS batch file text','Yes'),(7,'zip','Zip Archive','Zip archive data','No'),(8,'','Macintosh Program','LSB executable','No'),(9,'jpeg','JPEG/JPG Image','','No');
/*!40000 ALTER TABLE `filetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridcard`
--

DROP TABLE IF EXISTS `gridcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gridcard` (
  `cardid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cardname` char(20) NOT NULL,
  `grid` char(50) NOT NULL,
  `operator` int(10) unsigned NOT NULL COMMENT 'id of operator from password',
  `recipient` int(10) unsigned NOT NULL COMMENT 'id of person from recips',
  `cstatus` enum('U','A','C') NOT NULL DEFAULT 'U',
  `chngdate` datetime NOT NULL,
  PRIMARY KEY (`cardid`),
  UNIQUE KEY `cardname` (`cardname`),
  KEY `operator` (`operator`),
  KEY `recipient` (`recipient`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridcard`
--

LOCK TABLES `gridcard` WRITE;
/*!40000 ALTER TABLE `gridcard` DISABLE KEYS */;
INSERT INTO `gridcard` VALUES (1,'GCID064','AFVP9H7PY6MXNPGC3YLR9MDTK3U3MYMA8CPP8AAW6ALJPG9HT8',0,0,'U','2012-06-09 23:21:12'),(2,'GCID066','R9W47CGPB7GKEDVRRFM6646U3APK6CEAV44TPVVRDNPHTX4WP4',0,0,'U','2012-06-09 23:21:12');
/*!40000 ALTER TABLE `gridcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handling`
--

DROP TABLE IF EXISTS `handling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handling` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handling`
--

LOCK TABLES `handling` WRITE;
/*!40000 ALTER TABLE `handling` DISABLE KEYS */;
INSERT INTO `handling` VALUES (1,'Confidential Information. Do not share with anyone, store on an insecure device or print a copy.'),(2,'Proprietary information, do not disclose to unauthorised individuals.'),(3,'No restrictions on disclosure.');
/*!40000 ALTER TABLE `handling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helptext`
--

DROP TABLE IF EXISTS `helptext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helptext` (
  `pgid` varchar(10) NOT NULL,
  `pgtitle` varchar(50) NOT NULL,
  `pgbody` text NOT NULL,
  PRIMARY KEY (`pgid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helptext`
--

LOCK TABLES `helptext` WRITE;
/*!40000 ALTER TABLE `helptext` DISABLE KEYS */;
INSERT INTO `helptext` VALUES ('rec1','Recipient Log In','You have been sent a username and password via email or SMS message.\r\n\r\nEnter the username in the box labelled Uername.\r\n\r\nEnter the pasword in the box labelled Password.\r\n\r\nClick the button labelled Login.\r\n'),('log1','Publisher Log In','Type your username in the text box labelled <b>Username</b>.\r\n\r\nType your password in the text box labelled <b>Password</b>.\r\n\r\nClick on the button labelled <b>Login</b>.\r\n\r\n<hr />\r\n\r\nIf you cannot remember your password you can click on the link <em>Forgotten your password?</em> This will bring up a form where you can enter your username an password. The system will email you the reminder or hint phrase you set up when you changed your password.'),('rec2','Recipient choice of authentication method',''),('log2','Publisher choice of  authentication method',''),('rec3','Recipient entry of characters from gridcard',''),('log3','Publisher entry of characters from gridcard',''),('log4','Publisher entry of OTP','Read the string sent to you by email, SMS or pager. <em>The method(s) used are set by your system administrator.</em>\r\n\r\nType it into the text box labelled <b>OTP</b> and click on the button labelled Login.\r\n\r\n'),('rec4','Recipient entry of  OTP',''),('pub1','Publishing dashboard','There are <b>lots</b> of buttons.\r\n<hr />\r\nIf you click on them <em>they do stuff</em>.'),('in1','Inbox for publisher',''),('in3','Inbox file for publisher',''),('in4','Inbox file for administrator',''),('in2','Inbox for administrator',''),('log5','Publisher password reminder',''),('rec5','Recipient dashboard',''),('out1','Outbox for publisher',''),('out2','Outbox for administrator',''),('auth1','Authorisations for publisher',''),('auth2','Authorisations for administrator',''),('out3','Outbox transaction details',''),('auth3','Authorising a transaction assigned to you',''),('auth4','Authorising other transactions ',''),('adm1','Change your password','I\'m not sure what to say about the form.\r\n\r\nInclude capitals, numbers and symbols to make your password hard to guess.\r\n\r\n<b>Don\'t write it on a Post-It note!</b>'),('adm2','Search your publications',''),('adm3','Your personal recipients adddress list',''),('adm4','Editing a personal recipient',''),('pub2','Selecting recipients from address book',''),('pub3','Selecting groups of recipients',''),('pub4','Adding a recipient manually',''),('pub5','Using the document library',''),('pub6','Uploading files',''),('pub7','Writing a message',''),('pub8','Options',''),('pub9','Per transaction risk assessment',''),('pub10','Per file risk assessment',''),('rec6','Recipient upload a file to reply',''),('rec7','Recipient write a message to reply','');
/*!40000 ALTER TABLE `helptext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logintext`
--

DROP TABLE IF EXISTS `logintext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logintext` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `first` text NOT NULL,
  `last` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logintext`
--

LOCK TABLES `logintext` WRITE;
/*!40000 ALTER TABLE `logintext` DISABLE KEYS */;
INSERT INTO `logintext` VALUES (1,'Important information\r\nDo not attempt to log in unless you are an authorised user. The data on this system is PRIVATE PROPERTY. Access to the data is only available to authorised users and for authorised purposes. Unauthorised entry contravenes the Computer Misuse Act (1990) and may incur criminal penalties as well as damages. Proceed only if you are an authorised user. ','Important information\r\nDo not attempt to log in unless you are an authorised user. The data on this system is PRIVATE PROPERTY. Access to the data is only available to authorised users and for authorised purposes.\r\nUnauthorised entry contravenes the Computer Misuse Act (1990) and may incur criminal penalties as well as damages. Proceed only if you are an authorised user. ');
/*!40000 ALTER TABLE `logintext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logparms`
--

DROP TABLE IF EXISTS `logparms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logparms` (
  `id` tinyint(4) NOT NULL,
  `dispname` char(30) NOT NULL,
  `fn` char(65) NOT NULL,
  `lastview` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logparms`
--

LOCK TABLES `logparms` WRITE;
/*!40000 ALTER TABLE `logparms` DISABLE KEYS */;
INSERT INTO `logparms` VALUES (1,'System messages','messages','2012-02-08 11:16:16'),(2,'Error log','httpd/error_log','2012-06-09 23:18:08'),(3,'Mail log','maillog','2012-02-09 18:39:37');
/*!40000 ALTER TABLE `logparms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailq`
--

DROP TABLE IF EXISTS `mailq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailq` (
  `id` char(15) NOT NULL,
  `msize` int(11) NOT NULL,
  `sdate` char(20) NOT NULL,
  `sender` char(65) NOT NULL,
  `status` char(150) NOT NULL,
  `recipient` char(65) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailq`
--

LOCK TABLES `mailq` WRITE;
/*!40000 ALTER TABLE `mailq` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msglog`
--

DROP TABLE IF EXISTS `msglog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msglog` (
  `actid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sequential number',
  `acttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `acttype` varchar(10) NOT NULL,
  `fullname` varchar(64) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id of transaction',
  `publisher` int(10) unsigned NOT NULL COMMENT 'id of operator sending SMS',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `resp` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`actid`),
  KEY `acttime` (`acttime`),
  KEY `pid` (`pid`),
  KEY `publisher` (`publisher`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msglog`
--

LOCK TABLES `msglog` WRITE;
/*!40000 ALTER TABLE `msglog` DISABLE KEYS */;
INSERT INTO `msglog` VALUES (1,'2012-06-09 23:55:36','SMS','  sysadmin',1,1,'447955043171','To: 447955043171 ID: VI_137432112');
/*!40000 ALTER TABLE `msglog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notext`
--

DROP TABLE IF EXISTS `notext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notext` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `subject` varchar(100) NOT NULL COMMENT 'for both',
  `first` text NOT NULL COMMENT 'for recipients',
  `last` text NOT NULL COMMENT 'for operator',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notext`
--

LOCK TABLES `notext` WRITE;
/*!40000 ALTER TABLE `notext` DISABLE KEYS */;
INSERT INTO `notext` VALUES (1,'Default','URGENT: ISEEU Global Courier Secure Files - %EXP% day(s) before they expire','Dear %RECIP%\r\n\r\nFollowing our discussion, we have uploaded relevant documents for your attention on our \"ISEEU Global Courier\" service.\r\n\r\nThe site URL is %SITEURL%\r\nYour username is %USER%\r\nYour Password is %PASS%\r\n\r\nOur reference for this transaction is Development: %TRANSID%\r\n\r\n%MESSAGE%\r\n\r\nThe names of the files and their handling instructions are:\r\n%HANDLE%\r\n\r\nWhen you log in with this username and password, you will either be asked to choose a login method or this step will be skipped if only a single method is available to you.  You can then proceed to present your pager OTP, Mobile phone OTP or your grid card information as appropriate to enable access to your files. You must do this within %EXP% days or the files will expire and be deleted.  Step by step instructions are displayed on the web pages as you proceed through the process.\r\n\r\nRegards\r\n\r\n%SENDER%\r\nISEEU Global Ltd','Dear %RECIP%\r\n\r\nFollowing our discussion, we have uploaded relevant documents for your attention on our \"ISEEU Global Courier\" service.\r\n\r\nOur reference for this transaction is Development: %TRANSID%\r\n\r\n%MESSAGE%\r\n\r\nThe names of the files and their handling instructions are:\r\nHANDLE%\r\n\r\nRegards\r\n\r\n%SENDER%');
/*!40000 ALTER TABLE `notext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notsms`
--

DROP TABLE IF EXISTS `notsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notsms` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `first` varchar(200) NOT NULL COMMENT 'for recipients',
  `last` varchar(200) NOT NULL COMMENT 'for operator',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notsms`
--

LOCK TABLES `notsms` WRITE;
/*!40000 ALTER TABLE `notsms` DISABLE KEYS */;
INSERT INTO `notsms` VALUES (1,'%SENDER%\r\n\r\nI have approved this transaction and the files have been sent to %RECIP%.\r\n\r\n\r\n%AUTHORISER%','%SENDER%\r\n\r\nI deny authorisation for this transaction to %RECIP% involving the following files:\r\n\r\n%HANDLE%\r\n\r\n%REFUSE%\r\n\r\n\r\n%AUTHORISER%');
/*!40000 ALTER TABLE `notsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldpwds`
--

DROP TABLE IF EXISTS `oldpwds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldpwds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `publisher` int(10) unsigned NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `publisher` (`publisher`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldpwds`
--

LOCK TABLES `oldpwds` WRITE;
/*!40000 ALTER TABLE `oldpwds` DISABLE KEYS */;
INSERT INTO `oldpwds` VALUES (1,2,'9f6903c1524be9f9e8545a5642262cc6');
/*!40000 ALTER TABLE `oldpwds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otpsms`
--

DROP TABLE IF EXISTS `otpsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otpsms` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `first` varchar(200) NOT NULL COMMENT 'for recipients',
  `last` varchar(200) NOT NULL COMMENT 'for operators',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otpsms`
--

LOCK TABLES `otpsms` WRITE;
/*!40000 ALTER TABLE `otpsms` DISABLE KEYS */;
INSERT INTO `otpsms` VALUES (1,'Your password for Global Courier transaction %TRANSID% from %SEND-ORG% is %OTP% You have %EXP% days.','Your OTP to log in to Global Courier is %OTP%. Well what are you waiting for?');
/*!40000 ALTER TABLE `otpsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password`
--

DROP TABLE IF EXISTS `password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id of operator',
  `username` varchar(26) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL,
  `pwdhint` varchar(60) NOT NULL,
  `otptext` varchar(10) NOT NULL DEFAULT '',
  `grid` varchar(30) NOT NULL,
  `loginfail` int(10) unsigned NOT NULL,
  `failcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `logintime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` enum('X','0','2','4','6','8') NOT NULL DEFAULT '0',
  `maxkilldays` smallint(5) unsigned NOT NULL DEFAULT '1',
  `maxfilesize` int(10) unsigned NOT NULL COMMENT 'in bytes',
  `upldsallowed` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'in bytes',
  `dnldsallowed` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'in bytes',
  `msgsallowed` int(10) unsigned NOT NULL COMMENT 'number of text messages',
  `transallowed` int(10) unsigned NOT NULL COMMENT 'number of transactions allowd',
  `notext` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'id of notify email template',
  `authneed` int(11) NOT NULL DEFAULT '0',
  `createdate` datetime NOT NULL,
  `pwdexpirydays` smallint(5) unsigned NOT NULL,
  `pwdexpires` date NOT NULL,
  `graceallow` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `graceused` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pwdchanged` date NOT NULL,
  `expiry` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password`
--

LOCK TABLES `password` WRITE;
/*!40000 ALTER TABLE `password` DISABLE KEYS */;
INSERT INTO `password` VALUES (1,'sysadmin','8a4bde8c7351fdeb676b39c498c49aa8','','62466b33','',1339282519,0,'2012-06-09 23:56:39','8',1,1536870912,0,0,0,0,1,0,'2001-04-01 11:59:00',0,'0000-00-00',1,0,'0000-00-00','0000-00-00'),(2,'ISEEU.Admin','b730a0437709ea6f2ad35b6b78eef339','','','',0,0,'0000-00-00 00:00:00','8',10,2145386496,0,0,0,0,1,0,'2012-06-09 23:22:29',0,'0000-00-00',3,0,'2012-06-09','0000-00-00');
/*!40000 ALTER TABLE `password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picklist`
--

DROP TABLE IF EXISTS `picklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldid` int(10) unsigned NOT NULL DEFAULT '0',
  `ptext` text NOT NULL,
  `dispord` tinyint(4) NOT NULL DEFAULT '3',
  `allowpub` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fieldid` (`fieldid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picklist`
--

LOCK TABLES `picklist` WRITE;
/*!40000 ALTER TABLE `picklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `picklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestaged`
--

DROP TABLE IF EXISTS `prestaged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestaged` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `fdescr` varchar(200) NOT NULL,
  `ftype` varchar(20) NOT NULL DEFAULT '',
  `fsize` varchar(20) NOT NULL DEFAULT '0',
  `fbytes` bigint(20) unsigned NOT NULL,
  `fhandling` text NOT NULL,
  `fchecksum` varchar(128) NOT NULL,
  `publisher` int(10) unsigned NOT NULL DEFAULT '0',
  `pubdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fname` (`fname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestaged`
--

LOCK TABLES `prestaged` WRITE;
/*!40000 ALTER TABLE `prestaged` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestaged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publistfiles`
--

DROP TABLE IF EXISTS `publistfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publistfiles` (
  `lid` int(10) unsigned NOT NULL COMMENT 'id of publist',
  `fid` int(10) unsigned NOT NULL COMMENT 'id of library file',
  `fuse` char(1) NOT NULL DEFAULT 'O' COMMENT 'O=optional, M=mandatory',
  KEY `lid` (`lid`),
  KEY `fuse` (`fuse`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publistfiles`
--

LOCK TABLES `publistfiles` WRITE;
/*!40000 ALTER TABLE `publistfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `publistfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publistmbrs`
--

DROP TABLE IF EXISTS `publistmbrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publistmbrs` (
  `lid` int(10) unsigned NOT NULL COMMENT 'id of publist',
  `mid` int(10) unsigned NOT NULL COMMENT 'id of operator member',
  KEY `lid` (`lid`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publistmbrs`
--

LOCK TABLES `publistmbrs` WRITE;
/*!40000 ALTER TABLE `publistmbrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `publistmbrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publists`
--

DROP TABLE IF EXISTS `publists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publists`
--

LOCK TABLES `publists` WRITE;
/*!40000 ALTER TABLE `publists` DISABLE KEYS */;
/*!40000 ALTER TABLE `publists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipassword`
--

DROP TABLE IF EXISTS `recipassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipassword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id of transaction',
  `title` varchar(12) NOT NULL,
  `forename` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `orgname` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(26) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL,
  `otptext` varchar(10) NOT NULL DEFAULT '',
  `grid` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL DEFAULT '',
  `pager` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `cardid` int(10) unsigned NOT NULL DEFAULT '0',
  `cardlen` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `operator` int(10) unsigned NOT NULL COMMENT 'id from password if recipient is an operator',
  `loginfail` int(10) unsigned NOT NULL,
  `failcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `logintime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `maxfilesize` int(10) unsigned NOT NULL,
  `publisher` int(10) unsigned NOT NULL DEFAULT '0',
  `authoriser` int(10) unsigned NOT NULL DEFAULT '0',
  `authdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authorised` tinyint(4) NOT NULL DEFAULT '0',
  `notify` char(1) NOT NULL DEFAULT 'N' COMMENT 'flag for notifying by SMS/Pager',
  `createdate` datetime NOT NULL,
  `pubid` varchar(20) NOT NULL,
  `dunflag` tinyint(4) NOT NULL DEFAULT '0',
  `killdays` smallint(5) unsigned NOT NULL,
  `expiry` date NOT NULL DEFAULT '0000-00-00',
  `notifytxt` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `expiry` (`expiry`),
  KEY `publisher` (`publisher`),
  KEY `authorised` (`authorised`),
  KEY `authoriser` (`authoriser`),
  KEY `surname` (`surname`,`forename`(10)),
  KEY `pubid` (`pubid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipassword`
--

LOCK TABLES `recipassword` WRITE;
/*!40000 ALTER TABLE `recipassword` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reciplistmbrs`
--

DROP TABLE IF EXISTS `reciplistmbrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reciplistmbrs` (
  `lid` int(10) unsigned NOT NULL COMMENT 'id of reciplistlist',
  `mid` int(10) unsigned NOT NULL COMMENT 'id of member from recips',
  KEY `lid` (`lid`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reciplistmbrs`
--

LOCK TABLES `reciplistmbrs` WRITE;
/*!40000 ALTER TABLE `reciplistmbrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `reciplistmbrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reciplists`
--

DROP TABLE IF EXISTS `reciplists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reciplists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(50) NOT NULL,
  `ltype` char(1) NOT NULL DEFAULT 'G' COMMENT 'G=mail group, A=address book',
  PRIMARY KEY (`id`),
  KEY `ltype` (`ltype`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reciplists`
--

LOCK TABLES `reciplists` WRITE;
/*!40000 ALTER TABLE `reciplists` DISABLE KEYS */;
/*!40000 ALTER TABLE `reciplists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reciplistusers`
--

DROP TABLE IF EXISTS `reciplistusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reciplistusers` (
  `lid` int(10) unsigned NOT NULL COMMENT 'id of list',
  `uid` int(10) unsigned NOT NULL COMMENT 'id of operator',
  KEY `lid` (`lid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reciplistusers`
--

LOCK TABLES `reciplistusers` WRITE;
/*!40000 ALTER TABLE `reciplistusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `reciplistusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recips`
--

DROP TABLE IF EXISTS `recips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id of person',
  `ownerid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id of owner if its a private addess book entry',
  `title` varchar(12) NOT NULL DEFAULT '',
  `forename` varchar(40) NOT NULL DEFAULT '',
  `surname` varchar(40) NOT NULL DEFAULT '',
  `orgname` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `pager` varchar(20) NOT NULL DEFAULT '',
  `cardid` int(10) unsigned NOT NULL DEFAULT '0',
  `cardlen` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `operator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id from table password  if exists',
  `live` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `surname` (`surname`,`forename`),
  KEY `orgname` (`orgname`),
  KEY `ownerid` (`ownerid`),
  KEY `live` (`live`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recips`
--

LOCK TABLES `recips` WRITE;
/*!40000 ALTER TABLE `recips` DISABLE KEYS */;
INSERT INTO `recips` VALUES (1,1,'','','sysadmin','','tony@magikos.co.uk','447775446413','',0,0,1,0),(2,0,'','ISEEU','Admin','ISEEU Global Limited','admin@iseeuglobal.com','07982462531','',0,0,2,1);
/*!40000 ALTER TABLE `recips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replylist`
--

DROP TABLE IF EXISTS `replylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replylist` (
  `pid` int(10) unsigned NOT NULL COMMENT 'id of transaction',
  `operatorid` int(10) unsigned NOT NULL COMMENT 'id of operator for reply',
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replylist`
--

LOCK TABLES `replylist` WRITE;
/*!40000 ALTER TABLE `replylist` DISABLE KEYS */;
/*!40000 ALTER TABLE `replylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replytext`
--

DROP TABLE IF EXISTS `replytext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replytext` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL,
  `first` text NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replytext`
--

LOCK TABLES `replytext` WRITE;
/*!40000 ALTER TABLE `replytext` DISABLE KEYS */;
INSERT INTO `replytext` VALUES (1,'URGENT: ISEEU Global Courier Reply to %TRANSID%','Dear %RECIP%\r\n\r\nIn reply to the files sent to me in your transaction  %TRANSID% I have sent a response to your inbox.\r\n\r\nThe names of the file(s) forming this reply are:\r\n\r\n%HANDLE%\r\n\r\n\r\nRegards\r\n\r\n%SENDER%\r\n%SEND-ORG%');
/*!40000 ALTER TABLE `replytext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskdeclare`
--

DROP TABLE IF EXISTS `riskdeclare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskdeclare` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `first` text NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskdeclare`
--

LOCK TABLES `riskdeclare` WRITE;
/*!40000 ALTER TABLE `riskdeclare` DISABLE KEYS */;
INSERT INTO `riskdeclare` VALUES (1,'I have considered all the risk assessment questions listed above and declare that all my answers are complete and correct to the best of my knowledge.');
/*!40000 ALTER TABLE `riskdeclare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskform`
--

DROP TABLE IF EXISTS `riskform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskform` (
  `detno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sequential number',
  `pubid` varchar(20) NOT NULL DEFAULT '' COMMENT 'id of transaction',
  `fileid` bigint(20) unsigned NOT NULL COMMENT 'id of file',
  `fieldlabel` text NOT NULL,
  `fielddata` text NOT NULL,
  `publisher` int(10) unsigned NOT NULL COMMENT 'id of operator publishing files',
  `scope` char(1) NOT NULL DEFAULT 'P',
  PRIMARY KEY (`detno`),
  KEY `pubid` (`pubid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskform`
--

LOCK TABLES `riskform` WRITE;
/*!40000 ALTER TABLE `riskform` DISABLE KEYS */;
/*!40000 ALTER TABLE `riskform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `sid` varchar(64) NOT NULL DEFAULT '',
  `expiration` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES ('bn5th0ls76k1tgbkj0ohq459s2',1339286574,'role|s:1:\"P\";formtoken|s:32:\"5781129c16df80872296b9ed0afbb877\";fun|s:35:\"fun4b764ae8a37862354d3a72da736507d0\";');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timers`
--

DROP TABLE IF EXISTS `timers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `killdays` smallint(5) unsigned NOT NULL DEFAULT '2',
  `filedays` smallint(5) unsigned NOT NULL DEFAULT '0',
  `replydays` smallint(5) unsigned NOT NULL DEFAULT '30',
  `refresh` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timeout` smallint(5) unsigned NOT NULL DEFAULT '30',
  `loginfails` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `lefttit` varchar(50) NOT NULL DEFAULT 'Company Information',
  `lefturl` varchar(200) NOT NULL DEFAULT 'http://www.iseeuglobal.com/',
  `righttit` varchar(50) NOT NULL DEFAULT 'User Help Pages',
  `righturl` varchar(200) NOT NULL DEFAULT 'http://www.iseeuglobal.com/',
  `rascope` char(1) NOT NULL DEFAULT 'P',
  `notifydefault` tinyint(4) NOT NULL DEFAULT '0',
  `minpwdlen` tinyint(3) unsigned NOT NULL DEFAULT '6',
  `numoldpwds` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `gracedefault` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `pwdwarndays` tinyint(3) unsigned NOT NULL DEFAULT '7',
  `actwarndays` tinyint(3) unsigned NOT NULL DEFAULT '7',
  `maxfilesize` int(10) unsigned NOT NULL,
  `otpmethod` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timers`
--

LOCK TABLES `timers` WRITE;
/*!40000 ALTER TABLE `timers` DISABLE KEYS */;
INSERT INTO `timers` VALUES (1,7,0,30,2,60,5,'ISEEU Global Limited','http://www.iseeuglobal.com','ISEEU Global Limited','http://www.iseeuglobal.com','P',0,6,3,3,10,10,2145386496,'2');
/*!40000 ALTER TABLE `timers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `descr` char(20) NOT NULL,
  `live` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES (1,'Mr',1),(2,'Mrs',1),(3,'Miss',1),(4,'Ms',1),(5,'Dr',1),(6,'Prof',1),(7,'Rev',1),(8,'Right Honourable',0);
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmppass`
--

DROP TABLE IF EXISTS `tmppass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmppass` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pubid` varchar(20) NOT NULL,
  `recipid` int(10) unsigned NOT NULL,
  `groupid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(12) NOT NULL,
  `forename` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `orgname` varchar(64) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `pager` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `cardid` int(10) unsigned NOT NULL DEFAULT '0',
  `cardlen` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `operator` int(10) unsigned NOT NULL DEFAULT '0',
  `publisher` int(10) unsigned NOT NULL,
  `authoriser` int(10) unsigned NOT NULL,
  `notify` char(1) NOT NULL DEFAULT 'U',
  `killdays` smallint(5) unsigned NOT NULL,
  `notifytxt` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pubid` (`pubid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmppass`
--

LOCK TABLES `tmppass` WRITE;
/*!40000 ALTER TABLE `tmppass` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmppass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmpreply`
--

DROP TABLE IF EXISTS `tmpreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmpreply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sequential number',
  `pubid` varchar(20) NOT NULL COMMENT 'id of publication session',
  `groupname` varchar(50) NOT NULL,
  `replyto` int(10) unsigned NOT NULL COMMENT 'id of operator to reply to',
  `title` varchar(12) NOT NULL,
  `forename` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `orgname` varchar(64) NOT NULL DEFAULT '',
  `publisher` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pubid` (`pubid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmpreply`
--

LOCK TABLES `tmpreply` WRITE;
/*!40000 ALTER TABLE `tmpreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmpreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upldinternal`
--

DROP TABLE IF EXISTS `upldinternal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upldinternal` (
  `upid` bigint(20) unsigned NOT NULL COMMENT 'id of file',
  `pid` int(10) unsigned NOT NULL COMMENT 'id of transaction',
  `operator` int(10) unsigned NOT NULL COMMENT 'operator file sent to',
  `isreply` char(1) NOT NULL DEFAULT 'N',
  `downloaded` tinyint(4) NOT NULL DEFAULT '0',
  KEY `upid` (`upid`),
  KEY `pid` (`pid`),
  KEY `operator` (`operator`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upldinternal`
--

LOCK TABLES `upldinternal` WRITE;
/*!40000 ALTER TABLE `upldinternal` DISABLE KEYS */;
/*!40000 ALTER TABLE `upldinternal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upldpass`
--

DROP TABLE IF EXISTS `upldpass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upldpass` (
  `upid` bigint(20) unsigned NOT NULL COMMENT 'id of file',
  `pid` int(10) unsigned NOT NULL COMMENT 'id of transaction',
  `downloaded` tinyint(4) NOT NULL DEFAULT '0',
  KEY `upid` (`upid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upldpass`
--

LOCK TABLES `upldpass` WRITE;
/*!40000 ALTER TABLE `upldpass` DISABLE KEYS */;
/*!40000 ALTER TABLE `upldpass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uplds`
--

DROP TABLE IF EXISTS `uplds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uplds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id of file',
  `pubid` varchar(20) NOT NULL COMMENT 'id of publication session',
  `fname` varchar(200) NOT NULL DEFAULT '',
  `fdescr` text NOT NULL,
  `ftype` varchar(40) NOT NULL,
  `fsize` varchar(20) NOT NULL DEFAULT '0',
  `fbytes` bigint(20) unsigned NOT NULL,
  `fhandling` text NOT NULL,
  `fchecksum` varchar(128) NOT NULL,
  `publisher` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id of operator publishing file',
  `pubdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `prestaged` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id of prestaged file, 0 for uploaded files',
  `fuse` char(1) NOT NULL COMMENT 'M=mandatory prestaged file, O=optional or uploaded, T=text written',
  `replyfrom` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id of original transaction if this is a reply',
  `expiry` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pubid`),
  KEY `expiry` (`expiry`),
  KEY `replyfrom` (`replyfrom`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uplds`
--

LOCK TABLES `uplds` WRITE;
/*!40000 ALTER TABLE `uplds` DISABLE KEYS */;
/*!40000 ALTER TABLE `uplds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlog` (
  `actid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sequential number',
  `acttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `replyto` int(10) unsigned NOT NULL COMMENT 'if file is reply sent to an operator their id from password',
  `fullname` varchar(64) NOT NULL DEFAULT '' COMMENT 'name of actor',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id of transaction',
  `publisher` int(10) unsigned NOT NULL COMMENT 'id of operator publishing files',
  `actdescr` varchar(100) NOT NULL DEFAULT '',
  `fid` bigint(20) unsigned NOT NULL COMMENT 'id of file',
  `fname` varchar(200) NOT NULL DEFAULT '' COMMENT 'used for matching in filelog!',
  `fsize` varchar(20) NOT NULL,
  `fbytes` int(10) unsigned NOT NULL,
  `emailed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`actid`),
  KEY `acttime` (`acttime`),
  KEY `pid` (`pid`),
  KEY `emailed` (`emailed`),
  KEY `publisher` (`publisher`),
  KEY `fid` (`fid`),
  KEY `replyto` (`replyto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlog`
--

LOCK TABLES `userlog` WRITE;
/*!40000 ALTER TABLE `userlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `userlog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-06-10  0:04:17
