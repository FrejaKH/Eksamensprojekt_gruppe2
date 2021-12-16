-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: piefitdatabase
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `piefitdatabase`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `piefitdatabase` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;

USE `piefitdatabase`;

--
-- Table structure for table `amrap`
--

DROP TABLE IF EXISTS `amrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amrap` (
  `amrap_id` int(11) NOT NULL AUTO_INCREMENT,
  `time` time NOT NULL,
  `card_id` int(11) NOT NULL,
  PRIMARY KEY (`amrap_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `amrap_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `card` (`card_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amrap`
--

LOCK TABLES `amrap` WRITE;
/*!40000 ALTER TABLE `amrap` DISABLE KEYS */;
INSERT INTO `amrap` VALUES (1,'00:14:00',8),(2,'00:12:00',9),(3,'00:16:00',10),(4,'00:14:00',18),(5,'00:12:00',19),(6,'00:18:00',20),(7,'00:14:00',28),(8,'00:12:00',29),(9,'00:16:00',30),(10,'00:14:00',38),(11,'00:12:00',39),(12,'00:13:00',40);
/*!40000 ALTER TABLE `amrap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amrap_benchmark`
--

DROP TABLE IF EXISTS `amrap_benchmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amrap_benchmark` (
  `amrap_id` int(11) NOT NULL,
  `benchmark_id` int(11) NOT NULL,
  `rounds` int(11) NOT NULL,
  PRIMARY KEY (`amrap_id`,`benchmark_id`),
  KEY `benchmark_id` (`benchmark_id`),
  CONSTRAINT `amrap_benchmark_ibfk_1` FOREIGN KEY (`amrap_id`) REFERENCES `amrap` (`amrap_id`) ON DELETE CASCADE,
  CONSTRAINT `amrap_benchmark_ibfk_2` FOREIGN KEY (`benchmark_id`) REFERENCES `benchmark` (`benchmark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amrap_benchmark`
--

LOCK TABLES `amrap_benchmark` WRITE;
/*!40000 ALTER TABLE `amrap_benchmark` DISABLE KEYS */;
INSERT INTO `amrap_benchmark` VALUES (1,1,4),(1,2,5),(1,3,6),(1,4,8),(2,1,3),(2,2,4),(2,3,5),(2,4,6),(3,1,3),(3,2,4),(3,3,5),(3,4,6),(4,1,3),(4,2,5),(4,3,6),(4,4,7),(5,1,3),(5,2,4),(5,3,5),(5,4,6),(6,1,3),(6,2,4),(6,3,5),(6,4,6),(7,1,3),(7,2,5),(7,3,6),(7,4,7),(8,1,3),(8,2,4),(8,3,5),(8,4,6),(9,1,2),(9,2,3),(9,3,4),(9,4,5),(10,1,3),(10,2,5),(10,3,7),(10,4,9),(11,1,4),(11,2,5),(11,3,6),(11,4,7),(12,1,3),(12,2,5),(12,3,6),(12,4,7);
/*!40000 ALTER TABLE `amrap_benchmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amrap_exercise`
--

DROP TABLE IF EXISTS `amrap_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amrap_exercise` (
  `amrap_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `reps` int(11) NOT NULL,
  PRIMARY KEY (`amrap_id`,`exercise_id`),
  KEY `exercise_id` (`exercise_id`),
  CONSTRAINT `amrap_exercise_ibfk_1` FOREIGN KEY (`amrap_id`) REFERENCES `amrap` (`amrap_id`) ON DELETE CASCADE,
  CONSTRAINT `amrap_exercise_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amrap_exercise`
--

LOCK TABLES `amrap_exercise` WRITE;
/*!40000 ALTER TABLE `amrap_exercise` DISABLE KEYS */;
INSERT INTO `amrap_exercise` VALUES (1,7,20),(1,13,15),(1,47,10),(1,80,50),(2,19,30),(2,44,10),(2,74,10),(2,99,10),(3,13,12),(3,61,12),(3,63,16),(3,65,16),(3,77,16),(3,93,12),(4,11,10),(4,18,30),(4,36,10),(4,41,10),(5,17,10),(5,50,12),(5,58,10),(5,95,10),(6,9,10),(6,30,10),(6,33,10),(6,39,40),(6,56,10),(6,83,10),(7,6,15),(7,39,30),(7,63,20),(7,74,10),(8,7,15),(8,9,10),(8,46,10),(8,91,10),(9,6,10),(9,36,10),(9,38,10),(9,74,10),(9,88,10),(9,93,10),(10,1,12),(10,35,30),(10,48,12),(10,83,12),(11,38,8),(11,60,30),(11,85,10),(11,90,12),(12,13,12),(12,14,20),(12,54,12),(12,73,20),(12,77,20),(12,82,12);
/*!40000 ALTER TABLE `amrap_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benchmark`
--

DROP TABLE IF EXISTS `benchmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benchmark` (
  `benchmark_id` int(11) NOT NULL AUTO_INCREMENT,
  `level` enum('beginner','intermediate','advanced','elite') NOT NULL,
  PRIMARY KEY (`benchmark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benchmark`
--

LOCK TABLES `benchmark` WRITE;
/*!40000 ALTER TABLE `benchmark` DISABLE KEYS */;
INSERT INTO `benchmark` VALUES (1,'beginner'),(2,'intermediate'),(3,'advanced'),(4,'elite');
/*!40000 ALTER TABLE `benchmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boxcollection`
--

DROP TABLE IF EXISTS `boxcollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boxcollection` (
  `boxcollection_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(800) NOT NULL,
  `description_long` varchar(2000) NOT NULL,
  `releasedate` date NOT NULL,
  `price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`boxcollection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boxcollection`
--

LOCK TABLES `boxcollection` WRITE;
/*!40000 ALTER TABLE `boxcollection` DISABLE KEYS */;
INSERT INTO `boxcollection` VALUES (1,'PIEFITCARDS BOX - HOME EDITION V.1','Vores Home edition passer til begyndere og let øvet - men alle kan få gavn af træninger.','Med en Home edition får/kan du:\n\n40 stk. unikke, sjove kort, træn hele kroppen, uden udstyr, når som helst og hvor som helst\n\nForbrænde en masse kalorier og gå ned i vægt - Se forskellen i spejlet, på tøjet og dit syn på livet\n\nKomme i bedre form, mærk dit helbred og kondi blive bedre - aldrig har det været nemmere\n\nFå mere energi i hverdagen, bedre trivsel og øg din produktivitet - jobbet og dagens udfordinger bliver mere overskuelige\n\nPiefitCards box V.1 er træninger lige ved hånden - aldrig mere skal du være frustreret over at planlægge din træning. Træk et kort, træn og mærk forskellen på krop og sjæl\n\n10 fullbody, 10 uppebody, 10 lowerbody og 10 core træninger er inkluderet','2021-11-22',299.00),(2,'PIEFITCARDS BOX - HIIT EDITION V.1','Her skal der være en description','lang beskrivelse','2021-11-22',299.00),(3,'PIEFITCARDS BOX - POWER EDITION V.1','Her skal der være en description','lang beskrivelse','2021-11-22',299.00);
/*!40000 ALTER TABLE `boxcollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `difficulty` enum('1','2','3','4','5') NOT NULL,
  `video_url` varchar(100) NOT NULL,
  `type` varchar(45) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `name` (`name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'#PiefitWashingtonDC','1','https://piefitcards.dk/wp-content/uploads/2021/11/PiefitWashingtonDC.mov','workandrest',1),(2,'#PiefitSantiago','2','https://piefitcards.dk','workandrest',1),(3,'#PiefitPortofSpain','3','https://piefitcards.dk','workandrest',1),(4,'#PiefitParamaribo','4','https://piefitcards.dk','workandrest',1),(5,'#PiefitSanJose','2','https://piefitcards.dk','repsandrounds',1),(6,'#PiefitOttawa','2','https://piefitcards.dk','repsandrounds',1),(7,'#PiefitBogota','4','https://piefitcards.dk','repsandrounds',1),(8,'#PiefitHavana','2','https://piefitcards.dk','amrap',1),(9,'#PiefitNassau','3','https://piefitcards.dk','amrap',1),(10,'#PiefitBrasilia','4','https://piefitcards.dk','amrap',1),(11,'#PiefitBangkok','1','https://piefitcards.dk','workandrest',2),(12,'#PiefitShanghai','2','https://piefitcards.dk','workandrest',2),(13,'#PiefitManama','3','https://piefitcards.dk','workandrest',2),(14,'#PiefitBaghdad','4','https://piefitcards.dk','workandrest',2),(15,'#PiefitTokyo','3','https://piefitcards.dk','repsandrounds',2),(16,'#PiefitSeoul','2','https://piefitcards.dk','repsandrounds',2),(17,'#PiefitThimphu','4','https://piefitcards.dk','repsandrounds',2),(18,'#PiefitBeijing','3','https://piefitcards.dk','amrap',2),(19,'#PiefitJakarta','3','https://piefitcards.dk','amrap',2),(20,'#PiefitSana\'a','5','https://piefitcards.dk','amrap',2),(21,'#PiefitCopenhagen','1','https://piefitcards.dk','workandrest',3),(22,'#PiefitOslo','2','https://piefitcards.dk','workandrest',3),(23,'#PiefitNuuk','3','https://piefitcards.dk','workandrest',3),(24,'#PiefitBudapest','3','https://piefitcards.dk','workandrest',3),(25,'#PiefitStockholm','2','https://piefitcards.dk','repsandrounds',3),(26,'#PiefitHelsinki','2','https://piefitcards.dk','repsandrounds',3),(27,'#PiefitBucharest','4','https://piefitcards.dk','repsandrounds',3),(28,'#PiefitBrussels','3','https://piefitcards.dk','amrap',3),(29,'#PiefitAmsterdam','3','https://piefitcards.dk','amrap',3),(30,'#PiefitPristina','5','https://piefitcards.dk','amrap',3),(31,'#PiefitDenmark','1','https://piefitcards.dk','workandrest',4),(32,'#PiefitNorway','2','https://piefitcards.dk','workandrest',4),(33,'#PiefitVenezuela','3','https://piefitcards.dk','workandrest',4),(34,'#PiefitGuyana','4','https://piefitcards.dk','workandrest',4),(35,'#PiefitSweden','2','https://piefitcards.dk','repsandrounds',4),(36,'#PiefitFinland','2','https://piefitcards.dk','repsandrounds',4),(37,'#PiefitSuriname','3','https://piefitcards.dk','repsandrounds',4),(38,'#PiefitBelgium','3','https://piefitcards.dk','amrap',4),(39,'#PiefitNetherlands','3','https://piefitcards.dk','amrap',4),(40,'#PiefitSerbia','4','https://piefitcards.dk','amrap',4);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardcollection`
--

DROP TABLE IF EXISTS `cardcollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardcollection` (
  `cardcollection_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(800) NOT NULL,
  `releasedate` date NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `boxcollection_id` int(11) NOT NULL,
  PRIMARY KEY (`cardcollection_id`),
  KEY `boxcollection_id` (`boxcollection_id`),
  CONSTRAINT `cardcollection_ibfk_1` FOREIGN KEY (`boxcollection_id`) REFERENCES `boxcollection` (`boxcollection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardcollection`
--

LOCK TABLES `cardcollection` WRITE;
/*!40000 ALTER TABLE `cardcollection` DISABLE KEYS */;
INSERT INTO `cardcollection` VALUES (1,'PIEFITCARDS PACK - CORE HOME EDITION V.1','Her skal der være en description','2021-11-22',99.00,1),(2,'PIEFITCARDS PACK - LOWERBODY HOME EDITION V.1','Her skal der være en description','2021-11-22',99.00,1),(3,'PIEFITCARDS PACK - UPPERBODY HOME EDITION V.1','Her skal der være en description','2021-11-22',99.00,1),(4,'PIEFITCARDS PACK - FULLBODY HOME EDITION V.1','Her skal der være en description','2021-11-22',99.00,1);
/*!40000 ALTER TABLE `cardcollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardcollection_card`
--

DROP TABLE IF EXISTS `cardcollection_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardcollection_card` (
  `cardcollection_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  PRIMARY KEY (`cardcollection_id`,`card_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `cardcollection_card_ibfk_1` FOREIGN KEY (`cardcollection_id`) REFERENCES `cardcollection` (`cardcollection_id`),
  CONSTRAINT `cardcollection_card_ibfk_2` FOREIGN KEY (`card_id`) REFERENCES `card` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardcollection_card`
--

LOCK TABLES `cardcollection_card` WRITE;
/*!40000 ALTER TABLE `cardcollection_card` DISABLE KEYS */;
INSERT INTO `cardcollection_card` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,39),(4,40);
/*!40000 ALTER TABLE `cardcollection_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'core'),(2,'lowerbody'),(3,'upperbody'),(4,'fullbody'),(5,'cardio');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise` (
  `exercise_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`exercise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'1/2 burpee'),(2,'3 v up'),(3,'air squat'),(4,'air thruster'),(5,'back cross lunge'),(6,'back extension'),(7,'bicycle'),(8,'big jack'),(9,'burpee'),(10,'burpee jack'),(11,'burpee squat'),(12,'butt kick'),(13,'butt up'),(14,'cross 2 feet'),(15,'diamond push up'),(16,'diamond push up*'),(17,'double squat'),(18,'fast feet '),(19,'fast feet steps'),(20,'flutter kick'),(21,'front jack'),(22,'full sit up'),(23,'glute bridge'),(24,'glute kick (e)'),(25,'heel touch'),(26,'heel touch (e)'),(27,'high block'),(28,'high knee'),(29,'isometric squat'),(30,'jump squat'),(31,'jump squat*'),(32,'jumping jack'),(33,'jumping lunge*'),(34,'knee 2 elbow'),(35,'lateral jump'),(36,'leg raise'),(37,'lunge'),(38,'military drill'),(39,'mt. climber'),(40,'narrow push up*'),(41,'one leg glute bridge (e)'),(42,'over knee reach'),(43,'plank'),(44,'plank hip dip'),(45,'plank knee check'),(46,'plank knee check*'),(47,'plank toe tap'),(48,'plank walk*'),(49,'pogo jump'),(50,'power jack'),(51,'prisoner squat pull'),(52,'prisoner squat twist'),(53,'push up hand release*'),(54,'push up knee check*'),(55,'push up*'),(56,'reverse crunch'),(57,'reverse lunge'),(58,'reverse lunge (e)'),(59,'rocket crunch'),(60,'running man'),(61,'russian sit up'),(62,'russian twist (e)'),(63,'scissors'),(64,'shoulder tap'),(65,'shoulder tap (e)'),(66,'side lunge'),(67,'side plank (l)'),(68,'side plank (r)'),(69,'side triceps push up (e)'),(70,'side v up (l)'),(71,'side v up (r)'),(72,'single leg v up (e)'),(73,'sit out'),(74,'sit up get up*'),(75,'sit up twist'),(76,'skaters run'),(77,'soviet kick'),(78,'spider push up*'),(79,'sprint'),(80,'sprint steps'),(81,'squat 180*'),(82,'squat back\'n forth'),(83,'squat bounce'),(84,'squat kick'),(85,'sumo squat'),(86,'superman'),(87,'superman y+t'),(88,'t push up'),(89,'t push up*'),(90,'toe touch'),(91,'triceps push up*'),(92,'tuck jump'),(93,'tuck jump*'),(94,'twist'),(95,'v up*'),(96,'walk out'),(97,'walking push up*'),(98,'wide push up*'),(99,'windshield wiper*'),(100,'wiper crunch');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repsandrounds`
--

DROP TABLE IF EXISTS `repsandrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repsandrounds` (
  `repsandrounds_id` int(11) NOT NULL AUTO_INCREMENT,
  `rounds` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  PRIMARY KEY (`repsandrounds_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `repsandrounds_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `card` (`card_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repsandrounds`
--

LOCK TABLES `repsandrounds` WRITE;
/*!40000 ALTER TABLE `repsandrounds` DISABLE KEYS */;
INSERT INTO `repsandrounds` VALUES (1,4,5),(2,4,6),(3,4,7),(4,4,15),(5,4,16),(6,4,17),(7,4,25),(8,4,26),(9,4,27),(10,4,35),(11,4,36),(12,4,37);
/*!40000 ALTER TABLE `repsandrounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repsandrounds_benchmark`
--

DROP TABLE IF EXISTS `repsandrounds_benchmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repsandrounds_benchmark` (
  `repsandrounds_id` int(11) NOT NULL,
  `benchmark_id` int(11) NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`repsandrounds_id`,`benchmark_id`),
  KEY `benchmark_id` (`benchmark_id`),
  CONSTRAINT `repsandrounds_benchmark_ibfk_1` FOREIGN KEY (`repsandrounds_id`) REFERENCES `repsandrounds` (`repsandrounds_id`) ON DELETE CASCADE,
  CONSTRAINT `repsandrounds_benchmark_ibfk_2` FOREIGN KEY (`benchmark_id`) REFERENCES `benchmark` (`benchmark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repsandrounds_benchmark`
--

LOCK TABLES `repsandrounds_benchmark` WRITE;
/*!40000 ALTER TABLE `repsandrounds_benchmark` DISABLE KEYS */;
INSERT INTO `repsandrounds_benchmark` VALUES (1,1,'00:12:00'),(1,2,'00:10:00'),(1,3,'00:09:00'),(1,4,'00:08:00'),(2,1,'00:12:00'),(2,2,'00:10:00'),(2,3,'00:09:00'),(2,4,'00:08:00'),(3,1,'00:18:00'),(3,2,'00:15:00'),(3,3,'00:13:00'),(3,4,'00:12:00'),(4,1,'00:12:00'),(4,2,'00:10:00'),(4,3,'00:09:00'),(4,4,'00:08:00'),(5,1,'00:12:00'),(5,2,'00:10:00'),(5,3,'00:09:00'),(5,4,'00:08:00'),(6,1,'00:19:00'),(6,2,'00:18:00'),(6,3,'00:16:00'),(6,4,'00:15:00'),(7,1,'00:12:00'),(7,2,'00:10:00'),(7,3,'00:09:00'),(7,4,'00:08:00'),(8,1,'00:12:00'),(8,2,'00:10:00'),(8,3,'00:09:00'),(8,4,'00:08:00'),(9,1,'00:18:00'),(9,2,'00:17:00'),(9,3,'00:15:00'),(9,4,'00:14:00'),(10,1,'00:12:00'),(10,2,'00:10:00'),(10,3,'00:09:00'),(10,4,'00:08:00'),(11,1,'00:12:00'),(11,2,'00:10:00'),(11,3,'00:09:00'),(11,4,'00:08:00'),(12,1,'00:16:00'),(12,2,'00:15:00'),(12,3,'00:13:00'),(12,4,'00:12:00');
/*!40000 ALTER TABLE `repsandrounds_benchmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repsandrounds_exercise`
--

DROP TABLE IF EXISTS `repsandrounds_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repsandrounds_exercise` (
  `repsandrounds_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `reps` int(11) NOT NULL,
  `ordernumber` int(11) NOT NULL,
  PRIMARY KEY (`repsandrounds_id`,`exercise_id`),
  KEY `exercise_id` (`exercise_id`),
  CONSTRAINT `repsandrounds_exercise_ibfk_1` FOREIGN KEY (`repsandrounds_id`) REFERENCES `repsandrounds` (`repsandrounds_id`) ON DELETE CASCADE,
  CONSTRAINT `repsandrounds_exercise_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repsandrounds_exercise`
--

LOCK TABLES `repsandrounds_exercise` WRITE;
/*!40000 ALTER TABLE `repsandrounds_exercise` DISABLE KEYS */;
INSERT INTO `repsandrounds_exercise` VALUES (1,1,10,4),(1,8,15,1),(1,70,10,2),(1,71,10,3),(2,20,20,3),(2,26,10,4),(2,62,10,2),(2,77,20,1),(3,6,12,4),(3,36,12,5),(3,38,10,1),(3,45,10,6),(3,59,14,2),(3,100,14,3),(4,50,15,1),(4,57,18,4),(4,59,17,3),(4,77,16,2),(5,1,10,2),(5,31,10,1),(5,42,20,4),(5,51,10,3),(6,24,12,3),(6,32,20,4),(6,47,12,5),(6,52,12,1),(6,66,12,2),(6,99,12,6),(7,13,10,4),(7,34,30,1),(7,40,10,3),(7,96,10,2),(8,21,16,4),(8,69,8,2),(8,72,8,3),(8,73,16,1),(9,10,10,2),(9,14,20,5),(9,15,12,3),(9,59,14,4),(9,90,14,6),(9,97,8,1),(10,6,12,4),(10,14,30,1),(10,39,30,3),(10,84,12,2),(11,9,10,3),(11,12,30,1),(11,42,15,4),(11,81,10,2),(12,4,15,5),(12,6,15,6),(12,25,20,4),(12,27,15,1),(12,94,20,3),(12,98,10,2);
/*!40000 ALTER TABLE `repsandrounds_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistic`
--

DROP TABLE IF EXISTS `statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistic` (
  `statistic_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_completed` date NOT NULL,
  `time_used` time NOT NULL,
  `card_id` int(11) NOT NULL,
  PRIMARY KEY (`statistic_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `statistic_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `card` (`card_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistic`
--

LOCK TABLES `statistic` WRITE;
/*!40000 ALTER TABLE `statistic` DISABLE KEYS */;
INSERT INTO `statistic` VALUES (1,'2021-12-02','00:07:00',1);
/*!40000 ALTER TABLE `statistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (1,'light'),(2,'dark');
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `email` varchar(50) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `phonenumber` int(11) NOT NULL,
  `password` blob NOT NULL,
  `isadmin` tinyint(1) NOT NULL DEFAULT 0,
  `theme_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`email`),
  KEY `theme_id` (`theme_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('martin@piefitcards.dk','martin kidmose','kvist',93947763,'$2a$10$iJVQg0anraSdg4eIIzO0C.2TzbcmaFEB0PAg9sHxmBW22cV8Q0FAy',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cardcollection`
--

DROP TABLE IF EXISTS `user_cardcollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cardcollection` (
  `email` varchar(50) NOT NULL,
  `cardcollection_id` int(11) NOT NULL,
  PRIMARY KEY (`email`,`cardcollection_id`),
  KEY `cardcollection_id` (`cardcollection_id`),
  CONSTRAINT `user_cardcollection_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  CONSTRAINT `user_cardcollection_ibfk_2` FOREIGN KEY (`cardcollection_id`) REFERENCES `cardcollection` (`cardcollection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cardcollection`
--

LOCK TABLES `user_cardcollection` WRITE;
/*!40000 ALTER TABLE `user_cardcollection` DISABLE KEYS */;
INSERT INTO `user_cardcollection` VALUES ('martin@piefitcards.dk',1),('martin@piefitcards.dk',2),('martin@piefitcards.dk',3),('martin@piefitcards.dk',4);
/*!40000 ALTER TABLE `user_cardcollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_statistic`
--

DROP TABLE IF EXISTS `user_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_statistic` (
  `statistic_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`statistic_id`,`email`),
  KEY `email` (`email`),
  CONSTRAINT `user_statistic_ibfk_1` FOREIGN KEY (`statistic_id`) REFERENCES `statistic` (`statistic_id`),
  CONSTRAINT `user_statistic_ibfk_2` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_statistic`
--

LOCK TABLES `user_statistic` WRITE;
/*!40000 ALTER TABLE `user_statistic` DISABLE KEYS */;
INSERT INTO `user_statistic` VALUES (1,'martin@piefitcards.dk');
/*!40000 ALTER TABLE `user_statistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workandrest`
--

DROP TABLE IF EXISTS `workandrest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workandrest` (
  `workandrest_id` int(11) NOT NULL AUTO_INCREMENT,
  `timeactive` time NOT NULL,
  `timerest` time NOT NULL,
  `rounds` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  PRIMARY KEY (`workandrest_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `workandrest_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `card` (`card_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workandrest`
--

LOCK TABLES `workandrest` WRITE;
/*!40000 ALTER TABLE `workandrest` DISABLE KEYS */;
INSERT INTO `workandrest` VALUES (1,'00:00:25','00:00:10',3,1),(2,'00:00:30','00:00:10',3,2),(3,'00:00:45','00:00:15',3,3),(4,'00:00:20','00:00:05',4,4),(5,'00:00:25','00:00:10',3,11),(6,'00:00:30','00:00:10',3,12),(7,'00:00:45','00:00:15',3,13),(8,'00:00:20','00:00:05',4,14),(9,'00:00:25','00:00:10',3,21),(10,'00:00:30','00:00:10',3,22),(11,'00:00:45','00:00:15',3,23),(12,'00:00:20','00:00:05',4,24),(13,'00:00:25','00:00:10',3,31),(14,'00:00:30','00:00:10',3,32),(15,'00:00:45','00:00:15',3,33),(16,'00:00:20','00:00:05',4,34);
/*!40000 ALTER TABLE `workandrest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workandrest_exercise`
--

DROP TABLE IF EXISTS `workandrest_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workandrest_exercise` (
  `workandrest_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  PRIMARY KEY (`workandrest_id`,`exercise_id`),
  KEY `exercise_id` (`exercise_id`),
  CONSTRAINT `workandrest_exercise_ibfk_1` FOREIGN KEY (`workandrest_id`) REFERENCES `workandrest` (`workandrest_id`) ON DELETE CASCADE,
  CONSTRAINT `workandrest_exercise_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workandrest_exercise`
--

LOCK TABLES `workandrest_exercise` WRITE;
/*!40000 ALTER TABLE `workandrest_exercise` DISABLE KEYS */;
INSERT INTO `workandrest_exercise` VALUES (1,12),(1,57),(1,64),(1,96),(2,60),(2,63),(2,67),(2,68),(3,6),(3,18),(3,20),(3,75),(4,27),(4,34),(4,39),(4,73),(4,86),(4,94),(5,23),(5,29),(5,43),(5,79),(6,17),(6,35),(6,37),(6,99),(7,2),(7,50),(7,57),(7,84),(8,5),(8,11),(8,20),(8,29),(8,34),(8,48),(9,8),(9,18),(9,20),(9,90),(10,32),(10,44),(10,96),(10,97),(11,50),(11,53),(11,70),(11,71),(11,76),(11,87),(12,12),(12,34),(12,40),(12,96),(13,3),(13,22),(13,31),(13,32),(14,16),(14,28),(14,36),(14,37),(15,17),(15,18),(15,59),(15,78),(16,1),(16,42),(16,51),(16,67),(16,68),(16,79);
/*!40000 ALTER TABLE `workandrest_exercise` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-16  8:56:56
