-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 31, 2011 at 04:23 PM
-- Server version: 5.1.55
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `courier_v4`
--
CREATE DATABASE `courier_v4`;
USE   `courier_v4`;
-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE IF NOT EXISTS `archive` (
  `id` bigint(20) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `pubid` varchar(20) NOT NULL,
  `recipient` varchar(64) NOT NULL DEFAULT '',
  `orgname` varchar(64) NOT NULL DEFAULT '',
  `fsource` char(2) NOT NULL,
  `fname` varchar(200) NOT NULL DEFAULT '',
  `fdescr` text NOT NULL,
  `ftype` varchar(20) NOT NULL DEFAULT '',
  `fsize` varchar(20) NOT NULL DEFAULT '0',
  `fbytes` int(10) unsigned NOT NULL,
  `fhandling` text NOT NULL,
  `publisher` int(10) unsigned NOT NULL DEFAULT '0',
  `authoriser` int(10) unsigned NOT NULL DEFAULT '0',
  `authorised` tinyint(4) NOT NULL DEFAULT '0',
  `pubdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` varchar(30) NOT NULL,
  `actdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actor` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `pid` (`pid`),
  KEY `actdate` (`actdate`),
  KEY `pubdate` (`pubdate`),
  KEY `id` (`id`),
  KEY `pubid` (`pubid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `archive`
--


-- --------------------------------------------------------

--
-- Table structure for table `autext`
--

CREATE TABLE IF NOT EXISTS `autext` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `first` text NOT NULL,
  `last` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `autext`
--

INSERT INTO `autext` (`id`, `first`, `last`) VALUES
(1, 'Files have been uploaded which need your authorisation before they can be made available to the recipient.\r\n', 'It is essential that you check these files ASAP to avoid delaying action by the recipient.\r\n\r\nRegards\r\n\r\nGlobal Courier System Administrator\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `errorlog`
--

CREATE TABLE IF NOT EXISTS `errorlog` (
  `actid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `acttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fullname` varchar(64) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `errdescr` varchar(32) NOT NULL,
  `reviewed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`actid`),
  KEY `acttime` (`acttime`),
  KEY `pid` (`pid`),
  KEY `reviewed` (`reviewed`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `errorlog`
--


-- --------------------------------------------------------

--
-- Table structure for table `field`
--

CREATE TABLE IF NOT EXISTS `field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldlabel` text NOT NULL,
  `datalen` smallint(5) unsigned NOT NULL DEFAULT '20',
  `pick` enum('N','S','R') NOT NULL DEFAULT 'N',
  `dispord` tinyint(3) unsigned NOT NULL DEFAULT '5',
  `live` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `field`
--


-- --------------------------------------------------------

--
-- Table structure for table `filetypes`
--

CREATE TABLE IF NOT EXISTS `filetypes` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(4) NOT NULL,
  `descr` varchar(30) NOT NULL,
  `filewords` varchar(100) NOT NULL,
  `forbidden` char(3) NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`),
  KEY `forbidden` (`forbidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filetypes`
--

INSERT INTO `filetypes` (`id`, `type`, `descr`, `filewords`, `forbidden`) VALUES
(1, 'exe', 'Windows Program (exe)', 'PE32 executable for MS Windows', 'No'),
(2, 'com', 'Windows Program (com)', 'DOS executable (COM)', 'Yes'),
(3, 'dll', 'Windows dll', 'PE32 executable for MS Windows', 'Yes'),
(4, '', 'Linux Program', 'LSB executable', 'Yes'),
(5, 'cmd', 'Windows Batch File', 'DOS batch file text', 'Yes'),
(6, 'bat', 'DOS Batch File', 'DOS batch file text', 'Yes'),
(7, 'zip', 'Zip Archive', 'Zip archive data', 'No'),
(8, '', 'Macintosh Program', 'LSB executable', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `gridcard`
--

CREATE TABLE IF NOT EXISTS `gridcard` (
  `cardid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cardname` char(20) NOT NULL,
  `grid` char(50) NOT NULL,
  `operator` int(10) unsigned NOT NULL,
  `recipient` int(10) unsigned NOT NULL,
  `cstatus` enum('U','A','C') NOT NULL DEFAULT 'U',
  `chngdate` datetime NOT NULL,
  PRIMARY KEY (`cardid`),
  UNIQUE KEY `cardname` (`cardname`),
  KEY `operator` (`operator`),
  KEY `recipient` (`recipient`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gridcard`
--


-- --------------------------------------------------------

--
-- Table structure for table `handling`
--

CREATE TABLE IF NOT EXISTS `handling` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `handling`
--


-- --------------------------------------------------------

--
-- Table structure for table `msglog`
--

CREATE TABLE IF NOT EXISTS `msglog` (
  `actid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `acttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `acttype` varchar(10) NOT NULL,
  `fullname` varchar(64) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `publisher` int(10) unsigned NOT NULL,
  `phone` varchar(20) NOT NULL DEFAULT '',
  `resp` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`actid`),
  KEY `acttime` (`acttime`),
  KEY `pid` (`pid`),
  KEY `publisher` (`publisher`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `msglog`
--


-- --------------------------------------------------------

--
-- Table structure for table `notext`
--

CREATE TABLE IF NOT EXISTS `notext` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL,
  `first` text NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notext`
--

INSERT INTO `notext` (`id`, `subject`, `first`) VALUES
(1, 'URGENT: ISEEU Global Courier Secure Files - %EXP% day(s) before they expire', 'Dear %RECIP%\r\n\r\nFollowing our discussion, we have uploaded relevant documents for your attention on our "ISEEU Global Courier" service.\r\n\r\nThe site URL is %SITEURL%\r\n\r\nYour username is %USER%\r\n\r\nYour Password is %PASS%\r\n\r\nOur reference for this transaction is Development: %TRANSID%\r\n\r\nThe names of the files and their handling instructions are:\r\n\r\n%HANDLE%\r\n\r\nWhen you log in with this username and password, you will either be asked to choose a login method or this step will be skipped if only a single method is available to you.  You can then proceed to present your pager OTP, Mobile phone OTP or your grid card information as appropriate to enable access to your files. You must do this within %EXP% days or the files will expire and be deleted.  Step by step instructions are displayed on the web pages as you proceed through the process.\r\n\r\nRegards\r\n\r\n%SENDER%\r\nISEEU Global Ltd');

-- --------------------------------------------------------

--
-- Table structure for table `notsms`
--

CREATE TABLE IF NOT EXISTS `notsms` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `first` varchar(200) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notsms`
--

INSERT INTO `notsms` (`id`, `first`) VALUES
(1, '%SEND-ORG% has emailed you about files now available, you have %EXP% days to access them. Our ref is %TRANSID%.');

-- --------------------------------------------------------

--
-- Table structure for table `oldpwds`
--

CREATE TABLE IF NOT EXISTS `oldpwds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `publisher` int(10) unsigned NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `publisher` (`publisher`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldpwds`
--


-- --------------------------------------------------------

--
-- Table structure for table `otpsms`
--

CREATE TABLE IF NOT EXISTS `otpsms` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `first` varchar(200) NOT NULL,
  `last` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otpsms`
--

INSERT INTO `otpsms` (`id`, `first`, `last`) VALUES
(1, 'Your password to access your files from %SEND-ORG% is %OTP%', 'Your OTP for Global Courier is %OTP% \r\n');

-- --------------------------------------------------------

--
-- Table structure for table `password`
--

CREATE TABLE IF NOT EXISTS `password` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(12) NOT NULL,
  `forename` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `orgname` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(26) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL,
  `pwdhint` varchar(60) NOT NULL,
  `otptext` varchar(10) NOT NULL DEFAULT '',
  `grid` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL DEFAULT '',
  `pager` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `cardid` int(10) unsigned NOT NULL DEFAULT '0',
  `cardlen` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `loginfail` int(10) unsigned NOT NULL,
  `failcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `logintime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` enum('X','0','2','4','6','8') NOT NULL DEFAULT '0',
  `maxkilldays` smallint(5) unsigned NOT NULL DEFAULT '1',
  `maxfilesize` int(10) unsigned NOT NULL,
  `upldsallowed` bigint(20) unsigned NOT NULL DEFAULT '0',
  `dnldsallowed` bigint(20) unsigned NOT NULL DEFAULT '0',
  `msgsallowed` int(10) unsigned NOT NULL,
  `publisher` int(10) unsigned NOT NULL DEFAULT '0',
  `authneed` int(11) NOT NULL DEFAULT '0',
  `authoriser` int(10) unsigned NOT NULL DEFAULT '0',
  `authdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `authorised` tinyint(4) NOT NULL DEFAULT '0',
  `notify` char(1) NOT NULL DEFAULT 'N',
  `createdate` datetime NOT NULL,
  `pwdexpirydays` smallint(5) unsigned NOT NULL,
  `pwdexpires` date NOT NULL,
  `graceallow` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `graceused` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pwdchanged` date NOT NULL,
  `pubid` varchar(20) NOT NULL,
  `dunflag` tinyint(4) NOT NULL DEFAULT '0',
  `killdays` smallint(5) unsigned NOT NULL,
  `expiry` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `expiry` (`expiry`),
  KEY `publisher` (`publisher`),
  KEY `authorised` (`authorised`),
  KEY `authoriser` (`authoriser`),
  KEY `surname` (`surname`,`forename`(10)),
  KEY `pubid` (`pubid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `password`
--

INSERT INTO `password` (`id`, `title`, `forename`, `surname`, `orgname`, `username`, `password`, `pwdhint`, `otptext`, `grid`, `phone`, `pager`, `email`, `cardid`, `cardlen`, `loginfail`, `failcount`, `logintime`, `access`, `maxkilldays`, `maxfilesize`, `upldsallowed`, `dnldsallowed`, `msgsallowed`, `publisher`, `authneed`, `authoriser`, `authdate`, `authorised`, `notify`, `createdate`, `pwdexpirydays`, `pwdexpires`, `graceallow`, `graceused`, `pwdchanged`, `pubid`, `dunflag`, `killdays`, `expiry`) VALUES
(1, '', 'ISEEU', 'Global', '', 'iseeuglobal', 'c9e8f6e2ebb01be1e05db6dc59fb6fcb', '', 'f795df48', '', '07796613566', '', 'technical@iseeuglobal.com', 0, 0, 1294674338, 0, '2011-01-10 15:51:57', '8', 1, 1536870912, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 'N', '2008-02-21 10:30:00', 0, '0000-00-00', 1, 0, '0000-00-00', '', 0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `picklist`
--

CREATE TABLE IF NOT EXISTS `picklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldid` int(10) unsigned NOT NULL DEFAULT '0',
  `ptext` text NOT NULL,
  `dispord` tinyint(4) NOT NULL DEFAULT '3',
  `allowpub` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fieldid` (`fieldid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `picklist`
--


-- --------------------------------------------------------

--
-- Table structure for table `prestaged`
--

CREATE TABLE IF NOT EXISTS `prestaged` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `fdescr` varchar(200) NOT NULL,
  `ftype` varchar(20) NOT NULL DEFAULT '',
  `fsize` varchar(20) NOT NULL DEFAULT '0',
  `fhandling` text NOT NULL,
  `publisher` int(10) unsigned NOT NULL DEFAULT '0',
  `pubdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fname` (`fname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prestaged`
--


-- --------------------------------------------------------

--
-- Table structure for table `reciplistmbrs`
--

CREATE TABLE IF NOT EXISTS `reciplistmbrs` (
  `lid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  KEY `lid` (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reciplistmbrs`
--


-- --------------------------------------------------------

--
-- Table structure for table `reciplists`
--

CREATE TABLE IF NOT EXISTS `reciplists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reciplists`
--


-- --------------------------------------------------------

--
-- Table structure for table `recips`
--

CREATE TABLE IF NOT EXISTS `recips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(12) NOT NULL DEFAULT '',
  `forename` varchar(40) NOT NULL DEFAULT '',
  `surname` varchar(40) NOT NULL DEFAULT '',
  `orgname` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `pager` varchar(20) NOT NULL DEFAULT '',
  `cardid` int(10) unsigned NOT NULL DEFAULT '0',
  `cardlen` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `operator` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `surname` (`surname`,`forename`),
  KEY `orgname` (`orgname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recips`
--


-- --------------------------------------------------------

--
-- Table structure for table `riskdeclare`
--

CREATE TABLE IF NOT EXISTS `riskdeclare` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `first` text NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `riskdeclare`
--


-- --------------------------------------------------------

--
-- Table structure for table `riskform`
--

CREATE TABLE IF NOT EXISTS `riskform` (
  `detno` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pubid` varchar(20) NOT NULL DEFAULT '',
  `fileid` bigint(20) unsigned NOT NULL,
  `fieldlabel` text NOT NULL,
  `fielddata` text NOT NULL,
  `publisher` int(10) unsigned NOT NULL,
  `scope` char(1) NOT NULL DEFAULT 'P',
  PRIMARY KEY (`detno`),
  KEY `pubid` (`pubid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `riskform`
--


-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `sid` varchar(64) NOT NULL DEFAULT '',
  `expiration` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session`
--


-- --------------------------------------------------------

--
-- Table structure for table `timers`
--

CREATE TABLE IF NOT EXISTS `timers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `killdays` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `filedays` smallint(5) unsigned NOT NULL DEFAULT '0',
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timers`
--

INSERT INTO `timers` (`id`, `killdays`, `filedays`, `refresh`, `timeout`, `loginfails`, `lefttit`, `lefturl`, `righttit`, `righturl`, `rascope`, `notifydefault`, `minpwdlen`, `numoldpwds`, `gracedefault`, `pwdwarndays`, `actwarndays`, `maxfilesize`) VALUES
(1, 5, 0, 10, 480, 3, '', '', '', '', 'P', 0, 6, 2, 2, 7, 4, 1610612736);

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE IF NOT EXISTS `titles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `descr` char(20) NOT NULL,
  `live` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `descr`, `live`) VALUES
(1, 'Mr', 1),
(2, 'Mrs', 1),
(3, 'Miss', 1),
(4, 'Ms', 1),
(5, 'Dr', 1),
(6, 'Prof', 1),
(7, 'Rev', 1),
(8, 'Right Honourable', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tmppass`
--

CREATE TABLE IF NOT EXISTS `tmppass` (
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
  PRIMARY KEY (`id`),
  KEY `pubid` (`pubid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmppass`
--


-- --------------------------------------------------------

--
-- Table structure for table `upldpass`
--

CREATE TABLE IF NOT EXISTS `upldpass` (
  `upid` bigint(20) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  KEY `upid` (`upid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upldpass`
--


-- --------------------------------------------------------

--
-- Table structure for table `uplds`
--

CREATE TABLE IF NOT EXISTS `uplds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pubid` varchar(20) NOT NULL,
  `fname` varchar(200) NOT NULL DEFAULT '',
  `fdescr` text NOT NULL,
  `ftype` varchar(40) NOT NULL,
  `fsize` varchar(20) NOT NULL DEFAULT '0',
  `fhandling` text NOT NULL,
  `publisher` int(10) unsigned NOT NULL DEFAULT '0',
  `pubdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expiry` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pubid`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uplds`
--


-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE IF NOT EXISTS `userlog` (
  `actid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `acttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fullname` varchar(64) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `publisher` int(10) unsigned NOT NULL,
  `actdescr` varchar(32) NOT NULL DEFAULT '',
  `fname` varchar(200) NOT NULL DEFAULT '',
  `fsize` varchar(20) NOT NULL,
  `fbytes` int(10) unsigned NOT NULL,
  `emailed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`actid`),
  KEY `acttime` (`acttime`),
  KEY `pid` (`pid`),
  KEY `emailed` (`emailed`),
  KEY `publisher` (`publisher`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--
