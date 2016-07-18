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
-- Table structure for table `r16070012playlist`
--

DROP TABLE IF EXISTS `r16070012playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r16070012playlist` (
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
-- Dumping data for table `r16070012playlist`
--

LOCK TABLES `r16070012playlist` WRITE;
/*!40000 ALTER TABLE `r16070012playlist` DISABLE KEYS */;
INSERT INTO `r16070012playlist` VALUES (1,'_VxLOj3TB5k','周杰倫Jay Chou X aMEI【不該 Shouldnt Be】Official MV',NULL,'https://i.ytimg.com/vi/_VxLOj3TB5k/default.jpg','1468552893087'),(2,'2kdYSeoHChg','周杰倫 Jay Chou【愛情廢柴 Failure at love】Official MV',NULL,'https://i.ytimg.com/vi/2kdYSeoHChg/default.jpg','1468552893087'),(3,'j6MeBrM_bBc','Best of Jay Chou Collection',NULL,'https://i.ytimg.com/vi/j6MeBrM_bBc/default.jpg','1468552893087'),(4,'j9k3liT2MLo','周杰倫 Jay Chou【前世情人 Lover From Previous Life】Official MV',NULL,'https://i.ytimg.com/vi/j9k3liT2MLo/default.jpg','1468552893087'),(5,'v489sYYjtHI','周杰倫 Jay Chou【算什麼男人 What Kind of Man】Official MV (ft 林依晨)',NULL,'https://i.ytimg.com/vi/v489sYYjtHI/default.jpg','1468552893087');
/*!40000 ALTER TABLE `r16070012playlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-18 11:50:09
