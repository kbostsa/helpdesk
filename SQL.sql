--
-- DbNinja v3.2.6 for MySQL
--
-- Dump date: 2014-11-18 01:45:07 (UTC)
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

INSERT INTO `account_type` (`atid`,`description`) VALUES (1,'User'),(2,'Technician'),(3,'Administrator');

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

INSERT INTO `status` (`sid`,`description`) VALUES (1,'New (unassigned)'),(2,'In Progress'),(3,'Completed'),(4,'Cancelled by originator'),(5,'Stalled/Waiting');

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

INSERT INTO `user` (`uid`,`first_name`,`last_name`,`username`,`salt`,`password`,`atid`) VALUES (1,'Kevin','Besta','kbesta','','675130deeceaa6353f4eb789c1a865978c782ecd',3),(2,'Lindsey','Rauch','lrauch','','2bfb751c2e65b7e2881f2cde222ac5312763f662',3),(3,'Ken','Martinson','kmartinson','','74f3f11164a253e3900e188d65e7647c0e068728',2),(4,'Tony','Gallone','tgallone','','da21494f081e1bba9c217c7521094db433ff6559',2),(5,'Caitlin','Samuelsson','csamuelsson','','4fe89dbd20966efeec7e8fd0a2a8f3c700e1c4eb',2),(6,'Emily','Falder','efalder','','215e32f308a04762a1ddfd0be29e97254e778364',2),(7,'Jan','Kubal','jkubal','','4ec904f08da8421654c3d0a4a116b516712d4495',1),(8,'Sam','Lunn','slunn','','c86141866b0eecfea0788e1cfe3185ba5d348844',1),(9,'Devon','Mond','dmond','','1a4e36accb342734565c4149fe2079ce28fbb98a',1),(10,'Nick','Vallee','nvallee','','8a83b1714b48cd856a3b524f15e0db7219c27019',1),(11,'John','Hall','jhall','','530dc1679f4341b986133e54a4782f5214fa7ccd',1),(12,'Alec','Hume','ahume','','5a2d2be73a4a3b7348ae1e372c4d6cb33b079a44',1),(13,'Abdul','Alenazi','aalenazi','','3822ccb8c8dae6c2b27bf6618e5305458b986025',1),(14,'Dave','Grant','dgrant','','9c9ab6d4e69ecfa40f553b5d0c0b64892cd3c207',1);

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

