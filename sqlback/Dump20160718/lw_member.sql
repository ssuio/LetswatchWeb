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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(45) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `wCoin` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `epaper` tinyint(4) DEFAULT NULL,
  `introduction` varchar(200) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `roomId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('M16070039','Bala','bala2@gmail.com','Abcd1234',NULL,35000,NULL,'\0',0,NULL,NULL,0,'R16070014'),('M16070040','bala4','bala4@gmail.com','Abcd1234',NULL,35000,NULL,'\0',0,NULL,NULL,0,'R16070015'),('M16070038','Bala','bala@gmail.com','Abcd1234',NULL,35000,NULL,'\0',0,NULL,NULL,0,NULL),('M16070032','ccc','ccc@gmail.com','Abcd1234',NULL,5000,NULL,'\0',0,NULL,NULL,0,NULL),('M16060020','dimon','dimonbeez@gmail.com','Abcd1234',NULL,5000,NULL,'\0',0,NULL,NULL,0,'R16060038'),('M1111178','Karl','karl@hotmail.com','Abcd1234','1996-06-13',197000,'0979111111','F',1,'GOGO',NULL,0,'R16070011'),('M16060022','Karl','karlkarl@gmail.com','Abcd1234',NULL,5000,NULL,'\0',0,NULL,NULL,0,NULL),('M16070033','Pika','Pika@gmail.com','Abcd1234','2006-07-18',4000,'0978654321','\0',1,'Hello',NULL,0,'R16070009'),('M16060021','Ping2','ping2@gmail.com','Abcd1234',NULL,5000,NULL,'\0',0,NULL,NULL,0,NULL),('M16070035','Sam2','sam2@gmail.com','Abcd1234',NULL,5000,NULL,'\0',0,NULL,NULL,0,NULL),('M16070036','Sam3','sam3@gmail.com','Abcd1234',NULL,5000,NULL,'\0',0,NULL,NULL,0,NULL),('M16070037','Sam4','sam4@gmail.com','Abcd1234',NULL,5000,NULL,'\0',0,NULL,NULL,0,NULL),('M16070034','Sam','sam@gmail.com','Abcd1234',NULL,5000,NULL,'\0',0,NULL,NULL,0,NULL),('M16070028','woo1','woo1@gmail.com','Abcd1234',NULL,4000,NULL,'\0',0,NULL,NULL,0,'R16070008'),('M16070029','woo2','woo2@gmail.com','Abcd1234',NULL,5001,NULL,'\0',0,NULL,NULL,0,'R16070009'),('M16070030','woo3','woo3@gmail.com','Abcd1234',NULL,5000,NULL,'\0',0,NULL,NULL,0,NULL),('M16070023','Wow','wooo@gmail.com','Abcd1234','1996-06-13',5000,'0979042171','M',0,'I am',NULL,0,'R16070007'),('M16070027','Woo','wow@gmail.com','Abcd1234','1996-06-13',5000,NULL,'\0',0,NULL,NULL,0,'R16060042'),('M00000019','Ssuio','xssuio@gmail.com','Abcd1234','2016-06-17',113900,'09790421712','F',0,'我是一隻',NULL,0,'R16060042'),('M00000002','Ssuio','xssuiox@gmail.com','Abcd1234',NULL,5000,NULL,'\0',0,NULL,NULL,0,'R16060028'),('M16060018','xxsss','xxsss@gmail.com','Abcd1234',NULL,5000,NULL,'\0',0,NULL,NULL,0,'R16060030'),('M16070031','pingyi','yeie@outlook.com','Abcd1234','2006-10-17',5000,'0987654321','F',1,'HW',NULL,0,'R16070012'),('M16070041','Yih','yih@gmail.com','Abcd1234',NULL,4001,NULL,'\0',0,NULL,NULL,0,'R16070007');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-18 11:50:08
