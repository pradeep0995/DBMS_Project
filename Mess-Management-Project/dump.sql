-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mess_management
-- ------------------------------------------------------
-- Server version	5.5.52-0ubuntu0.14.04.1

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
-- Table structure for table `COMPLAINT`
--

DROP TABLE IF EXISTS `COMPLAINT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPLAINT` (
  `enrollment_no` int(10) DEFAULT NULL,
  `member_no` int(6) DEFAULT NULL,
  `comp_date` date DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  KEY `enrollment_no` (`enrollment_no`),
  KEY `member_no` (`member_no`),
  CONSTRAINT `COMPLAINT_ibfk_1` FOREIGN KEY (`enrollment_no`) REFERENCES `ENROLLMENT` (`enrollment_id`),
  CONSTRAINT `COMPLAINT_ibfk_2` FOREIGN KEY (`member_no`) REFERENCES `MESS_STAFF` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPLAINT`
--

LOCK TABLES `COMPLAINT` WRITE;
/*!40000 ALTER TABLE `COMPLAINT` DISABLE KEYS */;
INSERT INTO `COMPLAINT` VALUES (400011101,120001,'2016-02-16','THE FOOD WAS NOT PROPERLY COOKED.'),(400011103,120001,'2016-02-16','THE FOOD WAS OVER COOKED.'),(400011105,120001,'2016-02-16','THE CHAPATIS WERE NOT BAKED PROPERLY.'),(400011107,120001,'2016-02-16','THE FOOD WAS OVER COOKED.'),(400011120,120007,'2016-02-25','THE UTENSILS WERE DIRTY.'),(400011119,120007,'2016-02-25','OIL WAS STICKING TO THE PLATE.'),(400011120,120007,'2016-02-25','UTENSILS WERE NOT CLEANED PROPERLY.'),(400011116,120007,'2016-02-25','THE UTENSILS WERE DIRTY.'),(400011110,120003,'2016-03-01','THE MESS WAS NOT CLEANED PROPERLY.'),(400011117,120003,'2016-03-01','MESS WAS FILTHY.'),(400011116,120013,'2016-03-02','TOO MUCH WATER IN DAL.'),(400011101,120013,'2016-03-02','NO PROPER VEGETABLE.'),(400011102,120012,'2016-03-05','QUALITY OF RAJMA POOR.'),(400011103,120012,'2016-03-05','QUALITY OF LADYFINGER POOR.'),(400011116,120014,'2016-03-05','QUALITY OF RAJMA POOR.'),(400011105,120017,'2016-03-05','QUALITY OF LADYFINGER POOR.'),(400011101,120002,'2016-09-12','The food was pathetic.');
/*!40000 ALTER TABLE `COMPLAINT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENROLLMENT`
--

DROP TABLE IF EXISTS `ENROLLMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENROLLMENT` (
  `enrollment_id` int(10) NOT NULL AUTO_INCREMENT,
  `roll_no` int(10) DEFAULT NULL,
  `name` varchar(25) NOT NULL,
  `semester` varchar(5) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `phone_no` varchar(11) DEFAULT NULL,
  `hostel` varchar(30) DEFAULT NULL,
  `receipt_no` varchar(20) DEFAULT NULL,
  `account_no` varchar(20) DEFAULT NULL,
  `mess_no` int(2) DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  UNIQUE KEY `roll_no` (`roll_no`),
  UNIQUE KEY `receipt_no` (`receipt_no`),
  UNIQUE KEY `account_no` (`account_no`),
  KEY `mess_no` (`mess_no`),
  CONSTRAINT `ENROLLMENT_ibfk_1` FOREIGN KEY (`mess_no`) REFERENCES `MESS` (`mess_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=400011122 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENROLLMENT`
--

LOCK TABLES `ENROLLMENT` WRITE;
/*!40000 ALTER TABLE `ENROLLMENT` DISABLE KEYS */;
INSERT INTO `ENROLLMENT` VALUES (400011101,14075001,'RAKASH GUPTA','V',2016,'7052260891','CV RAMAN','DU52077921','20197370244',1),(400011102,14075045,'AMAN GUPTA','VI',2016,'9054400891','CV RAMAN','DU28426001','20192050244',1),(400011103,15075026,'VIJAY SINGH','VIII',2016,'8687888991','DHANRAJGIRI','DU33042863','20012458362',2),(400011104,14075025,'SHIVAM LOHIA','I',2016,'9450608673','VISHWESHWARIYA','DU56000921','30198564273',1),(400011105,14075037,'PRADEEP VERMA','VI',2016,'9436304070','RAMANUJAM','DU63331002','20194587220',1),(400011106,12075013,'RAHUL KUMAR','II',2016,'9999457852','ARYABHAT','DU52014785','10254002562',2),(400011107,13075034,'ABHIRAM SINGH','IV',2016,'8040506011','VISHWESHWARIYA','DU51259763','60502001200',2),(400011108,12075026,'AKASH GUPTA','VI',2016,'7054413252','VISHWESHWRIYA','DU73198264','10203050406',2),(400011109,13075010,'BHARAT KHANNA','V',2016,'7182936547','RAJPUTANA','DU75395142','45852659712',2),(400011110,14075011,'SURAJ KUMAR','V',2016,'9450608688','RAJPUTANA','DU74268531','20169857524',1),(400011111,15075009,'SUHAIL AHMED','VIII',2016,'7000056000','CV RAMAN','DU60201050','20195260024',1),(400011112,16075008,'HIMADRI SINGH','VI',2016,'7050004587','CV RAMAN','DU40511020','20192563399',1),(400011113,15075066,'VISHAL KUMAR','III',2016,'9600045080','CV RAMAN','DU42052012','30198524052',1),(400011114,16075025,'PRASOON VARSI','II',2016,'8400045280','RAMANUJAM','DU92054803','30169852001',1),(400011115,12075036,'KUMAR NIKHIL','IV',2016,'7880004587','RAMANUJAM','DU45032299','30197377245',1),(400011116,14075036,'DEEPAK SINGH','VI',2016,'9450212000','CV RAMAN','DU12365845','80197370244',2),(400011117,14075039,'ATISHAYA JAIN','VII',2016,'8425361200','CV RAMAN','DU10025005','90197370244',2),(400011118,14075017,'AVIJIT THAWANI','VI',2016,'8687900030','CV RAMAN','DU52019006','20185522000',1),(400011119,14075054,'RISHAB AGARWAL','V',2016,'9460000354','CV RAMAN','DU82060605','20197355555',1),(400011120,14075022,'ANUBHAV GUPTA','V',2016,'7889945865','RAMANUJAM','DU50242000','10166662000',2),(400011121,1002005,'Sudarshan','V',2016,'7025365214','Ramanujam','DU654954585','1254548745',1);
/*!40000 ALTER TABLE `ENROLLMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEEDBACK`
--

DROP TABLE IF EXISTS `FEEDBACK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEEDBACK` (
  `feedback_id` int(4) NOT NULL AUTO_INCREMENT,
  `rating` int(2) DEFAULT NULL,
  `suggestion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEEDBACK`
--

LOCK TABLES `FEEDBACK` WRITE;
/*!40000 ALTER TABLE `FEEDBACK` DISABLE KEYS */;
INSERT INTO `FEEDBACK` VALUES (1001,6,'Vegetables should be brought fresh.'),(1002,7,'Instead of Samosa in breakfast make sandwich.'),(1003,8,'Make kheer twice a week.'),(1004,8,'Chowmeen should be deleted from dinner.'),(1005,7,'Hot milk should be served in dinner.'),(1006,7,'fried rice only on sunday.'),(1007,6,'Remove chola-bhature from breakfast.'),(1008,6,'Make paratha-sabji instead of chola-bhature.'),(1009,6,'Remove Chola-bhature from breakfast.'),(1010,7,'make arhar dal daily in lunch.'),(1011,7,'sprouted seeds sometime in lunch.'),(1012,7,'serve fruits sometimes.');
/*!40000 ALTER TABLE `FEEDBACK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITEMS`
--

DROP TABLE IF EXISTS `ITEMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ITEMS` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITEMS`
--

LOCK TABLES `ITEMS` WRITE;
/*!40000 ALTER TABLE `ITEMS` DISABLE KEYS */;
INSERT INTO `ITEMS` VALUES (1,'WHEAT '),(2,'RICE'),(3,'RAJMA'),(4,'DAL'),(5,'MILK'),(6,'CORN_FLAKE'),(7,'LADYFINGER'),(8,'CUCUMBER'),(9,'LEMON'),(10,'BEANS'),(11,'SUJI'),(12,'MAIDA'),(13,'HALDI'),(14,'SALT'),(15,'SUGAR'),(16,'PEPER'),(17,'SPICES'),(18,'GAS_CYLIND'),(19,'SWEET'),(20,'CHANA');
/*!40000 ALTER TABLE `ITEMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MESS`
--

DROP TABLE IF EXISTS `MESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MESS` (
  `mess_id` int(11) NOT NULL DEFAULT '0',
  `mess_name` varchar(25) DEFAULT NULL,
  `mess_location` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`mess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MESS`
--

LOCK TABLES `MESS` WRITE;
/*!40000 ALTER TABLE `MESS` DISABLE KEYS */;
INSERT INTO `MESS` VALUES (1,'satvik_mess_sariya','Vishweshwariya Hostel'),(2,'satvik_mess_bose','SN Bose Hostel');
/*!40000 ALTER TABLE `MESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MESS_STAFF`
--

DROP TABLE IF EXISTS `MESS_STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MESS_STAFF` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `permanent_add` varchar(50) DEFAULT NULL,
  `contact_no` varchar(11) DEFAULT NULL,
  `date_of_join` date DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120018 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MESS_STAFF`
--

LOCK TABLES `MESS_STAFF` WRITE;
/*!40000 ALTER TABLE `MESS_STAFF` DISABLE KEYS */;
INSERT INTO `MESS_STAFF` VALUES (120001,'RAKESH RAJ','House No:10 Vijaynagar Sultanpur','7052236964','2010-02-06','cook'),(120002,'SHIVAM SINGH','House No:6  Gandhinagar Varanasi','7054412474','2012-04-10','cook'),(120003,'VINOD JAISWAL','House No:11 Mahanagar Barabanki','9052236964','2004-05-25','sweeper'),(120004,'KALI YADAV','House No:16 Anandvihar Ajamgarh','8052236125','2009-01-15','clearner'),(120005,'SIYARAM YADAV','House No:09 Noornagar Bareilly','7000536911','2006-04-26','cook'),(120006,'ARVIND SHARMA','House No:42 Sangamnagar Basti','8445003964','2006-03-24','cook'),(120007,'MUKESH JAIN','House No:13 Bhajanpur Faizabad','9050640522','2005-03-06','utensil cleaner'),(120008,'AJAY DESWAL','House No:55 Ahrola Gorakhpur','7055442236','2012-07-06','cook'),(120009,'VINAY KHURANA','House No:67 Premnagar Kanpur','9450605875','2012-06-06','food server'),(120010,'VIJAYPAL','House No:46 Bharatvihar Shahranpur','8687900520','2014-01-06','cook'),(120011,'RAMPAL SHRMA','House No:79 Vijaynagar Varanasi','8440001442','2010-09-06','cook'),(120012,'SHIVKUMAR','House No:72 Rajavihar Barabanki','8676461563','2011-07-06','cook'),(120013,'ANAND PRAKASH','House No:36 Indrapras Basti','9897949596','2009-05-06','sweeper'),(120014,'SURJEET KUMAR','House No:12 Pratapvihar Faizabad','7778797475','2008-03-06','sweeper'),(120016,'AVINASH KUMAR','House No:10 Jankivihar Ajamgargh','7088236964','2008-01-06','cook'),(120017,'VINAY SANGWAN','House No:5 Mundka Delhi','9450608673','2008-05-25','mess manager');
/*!40000 ALTER TABLE `MESS_STAFF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTICE`
--

DROP TABLE IF EXISTS `NOTICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTICE` (
  `notice_no` int(11) NOT NULL AUTO_INCREMENT,
  `notice` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`notice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTICE`
--

LOCK TABLES `NOTICE` WRITE;
/*!40000 ALTER TABLE `NOTICE` DISABLE KEYS */;
INSERT INTO `NOTICE` VALUES (1,'The mess will be closed for diwali break from 2016-10-29 to 2016-11-03'),(2,'Greetings From team Satvik.This is to inform you that mess will be closed tomorrow.');
/*!40000 ALTER TABLE `NOTICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PURCHASE_INVENTORY`
--

DROP TABLE IF EXISTS `PURCHASE_INVENTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PURCHASE_INVENTORY` (
  `item_no` int(11) DEFAULT NULL,
  `mess_no` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT '0.00',
  `expenditure` decimal(10,2) DEFAULT NULL,
  KEY `item_no` (`item_no`),
  KEY `mess_no` (`mess_no`),
  CONSTRAINT `PURCHASE_INVENTORY_ibfk_1` FOREIGN KEY (`item_no`) REFERENCES `ITEMS` (`item_id`),
  CONSTRAINT `PURCHASE_INVENTORY_ibfk_2` FOREIGN KEY (`mess_no`) REFERENCES `MESS` (`mess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PURCHASE_INVENTORY`
--

LOCK TABLES `PURCHASE_INVENTORY` WRITE;
/*!40000 ALTER TABLE `PURCHASE_INVENTORY` DISABLE KEYS */;
INSERT INTO `PURCHASE_INVENTORY` VALUES (1,1,'2016-05-05',20.00,700.50),(1,2,'2016-04-05',20.00,710.50),(4,1,'2016-04-05',20.00,4000.75),(3,2,'2016-04-07',5.00,250.50),(3,1,'2016-05-06',5.00,260.00),(20,1,'2016-05-06',10.00,500.00),(20,2,'2016-05-15',12.00,540.00),(18,1,'2016-05-10',3.00,1200.00),(18,2,'2016-05-12',3.00,1200.00),(5,1,'2016-05-10',10.00,400.00),(17,1,'2016-05-10',0.00,500.00),(17,2,'2016-05-11',0.00,500.00),(16,1,'2016-05-15',0.00,100.00),(11,1,'2016-05-12',5.00,140.00),(11,2,'2016-06-27',6.00,160.00),(6,1,'2016-06-24',5.00,620.00),(6,2,'2016-06-12',5.00,630.00),(2,1,'2016-09-12',5.00,500.00),(5,2,'2016-07-12',2.00,520.00),(5,2,'2016-07-12',2.00,520.00);
/*!40000 ALTER TABLE `PURCHASE_INVENTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$KlHWKmub6mHl$rfboHxXCew7W+NcPypcbvmPRsv85ngxnK7Np99yl9n8=','2016-10-21 20:12:33',1,'pradeep','','','pradeep01iit@gmail.com',1,1,'2016-10-20 21:07:41'),(3,'pbkdf2_sha256$36000$YEuaaMPH2E3e$cgxHHo8h2uIiyiRdFTkLOVmJ3sun8XFfKC3XqVXHnes=','2016-10-22 09:32:00',0,'deepak','','','',0,1,'2016-10-20 21:13:34');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-10-20 14:40:57'),(2,'auth','0001_initial','2016-10-20 14:41:00'),(3,'admin','0001_initial','2016-10-20 14:41:01'),(4,'admin','0002_logentry_remove_auto_add','2016-10-20 14:41:01'),(5,'contenttypes','0002_remove_content_type_name','2016-10-20 14:41:01'),(6,'auth','0002_alter_permission_name_max_length','2016-10-20 14:41:01'),(7,'auth','0003_alter_user_email_max_length','2016-10-20 14:41:02'),(8,'auth','0004_alter_user_username_opts','2016-10-20 14:41:02'),(9,'auth','0005_alter_user_last_login_null','2016-10-20 14:41:02'),(10,'auth','0006_require_contenttypes_0002','2016-10-20 14:41:02'),(11,'auth','0007_alter_validators_add_error_messages','2016-10-20 14:41:02'),(12,'auth','0008_alter_user_username_max_length','2016-10-20 14:41:02'),(13,'sessions','0001_initial','2016-10-20 14:41:03');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('xf2i7y60xnt3tnb8t66qk6zajtqu4n1l','OWZkNGQzZDRiM2M1YmNjNzBhYjc4MTc5NjAxMDlkNzk3ZTAwZTc3YTp7fQ==','2016-11-03 21:26:44');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-22 16:14:37
