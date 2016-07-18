-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: lw
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `r16060042playlist`
--

DROP TABLE IF EXISTS `r16060042playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r16060042playlist` (
  `number` int(11) NOT NULL,
  `videoId` varchar(45) DEFAULT NULL,
  `videoTitle` varchar(100) DEFAULT NULL,
  `videoTime` varchar(45) DEFAULT NULL,
  `videoImg` varchar(100) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`number`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r16060042playlist`
--

LOCK TABLES `r16060042playlist` WRITE;
/*!40000 ALTER TABLE `r16060042playlist` DISABLE KEYS */;
INSERT INTO `r16060042playlist` VALUES (1,'ZtPPw9mpKGE','Pokemon GO | CLOSEST GYM BATTLE EVER?!',NULL,'https://i.ytimg.com/vi/ZtPPw9mpKGE/default.jpg','1468551105121'),(2,'mur6Ch3SBXY','美國人在台灣玩Pokemon Go?! (POKEMON GO IN TAIWAN?!)',NULL,'https://i.ytimg.com/vi/mur6Ch3SBXY/default.jpg','1468551105121'),(3,'6mHUK760Cl0','Pokemon GO | EPIC 6AM POKEMON ADVENTURE!!',NULL,'https://i.ytimg.com/vi/6mHUK760Cl0/default.jpg','1468551105121');
/*!40000 ALTER TABLE `r16060042playlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-18 11:50:11
