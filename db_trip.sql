-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: localhost    Database: trip
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `cocomp`
--

DROP TABLE IF EXISTS `cocomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cocomp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compname` varchar(20) NOT NULL,
  `compwebname` varchar(20) DEFAULT NULL,
  `compur` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `compname` (`compname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cocomp`
--

LOCK TABLES `cocomp` WRITE;
/*!40000 ALTER TABLE `cocomp` DISABLE KEYS */;
INSERT INTO `cocomp` VALUES (1,'玩咖旅行社','旅遊咖','https://www.tripresso.com'),(2,'世興旅行社','新魅力旅遊','https://www.newamazing.com.tw'),(3,'亞森旅行社','澄果旅遊','http://www.orangetour.com.tw');
/*!40000 ALTER TABLE `cocomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newamazing`
--

DROP TABLE IF EXISTS `newamazing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newamazing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupcd` varchar(20) NOT NULL,
  `title` varchar(60) DEFAULT NULL,
  `days` char(3) DEFAULT NULL,
  `begindate` varchar(10) DEFAULT NULL,
  `sale` varchar(5) DEFAULT NULL,
  `totalsale` varchar(5) DEFAULT NULL,
  `price` varchar(7) DEFAULT NULL,
  `portnm` char(20) DEFAULT NULL,
  `url` varchar(120) DEFAULT NULL,
  `imgurl` varchar(120) DEFAULT NULL,
  `cocomp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupcd` (`grupcd`),
  KEY `fk_cocomp` (`cocomp_id`),
  CONSTRAINT `fk_cocomp` FOREIGN KEY (`cocomp_id`) REFERENCES `cocomp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newamazing`
--

LOCK TABLES `newamazing` WRITE;
/*!40000 ALTER TABLE `newamazing` DISABLE KEYS */;
INSERT INTO `newamazing` VALUES (1,'TYO05190319C','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/03/19','0','28','27900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190319C','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(2,'TYO05190323A','東京相模湖櫻花祭+富士山採果溫泉美食五日(國泰)','5','2019/03/23','8','19','34900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190319C','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006191.JPG',2),(3,'TYO05190324A','遇見日本-小東北鬼怒川那須高原五日(台中出發)','5','2019/03/24','27','28','35900','台中-清泉崗機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190323A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006505.JPG',2),(4,'TYO05190330A','東京相模湖櫻花祭+富士山採果溫泉美食五日(國泰)','5','2019/03/30','0','18','34900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190323A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006191.JPG',2),(5,'TYO05190404A','東京相模湖櫻花祭+富士山採果溫泉美食五日(國泰)','5','2019/04/04','17','20','39900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190324A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006191.JPG',2),(6,'TYO05190524B','東京海濱公園賞花+輕井澤溫泉五日(國泰)','5','2019/05/24','5','20','29900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190324A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00005231.JPG',2),(7,'TYO05190524A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/05/24','17','20','32900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190330A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(8,'TYO05190530B','東京海濱公園賞花+輕井澤溫泉五日(國泰)','5','2019/05/30','19','20','29900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190330A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00005231.JPG',2),(9,'TYO05190530A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/05/30','19','20','32900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190404A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(10,'TYO05190607B','東京海濱公園賞花+輕井澤溫泉五日(國泰)','5','2019/06/07','19','20','30900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190404A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00005231.JPG',2),(11,'TYO05190607A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/06/07','19','20','33900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190524B','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(12,'TYO05190613B','東京海濱公園賞花+輕井澤溫泉五日(國泰)','5','2019/06/13','19','20','29900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190524B','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00005231.JPG',2),(13,'TYO05190613A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/06/13','19','20','32900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190524A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(14,'TYO05190621B','東京海濱公園賞花+輕井澤溫泉五日(國泰)','5','2019/06/21','19','20','29900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190524A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00005231.JPG',2),(15,'TYO05190621A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/06/21','13','20','32900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190530B','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(16,'TYO05190627B','東京海濱公園賞花+輕井澤溫泉五日(國泰)','5','2019/06/27','19','20','29900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190530B','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00005231.JPG',2),(17,'TYO05190627A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/06/27','9','18','32900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190530A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(18,'TYO05190705A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/07/05','19','20','35900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190530A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(19,'TYO05190711A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/07/11','19','20','35900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190607B','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(20,'TYO05190719A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/07/19','19','20','35900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190607B','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(21,'TYO05190725A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/07/25','19','20','35900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190725A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(22,'TYO05190802A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/08/02','19','20','35900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190725A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(23,'TYO05190808A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/08/08','19','20','35900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190802A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(24,'TYO05190816A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/08/16','19','20','35900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190802A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(25,'TYO05190822A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/08/22','19','20','35900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190808A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(26,'TYO05190830A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/08/30','19','20','35900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190808A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(27,'TYO05190905B','東京海濱公園賞花+輕井澤溫泉五日(國泰)','5','2019/09/05','19','20','29900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190816A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00005231.JPG',2),(28,'TYO05190905A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/09/05','19','20','32900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190816A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2),(29,'TYO05190913B','東京海濱公園賞花+輕井澤溫泉五日(國泰)','5','2019/09/13','19','20','31900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupDetail.asp?prodCd=TYO05190822A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00005231.JPG',2),(30,'TYO05190913A','東京迪士尼+箱根+富士山溫泉休閒五日-國泰','5','2019/09/13','19','20','34900','台北-桃園機場','https://www.newamazing.com.tw/EW/GO/GroupOrder.asp?prodCd=TYO05190822A','https://www.newamazing.com.tw/eWeb_newamazing/IMGDB/000096/000099/00006555.JPG',2);
/*!40000 ALTER TABLE `newamazing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orangetour`
--

DROP TABLE IF EXISTS `orangetour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orangetour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupcd` varchar(20) NOT NULL,
  `title` varchar(60) DEFAULT NULL,
  `days` char(3) DEFAULT NULL,
  `begindate` varchar(10) DEFAULT NULL,
  `sale` varchar(5) DEFAULT NULL,
  `totalsale` varchar(5) DEFAULT NULL,
  `price` varchar(7) DEFAULT NULL,
  `portnm` char(20) DEFAULT NULL,
  `url` varchar(120) DEFAULT NULL,
  `imgurl` varchar(120) DEFAULT NULL,
  `cocomp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupcd` (`grupcd`),
  KEY `fk_cocompid` (`cocomp_id`),
  CONSTRAINT `fk_cocompid` FOREIGN KEY (`cocomp_id`) REFERENCES `cocomp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orangetour`
--

LOCK TABLES `orangetour` WRITE;
/*!40000 ALTER TABLE `orangetour` DISABLE KEYS */;
INSERT INTO `orangetour` VALUES (1,'NRTCX90328PA','【前16名收訂者優惠1千】【旗艦東瀛】東京浪漫櫻‧新宿御苑.千鳥淵.蘆之湖海盜船春風五日','5','2019/03/28','5','28','36900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupDetail.asp?prodCd=NRTCX90328PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(2,'NRTCX90330PA','【前16名收訂者優惠1千】【旗艦東瀛】東京浪漫櫻‧新宿御苑.千鳥淵.蘆之湖海盜船春風五日','5','2019/03/30','25','28','36900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupOrder.asp?prodCd=NRTCX90328PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(3,'NRTBR90419GB','【戀戀紫藤】日本觀藤花賞芝櫻繽紛歡樂五日遊','5','2019/04/19','27','28','39900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupDetail.asp?prodCd=NRTCX90330PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(4,'NRTBR90423PA','【旗艦東瀛】關東花花世界‧常陸海濱粉蝶花.足利花卉公園.市貝芝櫻春滿‧花香五日','5','2019/04/23','12','23','44900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupOrder.asp?prodCd=NRTCX90330PA&sacctNo=23420481','http://www.orangetour.com.twhttp://dcimg.travel.net.tw/23420481/IMGDB/000594/00008317.JPG',3),(5,'NRTCX90518PA','【前16名收訂者優惠1千】【旗艦東瀛】關東富士美‧米其林三星高尾山.三島大吊橋.忍野八海望富士山‧和風五日','5','2019/05/18','27','28','37900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupDetail.asp?prodCd=NRTBR90419GB&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(6,'NRTCX90601PA','【前16名收訂者優惠1千】【旗艦東瀛】關東富士美‧米其林三星高尾山.三島大吊橋.忍野八海望富士山‧和風五日','5','2019/06/01','27','28','37900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupOrder.asp?prodCd=NRTBR90419GB&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(7,'NRTCX90615PA','【前16名收訂者優惠1千】【旗艦東瀛】關東富士美‧米其林三星高尾山.三島大吊橋.忍野八海望富士山‧和風五日','5','2019/06/15','27','28','37900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupDetail.asp?prodCd=NRTBR90423PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(8,'NRTCX90626PA','【前16名收訂者優惠1千】【旗艦東瀛】關東富士美‧米其林三星高尾山.三島大吊橋.忍野八海望富士山‧和風五日','5','2019/06/26','27','28','37900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupOrder.asp?prodCd=NRTBR90423PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(9,'NRTCX90629PA','【前16名收訂者優惠1千】【旗艦東瀛】關東放暑假‧迪士尼.茨城江戶村.筑波山纜車.明太子工廠輕鬆一夏‧樂園玩味五日','5','2019/06/29','27','28','36900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupDetail.asp?prodCd=NRTCX90518PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(10,'NRTCX90629PB','【旗艦東瀛】關東伊豆溫泉‧日本第一三島大吊橋.米其林景點高尾山眺望富士山‧日式和風五日','5','2019/06/29','27','28','37900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupOrder.asp?prodCd=NRTCX90518PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(11,'NRTCX90710PA','【前16名收訂者優惠1千】【旗艦東瀛】關東放暑假‧迪士尼.茨城江戶村.筑波山纜車.明太子工廠輕鬆一夏‧樂園玩味五日','5','2019/07/10','27','28','36900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupDetail.asp?prodCd=NRTCX90601PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(12,'NRTCX90710PB','【旗艦東瀛】關東伊豆溫泉‧日本第一三島大吊橋.米其林景點高尾山眺望富士山‧日式和風五日','5','2019/07/10','27','28','37900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupOrder.asp?prodCd=NRTCX90601PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(13,'NRTCX90713PA','【前16名收訂者優惠1千】【旗艦東瀛】關東放暑假‧迪士尼.茨城江戶村.筑波山纜車.明太子工廠輕鬆一夏‧樂園玩味五日','5','2019/07/13','27','28','38900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupDetail.asp?prodCd=NRTCX90615PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(14,'NRTCX90713PB','【旗艦東瀛】關東伊豆溫泉‧日本第一三島大吊橋.米其林景點高尾山眺望富士山‧日式和風五日','5','2019/07/13','27','28','39900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupOrder.asp?prodCd=NRTCX90615PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(15,'NRTCX90724PA','【旗艦東瀛】關東伊豆溫泉‧日本第一三島大吊橋.米其林景點高尾山眺望富士山‧日式和風五日','5','2019/07/24','27','28','37900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupDetail.asp?prodCd=NRTCX90626PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(16,'NRTCX90727PA','【旗艦東瀛】關東伊豆溫泉‧日本第一三島大吊橋.米其林景點高尾山眺望富士山‧日式和風五日','5','2019/07/27','27','28','37900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupOrder.asp?prodCd=NRTCX90626PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(17,'NRTCX90807PA','【旗艦東瀛】關東伊豆溫泉‧日本第一三島大吊橋.米其林景點高尾山眺望富士山‧日式和風五日','5','2019/08/07','27','28','40900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupDetail.asp?prodCd=NRTCX90629PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(18,'NRTCX90810PA','【旗艦東瀛】關東伊豆溫泉‧日本第一三島大吊橋.米其林景點高尾山眺望富士山‧日式和風五日','5','2019/08/10','27','28','40900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupOrder.asp?prodCd=NRTCX90629PA&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(19,'NRTCX90821PA','【前16名收訂者優惠1千】【旗艦東瀛】關東放暑假‧迪士尼.茨城江戶村.筑波山纜車.明太子工廠輕鬆一夏‧樂園玩味五日','5','2019/08/21','27','28','36900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupDetail.asp?prodCd=NRTCX90629PB&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3),(20,'NRTCX90821PB','【旗艦東瀛】關東伊豆溫泉‧日本第一三島大吊橋.米其林景點高尾山眺望富士山‧日式和風五日','5','2019/08/21','27','28','37900','台北-桃園機場','http://www.orangetour.com.tw/EW/GO/GroupOrder.asp?prodCd=NRTCX90629PB&sacctNo=23420481','http://www.orangetour.com.tw/eweb_asiantour/images/default_demo.jpg',3);
/*!40000 ALTER TABLE `orangetour` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-13 12:48:26
