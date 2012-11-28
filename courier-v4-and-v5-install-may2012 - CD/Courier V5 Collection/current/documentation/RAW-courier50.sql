SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
--
-- *****************************************************************************************
-- NOTE current master login is sysadmin with password Dduallt.
-- You may want to change the username in password and/or email and phone in recips.
-- Leave ownerid as 1 and live as 0 in recips to hide record from address books
-- ******************************************************************************************
--
CREATE DATABASE courier5;
USE courier5;
--
-- Table structure for table `adminlog`
--

CREATE TABLE IF NOT EXISTS `adminlog` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE IF NOT EXISTS `archive` (
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

-- --------------------------------------------------------

--
-- Table structure for table `audeny`
--

CREATE TABLE IF NOT EXISTS `audeny` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL COMMENT 'for both',
  `first` text NOT NULL COMMENT 'for approval',
  `last` text NOT NULL COMMENT 'for denial',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `audeny`
--

INSERT INTO `audeny` (`id`, `subject`, `first`, `last`) VALUES
(1, 'Re: Authorisation Request for %TRANSID%', '%SENDER%\r\n\r\nI have approved this transaction and the files have been sent to %RECIP%.\r\n\r\n\r\n%AUTHORISER%', '%SENDER%\r\n\r\nI deny authorisation for this transaction to %RECIP% involving the following files:\r\n\r\n%HANDLE%\r\n\r\n%REFUSE%\r\n\r\n\r\n%AUTHORISER%');

-- --------------------------------------------------------

--
-- Table structure for table `autext`
--

CREATE TABLE IF NOT EXISTS `autext` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `first` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `autext`
--

INSERT INTO `autext` (`id`, `subject`, `first`) VALUES
(1, 'Authorisation needed for %TRANSID% within %EXP% days', 'The files listed below have been uploaded by %SENDER% of %SEND-ORG% but they need your authorisation before they can be made available to the recipient %RECIP%.\r\n\r\n%HANDLE%\r\n\r\nYou can access them in your Authorisation Box option in Courier.\r\n\r\nIt''s essential that you check these files ASAP to avoid delaying action by the recipient.\r\n\r\nRegards\r\n\r\nCourier System Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `csssettings`
--

CREATE TABLE IF NOT EXISTS `csssettings` (
  `sheet` char(25) NOT NULL,
  `setting` char(20) NOT NULL,
  `value` char(25) NOT NULL,
  KEY `sheet` (`sheet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `errorlog`
--

CREATE TABLE IF NOT EXISTS `errorlog` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `filetypes`
--

INSERT INTO `filetypes` (`id`, `type`, `descr`, `filewords`, `forbidden`) VALUES
(1, 'exe', 'Windows Program (exe)', 'PE32 executable for MS Windows', 'No'),
(2, 'com', 'Windows Program (com)', 'DOS executable (COM)', 'No'),
(3, 'dll', 'Windows dll', 'PE32 executable for MS Windows', 'No'),
(4, '', 'Linux Program', 'LSB executable', 'Yes'),
(5, 'cmd', 'Windows Batch File', 'DOS batch file text', 'No'),
(6, 'bat', 'DOS Batch File', 'DOS batch file text', 'Yes'),
(7, 'zip', 'Zip Archive', 'Zip archive data', 'No'),
(8, '', 'Macintosh Program', 'LSB executable', 'No'),
(9, 'jpeg', 'JPEG/JPG Image', '', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `gridcard`
--

CREATE TABLE IF NOT EXISTS `gridcard` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `handling`
--

CREATE TABLE IF NOT EXISTS `handling` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `handling`
--

INSERT INTO `handling` (`id`, `descr`) VALUES
(1, 'Confidential Information. Do not share with anyone, store on an insecure device or print a copy.'),
(2, 'Proprietary information, do not disclose to unauthorised individuals.'),
(3, 'No restrictions on disclosure.');

-- --------------------------------------------------------
--
-- Table structure for table `helptext`
--

CREATE TABLE `helptext` (
`pgid` VARCHAR( 10 ) NOT NULL ,
`pgtitle` VARCHAR( 50 ) NOT NULL ,
`pgbody` TEXT NOT NULL ,
PRIMARY KEY ( `pgid` )
) ENGINE = MYISAM ;

INSERT INTO `helptext` (`pgid`, `pgtitle`, `pgbody`) VALUES
('rec1', 'Recipient Log In', 'You have been sent a username and password via email or SMS message.\r\n\r\nEnter the username in the box labelled Uername.\r\n\r\nEnter the pasword in the box labelled Password.\r\n\r\nClick the button labelled Login.\r\n'),
('log1', 'Publisher Log In', 'Type your username in the text box labelled <b>Username</b>.\r\n\r\nType your password in the text box labelled <b>Password</b>.\r\n\r\nClick on the button labelled <b>Login</b>.\r\n\r\n<hr />\r\n\r\nIf you cannot remember your password you can click on the link <em>Forgotten your password?</em> This will bring up a form where you can enter your username an password. The system will email you the reminder or hint phrase you set up when you changed your password.'),
('rec2', 'Recipient choice of authentication method', ''),
('log2', 'Publisher choice of  authentication method', ''),
('rec3', 'Recipient entry of characters from gridcard', ''),
('log3', 'Publisher entry of characters from gridcard', ''),
('log4', 'Publisher entry of OTP', 'Read the string sent to you by email, SMS or pager. <em>The method(s) used are set by your system administrator.</em>\r\n\r\nType it into the text box labelled <b>OTP</b> and click on the button labelled Login.\r\n\r\n'),
('rec4', 'Recipient entry of  OTP', ''),
('pub1', 'Publishing dashboard', 'There are <b>lots</b> of buttons.\r\n<hr />\r\nIf you click on them <em>they do stuff</em>.'),
('in1', 'Inbox for publisher', ''),
('in3', 'Inbox file for publisher', ''),
('in4', 'Inbox file for administrator', ''),
('in2', 'Inbox for administrator', ''),
('log5', 'Publisher password reminder', ''),
('rec5', 'Recipient dashboard', ''),
('out1', 'Outbox for publisher', ''),
('out2', 'Outbox for administrator', ''),
('auth1', 'Authorisations for publisher', ''),
('auth2', 'Authorisations for administrator', ''),
('out3', 'Outbox transaction details', ''),
('auth3', 'Authorising a transaction assigned to you', ''),
('auth4', 'Authorising other transactions ', ''),
('adm1', 'Change your password', 'I''m not sure what to say about the form.\r\n\r\nInclude capitals, numbers and symbols to make your password hard to guess.\r\n\r\n<b>Don''t write it on a Post-It note!</b>'),
('adm2', 'Search your publications', ''),
('adm3', 'Your personal recipients adddress list', ''),
('adm4', 'Editing a personal recipient', ''),
('pub2', 'Selecting recipients from address book', ''),
('pub3', 'Selecting groups of recipients', ''),
('pub4', 'Adding a recipient manually', ''),
('pub5', 'Using the document library', ''),
('pub6', 'Uploading files', ''),
('pub7', 'Writing a message', ''),
('pub8', 'Options', ''),
('pub9', 'Per transaction risk assessment', ''),
('pub10', 'Per file risk assessment', ''),
('rec6', 'Recipient upload a file to reply', ''),
('rec7', 'Recipient write a message to reply', '');
--
-- Table structure for table `logintext`
--

CREATE TABLE IF NOT EXISTS `logintext` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `first` text NOT NULL,
  `last` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `logintext`
--

INSERT INTO `logintext` (`id`, `first`, `last`) VALUES
(1, 'Important information\r\nDo not attempt to log in unless you are an authorised user. The data on this system is PRIVATE PROPERTY. Access to the data is only available to authorised users and for authorised purposes. Unauthorised entry contravenes the Computer Misuse Act (1990) and may incur criminal penalties as well as damages. Proceed only if you are an authorised user. ', 'Important information\r\nDo not attempt to log in unless you are an authorised user. The data on this system is PRIVATE PROPERTY. Access to the data is only available to authorised users and for authorised purposes.\r\nUnauthorised entry contravenes the Computer Misuse Act (1990) and may incur criminal penalties as well as damages. Proceed only if you are an authorised user. ');

-- --------------------------------------------------------

--
-- Table structure for table `logparms`
--

CREATE TABLE IF NOT EXISTS `logparms` (
  `id` tinyint(4) NOT NULL,
  `dispname` char(30) NOT NULL,
  `fn` char(65) NOT NULL,
  `lastview` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logparms`
--

INSERT INTO `logparms` (`id`, `dispname`, `fn`, `lastview`) VALUES
(1, 'System messages', 'messages', '2012-02-08 11:16:16'),
(2, 'Error log', 'httpd/error_log', '2012-02-08 13:15:16'),
(3, 'Mail log', 'maillog', '2012-02-09 18:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `mailq`
--

CREATE TABLE IF NOT EXISTS `mailq` (
  `id` char(15) NOT NULL,
  `msize` int(11) NOT NULL,
  `sdate` char(20) NOT NULL,
  `sender` char(65) NOT NULL,
  `status` char(150) NOT NULL,
  `recipient` char(65) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `msglog`
--

CREATE TABLE IF NOT EXISTS `msglog` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notext`
--

CREATE TABLE IF NOT EXISTS `notext` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `subject` varchar(100) NOT NULL COMMENT 'for both',
  `first` text NOT NULL COMMENT 'for recipients',
  `last` text NOT NULL COMMENT 'for operator',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `notext`
--

INSERT INTO `notext` (`id`, `title`, `subject`, `first`, `last`) VALUES
(1, 'Default', 'URGENT: ISEEU Global Courier Secure Files - %EXP% day(s) before they expire', 'Dear %RECIP%\r\n\r\nFollowing our discussion, we have uploaded relevant documents for your attention on our "ISEEU Global Courier" service.\r\n\r\nThe site URL is %SITEURL%\r\nYour username is %USER%\r\nYour Password is %PASS%\r\n\r\nOur reference for this transaction is Development: %TRANSID%\r\n\r\n%MESSAGE%\r\n\r\nThe names of the files and their handling instructions are:\r\n%HANDLE%\r\n\r\nWhen you log in with this username and password, you will either be asked to choose a login method or this step will be skipped if only a single method is available to you.  You can then proceed to present your pager OTP, Mobile phone OTP or your grid card information as appropriate to enable access to your files. You must do this within %EXP% days or the files will expire and be deleted.  Step by step instructions are displayed on the web pages as you proceed through the process.\r\n\r\nRegards\r\n\r\n%SENDER%\r\nISEEU Global Ltd', 'Dear %RECIP%\r\n\r\nFollowing our discussion, we have uploaded relevant documents for your attention on our "ISEEU Global Courier" service.\r\n\r\nOur reference for this transaction is Development: %TRANSID%\r\n\r\n%MESSAGE%\r\n\r\nThe names of the files and their handling instructions are:\r\nHANDLE%\r\n\r\nRegards\r\n\r\n%SENDER%');

-- --------------------------------------------------------

--
-- Table structure for table `notsms`
--

CREATE TABLE IF NOT EXISTS `notsms` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `first` varchar(200) NOT NULL COMMENT 'for recipients',
  `last` varchar(200) NOT NULL COMMENT 'for operator',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notsms`
--

INSERT INTO `notsms` (`id`, `first`, `last`) VALUES
(1, '%SENDER%\r\n\r\nI have approved this transaction and the files have been sent to %RECIP%.\r\n\r\n\r\n%AUTHORISER%', '%SENDER%\r\n\r\nI deny authorisation for this transaction to %RECIP% involving the following files:\r\n\r\n%HANDLE%\r\n\r\n%REFUSE%\r\n\r\n\r\n%AUTHORISER%');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `otpsms`
--

CREATE TABLE IF NOT EXISTS `otpsms` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `first` varchar(200) NOT NULL COMMENT 'for recipients',
  `last` varchar(200) NOT NULL COMMENT 'for operators',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `otpsms`
--

INSERT INTO `otpsms` (`id`, `first`, `last`) VALUES
(1, 'Your password for Global Courier transaction %TRANSID% from %SEND-ORG% is %OTP% You have %EXP% days.', 'Your OTP to log in to Global Courier is %OTP%. Well what are you waiting for?');

-- --------------------------------------------------------

--
-- Table structure for table `password`
--

CREATE TABLE IF NOT EXISTS `password` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `password`
--

INSERT INTO `password` (`id`, `username`, `password`, `pwdhint`, `otptext`, `grid`, `loginfail`, `failcount`, `logintime`, `access`, `maxkilldays`, `maxfilesize`, `upldsallowed`, `dnldsallowed`, `msgsallowed`, `transallowed`, `notext`, `authneed`, `createdate`, `pwdexpirydays`, `pwdexpires`, `graceallow`, `graceused`, `pwdchanged`, `expiry`) VALUES
(1, 'sysadmin', '8a4bde8c7351fdeb676b39c498c49aa8', '', '6bb54052', '', 1263570689, 0, '2012-02-10 12:10:50', '8', 1, 1536870912, 0, 0, 0, 0, 1, 0, '2001-04-01 11:59:00', 0, '0000-00-00', 1, 0, '0000-00-00', '0000-00-00');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `fbytes` bigint(20) unsigned NOT NULL,
  `fhandling` text NOT NULL,
  `fchecksum` varchar(128) NOT NULL,
  `publisher` int(10) unsigned NOT NULL DEFAULT '0',
  `pubdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fname` (`fname`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `publistfiles`
--

CREATE TABLE IF NOT EXISTS `publistfiles` (
  `lid` int(10) unsigned NOT NULL COMMENT 'id of publist',
  `fid` int(10) unsigned NOT NULL COMMENT 'id of library file',
  `fuse` char(1) NOT NULL DEFAULT 'O' COMMENT 'O=optional, M=mandatory',
  KEY `lid` (`lid`),
  KEY `fuse` (`fuse`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `publistmbrs`
--

CREATE TABLE IF NOT EXISTS `publistmbrs` (
  `lid` int(10) unsigned NOT NULL COMMENT 'id of publist',
  `mid` int(10) unsigned NOT NULL COMMENT 'id of operator member',
  KEY `lid` (`lid`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `publists`
--

CREATE TABLE IF NOT EXISTS `publists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recipassword`
--

CREATE TABLE IF NOT EXISTS `recipassword` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reciplistmbrs`
--

CREATE TABLE IF NOT EXISTS `reciplistmbrs` (
  `lid` int(10) unsigned NOT NULL COMMENT 'id of reciplistlist',
  `mid` int(10) unsigned NOT NULL COMMENT 'id of member from recips',
  KEY `lid` (`lid`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reciplists`
--

CREATE TABLE IF NOT EXISTS `reciplists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(50) NOT NULL,
  `ltype` char(1) NOT NULL DEFAULT 'G' COMMENT 'G=mail group, A=address book',
  PRIMARY KEY (`id`),
  KEY `ltype` (`ltype`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reciplistusers`
--

CREATE TABLE IF NOT EXISTS `reciplistusers` (
  `lid` int(10) unsigned NOT NULL COMMENT 'id of list',
  `uid` int(10) unsigned NOT NULL COMMENT 'id of operator',
  KEY `lid` (`lid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recips`
--

CREATE TABLE IF NOT EXISTS `recips` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `recips`
--

INSERT INTO `recips` (`id`, `ownerid`, `title`, `forename`, `surname`, `orgname`, `email`, `phone`, `pager`, `cardid`, `cardlen`, `operator`, `live`) VALUES
(1, 1, '', '', 'sysadmin', '', 'mike@appweb.co.uk', '447955043171', '', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `replylist`
--

CREATE TABLE IF NOT EXISTS `replylist` (
  `pid` int(10) unsigned NOT NULL COMMENT 'id of transaction',
  `operatorid` int(10) unsigned NOT NULL COMMENT 'id of operator for reply',
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `replytext`
--

CREATE TABLE IF NOT EXISTS `replytext` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL,
  `first` text NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `replytext`
--

INSERT INTO `replytext` (`id`, `subject`, `first`) VALUES
(1, 'URGENT: ISEEU Global Courier Reply to %TRANSID%', 'Dear %RECIP%\r\n\r\nIn reply to the files sent to me in your transaction  %TRANSID% I have sent a response to your inbox.\r\n\r\nThe names of the file(s) forming this reply are:\r\n\r\n%HANDLE%\r\n\r\n\r\nRegards\r\n\r\n%SENDER%\r\n%SEND-ORG%');

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

INSERT INTO `riskdeclare` (`id`, `first`) VALUES
(1, 'I have considered all the risk assessment questions listed above and declare that all my answers are complete and correct to the best of my knowledge.');

-- --------------------------------------------------------

--
-- Table structure for table `riskform`
--

CREATE TABLE IF NOT EXISTS `riskform` (
  `detno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sequential number',
  `pubid` varchar(20) NOT NULL DEFAULT '' COMMENT 'id of transaction',
  `fileid` bigint(20) unsigned NOT NULL COMMENT 'id of file',
  `fieldlabel` text NOT NULL,
  `fielddata` text NOT NULL,
  `publisher` int(10) unsigned NOT NULL COMMENT 'id of operator publishing files',
  `scope` char(1) NOT NULL DEFAULT 'P',
  PRIMARY KEY (`detno`),
  KEY `pubid` (`pubid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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

-- --------------------------------------------------------

--
-- Table structure for table `timers`
--

CREATE TABLE IF NOT EXISTS `timers` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `timers`
--

INSERT INTO `timers` (`id`, `killdays`, `filedays`, `replydays`, `refresh`, `timeout`, `loginfails`, `lefttit`, `lefturl`, `righttit`, `righturl`, `rascope`, `notifydefault`, `minpwdlen`, `numoldpwds`, `gracedefault`, `pwdwarndays`, `actwarndays`, `maxfilesize`, `otpmethod`) VALUES
(1, 5, 0, 30, 2, 60, 3, 'InfoTainment', 'http://www.bbc.co.uk/', 'The Right Stuff', 'http://www.rightstuff.co.uk', 'P', 0, 6, 3, 3, 10, 10, 1048576000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE IF NOT EXISTS `titles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `descr` char(20) NOT NULL,
  `live` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

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
  `operator` int(10) unsigned NOT NULL DEFAULT '0',
  `publisher` int(10) unsigned NOT NULL,
  `authoriser` int(10) unsigned NOT NULL,
  `notify` char(1) NOT NULL DEFAULT 'U',
  `killdays` smallint(5) unsigned NOT NULL,
  `notifytxt` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pubid` (`pubid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tmpreply`
--

CREATE TABLE IF NOT EXISTS `tmpreply` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `upldinternal`
--

CREATE TABLE IF NOT EXISTS `upldinternal` (
  `upid` bigint(20) unsigned NOT NULL COMMENT 'id of file',
  `pid` int(10) unsigned NOT NULL COMMENT 'id of transaction',
  `operator` int(10) unsigned NOT NULL COMMENT 'operator file sent to',
  `isreply` char(1) NOT NULL DEFAULT 'N',
  `downloaded` tinyint(4) NOT NULL DEFAULT '0',
  KEY `upid` (`upid`),
  KEY `pid` (`pid`),
  KEY `operator` (`operator`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `upldpass`
--

CREATE TABLE IF NOT EXISTS `upldpass` (
  `upid` bigint(20) unsigned NOT NULL COMMENT 'id of file',
  `pid` int(10) unsigned NOT NULL COMMENT 'id of transaction',
  `downloaded` tinyint(4) NOT NULL DEFAULT '0',
  KEY `upid` (`upid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplds`
--

CREATE TABLE IF NOT EXISTS `uplds` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE IF NOT EXISTS `userlog` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

