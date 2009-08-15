-- MySQL dump 10.13  Distrib 5.1.36, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: paul
-- ------------------------------------------------------
-- Server version	5.1.36-5

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
-- Current Database: `paul`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `paul` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `paul`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `a_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`a_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,2,'2009-06-21'),(2,3,'2009-06-21'),(3,4,'0000-00-00');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `division` (
  `d_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `se_id` int(10) unsigned NOT NULL,
  `number` int(10) unsigned NOT NULL,
  PRIMARY KEY (`d_id`),
  UNIQUE KEY `l_id` (`se_id`,`number`),
  CONSTRAINT `division_ibfk_1` FOREIGN KEY (`se_id`) REFERENCES `season` (`se_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,2,1),(2,2,2),(4,6,1),(5,7,1),(6,7,2),(7,7,3),(8,7,4),(9,7,5),(36,19,1),(37,19,2),(38,19,3),(39,19,4),(40,19,5);
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `g_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gu_id` int(10) unsigned NOT NULL,
  `name` char(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`g_id`),
  UNIQUE KEY `name` (`name`),
  KEY `gu_id` (`gu_id`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`gu_id`) REFERENCES `guid` (`gu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,1,'gamename1','gamedesc1'),(2,1,'AO:T','Assault On Terrorr'),(3,2,'CounterStrike:Source',''),(4,2,'Day of Defeat',''),(5,2,'COD4',''),(7,13,'FAR CRY 2',''),(8,2,'Crysis',''),(11,2,'TEst Game',''),(12,1,'log_test',''),(14,1,'log_testex',''),(15,1,'toc',''),(20,1,'log_test_1',''),(22,1,'log_test_2',''),(23,1,'sudoku',''),(24,2,'tetris',''),(28,7,'testgame',''),(30,2,'testgame2','');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guid`
--

DROP TABLE IF EXISTS `guid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guid` (
  `gu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  PRIMARY KEY (`gu_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guid`
--

LOCK TABLES `guid` WRITE;
/*!40000 ALTER TABLE `guid` DISABLE KEYS */;
INSERT INTO `guid` VALUES (9,'1'),(11,'5'),(1,'bla'),(12,'name1'),(13,'riper'),(15,'riper2'),(2,'STEAM-ID'),(7,'TEST GUIDDD'),(8,'tester1');
/*!40000 ALTER TABLE `guid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guid_per_user`
--

DROP TABLE IF EXISTS `guid_per_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guid_per_user` (
  `gpu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gu_id` int(10) unsigned NOT NULL,
  `u_id` int(10) unsigned NOT NULL,
  `guid` char(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`gpu_id`),
  KEY `u_id` (`u_id`),
  KEY `gu_id` (`gu_id`),
  CONSTRAINT `guid_per_user_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `guid_per_user_ibfk_2` FOREIGN KEY (`gu_id`) REFERENCES `guid` (`gu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guid_per_user`
--

LOCK TABLES `guid_per_user` WRITE;
/*!40000 ALTER TABLE `guid_per_user` DISABLE KEYS */;
INSERT INTO `guid_per_user` VALUES (1,1,2,'3737-78fe-44f4-2234','0000-00-00'),(2,1,3,'1232-23424-2424-2424','0000-00-00'),(3,1,4,'1244-2432-5355-6575','0000-00-00'),(4,1,5,'2323-457-68685-56868','0000-00-00'),(5,1,11,'d2-3-23rr-3r3r3r','0000-00-00'),(6,2,2,'2134254','2009-07-19'),(7,2,2,'35235345346','2009-07-19'),(9,2,2,'guid01','2009-08-08'),(10,2,2,'Guidwert2','2009-08-08');
/*!40000 ALTER TABLE `guid_per_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `head_admin`
--

DROP TABLE IF EXISTS `head_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `head_admin` (
  `ha_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`ha_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `head_admin_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `head_admin`
--

LOCK TABLES `head_admin` WRITE;
/*!40000 ALTER TABLE `head_admin` DISABLE KEYS */;
INSERT INTO `head_admin` VALUES (1,2,'2009-06-23');
/*!40000 ALTER TABLE `head_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `league` (
  `l_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `g_id` int(10) unsigned NOT NULL,
  `name` char(100) NOT NULL,
  `description` text NOT NULL,
  `max_teams_div` smallint(5) unsigned NOT NULL,
  `min_players_team` tinyint(3) unsigned NOT NULL,
  `in_sign_up` tinyint(4) NOT NULL,
  `map_count` tinyint(3) unsigned NOT NULL DEFAULT '2',
  PRIMARY KEY (`l_id`),
  UNIQUE KEY `name` (`name`),
  KEY `g_id` (`g_id`),
  CONSTRAINT `league_ibfk_1` FOREIGN KEY (`g_id`) REFERENCES `game` (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES (1,1,'bla','blabla',1,1,1,1),(2,1,'TO:Crossfire 2on2','',0,0,0,1),(3,3,'CS:S 5on5','my deesccc',16,5,1,2),(4,2,'AO:T 2on2','',0,0,0,1),(5,3,'CS:S 2on2','',0,0,0,1),(6,2,'AO:T 5on5','aot 5on5 desc',16,5,1,1),(7,11,'Testleague','',16,1,1,1),(8,1,'liga1','',0,1,0,2),(9,2,'liga2','',0,1,0,2),(10,3,'liga3','',0,1,0,2),(11,2,'Liga22','',0,1,0,2);
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `method` char(6) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
INSERT INTO `logging` VALUES (1,'2009-08-02 15:03:17','sd','sf'),(2,'2009-08-02 15:06:02','INSERT','game with namelog_testex has been created'),(3,'2009-08-02 15:20:01','INSERT','game with nametoc has been inserted'),(4,'2009-08-02 15:22:53','INSERT','Game with name log_test_1 (id: 20) has been inserted.'),(5,'2009-08-02 15:23:53','INSERT','Game with name \'log_test_2\' (id: 22) has been inserted.'),(6,'2009-08-02 15:29:53','INSERT','Game with name sudoku (id: 23) has been inserted.'),(7,'2009-08-02 15:40:29','INSERT','New Guid riper (with id: 13) has been inserted.'),(8,'2009-08-02 15:46:50','INSERT','New Guid \'riper2\' (with id: 15) has been inserted.'),(9,'2009-08-02 22:20:37','INSERT','New League \'liga1with game_id \'1\' (with id: 8) has been inserted.'),(10,'2009-08-02 22:26:34','INSERT','New League \'liga2\'with Game ID \'2\' (with id: 9) has been inserted.'),(11,'2009-08-02 22:27:24','INSERT','New League \'liga3\' with Game ID \'3\' (with id: 10) has been inserted.'),(12,'2009-08-02 22:29:24','INSERT','Map with name \'Blister\' (id: 5) has been inserted.'),(13,'2009-08-02 22:32:20','INSERT','Game with name \'tetris\' (with id: 24) has been inserted.'),(14,'2009-08-02 22:33:21','INSERT','Map with name \'map1\' (with id: 6) has been inserted.'),(15,'2009-08-08 15:15:48','INSERT','Game with name \'testgame\' (with id: 28) has been inserted.'),(16,'2009-08-08 15:16:05','INSERT','Game with name \'testgame2\' (with id: 30) has been inserted.'),(17,'2009-08-08 15:36:09','INSERT','Team with name \'team222\' (with id: 158) has been inserted.'),(18,'2009-08-08 15:47:50','INSERT','New League \'Liga22\' (with id: 11) with Game ID \'2\' has been inserted.'),(19,'2009-08-08 15:57:20','INSERT','Team with team_id \'1\' (with id: 345) with div_id \'1\' has been inserted.'),(20,'2009-08-08 15:57:36','INSERT','Team with team_id \'1\' (with id: 346) with div_id \'2\' has been inserted.'),(21,'2009-08-08 15:58:11','INSERT','Team with team_id \'2\' (with id: 349) with div_id \'2\' has been inserted.'),(22,'2009-08-08 15:58:41','INSERT','Team with team_id \'1\' (with id: 350) with div_id \'1\' has been inserted.'),(23,'2009-08-08 16:06:29','INSERT','Team with team_id \'1\' (with id: 353) with div_id \'1\' has been inserted into table \"team_in_division\".'),(24,'2009-08-08 16:18:05','INSERT','New User \'last1\' (with id: 15) with last name \'last1\' with first name \'first1\' has been inserted.'),(25,'2009-08-08 16:28:08','INSERT','New guid_id \'2\' (with id: 9) for User ID \'2\' has been inserted.'),(26,'2009-08-08 16:32:32','INSERT','New GUID ID \'2\' (with id: 10) for User ID \'2\' has been inserted.'),(27,'2009-08-08 18:59:52','UPDATE','Game \'gamename1\' (with Game ID: 1) has been updated.'),(28,'2009-08-08 19:02:46','UPDATE','Game \'gamename1\' (with Game ID: \'1\') has been updated.'),(29,'2009-08-08 19:03:52','UPDATE','Game \'gamename1\' with Game ID: \'1\' has been updated.'),(30,'2009-08-08 19:05:14','UPDATE','Game \'gamename1\' (with Game ID: \'1\') has been updated.'),(31,'2009-08-08 19:20:59','DELETE','All signed up teams have been deleted from the League with ID \'1\'.'),(32,'2009-08-08 19:24:42','UPDATE','Guid \'bla\' (with Guid ID: \'1\') has been updated.'),(33,'2009-08-08 19:26:43','UPDATE','Guid \'bla\' (with ID: \'1\') has been updated.'),(34,'2009-08-08 19:31:20','UPDATE','League \'bla\' (with ID: \'1\') has been updated.'),(35,'2009-08-08 19:55:42','UPDATE','Match Settlement (with ID: \'1\') has been updated.'),(36,'2009-08-08 20:02:12','UPDATE','User Profile for user with ID: \'1\') has been updated.'),(37,'2009-08-08 20:22:45','SELECT','Admin information about user with ID: \'1\') has been selected.'),(38,'2009-08-08 20:45:27','SELECT','Information about division from league with ID: \'1\') has been selected.'),(39,'2009-08-08 22:17:10','INSERT','Match (id: 1377) of division with id \'1 and matchday 1 has been inserted.'),(40,'2009-08-08 22:17:28','INSERT','Match (id: 1378) of division with id \'1 and matchday 1 has been inserted.'),(41,'2009-08-08 22:18:06','INSERT','Match (id: 1379) of division with id \'1 and matchday 1 has been inserted.'),(42,'2009-08-08 22:18:06','INSERT','Match settlement (id: 2) of match with id \'1379 has been inserted.'),(43,'2009-08-09 00:43:28','SELECT','Admin information about user with ID: \'12\') has been selected.'),(44,'2009-08-09 01:30:26','SELECT','Admin information about user with ID: \'14\') has been selected.'),(45,'2009-08-09 02:44:10','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(46,'2009-08-09 02:44:43','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(47,'2009-08-09 02:45:50','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(48,'2009-08-09 02:50:57','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(49,'2009-08-09 02:51:19','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(50,'2009-08-09 02:51:54','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(51,'2009-08-09 02:53:02','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(52,'2009-08-09 02:54:40','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(53,'2009-08-09 02:57:29','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(54,'2009-08-09 02:57:44','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(55,'2009-08-09 03:05:39','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(56,'2009-08-09 03:05:59','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(57,'2009-08-09 03:06:44','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(58,'2009-08-09 03:07:05','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(59,'2009-08-09 03:13:13','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(60,'2009-08-09 03:13:52','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(61,'2009-08-09 03:14:13','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(62,'2009-08-09 03:18:23','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(63,'2009-08-09 03:19:14','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(64,'2009-08-09 03:20:15','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(65,'2009-08-09 03:21:34','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(66,'2009-08-09 03:21:51','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(67,'2009-08-09 03:22:11','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(68,'2009-08-09 03:22:30','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(69,'2009-08-09 03:23:06','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(70,'2009-08-09 03:23:14','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(71,'2009-08-09 03:23:50','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(72,'2009-08-09 03:24:24','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(73,'2009-08-09 03:25:23','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(74,'2009-08-09 03:25:50','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(75,'2009-08-09 03:30:43','SELECT','Admin information about user with ID: \'12\') has been selected.'),(76,'2009-08-09 03:31:17','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(77,'2009-08-09 03:31:38','SELECT','Admin information about user with ID: \'2\') has been selected.'),(78,'2009-08-09 03:32:05','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(79,'2009-08-09 03:33:41','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(80,'2009-08-09 03:33:54','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(81,'2009-08-09 22:02:17','INSERT','Match (id: 1380) of division with id \'1 and matchday 1 has been inserted.'),(82,'2009-08-09 22:02:52','INSERT','Match (id: 1381) of division with id \'1 and matchday 1 has been inserted.'),(83,'2009-08-09 22:03:36','INSERT','Match (id: 1382) of division with id \'1 and matchday 1 has been inserted.'),(84,'2009-08-10 02:06:18','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(85,'2009-08-10 02:06:29','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(86,'2009-08-10 02:07:23','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(87,'2009-08-10 02:07:44','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(88,'2009-08-10 02:11:11','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(89,'2009-08-10 02:11:38','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(90,'2009-08-10 02:12:21','SELECT','Admin information about user with ID: \'14\') has been selected.'),(91,'2009-08-10 02:12:53','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(92,'2009-08-10 02:13:12','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(93,'2009-08-10 02:13:18','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(94,'2009-08-12 16:03:45','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(95,'2009-08-12 16:28:20','SELECT','Admin information about user with ID: \'2\') has been selected.'),(96,'2009-08-12 16:31:21','SELECT','Admin information about user with ID: \'14\') has been selected.'),(97,'2009-08-12 16:51:59','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(98,'2009-08-12 16:52:18','SELECT','Admin information about user with ID: \'12\') has been selected.'),(99,'2009-08-12 16:52:31','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(100,'2009-08-12 17:06:23','SELECT','Admin information about user with ID: \'2\') has been selected.'),(101,'2009-08-12 17:06:34','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(102,'2009-08-12 20:25:57','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(103,'2009-08-12 20:28:30','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(104,'2009-08-12 20:28:40','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(105,'2009-08-12 20:28:49','UPDATE','Match Settlement (with Match ID: \'4\') has been updated.'),(106,'2009-08-14 03:24:41','SELECT','Admin information about user with ID: \'3\') has been selected.'),(107,'2009-08-14 03:25:03','SELECT','Admin information about user with ID: \'4\') has been selected.'),(108,'2009-08-14 03:25:24','SELECT','Admin information about user with ID: \'5\') has been selected.'),(109,'2009-08-14 03:25:41','SELECT','Admin information about user with ID: \'14\') has been selected.'),(110,'2009-08-15 00:24:58','SELECT','Admin information about user with ID: \'4\') has been selected.'),(111,'2009-08-15 00:26:01','SELECT','Admin information about user with ID: \'4\') has been selected.'),(112,'2009-08-15 00:28:20','INSERT','Team with name \'moep\' (with id: 160) has been inserted.'),(113,'2009-08-15 00:29:26','SELECT','Admin information about user with ID: \'2\') has been selected.'),(114,'2009-08-15 00:40:31','UPDATE','Game \'FAR CRY 2\' (with ID: \'7\') has been updated.'),(115,'2009-08-15 00:40:40','UPDATE','Guid \'name1\' (with ID: \'12\') has been updated.'),(116,'2009-08-15 00:40:54','INSERT','Map with name \'rotzmap\' (with id: 7) has been inserted.'),(117,'2009-08-15 00:41:15','UPDATE','Game \'testgame\' (with ID: \'28\') has been updated.'),(118,'2009-08-15 01:23:27','SELECT','Admin information about user with ID: \'4\') has been selected.'),(119,'2009-08-15 01:23:38','SELECT','Admin information about user with ID: \'4\') has been selected.'),(120,'2009-08-15 01:23:44','UPDATE','User Profile for user with ID: \'4\') has been updated.'),(121,'2009-08-15 01:24:00','UPDATE','Team \'TEAM Thermaltake\' (with ID: \'23\') has been updated.'),(122,'2009-08-15 01:24:32','UPDATE','Team \'TEAM Thermaltake\' (with ID: \'23\') has been updated.'),(123,'2009-08-15 01:24:47','UPDATE','Team \'TEAM Thermaltake\' (with ID: \'23\') has been updated.'),(124,'2009-08-15 01:24:59','SELECT','Admin information about user with ID: \'2\') has been selected.'),(125,'2009-08-15 01:25:03','UPDATE','Team \'stargamerz\' (with ID: \'1\') has been updated.'),(126,'2009-08-15 01:25:17','UPDATE','Team \'team61\' (with ID: \'105\') has been updated.'),(127,'2009-08-15 01:25:18','UPDATE','Team \'stargamerz\' (with ID: \'1\') has been updated.'),(128,'2009-08-15 01:25:49','UPDATE','User Profile for user with ID: \'2\') has been updated.'),(129,'2009-08-15 01:26:04','UPDATE','User Profile for user with ID: \'4\') has been updated.'),(130,'2009-08-15 01:26:14','UPDATE','User Profile for user with ID: \'4\') has been updated.'),(131,'2009-08-15 01:26:26','UPDATE','Team \'team62\' (with ID: \'106\') has been updated.'),(132,'2009-08-15 01:26:33','UPDATE','Team \'team62\' (with ID: \'106\') has been updated.'),(133,'2009-08-15 01:26:55','SELECT','Admin information about user with ID: \'4\') has been selected.'),(134,'2009-08-15 01:26:57','UPDATE','Team \'stargamerz\' (with ID: \'1\') has been updated.'),(135,'2009-08-15 01:27:13','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(136,'2009-08-15 01:27:25','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(137,'2009-08-15 01:30:47','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(138,'2009-08-15 01:30:54','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(139,'2009-08-15 01:31:17','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(140,'2009-08-15 01:31:47','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(141,'2009-08-15 01:32:06','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(142,'2009-08-15 01:32:13','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(143,'2009-08-15 01:35:09','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(144,'2009-08-15 01:35:36','SELECT','Admin information about user with ID: \'2\') has been selected.'),(145,'2009-08-15 01:35:42','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(146,'2009-08-15 01:37:18','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(147,'2009-08-15 01:37:28','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(148,'2009-08-15 01:39:36','UPDATE','Team \'stargamerztu\' (with ID: \'1\') has been updated.'),(149,'2009-08-15 02:35:38','INSERT','Team with name \'hdgfthrhntzn\' (with id: 161) has been inserted.'),(150,'2009-08-15 02:35:45','INSERT','Team with name \'rtttt\' (with id: 162) has been inserted.'),(151,'2009-08-15 02:47:51','UPDATE','User Profile for user with id: \'2\') has been updated.'),(152,'2009-08-15 02:47:56','UPDATE','Team \'stargamerztu\' (with id: \'1\') has been updated.'),(153,'2009-08-15 02:47:56','UPDATE','user-in-team status for user with id \'2\' in team with id \'1\' has been updated.'),(154,'2009-08-15 02:47:56','UPDATE','user-in-team status for user with id \'4\' in team with id \'1\' has been updated.'),(155,'2009-08-15 02:47:56','UPDATE','user-in-team status for user with id \'5\' in team with id \'1\' has been updated.'),(156,'2009-08-15 02:47:56','UPDATE','user-in-team status for user with id \'11\' in team with id \'1\' has been updated.'),(157,'2009-08-15 02:47:56','UPDATE','user-in-team status for user with id \'3\' in team with id \'1\' has been updated.'),(158,'2009-08-15 02:47:56','UPDATE','user-in-team status for user with id \'12\' in team with id \'1\' has been updated.');
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `map_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  PRIMARY KEY (`map_id`),
  UNIQUE KEY `UNIQUE_1` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
INSERT INTO `map` VALUES (5,'Blister'),(3,'de_dust2'),(4,'de_prodigy'),(6,'map1'),(1,'OBJ-Anvil'),(2,'OBJ-Dagger'),(7,'rotzmap');
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_in_league`
--

DROP TABLE IF EXISTS `map_in_league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_in_league` (
  `mil_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `l_id` int(10) unsigned NOT NULL,
  `map_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mil_id`),
  UNIQUE KEY `UNIQUE_1` (`l_id`,`map_id`),
  KEY `map_id` (`map_id`),
  KEY `l_id` (`l_id`),
  CONSTRAINT `FK_map_in_league_2` FOREIGN KEY (`map_id`) REFERENCES `map` (`map_id`),
  CONSTRAINT `map_in_league_ibfk_1` FOREIGN KEY (`l_id`) REFERENCES `league` (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_in_league`
--

LOCK TABLES `map_in_league` WRITE;
/*!40000 ALTER TABLE `map_in_league` DISABLE KEYS */;
INSERT INTO `map_in_league` VALUES (1,1,1),(2,1,2),(17,1,3),(4,2,1),(10,2,2),(8,3,3),(5,3,4),(12,4,3),(20,4,4),(23,5,5);
/*!40000 ALTER TABLE `map_in_league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_result`
--

DROP TABLE IF EXISTS `map_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_result` (
  `mr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m_id` int(10) unsigned NOT NULL,
  `map_id` int(10) unsigned NOT NULL,
  `result_1` int(11) NOT NULL,
  `result_2` int(11) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `map_owner_nr` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`mr_id`),
  KEY `map_id` (`map_id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `map_result_ibfk_2` FOREIGN KEY (`m_id`) REFERENCES `match` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_result`
--

LOCK TABLES `map_result` WRITE;
/*!40000 ALTER TABLE `map_result` DISABLE KEYS */;
INSERT INTO `map_result` VALUES (1,1,1,13,10,0,0),(2,1,2,13,8,0,0),(3,4,3,16,10,0,0),(4,5,3,15,15,0,0),(5,19,2,16,10,0,0),(6,19,2,16,8,0,0),(8,1382,0,0,0,0,1),(9,1382,0,0,0,0,2),(10,4,4,11,22,0,1),(11,4,4,10,12,0,2);
/*!40000 ALTER TABLE `map_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `d_id` int(10) unsigned NOT NULL,
  `t_id_1` int(10) unsigned NOT NULL,
  `t_id_2` int(10) unsigned NOT NULL,
  `winner_t_id` int(10) unsigned NOT NULL,
  `description_1` text NOT NULL,
  `description_2` text NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `matchday` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`m_id`),
  KEY `d_id` (`d_id`),
  KEY `t_id_1` (`t_id_1`),
  KEY `t_id_2` (`t_id_2`),
  CONSTRAINT `match_ibfk_2` FOREIGN KEY (`d_id`) REFERENCES `division` (`d_id`),
  CONSTRAINT `match_ibfk_3` FOREIGN KEY (`t_id_1`) REFERENCES `team` (`t_id`),
  CONSTRAINT `match_ibfk_4` FOREIGN KEY (`t_id_2`) REFERENCES `team` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1383 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES (1,1,1,2,1,'First match descr.','Second match descr.','2009-06-23 19:51:35',1,0),(4,4,19,20,19,'','','2009-04-04 18:00:00',2,0),(5,4,19,21,0,'','','2009-07-03 16:16:26',1,0),(6,4,19,22,0,'','','2009-07-03 16:16:26',1,0),(7,4,19,23,0,'','','2009-07-03 16:16:26',1,0),(8,4,19,24,24,'','','2009-07-03 16:16:26',1,0),(9,4,19,25,25,'','','2009-07-03 16:16:26',1,0),(10,4,19,26,26,'','','2009-07-03 16:16:26',1,0),(11,4,19,27,27,'','','2009-07-03 16:16:26',1,0),(12,4,19,28,28,'','','2009-07-03 16:16:26',1,0),(13,4,19,29,29,'','','2009-07-03 16:16:26',1,0),(14,4,19,30,0,'','','2009-07-03 16:16:26',1,0),(15,4,19,31,19,'','','2009-07-03 16:16:26',1,0),(16,4,19,32,0,'','','2009-07-03 16:16:26',1,0),(17,4,19,33,33,'','','2009-07-03 16:16:26',1,0),(18,4,19,34,0,'','','2009-07-03 16:16:26',1,0),(19,4,20,19,20,'','','2009-07-03 16:16:26',1,0),(20,4,20,21,0,'','','2009-07-03 16:16:26',1,0),(21,4,20,22,22,'','','2009-07-03 16:16:26',1,0),(22,4,20,23,0,'','','2009-07-03 16:16:26',1,0),(23,4,20,24,24,'','','2009-07-03 16:16:26',1,0),(24,4,20,25,0,'','','2009-07-03 16:16:26',1,0),(25,4,20,26,0,'','','2009-07-03 16:16:26',1,0),(26,4,20,27,20,'','','2009-07-03 16:16:26',1,0),(27,4,20,28,0,'','','2009-07-03 16:16:26',1,0),(28,4,20,29,0,'','','2009-07-03 16:16:26',1,0),(29,4,20,30,20,'','','2009-07-03 16:16:26',1,0),(30,4,20,31,31,'','','2009-07-03 16:16:26',1,0),(31,4,20,32,0,'','','2009-07-03 16:16:26',1,0),(32,4,20,33,0,'','','2009-07-03 16:16:26',1,0),(33,4,20,34,34,'','','2009-07-03 16:16:26',1,0),(34,4,21,19,0,'','','2009-07-03 16:16:26',1,0),(35,4,21,20,20,'','','2009-07-03 16:16:26',1,0),(36,4,21,22,22,'','','2009-07-03 16:16:26',1,0),(37,4,21,23,0,'','','2009-07-03 16:16:26',1,0),(38,4,21,24,0,'','','2009-07-03 16:16:26',1,0),(39,4,21,25,21,'','','2009-07-03 16:16:26',1,0),(40,4,21,26,26,'','','2009-07-03 16:16:26',1,0),(41,4,21,27,21,'','','2009-07-03 16:16:26',1,0),(42,4,21,28,0,'','','2009-07-03 16:16:26',1,0),(43,4,21,29,29,'','','2009-07-03 16:16:26',1,0),(44,4,21,30,30,'','','2009-07-03 16:16:26',1,0),(45,4,21,31,21,'','','2009-07-03 16:16:26',1,0),(46,4,21,32,0,'','','2009-07-03 16:16:26',1,0),(47,4,21,33,0,'','','2009-07-03 16:16:26',1,0),(48,4,21,34,21,'','','2009-07-03 16:16:26',1,0),(49,4,22,19,19,'','','2009-07-03 16:16:26',1,0),(50,4,22,20,22,'','','2009-07-03 16:16:26',1,0),(51,4,22,21,22,'','','2009-07-03 16:16:26',1,0),(52,4,22,23,23,'','','2009-07-03 16:16:26',1,0),(53,4,22,24,22,'','','2009-07-03 16:16:26',1,0),(54,4,22,25,25,'','','2009-07-03 16:16:26',1,0),(55,4,22,26,26,'','','2009-07-03 16:16:26',1,0),(56,4,22,27,22,'','','2009-07-03 16:16:26',1,0),(57,4,22,28,22,'','','2009-07-03 16:16:26',1,0),(58,4,22,29,22,'','','2009-07-03 16:16:26',1,0),(59,4,22,30,0,'','','2009-07-03 16:16:26',1,0),(60,4,22,31,22,'','','2009-07-03 16:16:26',1,0),(61,4,22,32,32,'','','2009-07-03 16:16:26',1,0),(62,4,22,33,22,'','','2009-07-03 16:16:26',1,0),(63,4,22,34,34,'','','2009-07-03 16:16:26',1,0),(64,4,23,19,23,'','','2009-07-03 16:16:26',1,0),(65,4,23,20,0,'','','2009-07-03 16:16:26',1,0),(66,4,23,21,0,'','','2009-07-03 16:16:26',1,0),(67,4,23,22,22,'','','2009-07-03 16:16:26',1,0),(68,4,23,24,23,'','','2009-07-03 16:16:26',1,0),(69,4,23,25,0,'','','2009-07-03 16:16:26',1,0),(70,4,23,26,0,'','','2009-07-03 16:16:26',1,0),(71,4,23,27,23,'','','2009-07-03 16:16:26',1,0),(72,4,23,28,23,'','','2009-07-03 16:16:26',1,0),(73,4,23,29,29,'','','2009-07-03 16:16:26',1,0),(74,4,23,30,0,'','','2009-07-03 16:16:26',1,0),(75,4,23,31,31,'','','2009-07-03 16:16:26',1,0),(76,4,23,32,0,'','','2009-07-03 16:16:26',1,0),(77,4,23,33,0,'','','2009-07-03 16:16:26',1,0),(78,4,23,34,23,'','','2009-07-03 16:16:26',1,0),(79,4,24,19,24,'','','2009-07-03 16:16:26',1,0),(80,4,24,20,0,'','','2009-07-03 16:16:26',1,0),(81,4,24,21,24,'','','2009-07-03 16:16:26',1,0),(82,4,24,22,0,'','','2009-07-03 16:16:26',1,0),(83,4,24,23,24,'','','2009-07-03 16:16:26',1,0),(84,4,24,25,24,'','','2009-07-03 16:16:26',1,0),(85,4,24,26,0,'','','2009-07-03 16:16:26',1,0),(86,4,24,27,24,'','','2009-07-03 16:16:26',1,0),(87,4,24,28,28,'','','2009-07-03 16:16:26',1,0),(88,4,24,29,0,'','','2009-07-03 16:16:26',1,0),(89,4,24,30,0,'','','2009-07-03 16:16:26',1,0),(90,4,24,31,0,'','','2009-07-03 16:16:26',1,0),(91,4,24,32,0,'','','2009-07-03 16:16:26',1,0),(92,4,24,33,33,'','','2009-07-03 16:16:26',1,0),(93,4,24,34,0,'','','2009-07-03 16:16:26',1,0),(94,4,25,19,25,'','','2009-07-03 16:16:26',1,0),(95,4,25,20,0,'','','2009-07-03 16:16:26',1,0),(96,4,25,21,25,'','','2009-07-03 16:16:26',1,0),(97,4,25,22,25,'','','2009-07-03 16:16:26',1,0),(98,4,25,23,25,'','','2009-07-03 16:16:26',1,0),(99,4,25,24,25,'','','2009-07-03 16:16:26',1,0),(100,4,25,26,26,'','','2009-07-03 16:16:26',1,0),(101,4,25,27,0,'','','2009-07-03 16:16:26',1,0),(102,4,25,28,25,'','','2009-07-03 16:16:26',1,0),(103,4,25,29,25,'','','2009-07-03 16:16:26',1,0),(104,4,25,30,25,'','','2009-07-03 16:16:26',1,0),(105,4,25,31,25,'','','2009-07-03 16:16:26',1,0),(106,4,25,32,25,'','','2009-07-03 16:16:26',1,0),(107,4,25,33,25,'','','2009-07-03 16:16:26',1,0),(108,4,25,34,34,'','','2009-07-03 16:16:26',1,0),(109,4,26,19,19,'','','2009-07-03 16:16:26',1,0),(110,4,26,20,26,'','','2009-07-03 16:16:26',1,0),(111,4,26,21,21,'','','2009-07-03 16:16:26',1,0),(112,4,26,22,26,'','','2009-07-03 16:16:26',1,0),(113,4,26,23,0,'','','2009-07-03 16:16:26',1,0),(114,4,26,24,26,'','','2009-07-03 16:16:26',1,0),(115,4,26,25,0,'','','2009-07-03 16:16:26',1,0),(116,4,26,27,27,'','','2009-07-03 16:16:26',1,0),(117,4,26,28,26,'','','2009-07-03 16:16:26',1,0),(118,4,26,29,26,'','','2009-07-03 16:16:26',1,0),(119,4,26,30,30,'','','2009-07-03 16:16:26',1,0),(120,4,26,31,26,'','','2009-07-03 16:16:26',1,0),(121,4,26,32,0,'','','2009-07-03 16:16:26',1,0),(122,4,26,33,0,'','','2009-07-03 16:16:26',1,0),(123,4,26,34,34,'','','2009-07-03 16:16:26',1,0),(124,4,27,19,19,'','','2009-07-03 16:16:26',1,0),(125,4,27,20,0,'','','2009-07-03 16:16:26',1,0),(126,4,27,21,0,'','','2009-07-03 16:16:26',1,0),(127,4,27,22,27,'','','2009-07-03 16:16:26',1,0),(128,4,27,23,23,'','','2009-07-03 16:16:26',1,0),(129,4,27,24,27,'','','2009-07-03 16:16:26',1,0),(130,4,27,25,27,'','','2009-07-03 16:16:26',1,0),(131,4,27,26,0,'','','2009-07-03 16:16:26',1,0),(132,4,27,28,0,'','','2009-07-03 16:16:26',1,0),(133,4,27,29,29,'','','2009-07-03 16:16:26',1,0),(134,4,27,30,27,'','','2009-07-03 16:16:26',1,0),(135,4,27,31,0,'','','2009-07-03 16:16:26',1,0),(136,4,27,32,0,'','','2009-07-03 16:16:26',1,0),(137,4,27,33,27,'','','2009-07-03 16:16:26',1,0),(138,4,27,34,0,'','','2009-07-03 16:16:26',1,0),(139,4,28,19,0,'','','2009-07-03 16:16:26',1,0),(140,4,28,20,20,'','','2009-07-03 16:16:26',1,0),(141,4,28,21,28,'','','2009-07-03 16:16:26',1,0),(142,4,28,22,28,'','','2009-07-03 16:16:26',1,0),(143,4,28,23,0,'','','2009-07-03 16:16:26',1,0),(144,4,28,24,24,'','','2009-07-03 16:16:26',1,0),(145,4,28,25,28,'','','2009-07-03 16:16:26',1,0),(146,4,28,26,26,'','','2009-07-03 16:16:26',1,0),(147,4,28,27,27,'','','2009-07-03 16:16:26',1,0),(148,4,28,29,28,'','','2009-07-03 16:16:26',1,0),(149,4,28,30,28,'','','2009-07-03 16:16:26',1,0),(150,4,28,31,0,'','','2009-07-03 16:16:26',1,0),(151,4,28,32,28,'','','2009-07-03 16:16:26',1,0),(152,4,28,33,0,'','','2009-07-03 16:16:26',1,0),(153,4,28,34,34,'','','2009-07-03 16:16:26',1,0),(154,4,29,19,29,'','','2009-07-03 16:16:26',1,0),(155,4,29,20,0,'','','2009-07-03 16:16:26',1,0),(156,4,29,21,0,'','','2009-07-03 16:16:26',1,0),(157,4,29,22,22,'','','2009-07-03 16:16:26',1,0),(158,4,29,23,23,'','','2009-07-03 16:16:26',1,0),(159,4,29,24,24,'','','2009-07-03 16:16:26',1,0),(160,4,29,25,29,'','','2009-07-03 16:16:26',1,0),(161,4,29,26,0,'','','2009-07-03 16:16:26',1,0),(162,4,29,27,29,'','','2009-07-03 16:16:26',1,0),(163,4,29,28,28,'','','2009-07-03 16:16:26',1,0),(164,4,29,30,0,'','','2009-07-03 16:16:26',1,0),(165,4,29,31,29,'','','2009-07-03 16:16:26',1,0),(166,4,29,32,32,'','','2009-07-03 16:16:26',1,0),(167,4,29,33,33,'','','2009-07-03 16:16:26',1,0),(168,4,29,34,34,'','','2009-07-03 16:16:26',1,0),(169,4,30,19,19,'','','2009-07-03 16:16:26',1,0),(170,4,30,20,0,'','','2009-07-03 16:16:26',1,0),(171,4,30,21,21,'','','2009-07-03 16:16:26',1,0),(172,4,30,22,0,'','','2009-07-03 16:16:26',1,0),(173,4,30,23,23,'','','2009-07-03 16:16:26',1,0),(174,4,30,24,0,'','','2009-07-03 16:16:26',1,0),(175,4,30,25,0,'','','2009-07-03 16:16:26',1,0),(176,4,30,26,26,'','','2009-07-03 16:16:26',1,0),(177,4,30,27,27,'','','2009-07-03 16:16:26',1,0),(178,4,30,28,28,'','','2009-07-03 16:16:26',1,0),(179,4,30,29,0,'','','2009-07-03 16:16:26',1,0),(180,4,30,31,30,'','','2009-07-03 16:16:26',1,0),(181,4,30,32,30,'','','2009-07-03 16:16:26',1,0),(182,4,30,33,0,'','','2009-07-03 16:16:26',1,0),(183,4,30,34,0,'','','2009-07-03 16:16:26',1,0),(184,4,31,19,0,'','','2009-07-03 16:16:26',1,0),(185,4,31,20,31,'','','2009-07-03 16:16:26',1,0),(186,4,31,21,0,'','','2009-07-03 16:16:26',1,0),(187,4,31,22,22,'','','2009-07-03 16:16:26',1,0),(188,4,31,23,23,'','','2009-07-03 16:16:26',1,0),(189,4,31,24,24,'','','2009-07-03 16:16:27',1,0),(190,4,31,25,0,'','','2009-07-03 16:16:27',1,0),(191,4,31,26,26,'','','2009-07-03 16:16:27',1,0),(192,4,31,27,31,'','','2009-07-03 16:16:27',1,0),(193,4,31,28,0,'','','2009-07-03 16:16:27',1,0),(194,4,31,29,0,'','','2009-07-03 16:16:27',1,0),(195,4,31,30,0,'','','2009-07-03 16:16:27',1,0),(196,4,31,32,0,'','','2009-07-03 16:16:27',1,0),(197,4,31,33,33,'','','2009-07-03 16:16:27',1,0),(198,4,31,34,0,'','','2009-07-03 16:16:27',1,0),(199,4,32,19,0,'','','2009-07-03 16:16:27',1,0),(200,4,32,20,20,'','','2009-07-03 16:16:27',1,0),(201,4,32,21,21,'','','2009-07-03 16:16:27',1,0),(202,4,32,22,32,'','','2009-07-03 16:16:27',1,0),(203,4,32,23,0,'','','2009-07-03 16:16:27',1,0),(204,4,32,24,0,'','','2009-07-03 16:16:27',1,0),(205,4,32,25,0,'','','2009-07-03 16:16:27',1,0),(206,4,32,26,0,'','','2009-07-03 16:16:27',1,0),(207,4,32,27,0,'','','2009-07-03 16:16:27',1,0),(208,4,32,28,28,'','','2009-07-03 16:16:27',1,0),(209,4,32,29,0,'','','2009-07-03 16:16:27',1,0),(210,4,32,30,30,'','','2009-07-03 16:16:27',1,0),(211,4,32,31,32,'','','2009-07-03 16:16:27',1,0),(212,4,32,33,0,'','','2009-07-03 16:16:27',1,0),(213,4,32,34,32,'','','2009-07-03 16:16:27',1,0),(214,4,33,19,33,'','','2009-07-03 16:16:27',1,0),(215,4,33,20,33,'','','2009-07-03 16:16:27',1,0),(216,4,33,21,33,'','','2009-07-03 16:16:27',1,0),(217,4,33,22,22,'','','2009-07-03 16:16:27',1,0),(218,4,33,23,0,'','','2009-07-03 16:16:27',1,0),(219,4,33,24,0,'','','2009-07-03 16:16:27',1,0),(220,4,33,25,25,'','','2009-07-03 16:16:27',1,0),(221,4,33,26,33,'','','2009-07-03 16:16:27',1,0),(222,4,33,27,27,'','','2009-07-03 16:16:27',1,0),(223,4,33,28,28,'','','2009-07-03 16:16:27',1,0),(224,4,33,29,0,'','','2009-07-03 16:16:27',1,0),(225,4,33,30,30,'','','2009-07-03 16:16:27',1,0),(226,4,33,31,0,'','','2009-07-03 16:16:27',1,0),(227,4,33,32,33,'','','2009-07-03 16:16:27',1,0),(228,4,33,34,34,'','','2009-07-03 16:16:27',1,0),(229,4,34,19,34,'','','2009-07-03 16:16:27',1,0),(230,4,34,20,0,'','','2009-07-03 16:16:27',1,0),(231,4,34,21,21,'','','2009-07-03 16:16:27',1,0),(232,4,34,22,34,'','','2009-07-03 16:16:27',1,0),(233,4,34,23,34,'','','2009-07-03 16:16:27',1,0),(234,4,34,24,0,'','','2009-07-03 16:16:27',1,0),(235,4,34,25,34,'','','2009-07-03 16:16:27',1,0),(236,4,34,26,34,'','','2009-07-03 16:16:27',1,0),(237,4,34,27,0,'','','2009-07-03 16:16:27',1,0),(238,4,34,28,34,'','','2009-07-03 16:16:27',1,0),(239,4,34,29,0,'','','2009-07-03 16:16:27',1,0),(240,4,34,30,34,'','','2009-07-03 16:16:27',0,0),(241,4,34,31,0,'','','2009-07-03 16:16:28',0,0),(242,4,34,32,34,'','','2009-07-03 16:16:29',0,0),(243,4,34,33,33,'','','2009-07-03 16:16:30',0,0),(842,36,57,53,0,'','','2000-12-31 00:00:00',0,1),(843,36,58,56,0,'','','2000-12-31 00:00:00',0,1),(844,36,55,50,0,'','','2000-12-31 00:00:00',0,1),(845,36,59,44,0,'','','2000-12-31 00:00:00',0,1),(846,36,48,46,0,'','','2000-12-31 00:00:00',0,1),(847,36,49,45,0,'','','2000-12-31 00:00:00',0,1),(848,36,51,54,0,'','','2000-12-31 00:00:00',0,1),(849,36,47,52,0,'','','2000-12-31 00:00:00',0,1),(850,36,57,58,0,'','','2001-01-07 00:00:00',0,2),(851,36,55,53,0,'','','2001-01-07 00:00:00',0,2),(852,36,59,56,0,'','','2001-01-07 00:00:00',0,2),(853,36,48,50,0,'','','2001-01-07 00:00:00',0,2),(854,36,49,44,0,'','','2001-01-07 00:00:00',0,2),(855,36,51,46,0,'','','2001-01-07 00:00:00',0,2),(856,36,47,45,0,'','','2001-01-07 00:00:00',0,2),(857,36,52,54,0,'','','2001-01-07 00:00:00',0,2),(858,36,57,55,0,'','','2001-01-14 00:00:00',0,3),(859,36,59,58,0,'','','2001-01-14 00:00:00',0,3),(860,36,48,53,0,'','','2001-01-14 00:00:00',0,3),(861,36,49,56,0,'','','2001-01-14 00:00:00',0,3),(862,36,51,50,0,'','','2001-01-14 00:00:00',0,3),(863,36,47,44,0,'','','2001-01-14 00:00:00',0,3),(864,36,52,46,0,'','','2001-01-14 00:00:00',0,3),(865,36,54,45,0,'','','2001-01-14 00:00:00',0,3),(866,36,57,59,0,'','','2001-01-21 00:00:00',0,4),(867,36,48,55,0,'','','2001-01-21 00:00:00',0,4),(868,36,49,58,0,'','','2001-01-21 00:00:00',0,4),(869,36,51,53,0,'','','2001-01-21 00:00:00',0,4),(870,36,47,56,0,'','','2001-01-21 00:00:00',0,4),(871,36,52,50,0,'','','2001-01-21 00:00:00',0,4),(872,36,54,44,0,'','','2001-01-21 00:00:00',0,4),(873,36,45,46,0,'','','2001-01-21 00:00:00',0,4),(874,36,57,48,0,'','','2001-01-28 00:00:00',0,5),(875,36,49,59,0,'','','2001-01-28 00:00:00',0,5),(876,36,51,55,0,'','','2001-01-28 00:00:00',0,5),(877,36,47,58,0,'','','2001-01-28 00:00:00',0,5),(878,36,52,53,0,'','','2001-01-28 00:00:00',0,5),(879,36,54,56,0,'','','2001-01-28 00:00:00',0,5),(880,36,45,50,0,'','','2001-01-28 00:00:00',0,5),(881,36,46,44,0,'','','2001-01-28 00:00:00',0,5),(882,36,57,49,0,'','','2001-02-04 00:00:00',0,6),(883,36,51,48,0,'','','2001-02-04 00:00:00',0,6),(884,36,47,59,0,'','','2001-02-04 00:00:00',0,6),(885,36,52,55,0,'','','2001-02-04 00:00:00',0,6),(886,36,54,58,0,'','','2001-02-04 00:00:00',0,6),(887,36,45,53,0,'','','2001-02-04 00:00:00',0,6),(888,36,46,56,0,'','','2001-02-04 00:00:00',0,6),(889,36,44,50,0,'','','2001-02-04 00:00:00',0,6),(890,36,57,51,0,'','','2001-02-11 00:00:00',0,7),(891,36,47,49,0,'','','2001-02-11 00:00:00',0,7),(892,36,52,48,0,'','','2001-02-11 00:00:00',0,7),(893,36,54,59,0,'','','2001-02-11 00:00:00',0,7),(894,36,45,55,0,'','','2001-02-11 00:00:00',0,7),(895,36,46,58,0,'','','2001-02-11 00:00:00',0,7),(896,36,44,53,0,'','','2001-02-11 00:00:00',0,7),(897,36,50,56,0,'','','2001-02-11 00:00:00',0,7),(898,36,57,47,0,'','','2001-02-18 00:00:00',0,8),(899,36,52,51,0,'','','2001-02-18 00:00:00',0,8),(900,36,54,49,0,'','','2001-02-18 00:00:00',0,8),(901,36,45,48,0,'','','2001-02-18 00:00:00',0,8),(902,36,46,59,0,'','','2001-02-18 00:00:00',0,8),(903,36,44,55,0,'','','2001-02-18 00:00:00',0,8),(904,36,50,58,0,'','','2001-02-18 00:00:00',0,8),(905,36,56,53,0,'','','2001-02-18 00:00:00',0,8),(906,36,57,52,0,'','','2001-02-25 00:00:00',0,9),(907,36,54,47,0,'','','2001-02-25 00:00:00',0,9),(908,36,45,51,0,'','','2001-02-25 00:00:00',0,9),(909,36,46,49,0,'','','2001-02-25 00:00:00',0,9),(910,36,44,48,0,'','','2001-02-25 00:00:00',0,9),(911,36,50,59,0,'','','2001-02-25 00:00:00',0,9),(912,36,56,55,0,'','','2001-02-25 00:00:00',0,9),(913,36,53,58,0,'','','2001-02-25 00:00:00',0,9),(914,36,57,54,0,'','','2001-03-04 00:00:00',0,10),(915,36,45,52,0,'','','2001-03-04 00:00:00',0,10),(916,36,46,47,0,'','','2001-03-04 00:00:00',0,10),(917,36,44,51,0,'','','2001-03-04 00:00:00',0,10),(918,36,50,49,0,'','','2001-03-04 00:00:00',0,10),(919,36,56,48,0,'','','2001-03-04 00:00:00',0,10),(920,36,53,59,0,'','','2001-03-04 00:00:00',0,10),(921,36,58,55,0,'','','2001-03-04 00:00:00',0,10),(922,36,57,45,0,'','','2001-03-11 00:00:00',0,11),(923,36,46,54,0,'','','2001-03-11 00:00:00',0,11),(924,36,44,52,0,'','','2001-03-11 00:00:00',0,11),(925,36,50,47,0,'','','2001-03-11 00:00:00',0,11),(926,36,56,51,0,'','','2001-03-11 00:00:00',0,11),(927,36,53,49,0,'','','2001-03-11 00:00:00',0,11),(928,36,58,48,0,'','','2001-03-11 00:00:00',0,11),(929,36,55,59,0,'','','2001-03-11 00:00:00',0,11),(930,36,57,46,0,'','','2001-03-18 00:00:00',0,12),(931,36,44,45,0,'','','2001-03-18 00:00:00',0,12),(932,36,50,54,0,'','','2001-03-18 00:00:00',0,12),(933,36,56,52,0,'','','2001-03-18 00:00:00',0,12),(934,36,53,47,0,'','','2001-03-18 00:00:00',0,12),(935,36,58,51,0,'','','2001-03-18 00:00:00',0,12),(936,36,55,49,0,'','','2001-03-18 00:00:00',0,12),(937,36,59,48,0,'','','2001-03-18 00:00:00',0,12),(938,36,57,44,0,'','','2001-03-25 00:00:00',0,13),(939,36,50,46,0,'','','2001-03-25 00:00:00',0,13),(940,36,56,45,0,'','','2001-03-25 00:00:00',0,13),(941,36,53,54,0,'','','2001-03-25 00:00:00',0,13),(942,36,58,52,0,'','','2001-03-25 00:00:00',0,13),(943,36,55,47,0,'','','2001-03-25 00:00:00',0,13),(944,36,59,51,0,'','','2001-03-25 00:00:00',0,13),(945,36,48,49,0,'','','2001-03-25 00:00:00',0,13),(946,36,57,50,0,'','','2001-04-01 00:00:00',0,14),(947,36,56,44,0,'','','2001-04-01 00:00:00',0,14),(948,36,53,46,0,'','','2001-04-01 00:00:00',0,14),(949,36,58,45,0,'','','2001-04-01 00:00:00',0,14),(950,36,55,54,0,'','','2001-04-01 00:00:00',0,14),(951,36,59,52,0,'','','2001-04-01 00:00:00',0,14),(952,36,48,47,0,'','','2001-04-01 00:00:00',0,14),(953,36,49,51,0,'','','2001-04-01 00:00:00',0,14),(954,36,57,56,0,'','','2001-04-08 00:00:00',0,15),(955,36,53,50,0,'','','2001-04-08 00:00:00',0,15),(956,36,58,44,0,'','','2001-04-08 00:00:00',0,15),(957,36,55,46,0,'','','2001-04-08 00:00:00',0,15),(958,36,59,45,0,'','','2001-04-08 00:00:00',0,15),(959,36,48,54,0,'','','2001-04-08 00:00:00',0,15),(960,36,49,52,0,'','','2001-04-08 00:00:00',0,15),(961,36,51,47,0,'','','2001-04-08 00:00:00',0,15),(962,37,73,63,0,'','','2000-12-31 00:00:00',0,1),(963,37,68,74,0,'','','2000-12-31 00:00:00',0,1),(964,37,66,70,0,'','','2000-12-31 00:00:00',0,1),(965,37,75,62,0,'','','2000-12-31 00:00:00',0,1),(966,37,72,71,0,'','','2000-12-31 00:00:00',0,1),(967,37,61,64,0,'','','2000-12-31 00:00:00',0,1),(968,37,67,69,0,'','','2000-12-31 00:00:00',0,1),(969,37,60,65,0,'','','2000-12-31 00:00:00',0,1),(970,37,73,68,0,'','','2001-01-07 00:00:00',0,2),(971,37,66,63,0,'','','2001-01-07 00:00:00',0,2),(972,37,75,74,0,'','','2001-01-07 00:00:00',0,2),(973,37,72,70,0,'','','2001-01-07 00:00:00',0,2),(974,37,61,62,0,'','','2001-01-07 00:00:00',0,2),(975,37,67,71,0,'','','2001-01-07 00:00:00',0,2),(976,37,60,64,0,'','','2001-01-07 00:00:00',0,2),(977,37,65,69,0,'','','2001-01-07 00:00:00',0,2),(978,37,73,66,0,'','','2001-01-14 00:00:00',0,3),(979,37,75,68,0,'','','2001-01-14 00:00:00',0,3),(980,37,72,63,0,'','','2001-01-14 00:00:00',0,3),(981,37,61,74,0,'','','2001-01-14 00:00:00',0,3),(982,37,67,70,0,'','','2001-01-14 00:00:00',0,3),(983,37,60,62,0,'','','2001-01-14 00:00:00',0,3),(984,37,65,71,0,'','','2001-01-14 00:00:00',0,3),(985,37,69,64,0,'','','2001-01-14 00:00:00',0,3),(986,37,73,75,0,'','','2001-01-21 00:00:00',0,4),(987,37,72,66,0,'','','2001-01-21 00:00:00',0,4),(988,37,61,68,0,'','','2001-01-21 00:00:00',0,4),(989,37,67,63,0,'','','2001-01-21 00:00:00',0,4),(990,37,60,74,0,'','','2001-01-21 00:00:00',0,4),(991,37,65,70,0,'','','2001-01-21 00:00:00',0,4),(992,37,69,62,0,'','','2001-01-21 00:00:00',0,4),(993,37,64,71,0,'','','2001-01-21 00:00:00',0,4),(994,37,73,72,0,'','','2001-01-28 00:00:00',0,5),(995,37,61,75,0,'','','2001-01-28 00:00:00',0,5),(996,37,67,66,0,'','','2001-01-28 00:00:00',0,5),(997,37,60,68,0,'','','2001-01-28 00:00:00',0,5),(998,37,65,63,0,'','','2001-01-28 00:00:00',0,5),(999,37,69,74,0,'','','2001-01-28 00:00:00',0,5),(1000,37,64,70,0,'','','2001-01-28 00:00:00',0,5),(1001,37,71,62,0,'','','2001-01-28 00:00:00',0,5),(1002,37,73,61,0,'','','2001-02-04 00:00:00',0,6),(1003,37,67,72,0,'','','2001-02-04 00:00:00',0,6),(1004,37,60,75,0,'','','2001-02-04 00:00:00',0,6),(1005,37,65,66,0,'','','2001-02-04 00:00:00',0,6),(1006,37,69,68,0,'','','2001-02-04 00:00:00',0,6),(1007,37,64,63,0,'','','2001-02-04 00:00:00',0,6),(1008,37,71,74,0,'','','2001-02-04 00:00:00',0,6),(1009,37,62,70,0,'','','2001-02-04 00:00:00',0,6),(1010,37,73,67,0,'','','2001-02-11 00:00:00',0,7),(1011,37,60,61,0,'','','2001-02-11 00:00:00',0,7),(1012,37,65,72,0,'','','2001-02-11 00:00:00',0,7),(1013,37,69,75,0,'','','2001-02-11 00:00:00',0,7),(1014,37,64,66,0,'','','2001-02-11 00:00:00',0,7),(1015,37,71,68,0,'','','2001-02-11 00:00:00',0,7),(1016,37,62,63,0,'','','2001-02-11 00:00:00',0,7),(1017,37,70,74,0,'','','2001-02-11 00:00:00',0,7),(1018,37,73,60,0,'','','2001-02-18 00:00:00',0,8),(1019,37,65,67,0,'','','2001-02-18 00:00:00',0,8),(1020,37,69,61,0,'','','2001-02-18 00:00:00',0,8),(1021,37,64,72,0,'','','2001-02-18 00:00:00',0,8),(1022,37,71,75,0,'','','2001-02-18 00:00:00',0,8),(1023,37,62,66,0,'','','2001-02-18 00:00:00',0,8),(1024,37,70,68,0,'','','2001-02-18 00:00:00',0,8),(1025,37,74,63,0,'','','2001-02-18 00:00:00',0,8),(1026,37,73,65,0,'','','2001-02-25 00:00:00',0,9),(1027,37,69,60,0,'','','2001-02-25 00:00:00',0,9),(1028,37,64,67,0,'','','2001-02-25 00:00:00',0,9),(1029,37,71,61,0,'','','2001-02-25 00:00:00',0,9),(1030,37,62,72,0,'','','2001-02-25 00:00:00',0,9),(1031,37,70,75,0,'','','2001-02-25 00:00:00',0,9),(1032,37,74,66,0,'','','2001-02-25 00:00:00',0,9),(1033,37,63,68,0,'','','2001-02-25 00:00:00',0,9),(1034,37,73,69,0,'','','2001-03-04 00:00:00',0,10),(1035,37,64,65,0,'','','2001-03-04 00:00:00',0,10),(1036,37,71,60,0,'','','2001-03-04 00:00:00',0,10),(1037,37,62,67,0,'','','2001-03-04 00:00:00',0,10),(1038,37,70,61,0,'','','2001-03-04 00:00:00',0,10),(1039,37,74,72,0,'','','2001-03-04 00:00:00',0,10),(1040,37,63,75,0,'','','2001-03-04 00:00:00',0,10),(1041,37,68,66,0,'','','2001-03-04 00:00:00',0,10),(1042,37,73,64,0,'','','2001-03-11 00:00:00',0,11),(1043,37,71,69,0,'','','2001-03-11 00:00:00',0,11),(1044,37,62,65,0,'','','2001-03-11 00:00:00',0,11),(1045,37,70,60,0,'','','2001-03-11 00:00:00',0,11),(1046,37,74,67,0,'','','2001-03-11 00:00:00',0,11),(1047,37,63,61,0,'','','2001-03-11 00:00:00',0,11),(1048,37,68,72,0,'','','2001-03-11 00:00:00',0,11),(1049,37,66,75,0,'','','2001-03-11 00:00:00',0,11),(1050,37,73,71,0,'','','2001-03-18 00:00:00',0,12),(1051,37,62,64,0,'','','2001-03-18 00:00:00',0,12),(1052,37,70,69,0,'','','2001-03-18 00:00:00',0,12),(1053,37,74,65,0,'','','2001-03-18 00:00:00',0,12),(1054,37,63,60,0,'','','2001-03-18 00:00:00',0,12),(1055,37,68,67,0,'','','2001-03-18 00:00:00',0,12),(1056,37,66,61,0,'','','2001-03-18 00:00:00',0,12),(1057,37,75,72,0,'','','2001-03-18 00:00:00',0,12),(1058,37,73,62,0,'','','2001-03-25 00:00:00',0,13),(1059,37,70,71,0,'','','2001-03-25 00:00:00',0,13),(1060,37,74,64,0,'','','2001-03-25 00:00:00',0,13),(1061,37,63,69,0,'','','2001-03-25 00:00:00',0,13),(1062,37,68,65,0,'','','2001-03-25 00:00:00',0,13),(1063,37,66,60,0,'','','2001-03-25 00:00:00',0,13),(1064,37,75,67,0,'','','2001-03-25 00:00:00',0,13),(1065,37,72,61,0,'','','2001-03-25 00:00:00',0,13),(1066,37,73,70,0,'','','2001-04-01 00:00:00',0,14),(1067,37,74,62,0,'','','2001-04-01 00:00:00',0,14),(1068,37,63,71,0,'','','2001-04-01 00:00:00',0,14),(1069,37,68,64,0,'','','2001-04-01 00:00:00',0,14),(1070,37,66,69,0,'','','2001-04-01 00:00:00',0,14),(1071,37,75,65,0,'','','2001-04-01 00:00:00',0,14),(1072,37,72,60,0,'','','2001-04-01 00:00:00',0,14),(1073,37,61,67,0,'','','2001-04-01 00:00:00',0,14),(1074,37,73,74,0,'','','2001-04-08 00:00:00',0,15),(1075,37,63,70,0,'','','2001-04-08 00:00:00',0,15),(1076,37,68,62,0,'','','2001-04-08 00:00:00',0,15),(1077,37,66,71,0,'','','2001-04-08 00:00:00',0,15),(1078,37,75,64,0,'','','2001-04-08 00:00:00',0,15),(1079,37,72,69,0,'','','2001-04-08 00:00:00',0,15),(1080,37,61,65,0,'','','2001-04-08 00:00:00',0,15),(1081,37,67,60,0,'','','2001-04-08 00:00:00',0,15),(1082,38,87,83,0,'','','2000-12-31 00:00:00',0,1),(1083,38,88,80,0,'','','2000-12-31 00:00:00',0,1),(1084,38,76,84,0,'','','2000-12-31 00:00:00',0,1),(1085,38,86,89,0,'','','2000-12-31 00:00:00',0,1),(1086,38,78,85,0,'','','2000-12-31 00:00:00',0,1),(1087,38,79,82,0,'','','2000-12-31 00:00:00',0,1),(1088,38,90,91,0,'','','2000-12-31 00:00:00',0,1),(1089,38,81,77,0,'','','2000-12-31 00:00:00',0,1),(1090,38,87,88,0,'','','2001-01-07 00:00:00',0,2),(1091,38,76,83,0,'','','2001-01-07 00:00:00',0,2),(1092,38,86,80,0,'','','2001-01-07 00:00:00',0,2),(1093,38,78,84,0,'','','2001-01-07 00:00:00',0,2),(1094,38,79,89,0,'','','2001-01-07 00:00:00',0,2),(1095,38,90,85,0,'','','2001-01-07 00:00:00',0,2),(1096,38,81,82,0,'','','2001-01-07 00:00:00',0,2),(1097,38,77,91,0,'','','2001-01-07 00:00:00',0,2),(1098,38,87,76,0,'','','2001-01-14 00:00:00',0,3),(1099,38,86,88,0,'','','2001-01-14 00:00:00',0,3),(1100,38,78,83,0,'','','2001-01-14 00:00:00',0,3),(1101,38,79,80,0,'','','2001-01-14 00:00:00',0,3),(1102,38,90,84,0,'','','2001-01-14 00:00:00',0,3),(1103,38,81,89,0,'','','2001-01-14 00:00:00',0,3),(1104,38,77,85,0,'','','2001-01-14 00:00:00',0,3),(1105,38,91,82,0,'','','2001-01-14 00:00:00',0,3),(1106,38,87,86,0,'','','2001-01-21 00:00:00',0,4),(1107,38,78,76,0,'','','2001-01-21 00:00:00',0,4),(1108,38,79,88,0,'','','2001-01-21 00:00:00',0,4),(1109,38,90,83,0,'','','2001-01-21 00:00:00',0,4),(1110,38,81,80,0,'','','2001-01-21 00:00:00',0,4),(1111,38,77,84,0,'','','2001-01-21 00:00:00',0,4),(1112,38,91,89,0,'','','2001-01-21 00:00:00',0,4),(1113,38,82,85,0,'','','2001-01-21 00:00:00',0,4),(1114,38,87,78,0,'','','2001-01-28 00:00:00',0,5),(1115,38,79,86,0,'','','2001-01-28 00:00:00',0,5),(1116,38,90,76,0,'','','2001-01-28 00:00:00',0,5),(1117,38,81,88,0,'','','2001-01-28 00:00:00',0,5),(1118,38,77,83,0,'','','2001-01-28 00:00:00',0,5),(1119,38,91,80,0,'','','2001-01-28 00:00:00',0,5),(1120,38,82,84,0,'','','2001-01-28 00:00:00',0,5),(1121,38,85,89,0,'','','2001-01-28 00:00:00',0,5),(1122,38,87,79,0,'','','2001-02-04 00:00:00',0,6),(1123,38,90,78,0,'','','2001-02-04 00:00:00',0,6),(1124,38,81,86,0,'','','2001-02-04 00:00:00',0,6),(1125,38,77,76,0,'','','2001-02-04 00:00:00',0,6),(1126,38,91,88,0,'','','2001-02-04 00:00:00',0,6),(1127,38,82,83,0,'','','2001-02-04 00:00:00',0,6),(1128,38,85,80,0,'','','2001-02-04 00:00:00',0,6),(1129,38,89,84,0,'','','2001-02-04 00:00:00',0,6),(1130,38,87,90,0,'','','2001-02-11 00:00:00',0,7),(1131,38,81,79,0,'','','2001-02-11 00:00:00',0,7),(1132,38,77,78,0,'','','2001-02-11 00:00:00',0,7),(1133,38,91,86,0,'','','2001-02-11 00:00:00',0,7),(1134,38,82,76,0,'','','2001-02-11 00:00:00',0,7),(1135,38,85,88,0,'','','2001-02-11 00:00:00',0,7),(1136,38,89,83,0,'','','2001-02-11 00:00:00',0,7),(1137,38,84,80,0,'','','2001-02-11 00:00:00',0,7),(1138,38,87,81,0,'','','2001-02-18 00:00:00',0,8),(1139,38,77,90,0,'','','2001-02-18 00:00:00',0,8),(1140,38,91,79,0,'','','2001-02-18 00:00:00',0,8),(1141,38,82,78,0,'','','2001-02-18 00:00:00',0,8),(1142,38,85,86,0,'','','2001-02-18 00:00:00',0,8),(1143,38,89,76,0,'','','2001-02-18 00:00:00',0,8),(1144,38,84,88,0,'','','2001-02-18 00:00:00',0,8),(1145,38,80,83,0,'','','2001-02-18 00:00:00',0,8),(1146,38,87,77,0,'','','2001-02-25 00:00:00',0,9),(1147,38,91,81,0,'','','2001-02-25 00:00:00',0,9),(1148,38,82,90,0,'','','2001-02-25 00:00:00',0,9),(1149,38,85,79,0,'','','2001-02-25 00:00:00',0,9),(1150,38,89,78,0,'','','2001-02-25 00:00:00',0,9),(1151,38,84,86,0,'','','2001-02-25 00:00:00',0,9),(1152,38,80,76,0,'','','2001-02-25 00:00:00',0,9),(1153,38,83,88,0,'','','2001-02-25 00:00:00',0,9),(1154,38,87,91,0,'','','2001-03-04 00:00:00',0,10),(1155,38,82,77,0,'','','2001-03-04 00:00:00',0,10),(1156,38,85,81,0,'','','2001-03-04 00:00:00',0,10),(1157,38,89,90,0,'','','2001-03-04 00:00:00',0,10),(1158,38,84,79,0,'','','2001-03-04 00:00:00',0,10),(1159,38,80,78,0,'','','2001-03-04 00:00:00',0,10),(1160,38,83,86,0,'','','2001-03-04 00:00:00',0,10),(1161,38,88,76,0,'','','2001-03-04 00:00:00',0,10),(1162,38,87,82,0,'','','2001-03-11 00:00:00',0,11),(1163,38,85,91,0,'','','2001-03-11 00:00:00',0,11),(1164,38,89,77,0,'','','2001-03-11 00:00:00',0,11),(1165,38,84,81,0,'','','2001-03-11 00:00:00',0,11),(1166,38,80,90,0,'','','2001-03-11 00:00:00',0,11),(1167,38,83,79,0,'','','2001-03-11 00:00:00',0,11),(1168,38,88,78,0,'','','2001-03-11 00:00:00',0,11),(1169,38,76,86,0,'','','2001-03-11 00:00:00',0,11),(1170,38,87,85,0,'','','2001-03-18 00:00:00',0,12),(1171,38,89,82,0,'','','2001-03-18 00:00:00',0,12),(1172,38,84,91,0,'','','2001-03-18 00:00:00',0,12),(1173,38,80,77,0,'','','2001-03-18 00:00:00',0,12),(1174,38,83,81,0,'','','2001-03-18 00:00:00',0,12),(1175,38,88,90,0,'','','2001-03-18 00:00:00',0,12),(1176,38,76,79,0,'','','2001-03-18 00:00:00',0,12),(1177,38,86,78,0,'','','2001-03-18 00:00:00',0,12),(1178,38,87,89,0,'','','2001-03-25 00:00:00',0,13),(1179,38,84,85,0,'','','2001-03-25 00:00:00',0,13),(1180,38,80,82,0,'','','2001-03-25 00:00:00',0,13),(1181,38,83,91,0,'','','2001-03-25 00:00:00',0,13),(1182,38,88,77,0,'','','2001-03-25 00:00:00',0,13),(1183,38,76,81,0,'','','2001-03-25 00:00:00',0,13),(1184,38,86,90,0,'','','2001-03-25 00:00:00',0,13),(1185,38,78,79,0,'','','2001-03-25 00:00:00',0,13),(1186,38,87,84,0,'','','2001-04-01 00:00:00',0,14),(1187,38,80,89,0,'','','2001-04-01 00:00:00',0,14),(1188,38,83,85,0,'','','2001-04-01 00:00:00',0,14),(1189,38,88,82,0,'','','2001-04-01 00:00:00',0,14),(1190,38,76,91,0,'','','2001-04-01 00:00:00',0,14),(1191,38,86,77,0,'','','2001-04-01 00:00:00',0,14),(1192,38,78,81,0,'','','2001-04-01 00:00:00',0,14),(1193,38,79,90,0,'','','2001-04-01 00:00:00',0,14),(1194,38,87,80,0,'','','2001-04-08 00:00:00',0,15),(1195,38,83,84,0,'','','2001-04-08 00:00:00',0,15),(1196,38,88,89,0,'','','2001-04-08 00:00:00',0,15),(1197,38,76,85,0,'','','2001-04-08 00:00:00',0,15),(1198,38,86,82,0,'','','2001-04-08 00:00:00',0,15),(1199,38,78,91,0,'','','2001-04-08 00:00:00',0,15),(1200,38,79,77,0,'','','2001-04-08 00:00:00',0,15),(1201,38,90,81,0,'','','2001-04-08 00:00:00',0,15),(1202,39,99,97,0,'','','2000-12-31 00:00:00',0,1),(1203,39,103,107,0,'','','2000-12-31 00:00:00',0,1),(1204,39,101,92,0,'','','2000-12-31 00:00:00',0,1),(1205,39,102,106,0,'','','2000-12-31 00:00:00',0,1),(1206,39,98,96,0,'','','2000-12-31 00:00:00',0,1),(1207,39,100,95,0,'','','2000-12-31 00:00:00',0,1),(1208,39,93,104,0,'','','2000-12-31 00:00:00',0,1),(1209,39,105,94,0,'','','2000-12-31 00:00:00',0,1),(1210,39,99,103,0,'','','2001-01-07 00:00:00',0,2),(1211,39,101,97,0,'','','2001-01-07 00:00:00',0,2),(1212,39,102,107,0,'','','2001-01-07 00:00:00',0,2),(1213,39,98,92,0,'','','2001-01-07 00:00:00',0,2),(1214,39,100,106,0,'','','2001-01-07 00:00:00',0,2),(1215,39,93,96,0,'','','2001-01-07 00:00:00',0,2),(1216,39,105,95,0,'','','2001-01-07 00:00:00',0,2),(1217,39,94,104,0,'','','2001-01-07 00:00:00',0,2),(1218,39,99,101,0,'','','2001-01-14 00:00:00',0,3),(1219,39,102,103,0,'','','2001-01-14 00:00:00',0,3),(1220,39,98,97,0,'','','2001-01-14 00:00:00',0,3),(1221,39,100,107,0,'','','2001-01-14 00:00:00',0,3),(1222,39,93,92,0,'','','2001-01-14 00:00:00',0,3),(1223,39,105,106,0,'','','2001-01-14 00:00:00',0,3),(1224,39,94,96,0,'','','2001-01-14 00:00:00',0,3),(1225,39,104,95,0,'','','2001-01-14 00:00:00',0,3),(1226,39,99,102,0,'','','2001-01-21 00:00:00',0,4),(1227,39,98,101,0,'','','2001-01-21 00:00:00',0,4),(1228,39,100,103,0,'','','2001-01-21 00:00:00',0,4),(1229,39,93,97,0,'','','2001-01-21 00:00:00',0,4),(1230,39,105,107,0,'','','2001-01-21 00:00:00',0,4),(1231,39,94,92,0,'','','2001-01-21 00:00:00',0,4),(1232,39,104,106,0,'','','2001-01-21 00:00:00',0,4),(1233,39,95,96,0,'','','2001-01-21 00:00:00',0,4),(1234,39,99,98,0,'','','2001-01-28 00:00:00',0,5),(1235,39,100,102,0,'','','2001-01-28 00:00:00',0,5),(1236,39,93,101,0,'','','2001-01-28 00:00:00',0,5),(1237,39,105,103,0,'','','2001-01-28 00:00:00',0,5),(1238,39,94,97,0,'','','2001-01-28 00:00:00',0,5),(1239,39,104,107,0,'','','2001-01-28 00:00:00',0,5),(1240,39,95,92,0,'','','2001-01-28 00:00:00',0,5),(1241,39,96,106,0,'','','2001-01-28 00:00:00',0,5),(1242,39,99,100,0,'','','2001-02-04 00:00:00',0,6),(1243,39,93,98,0,'','','2001-02-04 00:00:00',0,6),(1244,39,105,102,0,'','','2001-02-04 00:00:00',0,6),(1245,39,94,101,0,'','','2001-02-04 00:00:00',0,6),(1246,39,104,103,0,'','','2001-02-04 00:00:00',0,6),(1247,39,95,97,0,'','','2001-02-04 00:00:00',0,6),(1248,39,96,107,0,'','','2001-02-04 00:00:00',0,6),(1249,39,106,92,0,'','','2001-02-04 00:00:00',0,6),(1250,39,99,93,0,'','','2001-02-11 00:00:00',0,7),(1251,39,105,100,0,'','','2001-02-11 00:00:00',0,7),(1252,39,94,98,0,'','','2001-02-11 00:00:00',0,7),(1253,39,104,102,0,'','','2001-02-11 00:00:00',0,7),(1254,39,95,101,0,'','','2001-02-11 00:00:00',0,7),(1255,39,96,103,0,'','','2001-02-11 00:00:00',0,7),(1256,39,106,97,0,'','','2001-02-11 00:00:00',0,7),(1257,39,92,107,0,'','','2001-02-11 00:00:00',0,7),(1258,39,99,105,0,'','','2001-02-18 00:00:00',0,8),(1259,39,94,93,0,'','','2001-02-18 00:00:00',0,8),(1260,39,104,100,0,'','','2001-02-18 00:00:00',0,8),(1261,39,95,98,0,'','','2001-02-18 00:00:00',0,8),(1262,39,96,102,0,'','','2001-02-18 00:00:00',0,8),(1263,39,106,101,0,'','','2001-02-18 00:00:00',0,8),(1264,39,92,103,0,'','','2001-02-18 00:00:00',0,8),(1265,39,107,97,0,'','','2001-02-18 00:00:00',0,8),(1266,39,99,94,0,'','','2001-02-25 00:00:00',0,9),(1267,39,104,105,0,'','','2001-02-25 00:00:00',0,9),(1268,39,95,93,0,'','','2001-02-25 00:00:00',0,9),(1269,39,96,100,0,'','','2001-02-25 00:00:00',0,9),(1270,39,106,98,0,'','','2001-02-25 00:00:00',0,9),(1271,39,92,102,0,'','','2001-02-25 00:00:00',0,9),(1272,39,107,101,0,'','','2001-02-25 00:00:00',0,9),(1273,39,97,103,0,'','','2001-02-25 00:00:00',0,9),(1274,39,99,104,0,'','','2001-03-04 00:00:00',0,10),(1275,39,95,94,0,'','','2001-03-04 00:00:00',0,10),(1276,39,96,105,0,'','','2001-03-04 00:00:00',0,10),(1277,39,106,93,0,'','','2001-03-04 00:00:00',0,10),(1278,39,92,100,0,'','','2001-03-04 00:00:00',0,10),(1279,39,107,98,0,'','','2001-03-04 00:00:00',0,10),(1280,39,97,102,0,'','','2001-03-04 00:00:00',0,10),(1281,39,103,101,0,'','','2001-03-04 00:00:00',0,10),(1282,39,99,95,0,'','','2001-03-11 00:00:00',0,11),(1283,39,96,104,0,'','','2001-03-11 00:00:00',0,11),(1284,39,106,94,0,'','','2001-03-11 00:00:00',0,11),(1285,39,92,105,0,'','','2001-03-11 00:00:00',0,11),(1286,39,107,93,0,'','','2001-03-11 00:00:00',0,11),(1287,39,97,100,0,'','','2001-03-11 00:00:00',0,11),(1288,39,103,98,0,'','','2001-03-11 00:00:00',0,11),(1289,39,101,102,0,'','','2001-03-11 00:00:00',0,11),(1290,39,99,96,0,'','','2001-03-18 00:00:00',0,12),(1291,39,106,95,0,'','','2001-03-18 00:00:00',0,12),(1292,39,92,104,0,'','','2001-03-18 00:00:00',0,12),(1293,39,107,94,0,'','','2001-03-18 00:00:00',0,12),(1294,39,97,105,0,'','','2001-03-18 00:00:00',0,12),(1295,39,103,93,0,'','','2001-03-18 00:00:00',0,12),(1296,39,101,100,0,'','','2001-03-18 00:00:00',0,12),(1297,39,102,98,0,'','','2001-03-18 00:00:00',0,12),(1298,39,99,106,0,'','','2001-03-25 00:00:00',0,13),(1299,39,92,96,0,'','','2001-03-25 00:00:00',0,13),(1300,39,107,95,0,'','','2001-03-25 00:00:00',0,13),(1301,39,97,104,0,'','','2001-03-25 00:00:00',0,13),(1302,39,103,94,0,'','','2001-03-25 00:00:00',0,13),(1303,39,101,105,0,'','','2001-03-25 00:00:00',0,13),(1304,39,102,93,0,'','','2001-03-25 00:00:00',0,13),(1305,39,98,100,0,'','','2001-03-25 00:00:00',0,13),(1306,39,99,92,0,'','','2001-04-01 00:00:00',0,14),(1307,39,107,106,0,'','','2001-04-01 00:00:00',0,14),(1308,39,97,96,0,'','','2001-04-01 00:00:00',0,14),(1309,39,103,95,0,'','','2001-04-01 00:00:00',0,14),(1310,39,101,104,0,'','','2001-04-01 00:00:00',0,14),(1311,39,102,94,0,'','','2001-04-01 00:00:00',0,14),(1312,39,98,105,0,'','','2001-04-01 00:00:00',0,14),(1313,39,100,93,0,'','','2001-04-01 00:00:00',0,14),(1314,39,99,107,0,'','','2001-04-08 00:00:00',0,15),(1315,39,97,92,0,'','','2001-04-08 00:00:00',0,15),(1316,39,103,106,0,'','','2001-04-08 00:00:00',0,15),(1317,39,101,96,0,'','','2001-04-08 00:00:00',0,15),(1318,39,102,95,0,'','','2001-04-08 00:00:00',0,15),(1319,39,98,104,0,'','','2001-04-08 00:00:00',0,15),(1320,39,100,94,0,'','','2001-04-08 00:00:00',0,15),(1321,39,93,105,0,'','','2001-04-08 00:00:00',0,15),(1322,40,117,110,0,'','','2000-12-31 00:00:00',0,1),(1323,40,112,118,0,'','','2000-12-31 00:00:00',0,1),(1324,40,108,115,0,'','','2000-12-31 00:00:00',0,1),(1325,40,114,111,0,'','','2000-12-31 00:00:00',0,1),(1326,40,113,116,0,'','','2000-12-31 00:00:00',0,1),(1327,40,117,112,0,'','','2001-01-07 00:00:00',0,2),(1328,40,108,110,0,'','','2001-01-07 00:00:00',0,2),(1329,40,114,118,0,'','','2001-01-07 00:00:00',0,2),(1330,40,113,115,0,'','','2001-01-07 00:00:00',0,2),(1331,40,109,111,0,'','','2001-01-07 00:00:00',0,2),(1332,40,117,108,0,'','','2001-01-14 00:00:00',0,3),(1333,40,114,112,0,'','','2001-01-14 00:00:00',0,3),(1334,40,113,110,0,'','','2001-01-14 00:00:00',0,3),(1335,40,109,118,0,'','','2001-01-14 00:00:00',0,3),(1336,40,116,111,0,'','','2001-01-14 00:00:00',0,3),(1337,40,117,114,0,'','','2001-01-21 00:00:00',0,4),(1338,40,113,108,0,'','','2001-01-21 00:00:00',0,4),(1339,40,109,112,0,'','','2001-01-21 00:00:00',0,4),(1340,40,116,118,0,'','','2001-01-21 00:00:00',0,4),(1341,40,111,115,0,'','','2001-01-21 00:00:00',0,4),(1342,40,117,113,0,'','','2001-01-28 00:00:00',0,5),(1343,40,109,114,0,'','','2001-01-28 00:00:00',0,5),(1344,40,116,112,0,'','','2001-01-28 00:00:00',0,5),(1345,40,111,110,0,'','','2001-01-28 00:00:00',0,5),(1346,40,115,118,0,'','','2001-01-28 00:00:00',0,5),(1347,40,117,109,0,'','','2001-02-04 00:00:00',0,6),(1348,40,116,114,0,'','','2001-02-04 00:00:00',0,6),(1349,40,111,108,0,'','','2001-02-04 00:00:00',0,6),(1350,40,115,112,0,'','','2001-02-04 00:00:00',0,6),(1351,40,118,110,0,'','','2001-02-04 00:00:00',0,6),(1352,40,116,109,0,'','','2001-02-11 00:00:00',0,7),(1353,40,111,113,0,'','','2001-02-11 00:00:00',0,7),(1354,40,115,114,0,'','','2001-02-11 00:00:00',0,7),(1355,40,118,108,0,'','','2001-02-11 00:00:00',0,7),(1356,40,110,112,0,'','','2001-02-11 00:00:00',0,7),(1357,40,117,116,0,'','','2001-02-18 00:00:00',0,8),(1358,40,115,109,0,'','','2001-02-18 00:00:00',0,8),(1359,40,118,113,0,'','','2001-02-18 00:00:00',0,8),(1360,40,110,114,0,'','','2001-02-18 00:00:00',0,8),(1361,40,112,108,0,'','','2001-02-18 00:00:00',0,8),(1362,40,117,111,0,'','','2001-02-25 00:00:00',0,9),(1363,40,115,116,0,'','','2001-02-25 00:00:00',0,9),(1364,40,110,109,0,'','','2001-02-25 00:00:00',0,9),(1365,40,112,113,0,'','','2001-02-25 00:00:00',0,9),(1366,40,108,114,0,'','','2001-02-25 00:00:00',0,9),(1367,40,117,115,0,'','','2001-03-04 00:00:00',0,10),(1368,40,118,111,0,'','','2001-03-04 00:00:00',0,10),(1369,40,110,116,0,'','','2001-03-04 00:00:00',0,10),(1370,40,108,109,0,'','','2001-03-04 00:00:00',0,10),(1371,40,114,113,0,'','','2001-03-04 00:00:00',0,10),(1372,40,117,118,0,'','','2001-03-11 00:00:00',0,11),(1373,40,110,115,0,'','','2001-03-11 00:00:00',0,11),(1374,40,112,111,0,'','','2001-03-11 00:00:00',0,11),(1375,40,108,116,0,'','','2001-03-11 00:00:00',0,11),(1376,40,113,109,0,'','','2001-03-11 00:00:00',0,11),(1377,1,1,2,0,'','','1990-12-30 00:00:00',0,1),(1378,1,1,2,0,'','','1990-12-30 00:00:00',0,1),(1379,1,1,2,0,'','','1990-12-30 00:00:00',0,1),(1380,1,1,2,0,'','','1990-12-30 00:00:00',0,1),(1381,1,1,2,0,'','','1990-12-30 00:00:00',0,1),(1382,1,1,2,0,'','','1990-12-30 00:00:00',0,1);
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_media`
--

DROP TABLE IF EXISTS `match_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_media` (
  `mm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m_id` int(10) unsigned NOT NULL,
  `u_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `name` char(30) DEFAULT NULL,
  `description` char(20) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mm_id`),
  KEY `m_id` (`m_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `match_media_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `match` (`m_id`),
  CONSTRAINT `match_media_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_media`
--

LOCK TABLES `match_media` WRITE;
/*!40000 ALTER TABLE `match_media` DISABLE KEYS */;
INSERT INTO `match_media` VALUES (1,1,2,'2009-06-23 19:53:23','Screen1','',0),(4,4,14,'2009-08-14 22:28:09','343753001250281688.jpg','screen',11232),(5,4,14,'2009-08-14 22:28:34','078128001250281713.zip','demo',8641309),(6,4,14,'2009-08-14 22:34:43','203127001250282082.jpg','screen',11232);
/*!40000 ALTER TABLE `match_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_settlement_log`
--

DROP TABLE IF EXISTS `match_settlement_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_settlement_log` (
  `msl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` char(255) NOT NULL,
  `m_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`msl_id`),
  KEY `FK_INDEX` (`m_id`) USING BTREE,
  CONSTRAINT `FK_match_settlement_log_1` FOREIGN KEY (`m_id`) REFERENCES `match` (`m_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_settlement_log`
--

LOCK TABLES `match_settlement_log` WRITE;
/*!40000 ALTER TABLE `match_settlement_log` DISABLE KEYS */;
INSERT INTO `match_settlement_log` VALUES (1,'bibo from Hoorai changed the date to 2000-12-30 20:30',4,'2009-08-09 02:44:44'),(6,'bibo from Hoorai changed the date to 2006-12-30 18:00',4,'2009-08-09 02:57:44'),(7,'bibo from Hoorai changed the map to 4.',4,'2009-08-09 03:07:05'),(8,'bibo from Hoorai changed the map to de_dust2.',4,'2009-08-09 03:13:13'),(9,'bibo from Hoorai changed the map to de_prodigy.',4,'2009-08-09 03:14:13'),(10,'bibo from Hoorai changed the map to de_dust2.',4,'2009-08-09 03:18:23'),(11,'bibo from Hoorai changed the map to de_prodigy.',4,'2009-08-09 03:19:14'),(12,'bibo from Hoorai said: swsergb.',4,'2009-08-09 03:23:50'),(13,'bibo from Hoorai said:   swsergb.',4,'2009-08-09 03:24:24'),(14,'bibo from Hoorai said: \'swsergb.\'',4,'2009-08-09 03:25:24'),(15,'bibo from Hoorai said: \'swsergb\'.',4,'2009-08-09 03:25:50'),(16,'hero from TEAM Alternate changed the map to de_prodigy.',4,'2009-08-09 03:31:18'),(17,'hero from TEAM Alternate said: hiho.',4,'2009-08-09 03:31:18'),(18,'soi from Admin staff said: HI IHR ATZEN.',4,'2009-08-09 03:32:05'),(19,'soi from Admin staff changed the map to de_prodigy.',4,'2009-08-09 03:33:41'),(20,'soi from Admin staff changed the map to de_prodigy.',4,'2009-08-09 03:33:42'),(21,'soi from Admin staff said: HI IHR ATZEN.',4,'2009-08-09 03:33:42'),(22,'soi from Admin staff changed the date to 2006-12-31 18:00.',4,'2009-08-09 03:33:54'),(23,'soi from Admin staff changed the map to de_dust2.',4,'2009-08-09 03:33:54'),(24,'soi from Admin staff changed the map to de_dust2.',4,'2009-08-09 03:33:54'),(25,'soi from Admin staff said: assies.',4,'2009-08-09 03:33:54'),(26,'soi from Admin staff changed the map to de_dust2.',4,'2009-08-10 02:06:30'),(27,'soi from Admin staff changed the map to de_dust2.',4,'2009-08-10 02:06:30'),(28,'soi from Admin staff said: gergh.',4,'2009-08-10 02:06:30'),(29,'soi from Admin staff changed the date to 2009-07-03 18:30:00.',4,'2009-08-10 02:07:23'),(30,'soi from Admin staff changed the map to de_dust2.',4,'2009-08-10 02:07:23'),(31,'soi from Admin staff changed the map to de_dust2.',4,'2009-08-10 02:07:24'),(32,'soi from Admin staff said: 18:00.',4,'2009-08-10 02:07:24'),(33,'soi from Admin staff changed the map to de_prodigy.',4,'2009-08-10 02:07:44'),(34,'soi from Admin staff changed the map to de_dust2.',4,'2009-08-10 02:07:44'),(35,'soi from Admin staff said: af.',4,'2009-08-10 02:07:44'),(36,'soi from Admin staff changed the map to de_dust2.',4,'2009-08-10 02:11:11'),(37,'soi from Admin staff changed the map to de_dust2.',4,'2009-08-10 02:11:12'),(38,'soi from Admin staff said: hiho.',4,'2009-08-10 02:11:12'),(39,'soi from Admin staff changed the map to de_prodigy.',4,'2009-08-10 02:11:38'),(40,'soi from Admin staff changed the map to de_dust2.',4,'2009-08-10 02:11:39'),(41,'soi from Admin staff said: moin.',4,'2009-08-10 02:11:39'),(42,'bibo from Hoorai changed the date to 2009-07-04 18:30:00.',4,'2009-08-10 02:12:53'),(43,'bibo from Hoorai said: hi.',4,'2009-08-10 02:12:53'),(44,'bibo from Hoorai changed the date to 2010-04-04 18:30:00.',4,'2009-08-10 02:13:12'),(45,'bibo from Hoorai changed the map to de_prodigy.',4,'2009-08-10 02:13:12'),(46,'bibo from Hoorai changed the date to 2010-04-04 18:00:00.',4,'2009-08-10 02:13:18'),(47,'bibo from Hoorai changed the date to 2009-04-04 18:00:00.',4,'2009-08-12 16:03:46'),(48,'bibo from Hoorai changed the map to de_dust2.',4,'2009-08-12 16:51:59'),(49,'hero from TEAM Alternate changed the map to de_prodigy.',4,'2009-08-12 16:52:31'),(50,'soi from Admin staff changed the map to de_prodigy.',4,'2009-08-12 17:06:34'),(51,'soi from Admin staff changed the map to de_dust2.',4,'2009-08-12 17:06:35'),(52,'soi from Admin staff changed the map to de_prodigy.',4,'2009-08-12 20:25:57'),(53,'soi from Admin staff changed the map to de_dust2.',4,'2009-08-12 20:25:57'),(54,'soi from Admin staff changed the map to de_prodigy.',4,'2009-08-12 20:28:40'),(55,'soi from Admin staff said: hihohhh.',4,'2009-08-12 20:28:40');
/*!40000 ALTER TABLE `match_settlement_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `n_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(200) NOT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL,
  `u_id` int(11) unsigned NOT NULL,
  `l_id` int(11) unsigned NOT NULL,
  `league_news` tinyint(4) NOT NULL,
  PRIMARY KEY (`n_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'first news','hello world','2009-06-16 23:42:53',4,0,0),(2,'second news','hello world again','2009-06-16 23:43:57',4,0,0),(3,'third news','hello world again and again','2009-06-16 23:44:09',4,0,0),(5,'League started','League started','2009-07-01 00:00:00',2,1,1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season` (
  `se_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `l_id` int(10) unsigned NOT NULL,
  `number` int(10) unsigned NOT NULL,
  `name` char(100) NOT NULL,
  `schedule` tinyint(3) unsigned NOT NULL DEFAULT '7',
  PRIMARY KEY (`se_id`),
  KEY `l_id` (`l_id`),
  CONSTRAINT `season_ibfk_1` FOREIGN KEY (`l_id`) REFERENCES `league` (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (2,1,1,'TO:C 5on5 Season1',7),(3,1,2,'TO:C 5on5 Season2',7),(4,1,3,'TO:C 5on5 Season3',7),(5,3,1,'CS:S 5on5 Season 1',7),(6,3,2,'CS:S 5on5 Season 2',7),(7,6,1,'AO:T 5on5 Season 1',7),(19,6,2,'AOT Season 2',7);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `t_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `shorthandle` char(20) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `join_password` char(50) NOT NULL,
  PRIMARY KEY (`t_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'stargamerztu','sGFF','COOL GUYSSS','2009-06-17','starz'),(2,'Glück gehabt','GG','immer glücklich','2009-06-17','glück'),(19,'TEAM Alternate','TEAM Alternate','TEAM Alternate Werksteam','2009-07-01','alternate'),(20,'Hoorai','hoorai','hoorai team','2009-07-01','hoorai'),(21,'SNOGARD Dragons','SONGARD','snogard dragons werksteam','2009-07-01','snogard'),(22,'TEAM Speedlink','TEAM Speedlink','Team Speedlink werksteam','2009-07-01','speedlink'),(23,'TEAM Thermaltake','TEAM Therma','team thermaltake werkstea','2009-07-01','thermaltak'),(24,'KomaCrew','KC','die Komacrew','2009-07-01','komacrew'),(25,'ESC','ESC','ESC gaming','2009-07-01','esc'),(26,'YDK','ydk?me','you dont know me','2009-07-01','ydk'),(27,'MTW','MTW','Mortal team work','2009-07-01','mtw'),(28,'TAIFUN','TAIFUN','Taifun!!','2009-07-01','taifun'),(29,'Clan00','00','doppelnullen','2009-07-01','clan00'),(30,'EnRo Griffins','EnRo','enro bois','2009-07-01','enro'),(31,'bomk','bomk *','bomk kings','2009-07-01','bomk'),(32,'N!Faculty','n!','en faculty','2009-07-01','nfaculty'),(33,'Hardware4You','h4u','hardware for you','2009-07-01','h4u'),(34,'Raptor Gaming','raptor','raprap','2009-07-01','raptor'),(38,'abcbb','','','2009-07-10','scuq2x95'),(39,'as','','','2009-07-11','acd'),(40,'hgf','','','2009-07-11','exuq2b8i'),(41,'ghc','','','2009-07-11','s7olvs3c'),(42,'acd','','','2009-07-11','x3lvs3zv'),(44,'team0','tag0','desc0','2009-07-21',''),(45,'team1','tag1','desc1','2009-07-21',''),(46,'team2','tag2','desc2','2009-07-21',''),(47,'team3','tag3','desc3','2009-07-21',''),(48,'team4','tag4','desc4','2009-07-21',''),(49,'team5','tag5','desc5','2009-07-21',''),(50,'team6','tag6','desc6','2009-07-21',''),(51,'team7','tag7','desc7','2009-07-21',''),(52,'team8','tag8','desc8','2009-07-21',''),(53,'team9','tag9','desc9','2009-07-21',''),(54,'team10','tag10','desc10','2009-07-21',''),(55,'team11','tag11','desc11','2009-07-21',''),(56,'team12','tag12','desc12','2009-07-21',''),(57,'team13','tag13','desc13','2009-07-21',''),(58,'team14','tag14','desc14','2009-07-21',''),(59,'team15','tag15','desc15','2009-07-21',''),(60,'team16','tag16','desc16','2009-07-21',''),(61,'team17','tag17','desc17','2009-07-21',''),(62,'team18','tag18','desc18','2009-07-21',''),(63,'team19','tag19','desc19','2009-07-21',''),(64,'team20','tag20','desc20','2009-07-21',''),(65,'team21','tag21','desc21','2009-07-21',''),(66,'team22','tag22','desc22','2009-07-21',''),(67,'team23','tag23','desc23','2009-07-21',''),(68,'team24','tag24','desc24','2009-07-21',''),(69,'team25','tag25','desc25','2009-07-21',''),(70,'team26','tag26','desc26','2009-07-21',''),(71,'team27','tag27','desc27','2009-07-21',''),(72,'team28','tag28','desc28','2009-07-21',''),(73,'team29','tag29','desc29','2009-07-21',''),(74,'team30','tag30','desc30','2009-07-21',''),(75,'team31','tag31','desc31','2009-07-21',''),(76,'team32','tag32','desc32','2009-07-21',''),(77,'team33','tag33','desc33','2009-07-21',''),(78,'team34','tag34','desc34','2009-07-21',''),(79,'team35','tag35','desc35','2009-07-21',''),(80,'team36','tag36','desc36','2009-07-21',''),(81,'team37','tag37','desc37','2009-07-21',''),(82,'team38','tag38','desc38','2009-07-21',''),(83,'team39','tag39','desc39','2009-07-21',''),(84,'team40','tag40','desc40','2009-07-21',''),(85,'team41','tag41','desc41','2009-07-21',''),(86,'team42','tag42','desc42','2009-07-21',''),(87,'team43','tag43','desc43','2009-07-21',''),(88,'team44','tag44','desc44','2009-07-21',''),(89,'team45','tag45','desc45','2009-07-21',''),(90,'team46','tag46','desc46','2009-07-21',''),(91,'team47','tag47','desc47','2009-07-21',''),(92,'team48','tag48','desc48','2009-07-21',''),(93,'team49','tag49','desc49','2009-07-21',''),(94,'team50','tag50','desc50','2009-07-21',''),(95,'team51','tag51','desc51','2009-07-21',''),(96,'team52','tag52','desc52','2009-07-21',''),(97,'team53','tag53','desc53','2009-07-21',''),(98,'team54','tag54','desc54','2009-07-21',''),(99,'team55','tag55','desc55','2009-07-21',''),(100,'team56','tag56','desc56','2009-07-21',''),(101,'team57','tag57','desc57','2009-07-21',''),(102,'team58','tag58','desc58','2009-07-21',''),(103,'team59','tag59','desc59','2009-07-21',''),(104,'team60','tag60','desc60','2009-07-21',''),(105,'team61','tag61','desc61','2009-07-21','aaa'),(106,'team62','tag62','desc62','2009-07-21','111'),(107,'team63','tag63','desc63','2009-07-21',''),(108,'team64','tag64','desc64','2009-07-21',''),(109,'team65','tag65','desc65','2009-07-21',''),(110,'team66','tag66','desc66','2009-07-21',''),(111,'team67','tag67','desc67','2009-07-21',''),(112,'team68','tag68','desc68','2009-07-21',''),(113,'team69','tag69','desc69','2009-07-21',''),(114,'team70','tag70','desc70','2009-07-21',''),(115,'team71','tag71','desc71','2009-07-21',''),(116,'team72','tag72','desc72','2009-07-21',''),(117,'team73','tag73','desc73','2009-07-21',''),(118,'team74','tag74','desc74','2009-07-21',''),(120,'team75','tag75','desc75','2009-07-21',''),(121,'team76','tag76','desc76','2009-07-21',''),(122,'team77','tag77','desc77','2009-07-21',''),(123,'team78','tag78','desc78','2009-07-21',''),(124,'team79','tag79','desc79','2009-07-21',''),(125,'team80','tag80','desc80','2009-07-21',''),(126,'team81','tag81','desc81','2009-07-21',''),(127,'team82','tag82','desc82','2009-07-21',''),(128,'team83','tag83','desc83','2009-07-21',''),(129,'team84','tag84','desc84','2009-07-21',''),(130,'team85','tag85','desc85','2009-07-21',''),(131,'team86','tag86','desc86','2009-07-21',''),(132,'team87','tag87','desc87','2009-07-21',''),(133,'team88','tag88','desc88','2009-07-21',''),(134,'team89','tag89','desc89','2009-07-21',''),(135,'team90','tag90','desc90','2009-07-21',''),(136,'team91','tag91','desc91','2009-07-21',''),(137,'team92','tag92','desc92','2009-07-21',''),(138,'team93','tag93','desc93','2009-07-21',''),(139,'team94','tag94','desc94','2009-07-21',''),(140,'team95','tag95','desc95','2009-07-21',''),(141,'team96','tag96','desc96','2009-07-21',''),(142,'team97','tag97','desc97','2009-07-21',''),(143,'team98','tag98','desc98','2009-07-21',''),(144,'team99','tag99','desc99','2009-07-21',''),(145,'team100','tag100','desc100','2009-07-21',''),(146,'team101','tag101','desc101','2009-07-21',''),(147,'team102','tag102','desc102','2009-07-21',''),(148,'team103','tag103','desc103','2009-07-21',''),(149,'team104','tag104','desc104','2009-07-21',''),(150,'team105','tag105','desc105','2009-07-21',''),(151,'team106','tag106','desc106','2009-07-21',''),(152,'team107','tag107','desc107','2009-07-21',''),(153,'team108','tag108','desc108','2009-07-21',''),(154,'team109','tag109','desc109','2009-07-21',''),(158,'team222','','','2009-08-08','password1'),(160,'moep','','','2009-08-15','bbbbbbbb'),(161,'hdgfthrhntzn','','','2009-08-15','fyhdnkgd'),(162,'rtttt','','','2009-08-15','wgyv62yu');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_in_division`
--

DROP TABLE IF EXISTS `team_in_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_in_division` (
  `tid_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `t_id` int(10) unsigned NOT NULL,
  `d_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tid_id`),
  KEY `d_id` (`d_id`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `team_in_division_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `division` (`d_id`),
  CONSTRAINT `team_in_division_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_in_division`
--

LOCK TABLES `team_in_division` WRITE;
/*!40000 ALTER TABLE `team_in_division` DISABLE KEYS */;
INSERT INTO `team_in_division` VALUES (2,19,4),(20,20,4),(21,21,4),(22,22,4),(23,23,4),(24,24,4),(25,25,4),(26,26,4),(27,27,4),(28,28,4),(29,29,4),(30,30,4),(31,31,4),(32,32,4),(33,33,4),(34,34,4),(110,44,5),(111,45,5),(112,46,5),(113,47,5),(114,48,5),(115,49,5),(116,50,5),(117,51,5),(118,52,5),(119,53,5),(120,54,5),(121,55,5),(122,56,5),(123,57,5),(124,58,5),(125,59,5),(126,60,6),(127,61,6),(128,62,6),(129,63,6),(130,64,6),(131,65,6),(132,66,6),(133,67,6),(134,68,6),(135,69,6),(136,70,6),(137,71,6),(138,72,6),(139,73,6),(140,74,6),(141,75,6),(142,76,7),(143,77,7),(144,78,7),(145,79,7),(146,80,7),(147,81,7),(148,82,7),(149,83,7),(150,84,7),(151,85,7),(152,86,7),(153,87,7),(154,88,7),(155,89,7),(156,90,7),(157,91,7),(158,92,8),(159,93,8),(160,94,8),(161,95,8),(162,96,8),(163,97,8),(164,98,8),(165,99,8),(166,100,8),(167,101,8),(168,102,8),(169,103,8),(170,104,8),(171,105,8),(172,106,8),(173,107,8),(174,108,9),(175,109,9),(176,110,9),(177,111,9),(178,112,9),(179,113,9),(180,114,9),(181,115,9),(182,116,9),(183,117,9),(184,118,9),(266,44,36),(267,45,36),(268,54,36),(269,55,36),(270,56,36),(271,57,36),(272,58,36),(273,59,36),(274,46,36),(275,47,36),(276,48,36),(277,49,36),(278,50,36),(279,51,36),(280,52,36),(281,53,36),(282,60,37),(283,61,37),(284,62,37),(285,63,37),(286,64,37),(287,65,37),(288,66,37),(289,67,37),(290,68,37),(291,69,37),(292,70,37),(293,71,37),(294,72,37),(295,73,37),(296,74,37),(297,75,37),(298,76,38),(299,77,38),(300,78,38),(301,79,38),(302,80,38),(303,81,38),(304,82,38),(305,83,38),(306,84,38),(307,85,38),(308,86,38),(309,87,38),(310,88,38),(311,89,38),(312,90,38),(313,91,38),(314,92,39),(315,93,39),(316,94,39),(317,95,39),(318,96,39),(319,97,39),(320,98,39),(321,99,39),(322,100,39),(323,101,39),(324,102,39),(325,103,39),(326,104,39),(327,105,39),(328,106,39),(329,107,39),(330,108,40),(331,109,40),(332,110,40),(333,111,40),(334,112,40),(335,113,40),(336,114,40),(337,115,40),(338,116,40),(339,117,40),(340,118,40),(341,1,1),(343,1,36),(345,1,1),(346,1,2),(349,2,2),(350,1,1),(353,1,1);
/*!40000 ALTER TABLE `team_in_division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_signed_up`
--

DROP TABLE IF EXISTS `team_signed_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_signed_up` (
  `tsi_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `t_id` int(10) unsigned NOT NULL,
  `l_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tsi_id`),
  UNIQUE KEY `t_id` (`t_id`,`l_id`),
  KEY `FK_team_signed_in_2` (`l_id`),
  CONSTRAINT `FK_team_signed_in_1` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`) ON UPDATE NO ACTION,
  CONSTRAINT `FK_team_signed_in_2` FOREIGN KEY (`l_id`) REFERENCES `league` (`l_id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_signed_up`
--

LOCK TABLES `team_signed_up` WRITE;
/*!40000 ALTER TABLE `team_signed_up` DISABLE KEYS */;
INSERT INTO `team_signed_up` VALUES (2,1,3),(6,1,6);
/*!40000 ALTER TABLE `team_signed_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_status_type`
--

DROP TABLE IF EXISTS `team_status_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_status_type` (
  `tst_id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `status_name` char(20) NOT NULL,
  PRIMARY KEY (`tst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_status_type`
--

LOCK TABLES `team_status_type` WRITE;
/*!40000 ALTER TABLE `team_status_type` DISABLE KEYS */;
INSERT INTO `team_status_type` VALUES (1,'Manager'),(2,'Orga'),(3,'Team Captain'),(4,'Player'),(5,'Inactive');
/*!40000 ALTER TABLE `team_status_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `u_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` char(50) NOT NULL,
  `last_name` char(50) NOT NULL,
  `nick` char(50) NOT NULL,
  `description` text NOT NULL,
  `nation` char(50) NOT NULL,
  `up_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `password_hash` char(32) NOT NULL,
  `email` char(100) NOT NULL,
  `unlocked` tinyint(11) unsigned NOT NULL,
  `login` char(50) NOT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Felix','Ssupiuu','soi','dufte','Afganistan',0,'0000-00-00','4df1ee97499d792b84e317e2db00c65e','mymail@hier.de',0,'soi'),(3,'Falco','Schmidt','granus','aachen','D',0,'2009-06-16','4df1ee97499d792b84e317e2db00c65e','mymail1@hier.de',0,'granus'),(4,'Kons','Geis','riper','FM','D',0,'2009-06-16','4df1ee97499d792b84e317e2db00c65e','mymail2@hier.de',0,'riper'),(5,'Marvin','Ludwig','rubber','Dortmund123','Germany',0,'2009-06-16','4df1ee97499d792b84e317e2db00c65e','efever@trash-mail.com',0,'rubber'),(6,'Marcel','Bruns','buschii','berlin','D',0,'2009-06-16','4df1ee97499d792b84e317e2db00c65e','efever@trash-mail.comefe',0,'buschii'),(9,'Tobias','Müller','mouz','BW','D',0,'2009-06-16','4df1ee97499d792b84e317e2db00c65e','soisseteben@yahoo.de',0,'mouz'),(10,'Hinze','Wolfgang','wolf','','D',0,'2009-06-19','c9ec6eb0fad17fb6fdf73cb6ca3152e0','punk@gmx.de',0,'wolf'),(11,'meier','jürgen','head shooter','','Afganistan',0,'2009-06-21','c9ec6eb0fad17fb6fdf73cb6ca3152e0','hi@hi.de',0,'head shooter'),(12,'Johny','Smithhh','hero','efge','Afganistan',0,'2009-06-23','c9ec6eb0fad17fb6fdf73cb6ca3152e0','hero@yahoo.com',0,'hero'),(13,'Micha','Gruns','bambam','','Afganistan',0,'2009-07-11','c9ec6eb0fad17fb6fdf73cb6ca3152e0','hiii@djb.com',0,'bambam'),(14,'bob','bimbo','bibo','','Afganistan',0,'2009-07-11','c9ec6eb0fad17fb6fdf73cb6ca3152e0','asff@sss.de',0,'bibo'),(15,'first1','last1','login1','','nation1',0,'2009-08-08','hash1','email1',0,'login1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_in_team`
--

DROP TABLE IF EXISTS `user_in_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_in_team` (
  `uit_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` int(11) unsigned NOT NULL,
  `t_id` int(11) unsigned NOT NULL,
  `admin_permission` tinyint(4) unsigned NOT NULL,
  `write_permission` tinyint(4) unsigned NOT NULL,
  `tst_id` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`uit_id`),
  UNIQUE KEY `u_id_2` (`u_id`,`t_id`),
  KEY `u_id` (`u_id`),
  KEY `t_id` (`t_id`),
  KEY `tst_id` (`tst_id`),
  CONSTRAINT `user_in_team_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `user_in_team_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`),
  CONSTRAINT `user_in_team_ibfk_3` FOREIGN KEY (`tst_id`) REFERENCES `team_status_type` (`tst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_in_team`
--

LOCK TABLES `user_in_team` WRITE;
/*!40000 ALTER TABLE `user_in_team` DISABLE KEYS */;
INSERT INTO `user_in_team` VALUES (2,3,1,0,0,4),(3,4,1,1,1,3),(4,5,2,0,0,3),(7,5,1,0,0,4),(8,4,2,0,0,4),(9,3,2,0,1,4),(24,11,1,1,1,4),(25,12,1,0,1,5),(33,12,2,0,0,4),(36,2,38,1,1,4),(37,2,39,1,1,4),(38,3,39,0,0,4),(39,4,40,1,1,4),(40,2,41,1,1,4),(44,2,1,1,1,2),(45,14,42,1,1,4),(47,12,19,1,1,1),(50,14,20,1,1,1),(51,4,112,1,1,4),(52,2,149,1,1,4),(53,2,150,1,1,4);
/*!40000 ALTER TABLE `user_in_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'paul'
--
/*!50003 DROP FUNCTION IF EXISTS `split` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 FUNCTION `split`(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
) RETURNS varchar(255) CHARSET latin1
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_game`(IN game_name char(50),  IN guid_id INT)
BEGIN
	INSERT into game (name, gu_id) values  (
  game_name,
	guid_id);

  CALL `log`('INSERT', CONCAT('Game with name \'', game_name, '\' (id: ', LAST_INSERT_ID(), ') has been inserted.'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_guid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_guid`(IN guid_name char(20))
BEGIN
	INSERT into guid (name) values  (
  guid_name);

  CALL `log`('INSERT', CONCAT('New Guid \'', guid_name, '\' (id: ', LAST_INSERT_ID(), ') has been inserted.'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_league` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_league`(IN league_name char(100), IN game_id INT)
BEGIN
	INSERT INTO league(name, g_id, min_players_team) VALUES (
	league_name,
	game_id,
  1);
  CALL `log`('INSERT', CONCAT('New League \'', league_name, '\' (id: ', LAST_INSERT_ID(), ') of game with id: \'', game_id, '\' has been inserted.'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_map` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_map`(IN map_name char(50))
BEGIN
  INSERT INTO map (name) VALUES (map_name);
  CALL `log`('INSERT', CONCAT('Map with name \'', map_name, '\' (id: ', LAST_INSERT_ID(), ') has been inserted.'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_map_to_league` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_map_to_league`(IN map_id_ INTEGER UNSIGNED,
                                             IN league_id INTEGER UNSIGNED)
BEGIN
  INSERT INTO map_in_league (map_id, l_id) VALUES (map_id_, league_id);
  CALL `log`('INSERT', CONCAT('Map with id \'', map_id, 'has been inserted into league with id: \'', league_id, '\'.'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_match` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_match`(IN div_id INT UNSIGNED,
                                                            IN teams_id_1 INT UNSIGNED,
                                                            IN teams_id_2 INT UNSIGNED,
                                                            IN div_matchday INT UNSIGNED,
                                                            IN start_date char(10),
                                                            IN schedule varchar(2))
BEGIN
  DECLARE match_id INTEGER UNSIGNED DEFAULT 0;

  SET start_date = ADDDATE(start_date, schedule * (div_matchday - 1));

  INSERT INTO `match` (d_id, t_id_1, t_id_2, `status`, winner_t_id, description_1, description_2, matchday, `date`) VALUES (
  div_id,
  teams_id_1,
  teams_id_2,
  0,
  0,
  '',
  '',
  div_matchday,
  start_date);

  SET match_id = LAST_INSERT_ID();

  CALL `log`('INSERT', CONCAT('Match (id: ', match_id, ') of division with id \'', div_id, '\' and matchday ', div_matchday, ' has been inserted.'));

  INSERT INTO map_result (map_id, m_id, result_1, result_2, `status`, map_owner_id) VALUES (
  0,
  match_id,
  0,
  0,
  0,
  1);

  INSERT INTO map_result (map_id, m_id, result_1, result_2, `status`, map_owner_id) VALUES (
  0,
  match_id,
  0,
  0,
  0,
  2);



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_match_media` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_match_media`(IN match_id INTEGER UNSIGNED,
                                           IN user_id INTEGER UNSIGNED,
                                           IN description char(50),
                                           IN file_name char(30),
                                           IN file_size INTEGER UNSIGNED)
BEGIN
  INSERT INTO match_media (m_id, u_id, name, description, size, `date`) VALUES (
    match_id,
    user_id,
    file_name,
    description,
    file_size,
    NOW());

  CALL `log`('INSERT', CONCAT('Match media for match with id \'', match_id, '\' was inserted by user with id \'', user_id, '\'.'));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_season_with_divisions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_season_with_divisions`(IN league_id INT UNSIGNED,
                                                                            IN season_name char(100),
                                                                            IN season_schedule TINYINT UNSIGNED,
                                                                            IN div_nums varchar(255))
BEGIN
  DECLARE season_number INT UNSIGNED DEFAULT 0;
  DECLARE season_id INT UNSIGNED DEFAULT 0;
  DECLARE div_num VARCHAR(4) DEFAULT 1;
  DECLARE i INT UNSIGNED DEFAULT 1;

  SELECT (count(number) + 1)
  INTO season_number
  FROM season
  WHERE l_id = league_id;

  
  INSERT INTO season (l_id, name, schedule, number) VALUES (
    league_id,
    season_name,
    season_schedule,
    season_number);

  CALL `log`('INSERT', CONCAT('Season \'', season_name, '\' (id: ', LAST_INSERT_ID(), ') was inserted in league with id:', league_id, '.'));
  SET season_id = LAST_INSERT_ID();

  
  div_loop:
  LOOP
    SET div_num = split(div_nums, ',', i);
    IF div_num = '' THEN
      lEAVE div_loop;
    END IF;
    INSERT INTO division(se_id, number) VALUES (
      season_id,
      div_num);
    SET i = i + 1;
    CALL `log`('INSERT', CONCAT('Division number \'', div_num, '\' (id: ', LAST_INSERT_ID(), ') was inserted in season \'', season_name, '\'.'));
  END LOOP div_loop;



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_settlement_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_settlement_log`(IN match_id INTEGER UNSIGNED, IN log_message char(255))
BEGIN
  INSERT INTO match_settlement_log (message, m_id, `date`) VALUES (
  log_message,
  match_id,
  NOW());

  CALL `log`('INSERT', CONCAT('Match settlement log for match with id \'', match_id, ' \' has been inserted.'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_team`(IN team_name char(50), IN join_pw char(50), IN user_id INT)
BEGIN

	declare team_id int default 0;

  INSERT into team (name, join_password, date) values (
    team_name,
    join_pw,
    NOW());

  CALL `log`('INSERT', CONCAT('Team with name \'', team_name, '\' (with id: ', LAST_INSERT_ID(), ') has been inserted.'));

  set team_id = LAST_INSERT_ID();

  
  INSERT into user_in_team (u_id, t_id, admin_permission, write_permission, tst_id) values (
    user_id,
    team_id,
    1,
    1,
    4);

  CALL `log`('INSERT', CONCAT('User with id \'', u_id, '\' has been granted full admin right for team with id: \'', team_id, '\' as he just created the team.'));

  SELECT team_id as t_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_teams_div` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_teams_div`(IN div_id INT UNSIGNED,
                                         IN team_ids varchar(255))
BEGIN
  DECLARE team_id INT UNSIGNED DEFAULT 0;
  DECLARE i INT UNSIGNED DEFAULT 1;

  id_loop:
  LOOP
    SET team_id = split(team_ids, ',', i);
    IF team_id = '' THEN
      lEAVE id_loop;
    END IF;
    INSERT into team_in_division (t_id, d_id) VALUES (
      team_id,
      div_id);
    SET i = i + 1;
  CALL `log`('INSERT', CONCAT('Team with team ID \'', team_id, '\' (with id: ', LAST_INSERT_ID(), ') inserted in division with ID \'', div_id));
  END LOOP id_loop;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_user`(IN user_last_name char(50),
                                    IN user_first_name char(50),
                                    IN user_login char(50),
                                    IN user_nation char(50),
                                    IN user_email char(100),
                                    IN user_password_hash char(32))
BEGIN
  INSERT INTO user (last_name, first_name, login, nick,  nation, email, password_hash, unlocked, date) values (
    user_last_name,
    user_first_name,
    user_login,
    user_login,
    user_nation,
    user_email,
    user_password_hash,
    0,
    NOW());

  CALL `log`('INSERT', CONCAT('New User \'', user_login, '\' (with id: ', LAST_INSERT_ID(), ') with last name \'', user_last_name, '\' with first name \'', user_first_name, '\' has been inserted.'));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_user_guid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `add_user_guid`(IN user_id INT UNSIGNED, IN guid_id INT UNSIGNED, IN the_guid CHAR(100))
BEGIN
  INSERT INTO guid_per_user (u_id, gu_id, guid, `date`) VALUES (
  user_id,
  guid_id,
  the_guid,
  NOW());

  CALL `log`('INSERT', CONCAT('New Guid \'', the_guid, '\' (type id: ', guid_id, ') for user with id \'', user_id, '\' has been inserted.'));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `confirm_match_result` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `confirm_match_result`(IN match_id INTEGER UNSIGNED)
BEGIN
  UPDATE `match`
  SET `status` = 2
  WHERE m_id = match_id;

  CALL `log`('UPDATE', CONCAT('Match result for match with id \'', match_id, '\' has been confirmed.'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_signed_up_teams` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `delete_signed_up_teams`(IN league_id INT UNSIGNED)
BEGIN
  DELETE FROM team_signed_up
  WHERE l_id = league_id;
  CALL `log`('DELETE', CONCAT('All signed up teams have been deleted from the League with ID \'', league_id, '\'.'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `edit_game`(IN game_name char(50), IN game_description text, IN guid_id INT, IN game_id INT)
BEGIN
  UPDATE game
  SET name = game_name,
      description = game_description,
      gu_id = guid_id
  WHERE g_id = game_id;

  CALL `log`('UPDATE', CONCAT('Game \'', game_name, '\' (with ID: \'', game_id, '\') has been updated.'));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_guid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `edit_guid`(IN guid_name char(20), IN guid_id INT)
BEGIN
  UPDATE guid
  SET name = guid_name
  WHERE gu_id = guid_id;

  CALL `log`('UPDATE', CONCAT('Guid \'', guid_name, '\' (with ID: \'', guid_id, '\') has been updated.'));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_league` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `edit_league`(IN league_id INT UNSIGNED,
                                       IN game_id INT UNSIGNED,
                                       IN league_name CHAR(100),
                                       IN league_desc TEXT,
                                       IN league_map_count TINYINT UNSIGNED,
                                       IN league_max_teams SMALLINT UNSIGNED,
                                       IN league_min_players TINYINT UNSIGNED,
                                       IN league_sign_up TINYINT)
BEGIN
  UPDATE league
  SET g_id = game_id,
      name = league_name,
      description = league_desc,
      map_count = league_map_count,
      max_teams_div = league_max_teams,
      min_players_team = league_min_players,
      in_sign_up = league_sign_up
  WHERE l_id = league_id;

  CALL `log`('UPDATE', CONCAT('League \'', league_name, '\' (with ID: \'', league_id, '\') has been updated.'));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_match_result` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `edit_match_result`(IN match_id INTEGER UNSIGNED,
                                             IN result_1_1 INTEGER UNSIGNED,
                                             IN result_1_2 INTEGER UNSIGNED,
                                             IN result_2_1 INTEGER UNSIGNED,
                                             IN result_2_2 INTEGER UNSIGNED)
BEGIN
  UPDATE map_result
  SET result_1 = result_1_1,
      result_2 = result_1_2
  WHERE m_id = match_id AND map_owner_nr = 1;

  UPDATE map_result
  SET result_1 = result_2_1,
      result_2 = result_2_2
  WHERE m_id = match_id AND map_owner_nr = 2;

  UPDATE `match`
  SET `status` = 1
  WHERE m_id = match_id;

  CALL `log`('UPDATE', CONCAT('Match results for match with id \'', match_id, '\') have been updated. Match status updated to \'1\''));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_match_settlement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `edit_match_settlement`(IN match_id INTEGER UNSIGNED,
                                                 IN match_map_id_1 INTEGER UNSIGNED,
                                                 IN match_map_id_2 INTEGER UNSIGNED,
                                                 IN match_date char(30))
BEGIN
  UPDATE map_result
  SET map_id = match_map_id_1
  WHERE m_id = match_id AND map_owner_nr = 1;

  UPDATE map_result
  SET map_id = match_map_id_2
  WHERE m_id = match_id AND map_owner_nr = 2;

  UPDATE `match`
  SET `date` = match_date
  WHERE m_id = match_id;

  CALL `log`('UPDATE', CONCAT('Match settlement for match with id: \'', match_id, '\') has been updated.'));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `edit_team`(IN team_name char(50), IN team_sh char(20), IN team_desc text, IN team_j_pw char(50), IN team_id INT)
BEGIN
  UPDATE team
  SET name = team_name,
      shorthandle = team_sh,
      description = team_desc,
      join_password = team_j_pw
  WHERE t_id = team_id;

  CALL `log`('UPDATE', CONCAT('Team \'', team_name, '\' (with id: \'', team_id, '\') has been updated.'));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_user_in_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `edit_user_in_team`(IN user_tst INT, IN user_admin TINYINT, IN user_write TINYINT, IN user_id INT, IN team_id INT)
BEGIN
  UPDATE user_in_team
  SET tst_id = user_tst,
      admin_permission = user_admin ,
      write_permission = user_write
  WHERE u_id = user_id AND t_id = team_id;

  CALL `log`('UPDATE', CONCAT('user-in-team status for user with id \'', user_id, '\' in team with id \'', team_id, '\' has been updated.'));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_user_profile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `edit_user_profile`(IN user_last char(50),
                                             IN user_first char(50),
                                             IN user_nick char(50),
                                             IN user_desc text,
                                             IN user_nation char(50),
                                             IN user_id INT UNSIGNED)
BEGIN
  IF user_nation = 'dont_change_nation' THEN
    UPDATE `user`
    SET last_name = user_last,
      first_name = user_first,
      nick = user_nick,
      description = user_desc
    WHERE u_id = user_id;
  ELSE
    UPDATE `user`
    SET last_name = user_last,
      first_name = user_first,
      nick = user_nick,
      description = user_desc,
      nation = user_nation
    WHERE u_id = user_id;
  END IF;

  CALL `log`('UPDATE', CONCAT('User Profile for user with id: \'', user_id, '\') has been updated.'));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_admin_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_admin_id`(IN user_id INT)
BEGIN
	SELECT a_id as admin_id
	FROM admin
	WHERE u_id = user_id;

  CALL `log`('SELECT', CONCAT('Admin information about user with ID: \'', user_id, '\') has been selected.'));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_division_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_division_info`(IN div_id INT UNSIGNED)
BEGIN
  SELECT s.name as season_name, d.number
  FROM division as d
  JOIN season as s
  ON s.se_id = d.se_id AND d.d_id = div_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_division_last_matches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_division_last_matches`(IN div_id INTEGER UNSIGNED)
BEGIN
  SELECT m.`date`,
         m.m_id as match_id,
         t1.t_id as team_id_1,
         t2.t_id as team_id_2,
         t1.name as team_1_name,
         t2.name as team_2_name,
         sum(mr.result_1) as team_1_result,
         sum(mr.result_2) as team_2_result
  FROM `match` as m
  JOIN division as d
  JOIN team as t1
  JOIN team as t2
  JOIN map_result as mr
    ON m.d_id = d.d_id
    AND d.d_id = div_id
    AND t1.t_id = m.t_id_1
    AND t2.t_id = m.t_id_2
    AND mr.m_id = m.m_id
    AND m.`status` = 2
  GROUP BY m.m_id
  ORDER BY `date` DESC
  LIMIT 0, 10;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_division_upcomming_matches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_division_upcomming_matches`(IN div_id INTEGER UNSIGNED)
BEGIN
  SELECT m.`date`,
         m.m_id as match_id,
         t1.t_id as team_id_1,
         t2.t_id as team_id_2,
         t1.name as team_1_name,
         t2.name as team_2_name
  FROM `match` as m
  JOIN division as d
  JOIN team as t1
  JOIN team as t2
    ON m.d_id = d.d_id
    AND d.d_id = div_id
    AND t1.t_id = m.t_id_1
    AND t2.t_id = m.t_id_2
    AND m.`status` < 2
  GROUP BY m.m_id
  ORDER BY `date` ASC
  LIMIT 0, 10;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_div_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_div_id`(IN league_id INT UNSIGNED,
                                      IN div_num INT UNSIGNED)
BEGIN
  SELECT d.d_id as division_id
  FROM division as d
  JOIN season as s
  JOIN league as l
  ON d.number = div_num
    AND d.se_id = s.se_id
    AND s.l_id = l.l_id
    AND l.l_id = league_id
    AND s.number = (SELECT max(number) FROM season WHERE season.l_id = league_id);

  CALL `log`('SELECT', CONCAT('Information about division from league with ID: \'', league_id, '\') has been selected.'));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_div_teams` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_div_teams`(IN div_id INT UNSIGNED)
BEGIN
  SELECT t_id as team_id
  FROM team_in_division
  WHERE d_id = div_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_games` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_games`()
BEGIN
	SELECT g_id as game_id, name
	FROM game;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_game_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_game_info`(IN game_id INT)
BEGIN
	SELECT game.name,
         game.g_id as game_id,
         game.description,
         game.gu_id as guid_id,
         guid.name as guid_name
	FROM game
  INNER JOIN guid
  ON game.gu_id = guid.gu_id AND game.g_id = game_id;	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_game_leagues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_game_leagues`(IN game_id INT)
BEGIN
	SELECT name, l_id as league_id
	FROM league
	WHERE g_id = game_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_guids` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_guids`()
BEGIN
	SELECT gu_id as guid_id, name
  FROM guid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_guid_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_guid_info`(IN guid_id INT)
BEGIN
	SELECT gu_id as guid_id, name
	FROM guid
	WHERE gu_id = guid_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_head_admin_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_head_admin_id`(IN user_id INT)
BEGIN
	SELECT ha_id as head_admin_id
	FROM head_admin
	WHERE u_id = user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_league_id_from_match` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_league_id_from_match`(IN match_id INTEGER UNSIGNED)
BEGIN
  SELECT l.l_id as league_id
  FROM `match` as m
  JOIN division as d
  JOIN season as s
  JOIN league as l
    ON m.m_id = match_id
    AND m.d_id = d.d_id
    AND d.se_id = s.se_id
    AND s.l_id = l.l_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_league_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_league_info`(IN league_id INT)
BEGIN
	SELECT l.name,
         l.description,
         l.map_count,
         l.in_sign_up,
         l.max_teams_div,
         l.min_players_team,
         l.l_id as league_id,
         g.name as game_name,
         l.g_id as game_id 
  FROM league as l
  JOIN game as g
  ON g.g_id = l.g_id AND l_id = league_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_league_maps` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_league_maps`(IN league_id INTEGER UNSIGNED)
BEGIN
  SELECT m.name as map_name, m.map_id
  FROM league as l
  JOIN map_in_league as mil
  JOIN map as m
    ON m.map_id = mil.map_id
    AND mil.l_id = l.l_id
    AND l.l_id = league_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_league_news` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_league_news`(IN league_id INT)
BEGIN
	SELECT n_id as news_id, `text`, title, u_id as creater
  FROM news
  WHERE l_id = league_id
  ORDER BY date DESC
  limit 0, 5;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_league_seasons` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_league_seasons`(IN league_id INT)
BEGIN
	SELECT se_id as season_id, number
  FROM season
  WHERE l_id = league_id
  ORDER BY number DESC;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_login_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_login_email`(IN user_login char(50), IN user_email char(100))
BEGIN
  SELECT login, email
  FROM user
  WHERE login = user_login
  OR email = user_email;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_maps` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_maps`()
BEGIN
  SELECT map_id, name as map_name
  FROM map;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_map_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_map_name`(IN passed_map_id INTEGER UNSIGNED)
BEGIN
  SELECT name
  FROM map
  WHERE map_id = passed_map_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_match_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_match_info`(IN match_id INTEGER UNSIGNED)
BEGIN
  
  SELECT m.m_id   as match_id, 
         m.t_id_1 as team_id_1,
         m.t_id_2 as team_id_2,
         m.`status`,
         m.winner_t_id as winner_team_id,
         m.`date`,
         t1.name  as team_name_1,
         t2.name  as team_name_2,
         d.d_id   as division_id,
         d.number as division_number,
         s.se_id  as season_id,
         s.name   as season_name,
         l.l_id   as league_id,
         l.name   as league_name,
         g.g_id   as game_id,
         g.name   as game_name
  FROM `match`    as m
  JOIN team       as t1
  JOIN team       as t2
  JOIN division   as d
  JOIN season     as s
  JOIN league     as l
  JOIN game       as g
    ON m.d_id = d.d_id
    AND d.se_id = s.se_id
    AND s.l_id = l.l_id
    AND l.g_id = g.g_id
    AND m.t_id_1 = t1.t_id
    AND m.t_id_2 = t2.t_id
    AND m.m_id = match_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_match_media` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_match_media`(IN match_id INTEGER UNSIGNED)
BEGIN
  SELECT mm.`date`,
         mm.size,
         mm.name as media_name,
         mm.description as media_description,
         u.u_id as user_id,
         u.nick as user_nick
  FROM match_media as mm
  JOIN `user` as u
    ON mm.m_id = match_id
    AND u.u_id = mm.u_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_match_results` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_match_results`(IN match_id INTEGER UNSIGNED)
BEGIN
  SELECT m.name as map_name, m.map_id, mr.result_1, mr.result_2
  FROM map_result as mr
  JOIN map as m
    ON mr.map_id = m.map_id
    AND mr.m_id = match_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_match_settlement_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_match_settlement_info`(IN match_id INTEGER UNSIGNED)
BEGIN
  DECLARE map_id_1 INTEGER UNSIGNED DEFAULT 0;
  DECLARE map_id_2 INTEGER UNSIGNED DEFAULT 0;
  DECLARE map_name_1 char(50) DEFAULT '';
  DECLARE map_name_2 char(50) DEFAULT '';
  DECLARE date_tmp DATETIME;

  SELECT map_id INTO map_id_1
  FROM map_result
  WHERE m_id = match_id AND map_owner_nr = 1;

  SELECT name INTO map_name_1
  FROM map
  WHERE map_id = map_id_1;

  SELECT map_id INTO map_id_2
  FROM map_result
  WHERE m_id = match_id AND map_owner_nr = 2;

  SELECT name INTO map_name_2
  FROM map
  WHERE map_id = map_id_2;

  SELECT `date` INTO date_tmp
  FROM `match`
  WHERE m_id = match_id;

  SELECT match_id, map_id_1, map_id_2, map_name_1, map_name_2, date_tmp as `date`;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_match_settlement_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_match_settlement_log`(IN match_id INTEGER UNSIGNED)
BEGIN
  SELECT message, m_id as match_id, `date`
  FROM match_settlement_log
  WHERE m_id = match_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_match_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_match_status`(IN match_id INTEGER UNSIGNED)
BEGIN
  SELECT `status`
  FROM `match`
  WHERE m_id = match_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_match_teams` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_match_teams`(IN match_id INTEGER UNSIGNED)
BEGIN
  SELECT t_id_1 as team_id_1, t_id_2 as team_id_2
  FROM `match`
  WHERE m_id = match_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_news` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_news`()
BEGIN
	SELECT news.title,
         news.text,
         user.nick as creater,
         news.date,
         news.l_id as league_id 
  FROM news
  INNER JOIN user
  ON user.u_id = news.u_id AND news.league_news = 0
  ORDER BY date DESC
  limit 0, 5;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_players_valid_ids` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_players_valid_ids`(IN team_id INT UNSIGNED, IN league_id INT UNSIGNED)
BEGIN
  DECLARE player_count INT UNSIGNED default 0;
  DECLARE min_count INT UNSIGNED default 0;

  SELECT count(uit_id) INTO player_count
  FROM user_in_team as u
  JOIN guid_per_user  as g
  JOIN league as l
  JOIN game as ga
  ON l.l_id = league_id
  AND ga.g_id = l.g_id
  AND u.t_id = team_id
  AND u.u_id = g.u_id
  AND g.gu_id = ga.gu_id
  AND u.tst_id != 5;

  SELECT min_players_team INTO min_count
  FROM league
  WHERE l_id = league_id;

  SELECT player_count, min_count;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_season_divisions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_season_divisions`(IN season_id INT)
BEGIN
	SELECT d_id as division_id, number
	FROM division
	WHERE se_id = season_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_season_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_season_info`(IN season_id INT)
BEGIN
	SELECT s.name as name,
         s.se_id as season_id,
         s.number,
         l.name as league_name,
         l.l_id as league_id
	FROM season as s
	JOIN league as l
	ON s.l_id = l.l_id AND s.se_id = season_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_stats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_stats`(IN team_id INT UNSIGNED,
                                                            IN div_id INT UNSIGNED,
                                                            OUT wins INT UNSIGNED,
                                                            OUT draws INT UNSIGNED,
                                                            OUT losses INT UNSIGNED)
BEGIN
  SELECT count(m_id)
  INTO wins
  FROM `match`
  WHERE winner_t_id = team_id AND d_id = div_id AND `status` = 1;

  SELECT count(m_id)
  INTO draws
  FROM `match`
  WHERE (t_id_1 = team_id OR t_id_2 = team_id) AND winner_t_id = 0 AND d_id = div_id AND `status` = 1;

  SELECT count(m_id)
  INTO losses
  FROM `match`
  WHERE (t_id_1 = team_id OR t_id_2 = team_id) AND winner_t_id != team_id AND winner_t_id > 0 AND d_id = div_id AND `status` = 1;



  

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_stats_team_div` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_stats_team_div`(IN team_id INT UNSIGNED,
                                              IN div_id INT UNSIGNED,
                                              IN points_win TINYINT,
                                              IN points_draw TINYINT,
                                              IN points_loss TINYINT)
BEGIN
  DECLARE team_name CHAR(50) DEFAULT 0;

  DECLARE wins INT UNSIGNED DEFAULT 0;
  DECLARE draws INT UNSIGNED DEFAULT 0;
  DECLARE losses INT UNSIGNED DEFAULT 0;
  DECLARE match_count INT UNSIGNED DEFAULT 0;

  DECLARE balance_pos INT UNSIGNED DEFAULT 0;
  DECLARE balance_pos_tmp INT UNSIGNED DEFAULT 0;
  DECLARE balance_neg INT UNSIGNED DEFAULT 0;
  DECLARE balance_neg_tmp INT UNSIGNED DEFAULT 0;

  DECLARE points INT UNSIGNED DEFAULT 0;

  
  SELECT name INTO team_name FROM team WHERE t_id = team_id;

  
  CALL get_stats(team_id, div_id, wins, draws, losses);
  SET match_count = wins + draws + losses;

  
  SET points = points_win * wins + points_draw * draws + points_loss * losses;

  
  SELECT sum(mr.result_1)
  INTO balance_pos
  FROM map_result as mr
  JOIN `match` as m
  ON mr.m_id = m.m_id AND m.t_id_1 = team_id;

  SELECT sum(mr.result_2)
  INTO balance_pos_tmp
  FROM map_result as mr
  JOIN `match` as m
  ON mr.m_id = m.m_id AND m.t_id_2 = team_id;

  SET balance_pos = balance_pos + balance_pos_tmp;

  
  SELECT sum(mr.result_2)
  INTO balance_neg
  FROM map_result as mr
  JOIN `match` as m
  ON mr.m_id = m.m_id AND m.t_id_1 = team_id;

  SELECT sum(mr.result_1)
  INTO balance_neg_tmp
  FROM map_result as mr
  JOIN `match` as m
  ON mr.m_id = m.m_id AND m.t_id_2 = team_id;

  SET balance_neg = balance_neg + balance_neg_tmp;

  
  SELECT team_id, team_name as name, match_count, wins, draws, losses, balance_pos, balance_neg, points;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_teams_league_signup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_teams_league_signup`(IN league_id INT UNSIGNED)
BEGIN
  SELECT t.name, t.t_id as team_id
  FROM team as t
  JOIN team_signed_up as tsi
  WHERE t.t_id = tsi.t_id AND tsi.l_id = league_id
  ORDER BY name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_teams_season` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_teams_season`(IN league_id INT UNSIGNED)
BEGIN
  SELECT t.name,
         t.t_id as team_id,
         d.d_id as division_id,
         d.number as div_number
  FROM team_in_division as tid
  JOIN team as t
  JOIN division as d
  JOIN season as s
  JOIN league as l
    ON tid.t_id = t.t_id
    AND tid.d_id = d.d_id
    AND d.se_id = s.se_id
    AND s.l_id = l.l_id
    AND l.l_id = league_id
    AND s.number = (SELECT max(s.number) FROM season as s WHERE s.l_id = league_id)
  ORDER BY d.number, t.name;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_team_divisions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_team_divisions`(IN div_id INTEGER UNSIGNED)
BEGIN
  SELECT d.d_id as division_id,
         d.number as division_number,
         s.se_id as season_id,
         s.name as season_name,
         g.g_id as game_id,
         g.name as game_name
  FROM team_in_division as tid
  JOIN division as d
  JOIN season as s
  JOIN league as l
  JOIN game as g
    ON tid.d_id = d.d_id
    AND d.se_id = s.se_id
    AND s.l_id = l.l_id
    AND l.g_id = g.g_id
    AND d.d_id = div_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_team_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_team_info`(IN team_id INT)
BEGIN
	SELECT team.name,
         team.shorthandle,
         team.description,
         team.date,
         team.join_password,
         team.t_id as team_id 
  FROM team
  WHERE t_id = team_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_team_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_team_name`(IN team_id INTEGER UNSIGNED)
BEGIN
  SELECT name
  FROM team
  WHERE t_id = team_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_team_perm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_team_perm`(IN team_id INT, IN user_id INT)
BEGIN
	SELECT admin_permission, write_permission
  FROM user_in_team
  WHERE t_id = team_id
  AND u_id = user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_team_players` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_team_players`(IN team_id INT)
BEGIN
	SELECT user.nick,
         user.u_id as user_id,
         user_in_team.admin_permission,
         user_in_team.write_permission,
         user_in_team.tst_id as team_status_type_id,
         team_status_type.status_name
	FROM user
	INNER JOIN user_in_team
	INNER JOIN team_status_type
	ON user.u_id = user_in_team.u_id
	AND user_in_team.t_id = team_id
	AND user_in_team.tst_id = team_status_type.tst_id
	ORDER BY user_in_team.tst_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_team_short_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_team_short_info`(IN team_id INT)
BEGIN
	SELECT team.name, team.t_id as team_id
	FROM team
	WHERE t_id = team_id;	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_team_status_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_team_status_types`()
BEGIN
	SELECT status_name, tst_id as team_status_type_id
  FROM team_status_type;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_guids` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_user_guids`(IN user_id INT UNSIGNED)
BEGIN
  SELECT gpu.guid,
         g.name,
         g.gu_id as guid_id,
         gpu.`date`
  FROM guid as g
  JOIN guid_per_user as gpu
  ON gpu.gu_id = g.gu_id AND gpu.u_id = user_id
  ORDER BY `date` DESC;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_id_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_user_id_login`(IN user_login char(100), IN pwhash char(32))
BEGIN
	SELECT u_id as user_id
  FROM user
  WHERE (login = user_login AND password_hash = pwhash)
  OR (email = user_login AND password_hash = pwhash);		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_user_info`(IN user_id INT)
BEGIN
	SELECT last_name,
         first_name,
         nick,
         description,
         date,
         nation,
         u_id as user_id,
         login
	FROM user
	WHERE u_id = user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_nick` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_user_nick`(IN user_id INTEGER UNSIGNED)
BEGIN
  SELECT nick
  FROM `user`
  WHERE u_id = user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_short_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_user_short_info`(IN user_id INT)
BEGIN
	SELECT nick, u_id as user_id
	FROM user
	WHERE u_id = user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_teams` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_user_teams`(IN user_id INT)
BEGIN
	SELECT team.name, team.t_id as team_id
	FROM user_in_team
	INNER JOIN team
	ON user_in_team.t_id = team.t_id AND user_in_team.u_id = user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_visitor_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `get_visitor_info`(IN user_id INT)
BEGIN
	SELECT u_id as user_id,
         first_name,
         last_name,
         nation,
         nick,
         description,
         up_id as user_pic_id,
         `date`,
         password_hash,
         email,
         unlocked,
         login
	FROM user
	WHERE u_id = user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `join_league` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `join_league`(IN team_id INT UNSIGNED, IN league_id INT UNSIGNED)
BEGIN
  INSERT INTO team_signed_up(t_id, l_id) VALUES (
  team_id,
  league_id);

  CALL `log`('INSERT', CONCAT('Team with id \'', team_id, '\' joined league with id: \'', league_id, '\'.'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `join_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `join_team`(IN user_id INT UNSIGNED, IN team_id INT UNSIGNED, IN user_pw char(50))
BEGIN

  DECLARE real_pw CHAR(50) DEFAULT 0;

  SELECT team.join_password
  INTO real_pw
  FROM team
  WHERE t_id = team_id;

  IF real_pw = user_pw THEN
    INSERT INTO user_in_team (u_id, t_id, tst_id) VALUES (user_id,
                                                          team_id,
                                                          4);
    CALL `log`('INSERT', CONCAT('User with id \'', user_id, '\' joined team with id: \'', team_id, '\'.'));
  END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `log`(IN log_method char(6), IN log_message varchar(255))
BEGIN
  INSERT INTO logging (`date`, method, message) VALUES (
  NOW(),
  log_method,
  log_message);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`paul_dbo`@`%`*/ /*!50003 PROCEDURE `test`()
BEGIN
  declare str char(100) default '1,2,3,4';
  declare str_1 char(10) default '';

  set str_1 = split(str, ',', 1);
  set str_1 = split(str, ',', 2);
  set str_1 = split(str, ',', 3);
  set str_1 = split(str, ',', 4);
  select str;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-08-15  2:49:42
