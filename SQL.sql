--
-- DbNinja v3.2.6 for MySQL
--
-- Dump date: 2014-11-18 01:48:09 (UTC)
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- Database: kbesta_forge
--

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

DROP DATABASE IF EXISTS `kbesta_forge`;
CREATE DATABASE `kbesta_forge` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `kbesta_forge`;

--
-- Structure for table: account_type
--
CREATE TABLE `account_type` (
  `atid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'account type id',
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`atid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


--
-- Structure for table: message
--
CREATE TABLE `message` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'message id',
  `uid` int(11) unsigned NOT NULL COMMENT 'user id',
  `sid` int(10) unsigned NOT NULL COMMENT 'status id',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text,
  PRIMARY KEY (`mid`),
  KEY `fkey_bderecziat` (`uid`),
  KEY `fkey_smsxcwdqrw` (`sid`),
  CONSTRAINT `fkey_smsxcwdqrw` FOREIGN KEY (`sid`) REFERENCES `status` (`sid`),
  CONSTRAINT `fkey_bderecziat` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Structure for table: status
--
CREATE TABLE `status` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'status id',
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


--
-- Structure for table: ticket
--
CREATE TABLE `ticket` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ticket id',
  `date_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_out` timestamp NULL DEFAULT NULL,
  `uid` int(10) unsigned NOT NULL COMMENT 'user id of creator',
  `tech_id` int(10) unsigned NOT NULL COMMENT 'uid of assigned technician',
  `subject` varchar(50) NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '3' COMMENT '1-5',
  PRIMARY KEY (`tid`),
  KEY `fkey_upoadxmwuh` (`uid`),
  KEY `fkey_rbxgnphxjv` (`tech_id`),
  CONSTRAINT `fkey_upoadxmwuh` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `fkey_rbxgnphxjv` FOREIGN KEY (`tech_id`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Structure for table: user
--
CREATE TABLE `user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'user id',
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `salt` varchar(50) NOT NULL COMMENT 'some random string, md5 the timestamp or something idk',
  `password` varchar(50) NOT NULL COMMENT 'sha1sum of actual password',
  `atid` int(10) unsigned NOT NULL COMMENT 'account type id',
  PRIMARY KEY (`uid`),
  KEY `fkey_vmdevomtjm` (`atid`),
  CONSTRAINT `fkey_vmdevomtjm` FOREIGN KEY (`atid`) REFERENCES `account_type` (`atid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;


--
-- Data for table: account_type
--
LOCK TABLES `account_type` WRITE;
ALTER TABLE `account_type` DISABLE KEYS;

INSERT INTO `account_type` (`atid`,`description`) VALUES (1,'User');
INSERT INTO `account_type` (`atid`,`description`) VALUES (2,'Technician');
INSERT INTO `account_type` (`atid`,`description`) VALUES (3,'Administrator');

ALTER TABLE `account_type` ENABLE KEYS;
UNLOCK TABLES;
COMMIT;

--
-- Data for table: message
--
LOCK TABLES `message` WRITE;
ALTER TABLE `message` DISABLE KEYS;

-- Table contains no data

ALTER TABLE `message` ENABLE KEYS;
UNLOCK TABLES;
COMMIT;

--
-- Data for table: status
--
LOCK TABLES `status` WRITE;
ALTER TABLE `status` DISABLE KEYS;

INSERT INTO `status` (`sid`,`description`) VALUES (1,'New (unassigned)');
INSERT INTO `status` (`sid`,`description`) VALUES (2,'In Progress');
INSERT INTO `status` (`sid`,`description`) VALUES (3,'Completed');
INSERT INTO `status` (`sid`,`description`) VALUES (4,'Cancelled by originator');
INSERT INTO `status` (`sid`,`description`) VALUES (5,'Stalled/Waiting');

ALTER TABLE `status` ENABLE KEYS;
UNLOCK TABLES;
COMMIT;

--
-- Data for table: ticket
--
LOCK TABLES `ticket` WRITE;
ALTER TABLE `ticket` DISABLE KEYS;

-- Table contains no data

ALTER TABLE `ticket` ENABLE KEYS;
UNLOCK TABLES;
COMMIT;

--
-- Data for table: user
--
LOCK TABLES `user` WRITE;
ALTER TABLE `user` DISABLE KEYS;

INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (1,'Kevin','Besta','kbesta',' aejhus46yrkrejtsertjewas5jtathaetrhnae6iut4','90ebd14f6da0e6c5ffb00a1b02bbad5db9483ed6',3);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (2,'Lindsey','Rauch','lrauch','awe5k636kla2j6w3hqjpwgo3uriaygvbaeiln\\rvby\\il j\\ba','4eaf6d1bdb115810f5ec22a4b551794df0c6e6b7',3);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (3,'Ken','Martinson','kmartinson',';alsiuernlobzsvinmfalskun;bzornzylsoe8nrf','1b39a289370ca56dcce4d1f76f654f76cf748753',2);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (4,'Tony','Gallone','tgallone','aseibtunal\\rwubpoerimca;wo3imvawp4ert','5b3c5fe08338e0ff28937ab9fb26674eea4f89b8',2);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (5,'Caitlin','Samuelsson','csamuelsson','a;lsdritnzilvsynroQCIHNASELKUVQYBWIYNUV\\AFJI','0f415fc58de55ddec6b94b2322c157a5fae754c2',2);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (6,'Emily','Falder','efalder','ASLIIIIEWHYCR\\LAIymr5awli34rt','f01db910d4cbaca8b9c94c31d5423d6d5edf46f5',2);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (7,'Jan','Kubal','jkubal','aicusevnltrausynchIAUvnlsasasasasasasasasasasasakr','731638a0ef323a07bd6874cd2e4843769216fd90',1);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (8,'Sam','Lunn','slunn','awliegnyvuzasumwpoenayuvsrueine;a','1cef616b3cf95ee95339f7115604df1124b9487d',1);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (9,'Devon','Mond','dmond','asoif9eybalswkiejfai8wtbuvafm;ajg','a8f7da7071de46b40ed56cd8192377f4cfeba175',1);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (10,'Nick','Vallee','nvallee','h\\awjicoemrf\\iuaservownt;rvsoiajgo;a','6c48c6adba434360a59da40bc7c28396a00a9671',1);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (11,'John','Hall','jhall','la;sfeval;ksuhef laswetvob;aw87r;ib;askdjf','e4d6181e60d6e0a954dae500567e3c90b51fb175',1);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (12,'Alec','Hume','ahume','asklf;h\\asldfjbaw;oeryfgu\\;dso87fgl\\atg/awrbgw','6df96c8bbdd6e1271cb129aef17a259fd6a9e305',1);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (13,'Abdul','Alenazi','aalenazi','aslvjhawe;lrijbz;osdn\';sdetnsetnjwesatnh','722ca7df36e795815c2b7b9e83c9f245ac1fbbc7',1);
INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (14,'Dave','Grant','dgrant','awjtjkasetybaeryjkejgasejste','1e56ab26bd8a55d304e2b7b47f708ae45b1d54e7',1);

ALTER TABLE `user` ENABLE KEYS;
UNLOCK TABLES;
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

