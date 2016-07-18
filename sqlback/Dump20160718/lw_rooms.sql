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
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `roomid` varchar(45) NOT NULL,
  `ownerId` varchar(45) NOT NULL,
  `roomName` varchar(45) DEFAULT 'New Room',
  `wCoin` int(11) DEFAULT '0',
  `roomPwd` varchar(45) DEFAULT NULL,
  `chatroomId` varchar(45) DEFAULT NULL,
  `playMode` int(11) DEFAULT '0',
  `videoPlayNow` varchar(45) DEFAULT NULL,
  `videoWhereNow` varchar(45) DEFAULT NULL,
  `roomType` int(11) DEFAULT '0',
  `action` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `currentTime` varchar(45) DEFAULT NULL,
  `videoId` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES ('R16060042','M1111178','Pokemon',0,'Abcd1234',NULL,0,NULL,NULL,1,'play','play','455.680029','5zB-IIRKfdU','1468467813456'),('R16070007','M00000019','天價房',99999,'',NULL,0,NULL,NULL,0,'play','play','0','dnJdFLRQgvk','1468811168374'),('R16070009','M16070029','數碼寶貝',1000,'',NULL,0,NULL,NULL,0,'play','play','0','0DgSQxitdx8','1468810860171'),('R16070011','M1111178','PingYiCome',0,'',NULL,0,NULL,NULL,0,'stop','play','81.634586','NH43WjeoVgs','1468551498776'),('R16070012','M16070033','PingYi',0,'',NULL,0,NULL,NULL,0,'stop','play','62.86485400000001','_VxLOj3TB5k','1468552940887'),('R16070013','M16070039','Hello',0,'',NULL,0,NULL,NULL,0,'play','search','76.48636402000001','w7ZccglSfu4','1468805864010'),('R16070014','M16070039','Another room',0,'',NULL,0,NULL,NULL,0,'play','search','33.22775481','w7ZccglSfu4','1468806310296'),('R16070015','M16070040','ok',0,'',NULL,0,NULL,NULL,0,'stop','search','5.615938080108642','w7ZccglSfu4','1468809901413'),('R16070016','M16070041','Music 聽歌',0,'',NULL,0,NULL,NULL,0,'play','play','0','32FB-gYr49Y','1468810243679'),('R16070017','M16070041','音樂',0,'',NULL,0,NULL,NULL,0,'stop','play','130.74625194659424','KQ6zr6kCPj8','1468810821689');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-18 11:50:12
