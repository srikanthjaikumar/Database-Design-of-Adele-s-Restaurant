CREATE DATABASE  IF NOT EXISTS `the_coffee_bar_live` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `the_coffee_bar_live`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: the_coffee_bar_live
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `day_of_the_week`
--

DROP TABLE IF EXISTS `day_of_the_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_of_the_week` (
  `day` varchar(35) NOT NULL,
  PRIMARY KEY (`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_of_the_week`
--

LOCK TABLES `day_of_the_week` WRITE;
/*!40000 ALTER TABLE `day_of_the_week` DISABLE KEYS */;
INSERT INTO `day_of_the_week` VALUES ('Friday'),('Monday'),('Saturday'),('Thursday'),('Tuesday'),('Wednesday');
/*!40000 ALTER TABLE `day_of_the_week` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_first_name` varchar(40) DEFAULT NULL,
  `employee_last_name` varchar(40) DEFAULT NULL,
  `age` smallint(6) DEFAULT NULL,
  `contact_no` varchar(40) DEFAULT NULL,
  `hourly_wage` decimal(4,2) DEFAULT NULL,
  `employee_supervisor` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (100,'Castillo','Fitzgerald',24,'240-645-7256',8.25,150),(101,'Jeanette','Connely',24,'891-876-7675',8.25,150),(102,'Claudia','Hart',24,'891-775-1209',12.00,150),(103,'Warren','Everhart',28,'891-845-8763',11.25,150),(104,'Martin','Patrick',23,'240-651-9076',11.00,150),(105,'Anthony','Espinosa',26,'240-871-9990',10.00,150),(106,'Celeste','Mitchell',32,'891-871-8210',8.25,150),(107,'Divania','Belfort',29,'240-098-2310',8.25,150),(108,'Rachell','Esperaza',30,'240-111-7612',9.00,150),(109,'Janine','house',24,'871-671-1102',9.00,150),(110,'Brian','Martin',23,'871-222-1782',11.00,150),(111,'Ben','Mirtle',21,'240-222-9032',9.50,150),(112,'Andrew','Strain',22,'240-896-0062',9.00,150),(113,'Joshua','Periera',21,'240-222-7841',10.00,150),(114,'Connor','Mack',30,'240-109-7865',8.25,150),(115,'Travon','Abbott',30,'891-109-8898',9.00,150),(150,'Ellen','Douglas',42,'342-987-0087',30.00,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_availability`
--

DROP TABLE IF EXISTS `employee_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_availability` (
  `employee_ID` int(11) NOT NULL,
  `day` varchar(40) NOT NULL,
  `slot_name` varchar(30) NOT NULL,
  PRIMARY KEY (`employee_ID`,`day`,`slot_name`),
  KEY `day` (`day`),
  KEY `slot_name` (`slot_name`),
  CONSTRAINT `employee_availability_ibfk_1` FOREIGN KEY (`day`) REFERENCES `day_of_the_week` (`day`),
  CONSTRAINT `employee_availability_ibfk_2` FOREIGN KEY (`slot_name`) REFERENCES `time` (`slot_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_availability`
--

LOCK TABLES `employee_availability` WRITE;
/*!40000 ALTER TABLE `employee_availability` DISABLE KEYS */;
INSERT INTO `employee_availability` VALUES (100,'Friday','S1'),(100,'Thursday','S1'),(100,'Tuesday','S1'),(100,'Wednesday','S1'),(101,'Friday','S1'),(101,'Monday','S1'),(101,'Thursday','S1'),(101,'Tuesday','S1'),(102,'Friday','S1'),(102,'Monday','S1'),(102,'Thursday','S1'),(102,'Tuesday','S1'),(102,'Wednesday','S1'),(103,'Monday','S1'),(104,'Friday','S1'),(104,'Wednesday','S1'),(105,'Friday','S1'),(105,'Monday','S1'),(108,'Monday','S1'),(108,'Wednesday','S1'),(112,'Thursday','S1'),(100,'Friday','S2'),(100,'Thursday','S2'),(100,'Tuesday','S2'),(100,'Wednesday','S2'),(101,'Friday','S2'),(101,'Monday','S2'),(101,'Thursday','S2'),(101,'Tuesday','S2'),(102,'Friday','S2'),(102,'Monday','S2'),(102,'Thursday','S2'),(102,'Tuesday','S2'),(102,'Wednesday','S2'),(103,'Friday','S2'),(103,'Monday','S2'),(103,'Thursday','S2'),(103,'Tuesday','S2'),(103,'Wednesday','S2'),(104,'Friday','S2'),(104,'Tuesday','S2'),(104,'Wednesday','S2'),(105,'Friday','S2'),(105,'Monday','S2'),(108,'Monday','S2'),(108,'Wednesday','S2'),(112,'Thursday','S2'),(100,'Friday','S3'),(100,'Thursday','S3'),(100,'Tuesday','S3'),(100,'Wednesday','S3'),(101,'Friday','S3'),(101,'Monday','S3'),(101,'Thursday','S3'),(101,'Tuesday','S3'),(102,'Friday','S3'),(102,'Monday','S3'),(102,'Thursday','S3'),(102,'Tuesday','S3'),(102,'Wednesday','S3'),(103,'Friday','S3'),(103,'Monday','S3'),(103,'Thursday','S3'),(103,'Tuesday','S3'),(103,'Wednesday','S3'),(104,'Friday','S3'),(104,'Monday','S3'),(104,'Tuesday','S3'),(104,'Wednesday','S3'),(105,'Friday','S3'),(105,'Monday','S3'),(106,'Saturday','S3'),(107,'Saturday','S3'),(108,'Monday','S3'),(108,'Wednesday','S3'),(111,'Wednesday','S3'),(112,'Thursday','S3'),(100,'Friday','S4'),(100,'Thursday','S4'),(100,'Tuesday','S4'),(100,'Wednesday','S4'),(101,'Friday','S4'),(101,'Monday','S4'),(101,'Thursday','S4'),(101,'Tuesday','S4'),(102,'Friday','S4'),(102,'Monday','S4'),(102,'Thursday','S4'),(102,'Tuesday','S4'),(102,'Wednesday','S4'),(103,'Friday','S4'),(103,'Monday','S4'),(103,'Thursday','S4'),(103,'Tuesday','S4'),(103,'Wednesday','S4'),(104,'Monday','S4'),(104,'Tuesday','S4'),(105,'Monday','S4'),(106,'Friday','S4'),(106,'Saturday','S4'),(107,'Friday','S4'),(107,'Saturday','S4'),(107,'Wednesday','S4'),(109,'Thursday','S4'),(109,'Tuesday','S4'),(111,'Monday','S4'),(111,'Wednesday','S4'),(104,'Monday','S5'),(105,'Monday','S5'),(106,'Friday','S5'),(106,'Saturday','S5'),(107,'Friday','S5'),(107,'Saturday','S5'),(107,'Wednesday','S5'),(109,'Thursday','S5'),(109,'Tuesday','S5'),(110,'Thursday','S5'),(111,'Monday','S5'),(111,'Wednesday','S5'),(112,'Tuesday','S5'),(114,'Friday','S5'),(114,'Wednesday','S5'),(106,'Friday','S6'),(107,'Friday','S6'),(107,'Saturday','S6'),(107,'Wednesday','S6'),(109,'Thursday','S6'),(109,'Tuesday','S6'),(110,'Thursday','S6'),(111,'Monday','S6'),(112,'Tuesday','S6'),(114,'Friday','S6'),(114,'Wednesday','S6'),(106,'Friday','S7'),(107,'Friday','S7'),(107,'Saturday','S7'),(107,'Wednesday','S7'),(109,'Thursday','S7'),(109,'Tuesday','S7'),(110,'Thursday','S7'),(111,'Monday','S7'),(112,'Tuesday','S7'),(114,'Friday','S7'),(114,'Wednesday','S7');
/*!40000 ALTER TABLE `employee_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_leave`
--

DROP TABLE IF EXISTS `employee_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_leave` (
  `leave_ID` int(11) NOT NULL,
  `employee_ID` int(11) DEFAULT NULL,
  `leave_day` varchar(40) DEFAULT NULL,
  `leave_slot_name` varchar(40) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`leave_ID`),
  KEY `employee_ID` (`employee_ID`),
  KEY `leave_day` (`leave_day`),
  KEY `leave_slot_name` (`leave_slot_name`),
  CONSTRAINT `employee_leave_ibfk_1` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `employee_leave_ibfk_2` FOREIGN KEY (`leave_day`) REFERENCES `day_of_the_week` (`day`),
  CONSTRAINT `employee_leave_ibfk_3` FOREIGN KEY (`leave_slot_name`) REFERENCES `time` (`slot_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leave`
--

LOCK TABLES `employee_leave` WRITE;
/*!40000 ALTER TABLE `employee_leave` DISABLE KEYS */;
INSERT INTO `employee_leave` VALUES (1,104,'Friday','S1','2016-04-01 07:00:00'),(2,104,'Friday','S2','2016-04-01 07:00:00'),(3,105,'Monday','S4','2016-04-04 07:00:00'),(4,105,'Monday','S5','2016-04-04 07:00:00'),(5,111,'Tuesday','S1','2016-04-05 07:00:00'),(6,111,'Tuesday','S2','2016-04-05 07:00:00'),(7,111,'Tuesday','S3','2016-04-05 07:00:00'),(8,111,'Tuesday','S4','2016-04-05 07:00:00'),(9,107,'Monday','S4','2016-04-04 07:00:00'),(10,107,'Monday','S5','2016-04-04 07:00:00'),(11,107,'Monday','S6','2016-04-04 07:00:00'),(12,107,'Monday','S7','2016-04-04 07:00:00'),(13,106,'Wednesday','S1','2016-04-06 07:00:00'),(14,106,'Wednesday','S2','2016-04-06 07:00:00'),(15,106,'Wednesday','S3','2016-04-06 07:00:00'),(16,106,'Thursday','S4','2016-04-07 07:00:00'),(17,106,'Thursday','S5','2016-04-07 07:00:00'),(18,106,'Thursday','S6','2016-04-07 07:00:00'),(19,106,'Thursday','S7','2016-04-07 07:00:00'),(20,110,'Friday','S1','2016-04-15 07:00:00'),(21,110,'Friday','S2','2016-04-15 07:00:00'),(22,110,'Friday','S3','2016-04-15 07:00:00'),(23,110,'Friday','S4','2016-04-15 07:00:00'),(24,110,'Friday','S5','2016-04-15 07:00:00'),(25,110,'Saturday','S4','2016-04-16 07:00:00'),(26,110,'Saturday','S5','2016-04-16 07:00:00'),(27,110,'Saturday','S6','2016-04-16 07:00:00'),(28,110,'Saturday','S7','2016-04-16 07:00:00');
/*!40000 ALTER TABLE `employee_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `item_ID` int(11) NOT NULL,
  `item_name` varchar(40) DEFAULT NULL,
  `item_quantity` smallint(6) DEFAULT NULL,
  `item_price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`item_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (127,'CHEESE CREAM 1 OZ PC',3,4.99),(151,'BUTTER PATTIES WRAPPED',13,2.99),(580,'SP CINNAMON GROUND K',14,1.99),(599,'SP NUTMEG GROUND K',14,2.99),(630,'SUGAR PC ARTIFICIAL SW',200,0.90),(635,'SUGAR PC PACKETS',200,0.75),(1060,'MILK 5GL',13,6.99),(1070,'MILK 5GL SKILM',8,5.99),(1075,'MILK QUARTER HALF & HALF',20,1.99),(1079,'TOPP ZIP WIP 16oz CN',48,2.99),(1732,'COFFEE ESPRESSO BEAN DECAF',10,12.99),(1754,'COFFEE ESPRESSO BEANS',7,8.99),(1855,'FILTER COFFEE PAPER(15 BY 5)',40,2.99),(2408,'STBK COFFEE SYRUP ASST',35,4.99),(2863,'STBK CUP 12 OZ HOT',250,0.75),(2864,'STBK LID 12,16,20 OZ HOT',250,0.50),(2865,'STBK CUP 16 OZ HOT',250,1.00),(2890,'STBK STRAW GREEN',300,0.10),(2891,'STBK SAUCE CHOCOLATE/SEMI&BITTER SWEET',30,3.99),(2893,'STBK LID 16/26 DOME',200,1.50),(2894,'STBK COFFEE FRAP SYRUP',25,2.99),(2897,'STBK FRAP EXTRACT',8,23.50),(2898,'STBK STICK SPLASH BAG',20,5.99),(2900,'STBK SLEEVE HOT CUP',56,2.99),(2901,'STBK SOY MILK ORG',30,3.99),(2903,'STBK COFFEE HOUSE',25,3.99),(2904,'STBK HOUSE DECAF 9OZ 28/cs PIKE',25,3.99),(2906,'STBK TEA TAZO ASSORTED FLAVORS',20,1.50),(2911,'STBK BISCOTTI',25,1.99),(2913,'STBK MOCHA SYRUP',25,4.99),(3492,'STBK TEA CHAI LATTE CONC',15,3.50),(3493,'STBK TEA BLACK ICE',20,1.50),(3494,'STBK TEA GREEN LATTE',8,1.50),(3546,'STBK NAPKIN',30,5.00),(3547,'STBK TAZO ICED',27,1.50),(4020,'DISP STIRRER 7\" WOODEN COMPOSTABLE',17,11.99),(4239,'STBK CUP 4 OZ HOT',250,0.50),(4240,'STBK CUP 20/24 OZ HOT',235,1.20),(4243,'STBK SAUCE ASST',20,3.99),(4322,'STBK LID 16/26 FLAT',250,0.70),(4941,'STBK TEA CHAI MATCHA',15,3.50),(5203,'STBK COFFEE ESTIMA',15,2.50),(5289,'SOY MILK 32OZ',20,19.99),(5492,'GELATO ASST FRUIT 5L',10,3.99),(5493,'GELATO ASST CREAM 5L',6,3.99),(6200,'STBK TEA TAZO PASSION',20,1.50),(6201,'STBK TEA TAZO AWAKE',20,1.50),(6202,'STBK TEA TAZO REFRESH',20,1.50),(6203,'STBK TEA TAZO ORGANIC CHI',30,1.50),(6204,'STBK TEA TAZO ORANGE',27,1.50),(6205,'STBK TEA TAZO ZEN',20,1.50),(6206,'STBK TEA TAZO EARL GREY',20,1.50),(6207,'STBK TEA TAZO LOTUS',20,1.50),(6208,'STBK TEA TAZO CHINA GREEN',27,1.50),(6209,'STBK TEA TAZO CALM',20,1.50),(6220,'STBK SYRUP FONTANA VANILLA',20,3.99),(6221,'STBK SYRUP FONTANA VANILLA SF',45,1.00),(6222,'STBK SYRUP FONTANA HAZLENUT',20,3.99),(6223,'STBK SYRUP FONTANA HAZLENUT SF',20,3.99),(6224,'STBK SYRUP FONTANA CARAMEL',20,3.99),(6225,'STBK SYRUP FONTANA CARAMEL SF',20,3.99),(6226,'STBK SYRUP FONTANA RASPBERRY',20,1.99),(6230,'STBK SAUCE FNTN CHOC BITTER SWEEET',20,1.99),(6231,'STBK SAUCE CARAMEL',20,1.99),(6232,'STBK SCE CHOCOLATE MOCHA SEMI SWEET',20,1.99),(6233,'STBK SAUCE WHITE CHOCOLATE MOCHA',20,1.99),(6240,'STBK SYRUP FONTANA IRISH CREAM',20,1.99),(7062,'BP CUPCAKES/VEGAN',12,4.99),(7078,'BP BRWNIE ASST RG CUT',10,6.50),(7353,'BCA ASST LAYER CAKE ADELE',10,4.99),(8517,'IC HG CHERRY VANILLA',10,2.99),(8518,'IC HG CHOCOLATE',10,2.99),(8519,'IC HG CHOCOLATE CHIP',30,2.99),(8521,'IC HG COFFEE CHIP',27,2.99),(8523,'IC HG COOKIES & CREAM',20,2.99),(8531,'IC HG MINT CHIP',20,3.99),(8537,'IC HG ROCKY ROAD',20,3.99),(8539,'IC HG SPECIAL',20,3.99),(8540,'IC HG STRAWBERRY',20,3.99),(8542,'IC HG VANILLA',20,3.99),(8558,'IC HG CAKE BATTER',25,2.99);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER inventory_update
AFTER UPDATE
ON inventory
FOR EACH ROW
BEGIN
INSERT INTO update_inventory_log(update_log_ID,item_ID,old_quantity,new_quantity,time_stamp) VALUES(update_log_ID,old.item_ID,old.item_quantity,new.item_quantity,now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inventory_log`
--

DROP TABLE IF EXISTS `inventory_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_log` (
  `log_ID` int(11) NOT NULL,
  `item_ID` int(11) DEFAULT NULL,
  `employee_ID` int(11) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_ID`),
  KEY `item_ID` (`item_ID`),
  KEY `employee_ID` (`employee_ID`),
  CONSTRAINT `inventory_log_ibfk_1` FOREIGN KEY (`item_ID`) REFERENCES `inventory` (`item_ID`),
  CONSTRAINT `inventory_log_ibfk_2` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_log`
--

LOCK TABLES `inventory_log` WRITE;
/*!40000 ALTER TABLE `inventory_log` DISABLE KEYS */;
INSERT INTO `inventory_log` VALUES (300,6202,107,'2016-04-23 07:34:01'),(301,8518,107,'2016-04-24 20:24:01'),(302,6220,107,'2016-04-22 19:44:01'),(303,2913,109,'2016-04-26 21:19:01'),(304,3492,109,'2016-04-27 22:24:01'),(305,8531,100,'2016-04-28 23:32:01'),(306,8537,100,'2016-04-28 23:34:01'),(307,8558,100,'2016-04-28 18:00:01');
/*!40000 ALTER TABLE `inventory_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `product_ID` int(11) NOT NULL,
  `category_ID` int(11) DEFAULT NULL,
  `product_name` varchar(40) DEFAULT NULL,
  `product_cost` decimal(4,2) DEFAULT NULL,
  `product_size` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`product_ID`),
  KEY `category_ID` (`category_ID`),
  CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `product_categories` (`category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Caramel Machiato',3.95,'Small'),(2,1,'Caramel Machiato',4.65,'Medium'),(3,1,'Caramel Machiato',4.95,'large'),(4,1,'White Chocolate Mocha',3.95,'Small'),(5,1,'White Chocolate Mocha',4.65,'Medium'),(6,1,'White Chocolate Mocha',4.95,'Large'),(7,2,'Cafe Latte',3.25,'Small'),(8,2,'Cafe Latte',3.75,'Medium'),(9,2,'Cafe Latte',4.25,'Large'),(10,2,'Cafe Mocha',3.75,'Small'),(11,2,'Cafe Mocha',4.25,'Medium'),(12,2,'Cafe Mocha',4.75,'Large'),(13,2,'Cafe Americano',2.45,'Small'),(14,2,'Cafe Americano',2.95,'Medium'),(15,2,'Cafe Americano',3.25,'Large'),(16,2,'Cappuccino',3.25,'Small'),(17,2,'Cappucino',3.75,'Medium'),(18,2,'Cappucino',4.25,'Large'),(19,2,'Espresso',1.95,'Small'),(20,2,'Espresso Machiato',2.05,'Small'),(21,2,'Espresso Con Panna',2.05,'Small'),(22,3,'Pike Place Roast',1.95,'Small'),(23,3,'Pike Place Roast',2.25,'Medium'),(24,3,'Pike Place Roast',2.45,'Large'),(25,3,'Brewed Coffee Refill',1.75,'Small'),(26,3,'Brewed Coffee Refill',2.05,'Medium'),(27,3,'Brewed Coffee Refill',2.25,'Large'),(28,3,'Cap Charge',0.30,'Standard'),(29,4,'Chai Tea Latte',3.75,'Small'),(30,4,'Chai Tea Latte',4.45,'Medium'),(31,4,'Chai Tea Latte',4.75,'Large'),(32,2,'Full Leaf Brewed Tea',1.50,'Standard'),(33,2,'Hot Chocolate',2.95,'Small'),(34,2,'Hot Chocolate',3.25,'Medium'),(35,2,'Hot Chocolate',3.45,'Large'),(36,5,'Mocha',4.95,'Medium'),(37,5,'Caramel',4.95,'Medium'),(38,5,'Coffee',4.95,'Medium'),(39,6,'Latte',3.95,'Medium'),(40,6,'Mocha',4.75,'Medium'),(41,6,'White Caramel Mocha',4.75,'Medium'),(42,6,'Cafe Americano',2.95,'Medium'),(43,6,'Coffee',2.45,'Medium'),(44,6,'Tazo Shaken Iced Tea',2.45,'Medium');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_items`
--

DROP TABLE IF EXISTS `ordered_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordered_items` (
  `order_ID` int(11) NOT NULL,
  `product_ID` int(11) NOT NULL,
  `employee_ID` int(11) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `frequency_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_ID`,`product_ID`,`employee_ID`),
  KEY `product_ID` (`product_ID`),
  KEY `employee_ID` (`employee_ID`),
  CONSTRAINT `ordered_items_ibfk_1` FOREIGN KEY (`product_ID`) REFERENCES `menu_items` (`product_ID`),
  CONSTRAINT `ordered_items_ibfk_2` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_items`
--

LOCK TABLES `ordered_items` WRITE;
/*!40000 ALTER TABLE `ordered_items` DISABLE KEYS */;
INSERT INTO `ordered_items` VALUES (100,1,100,'2016-04-01 14:00:01',2),(101,7,100,'2016-04-01 15:00:02',3),(102,9,104,'2016-04-01 16:00:01',2),(103,14,104,'2016-04-01 16:10:03',2),(104,34,104,'2016-04-05 16:17:01',2),(105,22,106,'2016-04-07 18:00:02',1),(106,23,106,'2016-04-08 21:00:03',1),(107,21,103,'2016-04-09 22:11:06',2),(108,4,103,'2016-04-10 00:29:07',2),(109,7,102,'2016-04-09 23:34:07',1),(110,9,101,'2016-04-09 20:43:08',1),(111,23,100,'2016-04-09 18:56:08',1),(112,1,100,'2016-04-09 19:22:08',1),(113,35,103,'2016-04-11 01:49:06',2),(114,7,110,'2016-04-11 00:10:07',2),(115,8,111,'2016-04-10 23:11:07',1),(116,19,105,'2016-04-10 20:23:08',4),(117,23,103,'2016-04-10 18:26:08',1),(118,2,103,'2016-04-10 19:43:08',3),(119,18,107,'2016-04-11 15:49:06',2),(120,17,108,'2016-04-12 02:10:07',2),(121,28,100,'2016-04-11 23:11:07',2),(122,29,104,'2016-04-11 21:23:08',3),(123,12,103,'2016-04-11 16:26:08',2),(124,8,103,'2016-04-11 19:23:08',3),(125,21,107,'2016-04-12 16:39:06',2),(126,22,108,'2016-04-13 02:30:07',1),(127,23,108,'2016-04-13 02:11:07',1),(128,24,107,'2016-04-12 21:45:08',1),(129,25,107,'2016-04-12 16:54:08',1),(130,26,102,'2016-04-12 19:33:08',3),(131,16,107,'2016-04-13 15:49:06',2),(132,17,108,'2016-04-13 17:10:07',2),(133,22,100,'2016-04-14 17:13:07',2),(134,23,104,'2016-04-15 17:16:08',3),(135,24,103,'2016-04-15 17:29:08',2),(136,28,103,'2016-04-15 19:23:08',3),(137,1,107,'2016-04-15 16:39:06',2),(138,2,100,'2016-04-16 02:30:07',1),(139,3,100,'2016-04-16 02:11:07',1),(140,24,102,'2016-04-15 21:33:08',1),(141,7,113,'2016-04-15 16:22:08',1),(142,9,102,'2016-04-15 19:21:08',3),(143,13,108,'2016-04-17 01:11:07',1),(144,14,107,'2016-04-16 20:45:08',1),(145,10,107,'2016-04-17 00:54:08',4),(146,7,102,'2016-04-16 19:33:08',3),(147,8,107,'2016-04-16 17:49:06',2),(148,9,108,'2016-04-16 17:10:07',2),(149,10,100,'2016-04-17 17:23:07',2),(150,13,104,'2016-04-17 17:21:08',3),(151,14,103,'2016-04-17 17:33:08',2),(152,18,103,'2016-04-17 19:26:08',3),(153,1,107,'2016-04-17 17:22:06',2),(154,1,100,'2016-04-17 19:30:07',1),(155,1,100,'2016-04-18 19:23:07',1),(156,8,102,'2016-04-18 22:56:08',1),(157,8,113,'2016-04-18 21:22:08',1),(158,8,102,'2016-04-18 20:21:08',3),(159,15,113,'2016-04-01 21:22:08',1),(160,3,102,'2016-04-01 20:21:08',1),(161,1,102,'2016-04-24 00:21:08',1),(162,1,100,'2016-04-24 00:21:08',3),(163,1,101,'2016-04-09 00:21:08',1);
/*!40000 ALTER TABLE `ordered_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `category_ID` int(11) NOT NULL,
  `product_category` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'Signature Beverages'),(2,'Classic Beverages'),(3,'Brewed Coffee'),(4,'Tea'),(5,'Frapuccino'),(6,'Iced Drinks');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time`
--

DROP TABLE IF EXISTS `time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time` (
  `slot_name` varchar(35) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`slot_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time`
--

LOCK TABLES `time` WRITE;
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
INSERT INTO `time` VALUES ('S1','07:30:00','09:30:00'),('S2','09:30:00','11:30:00'),('S3','11:30:00','13:30:00'),('S4','13:30:00','15:30:00'),('S5','15:30:00','17:30:00'),('S6','17:30:00','19:30:00'),('S7','19:30:00','21:00:00');
/*!40000 ALTER TABLE `time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update_inventory_log`
--

DROP TABLE IF EXISTS `update_inventory_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update_inventory_log` (
  `update_log_ID` int(11) NOT NULL AUTO_INCREMENT,
  `item_ID` int(11) DEFAULT NULL,
  `old_quantity` smallint(6) DEFAULT NULL,
  `new_quantity` smallint(6) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`update_log_ID`),
  KEY `item_ID` (`item_ID`),
  CONSTRAINT `update_inventory_log_ibfk_1` FOREIGN KEY (`item_ID`) REFERENCES `inventory` (`item_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_inventory_log`
--

LOCK TABLES `update_inventory_log` WRITE;
/*!40000 ALTER TABLE `update_inventory_log` DISABLE KEYS */;
INSERT INTO `update_inventory_log` VALUES (1,8531,20,20,'2016-05-15 18:02:17'),(2,4240,250,13,'2016-05-15 18:02:34'),(3,2897,34,8,'2016-05-15 18:02:54'),(4,4240,13,235,'2016-05-15 18:04:53'),(5,5493,10,6,'2016-05-15 18:05:14'),(6,2863,250,16,'2016-05-15 18:05:34'),(7,3494,20,8,'2016-05-15 18:05:47'),(8,8518,23,10,'2016-05-15 18:06:14'),(9,151,17,13,'2016-05-15 18:06:30'),(10,2863,16,250,'2016-05-15 18:07:13');
/*!40000 ALTER TABLE `update_inventory_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'the_coffee_bar_live'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-16 13:43:02
