-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: codeme
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.13.04.1-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('arrays','Arrays','2014-04-07 11:45:17',0),('basic','Basic Questions','2014-04-05 08:26:45',0),('devide_n_conquer','Device And Conquer','2014-04-05 08:28:32',0),('dp','Dynamic Programming','2014-04-05 08:27:55',0),('graph','Graph','2014-04-05 08:25:46',0),('hashing','Hashing','2014-04-05 08:26:01',0),('linked_list','Linked List','2014-04-05 08:25:29',0),('maths','Mathematics','2014-04-05 08:29:02',0),('oops','OOPS','2014-04-22 06:12:55',0),('operating_system','Operating Systems','2014-04-22 06:19:18',0),('queue','Queue','2014-04-05 08:26:23',0),('searching','Searching','2014-04-05 08:28:05',0),('sorting','Sorting','2014-04-05 08:28:13',0),('stack','Stack','2014-04-05 08:26:17',0),('strings','Strings','2014-04-05 08:25:04',0),('tree','Tree','2014-04-05 08:25:38',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES ('c','C Language','2014-04-05 08:19:43',0),('c#','Microsoft C#','2014-04-05 08:20:57',0),('cpp','C++','2014-04-05 08:19:54',0),('java','Java','2014-04-05 08:20:01',0),('javascript','JavaScript','2014-04-05 08:21:27',0),('php','PHP','2014-04-05 08:21:14',0),('python','Python','2014-04-05 08:20:09',0),('ruby','Ruby','2014-04-05 08:22:37',0),('scala','Scala','2014-04-05 08:22:51',0);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_details`
--

DROP TABLE IF EXISTS `program_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `fk_language` varchar(50) NOT NULL,
  `fk_category` varchar(50) NOT NULL,
  `actual_file_name` varchar(255) DEFAULT NULL,
  `stored_file_name` varchar(255) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `description` text,
  `is_verified` tinyint(1) DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_created_by` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_category` (`fk_category`),
  KEY `fk_language` (`fk_language`),
  KEY `program_details_ibfk_3` (`fk_created_by`),
  CONSTRAINT `program_details_ibfk_1` FOREIGN KEY (`fk_category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `program_details_ibfk_2` FOREIGN KEY (`fk_language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `program_details_ibfk_3` FOREIGN KEY (`fk_created_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_details`
--

LOCK TABLES `program_details` WRITE;
/*!40000 ALTER TABLE `program_details` DISABLE KEYS */;
INSERT INTO `program_details` VALUES (1,'Remove duplicate characters from given string','c','strings','remove_duplicate_char_in_str.c','930270e304273239ce428460e10139e6.c','Easy','Remove duplicate chars using fixed size hash table which keeps frequency of each character.\r\nTime : O(n)\r\nSpace : Fixed',1,'2014-04-22 18:08:07',1,0);
/*!40000 ALTER TABLE `program_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_hash` varchar(255) NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `ip_address` varchar(60) DEFAULT NULL,
  `is_loggedin` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'shekhar','882c45820c72fc317733a6fcdfd7fe258ebee7a4e9fb3cfa84232e58235b35aa','48k9aqql2d6hu0uv7gsva6gno3','127.0.0.1',1,'2014-04-22 23:19:49','2014-04-11 15:50:09',1,0),(2,'shubham','10f6d3ce9d854d1ebfc1ca7d1981fafc122a9970093382f2c5c72cfa6ab47572','','',0,'2014-04-16 18:45:55','2014-04-14 01:01:31',1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-22 23:51:28
