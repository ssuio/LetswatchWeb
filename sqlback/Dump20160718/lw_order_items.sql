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
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `product_id` varchar(45) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES ('1',100,1,1,1),('3',300,1,2,1),('5',1000,1,3,1),('1',100,4,4,2),('1',100,1,5,3),('2',200,4,6,3),('3',300,2,7,3),('4',500,6,8,3),('5',1000,8,9,3),('2',200,5,10,4),('3',300,6,11,4),('3',300,1,12,5),('1',100,3,13,6),('3',300,4,14,6),('4',500,3,15,6),('5',1000,2,16,6),('1',100,3,17,7),('2',200,4,18,7),('4',500,2,19,7),('5',1000,2,20,7),('1',100,4,21,8),('2',200,1,22,8),('3',300,1,23,8),('4',500,1,24,8),('5',1000,1,25,8),('1',100,1,26,9),('2',200,1,27,9),('3',300,1,28,9),('4',500,1,29,9),('5',1000,4,30,9),('1',100,1,31,10),('2',200,1,32,10),('3',300,1,33,10),('4',500,1,34,10),('5',1000,5,35,10),('1',100,1,36,11),('2',200,1,37,11),('3',300,1,38,11),('4',500,1,39,11),('5',1000,9,40,11),('2',200,6,41,12),('3',300,5,42,12),('4',500,1,43,12),('5',1000,6,44,12),('5',1000,100,45,13),('5',1000,100,46,14),('5',1000,10,47,15),('2',200,1,48,16),('3',300,1,49,16),('3',300,1,50,17),('5',1000,10,51,18),('5',1000,10,52,19),('5',1000,10,53,20),('4',500,1,54,21),('4',500,3,55,22),('5',1000,5,56,23),('5',1000,6,57,24),('5',1000,3,58,25),('5',1000,3,59,26),('5',1000,3,60,27),('5',1000,3,61,28),('5',1000,10,62,29);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-18 11:50:10
