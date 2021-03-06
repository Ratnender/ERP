-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: erp
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendence`
--

DROP TABLE IF EXISTS `attendence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `attendence` (
  `id` int(11) NOT NULL,
  `l_date` date NOT NULL,
  `name` varchar(40) NOT NULL,
  `attendence` varchar(40) NOT NULL,
  `remark` varchar(300) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendence`
--

LOCK TABLES `attendence` WRITE;
/*!40000 ALTER TABLE `attendence` DISABLE KEYS */;
INSERT INTO `attendence` VALUES (30,'2019-02-15','Abhishek Kumar','present',''),(31,'2019-02-15','Abhishek Kumar','absent',''),(32,'2019-02-15','Abhishek Kumar','present',''),(33,'2019-02-15','Ajay Kumar','absent',''),(34,'2019-02-15','Ajit Kumar','present',''),(35,'2019-02-15','Chandan Singh','medical',''),(36,'2019-02-15','Akashat Vashistha','present',''),(37,'2019-02-15','Akshay Thakur','present',''),(38,'2019-02-15','Aman Ansari','present',''),(39,'2019-02-15','Amandeep Kaur','present',''),(40,'2019-02-15','Amandeep Singh','present',''),(41,'2019-02-15','Amit Kumar','present',''),(42,'2019-02-15','Amninder Singh','present',''),(43,'2019-02-15','Amrit Kaur','present',''),(44,'2019-02-15','Aniket Nagpal','present',''),(45,'2019-02-15','Anish Gautam','present',''),(46,'2019-02-15','Annu Soni','present',''),(47,'2019-02-15','Anshika Bajaj','present',''),(48,'2019-02-15','Arman Ansari','present',''),(49,'2019-02-15','Arshdeep Singh','present',''),(50,'2019-02-15','Arshita Arora','present',''),(51,'2019-02-15','Arshpreet Singh','present',''),(52,'2019-02-15','Arwinder Singh','present',''),(53,'2019-02-15','Ashish Raj','present',''),(54,'2019-02-15','Atish Kumar','present',''),(55,'2019-02-15','Ayudh Chaubey','present',''),(56,'2019-02-15','Bablu Kumar','present',''),(57,'2019-02-15','Baldeep Singh','present',''),(58,'2019-02-15','Bavneet Kaur','present',''),(59,'2019-02-15','Bhavna Saini','present',''),(60,'2019-02-15','Bhavuk Sharma','present',''),(61,'2019-02-15','Bhavya Gauri','present','');
/*!40000 ALTER TABLE `attendence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendence_summary`
--

DROP TABLE IF EXISTS `attendence_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `attendence_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `l_date` date NOT NULL,
  `sec_group` varchar(2) NOT NULL,
  `total` int(11) NOT NULL,
  `present` int(11) DEFAULT NULL,
  `absent` int(11) DEFAULT NULL,
  `other` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendence_summary`
--

LOCK TABLES `attendence_summary` WRITE;
/*!40000 ALTER TABLE `attendence_summary` DISABLE KEYS */;
INSERT INTO `attendence_summary` VALUES (21,'2019-02-15','A1',32,29,2,1);
/*!40000 ALTER TABLE `attendence_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communication`
--

DROP TABLE IF EXISTS `communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `communication` (
  `id` int(11) NOT NULL,
  `lec_date` date NOT NULL,
  `name` varchar(40) NOT NULL,
  `attendance` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communication`
--

LOCK TABLES `communication` WRITE;
/*!40000 ALTER TABLE `communication` DISABLE KEYS */;
/*!40000 ALTER TABLE `communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_groups`
--

DROP TABLE IF EXISTS `sec_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sec_groups` (
  `group_id` varchar(2) NOT NULL,
  PRIMARY KEY (`group_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_groups`
--

LOCK TABLES `sec_groups` WRITE;
/*!40000 ALTER TABLE `sec_groups` DISABLE KEYS */;
INSERT INTO `sec_groups` VALUES ('C1'),('C2');
/*!40000 ALTER TABLE `sec_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `sec_group` varchar(2) DEFAULT NULL,
  `college_roll` varchar(10) NOT NULL,
  `unv_roll` int(11) DEFAULT NULL,
  `father_name` varchar(30) DEFAULT NULL,
  `mother_name` varchar(30) DEFAULT NULL,
  `catagory` varchar(10) DEFAULT NULL,
  `parent_no` varchar(44) DEFAULT NULL,
  `student_no` varchar(44) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (30,'Abhishek Kumar','A1','CCT181004',1822266,'Kewal Singh','Nisha Devi',NULL,'9781206129','7986113157'),(31,'Abhishek Kumar','A1','CCT181005',1822267,'Mahender Kumar','Rita',NULL,'9992618063','9017650822'),(32,'Abhishek Kumar','A1','CCT181017',1822268,'Jasbir Singh','Seema',NULL,'8686016488, 9991818481','8289051986'),(33,'Ajay Kumar','A1','CCT181006',1822269,'Prem Raj','Kaushlya',NULL,'9418913411','9418997295'),(34,'Ajit Kumar','A1','CCT181007',1822270,'Brij Kishore Singh','Suman Devi',NULL,'9417687846, 9646890325','9888402576'),(35,'Chandan Singh','A1','CCT181212',1822301,'Nagender Singh','Renu Singh',NULL,'9888113612, 9876079497','9988440849'),(36,'Akashat Vashistha','A1','CCT181011',1822271,'Vinod Vashistha','Veena Vashistha',NULL,'9319587527','9557331358'),(37,'Akshay Thakur','A1','CCT181211',1822272,'Satish Kumar','Mamta',NULL,'9817177661, 9817201478','9816516964'),(38,'Aman Ansari','A1','CCT181013',1822273,'Kyum Ansari','Shahnaj Khatun',NULL,'9631823854','8340623595'),(39,'Amandeep Kaur','A1','CCT181018',1822274,'Sher Singh','Paramjit Kaur',NULL,'8437416228, 9216081238','8872602715'),(40,'Amandeep Singh','A1','CCT181015',1822275,'Pancham Singh','Shanti Devi',NULL,'9896363038, 9729049270','7404339706'),(41,'Amit Kumar','A1','CCT181016',1822276,'Syo Kumar','Krishana Devi',NULL,'9868653910','8076562495'),(42,'Amninder Singh','A1','CCT181205',1822277,'Manjit Singh','Gurmeet Kaur',NULL,'9915135817, 9815099057','9465915658'),(43,'Amrit Kaur','A1','CCT181148',1822278,'Sukhdev Singh','Rita Rani',NULL,'9815896768, 9592056240','9815896768, 9592056240'),(44,'Aniket Nagpal','A1','CCT181187',1822279,'Vipin Nagpal','Pooja Nagpal',NULL,'9814839322, 9814851299','7973592174'),(45,'Anish Gautam','A1','CCT181202',1822280,'Tarsem Lal','Sunita Devi',NULL,'9463644600','7589016600'),(46,'Annu Soni','A1','CCT181207',1822281,'Inderraj  Soni','Anjana Soni',NULL,'9355632656','9315118641'),(47,'Anshika Bajaj','A1','CCT181113',1822282,'Raj Kumar Bajaj','Santosh Bajaj',NULL,'9872731930','9041300082'),(48,'Arman Ansari','A1','CCT181153',1822283,'Rasheed Ansari','Jahanara Khatoon',NULL,'9725635255, 9973133081','8780424453'),(49,'Arshdeep Singh','A1','CCT181164',1822284,'Parminder Singh','Amandeep Kaur',NULL,'9814836593','7986612569'),(50,'Arshita Arora','A1','CCT181104',1822285,'Rajiv','Jyoti Arora',NULL,'9414318318','7425876318'),(51,'Arshpreet Singh','A1','CCT181157',1822286,'Jagjeet Singh','Rajpal Kaur',NULL,'9416793465','9780663965'),(52,'Arwinder Singh','A1','CCT181019',1822287,'Shamsher Singh','Kuldeep Kaur',NULL,'9988519147','9855038188'),(53,'Ashish Raj','A1','CCT181154',1822288,'Arun Shah','Sunita Shah',NULL,'9097552388, 9122161360','7903034338'),(54,'Atish Kumar','A1','CCT181200',1822290,'Shiv Kumar','Paramjeet Kaur',NULL,'9888449417, 9465007218','8556934414'),(55,'Ayudh Chaubey','A1','CCT181020',1822291,'Gyan Chandra Chaubey','Poonam Chaubey',NULL,'9415677297 ,9839753061','6280711419, 7755870760'),(56,'Bablu Kumar','A1','CCT181021',1822292,'Manager Gupta','Prabhawati Devi',NULL,'9803186404','9780768110'),(57,'Baldeep Singh','A1','CCT181145',1822293,'Hukum Singh','Neelam Kaur',NULL,'8449896905, 8410812745','7017672253'),(58,'Bavneet Kaur','A1','CCT181134',1822294,'Shajpreet Singh','Gurpreet Kaur',NULL,'6280305139','9779190079'),(59,'Bhavna Saini','A1','CCT181175',1822296,'Gurdas Singh','Sudesh Kumari',NULL,'7839049805, 9416931699','7839049805'),(60,'Bhavuk Sharma','A1','CCT181204',1822297,'Parveen Kumar Sharma','Jyoti Sharma',NULL,'9896934562, 8495335250','9996524562'),(61,'Bhavya Gauri','A1','CCT181022',1822298,'Raman Kumar','Sakshi',NULL,'9354640070','7206553882'),(62,'Bhawana Thakur','A2','CCT181126',1822299,'Nirmal Singh','Geeta Devi',NULL,'9914035872','9501941068'),(63,'Biki Kumar Rai','A2','CCT181023',1822300,'Mishri Lal Rai','Neelam Devi',NULL,'9774979517','8794593033'),(64,'Daljit Kaur','A2','CCT181025',1822302,'Gurcharn Singh','Paramjeet Kaur',NULL,'9872170998','9814770998'),(65,'Damanjot Kaur','A2','CCT181026',1822303,'Jagtar Singh','Paramjit Kaur',NULL,'8427141164','9815491155'),(66,'Gagandeep Singh','A2','CCT181027',1822305,'Kuldeep Singh','Renu Bala',NULL,'9779743816','7888431540'),(67,'Gaurav Singh','A2','CCT181028',1822306,'Hans Bahadur Singh','Rekha Singh',NULL,'7837127723','8929679507'),(68,'Gaurav Singh Minhas','A2','CCT181142',1822307,'Jagdev Singh','Asha Rani',NULL,'9779132057, 7589490337','9417602057'),(69,'Girish','A2','CCT181097',1822308,'Pardeep Kumar','Jyoti',NULL,'8288991507','8146262077'),(70,'Gourav Malhotra','A2','CCT181095',1822309,'Sunil Kumar Malhotra','Kajal Malhotra',NULL,'8278926181','7404391282'),(71,'Gulshan Kumar','A2','CCT181029',1822310,'Ram Balak Yadav','Shubhashni Devi',NULL,'9430063874','7903312855'),(72,'Gurdeep Singh','A2','CCT181030',1822311,'Rulda Singh','Surinderpal Kaur',NULL,'8437846987','8872356365'),(73,'Gurdev Singh','A2','CCT181193',1822312,'Baljeet Singh','Manjeet Kaur',NULL,'9996245613, 8295613348','9996181200'),(74,'Gurpreet Kaur','A2','CCT181099',1822313,'Karam Singh','Manjeet Kaur',NULL,'8959709122','9914280858'),(75,'Gursimran Singh','A2','CCT181031',1822315,'Sewa Singh','Harjinder Kaur',NULL,'9592348800','9592348800'),(76,'Hardeep Kaur','A2','CCT181032',1822316,'Avtar Singh','Baljinder Kaur',NULL,'9815313885','9501579756'),(77,'Harish Haridas','A2','CCT181123',1822317,'Haridas V S','Sushma Haridas',NULL,'9888860861, 9815553536','8054698461'),(78,'Harkirat Singh','A2','CCT181100',1822318,'Jarnail Singh','Rajinder Kaur',NULL,'7696025960','8699918354'),(79,'Harminder Kaur','A2','CCT181033',1822319,'Malkit Singh','Chhinder Kaur',NULL,'9915910111','9041398594'),(80,'Harpreet Kaur','A2','CCT181034',1822320,'Paramjeet Kaur','Iqbal Kaur',NULL,'8727046713','7508383622'),(81,'Harpreet Singh','A2','CCT181111',1822321,'Sukhvinder Singh','Hardeep Kaur',NULL,'9729139114','9729139114'),(82,'Harshit','A2','CCT181035',1822323,'Sunil','Rekha',NULL,'9896330065','9034446447'),(83,'Harshit','A2','CCT181106',1822322,'Balvinder','Dimple',NULL,'9896208973','9996940977'),(84,'Harshit Bhardwaj','A2','CCT181036',1822324,'Vishal Bhardwaj','Meenakshi Bhardwaj',NULL,'9803646019','9876354102'),(85,'Harsimran Singh','A2','CCT181037',1822325,'Kuldip Singh','Sukhjit Kaur',NULL,'9216269391','8872084609'),(86,'Harwinder Puri','A2','CCT181038',1822326,'Prem Puri','Ranjeet Kaur',NULL,'9779164918','8872347894'),(87,'Himanshu Dhiman','A2','CCT181120',1822327,'Rajesh Kumar','Anita Rani',NULL,'8059425258, 9728504331','7082708442'),(88,'Ritu Soni','A2','CCT181206',1822411,'Inder Raj Singh Soni','Anjana Soni',NULL,'9355632656','9315118641'),(89,'Mohit Kumar','A2','CCT181214',1822373,'Devinder Kumar','Meera Devi',NULL,'9459882921, 9459146921','7807188120'),(90,'Manpreet SIngh','A2','CCT181215',1822367,'Jasvir Singh','Karmjeet Kaur',NULL,'9417528607','9417584507'),(91,'Gursharnvir Singh','A2','CCT181217',1822314,'Harvinder Singh','Sarabjit Kaur',NULL,'9463093329','7889173988'),(92,'NAVNEET SINGH','A2','CCT181220',1822384,'Hari prasad','jai kaur',NULL,'9501033762','9914475282'),(93,'Virender Singh','A2','CCT181219',1822470,'Harinder Singh','Rimpy',NULL,'9216242982, 9646662731','7837748591'),(94,'Ishant kumar','A2','CCT181114',1822330,'Arun Jindal','Neeru Jindal',NULL,'9216553622, 9803210601','8591116000'),(95,'Vivek Sharma','A2','CCT181227',1822471,'Rangi Ram','Indu Bala',NULL,'9896693083, 7404284621','9996063083'),(96,'K Jithin Babu','A2','CCT181228',1822342,'K N Babu','S Jayashree',NULL,'9008785125, 7259983588','9544152765'),(97,'Ashutosh Rana','A2','CCT181218',1822289,'Rakesh Rana','Manju',NULL,'8869884127, 8533989784','9837391483'),(98,'Bhart Kumar','A2','CCT181231',1822295,'Dhiraj Kumar','Mamta Devi',NULL,'8219717526','8278865747'),(99,'Honey ','B1','CCT181039',1822329,'Vijay Kumar','Rani',NULL,'8196091583','8847567832'),(100,'Ishfaq Farooq','B1','CCT181040',1822331,'Farooq Ahmad Changal','Shameema Begum',NULL,'9906662878','7006043264'),(101,'Ishik Kumar','B1','CCT181041',1822332,'Pramod Kumar','Neelam',NULL,'9431676845','9304891914'),(102,'Jashandeep Kaur','B1','CCT181042',1822333,'Gurjant Singh','Rupinder Kaur',NULL,'9501055061, 9915260512','8968631301'),(103,'Jashandeep Kaur','B1','CCT181101',1822334,'Baljinder Singh','Parwinder Kaur',NULL,'9855908632','9592062206'),(104,'Jaspreet Kaur','B1','CCT181043',1822336,'Tarsem Singh','Pardeep Kaur',NULL,'9417181931','9417181931'),(105,'Jaspreet Singh','B1','CCT181107',1822337,'Arvinder Singh','Jaswinder Kaur',NULL,'7837646991','7837646991'),(106,'Jatin Malik','B1','CCT181131',1822339,'Sanjeev Kumar','Meeta Devi',NULL,'9466446044, 9466326763','9729314236'),(107,'Jatin Sharma','B1','CCT181198',1822340,'Suresh Sharma','Asha Sharma',NULL,'8968965961','8528997249'),(108,'Jyoti Vashisht','B1','CCT181044',1822341,'Bharat Bhushan ','Sunita Devi',NULL,'7340816400','9888545206'),(109,'Kamaldeep Kaur','B1','CCT181045',1822343,'Manjeet Singh','Kiranpreet Kaur',NULL,'9781401806','9781401806'),(110,'Karamveer Singh','B1','CCT181144',1822344,'Daljeet Singh','Kuldeep Kaur',NULL,'9896096831, 9896920843','7988728772'),(111,'Karan Boparai','B1','CCT181047',1822345,'Gurnam Singh Boparai','Sukhvir Kaur',NULL,'9646107000','9316507000'),(112,'Karanveer Singh','B1','CCT181048',1822346,'Maggar Singh','Charanjeet Kaur',NULL,'9592804269','9592804269'),(113,'Kartikay Raghav','B1','CCT181163',1822347,'Bhupender Singh Raghav','Laxmi Devi',NULL,'9811007685, 8076647831','8285127975'),(114,'Kashish Kochar','B1','CCT181105',1822348,'Girish','Sunita',NULL,'9460102880','7073126763'),(115,'Ketan','B1','CCT181166',1822349,'Hari Krishan',' Ritu',NULL,'9254298804','7027228054'),(116,'Kirandeep Kaur','B1','CCT181049',1822350,'Balwinder Singh','Jaswinder Kaur',NULL,'9646726746, 9914816294','7696019477'),(117,'Komal Badlaan','B1','CCT181050',1822351,'Sukhwinder Singh','Manju',NULL,'8728978308','8288915858'),(118,'Koustab Kumar','B1','CCT181150',1822352,'Bakshish Ram','Sushma Kumari',NULL,'9816350086, 9816664547','8351839908'),(119,'Kuhu Ojha','B1','CCT181130',1822353,'Sunil Ohja','Vibha Ohja',NULL,'9992203353, 9671335359','7340976689'),(120,'Kuljeet Kaur','B1','CCT181102',1822354,'Surmukh Singh','Harpal Kaur',NULL,'9855553445','9878846809'),(121,'Lakhbir Singh','B1','CCT181170',1822355,'Suresh','Sushma',NULL,'9467812270','7027962708'),(122,'Lakhwinder Singh','B1','CCT181128',1822356,'Tarlochan Singh','Paramjit Kaur',NULL,'9996234846','9728388270'),(123,'Lovepreet Kaur','B1','CCT181090',1822357,'Jasvir Singh','Kamaljit Kaur',NULL,'9855969563, 8699439261','9815117565'),(124,'Lovepreet Singh','B1','CCT181116',1822358,'Jasvir Singh','Sukhwinder Kaur',NULL,'9988502874','7526899898'),(125,'Madhav','B1','CCT181135',1822360,'Tej Pal','Sangeeta',NULL,'8168749709, 9416853785','7988946898'),(126,'Maninder Singh','B1','CCT181088',1822361,'Mohinder Singh','Surjeet Kaur',NULL,'9872019324','9872019324'),(127,'Manish','B1','CCT181051',1822362,'Rajinder Kumar','Veena',NULL,'9988155145','9872805145'),(128,'Manpreet Kaur','B1','CCT181052',1822363,'Pappu Singh','Sukhjeet Kaur',NULL,'9779495157','9592139374'),(129,'Manpreet Kaur','B1','CCT181053',1822364,'Jaswant Singh','Karamjeet Kaur',NULL,'9876606159','9915472732'),(130,'Manpreet Kaur','B1','CCT181054',1822365,'Sardool Singh','Karmjit Kaur',NULL,'9815295393','9815295393'),(131,'Manpreet Singh','B1','CCT181056',1822366,'Karam Singh','Daljeet Kaur',NULL,'9914459049','8725959049'),(132,'Mansi Tyagi','B1','CCT181158',1822368,'Sushma Tyagi','Lalit Tyagi',NULL,'8006109816','7253051377'),(133,'Md Umar Alam','B2','CCT181151',1822369,'Abdul Rashid','Najmuna Khatoon',NULL,'8494055034, 9199327450','8677843892'),(134,'Meghna Sharma','B2','CCT181118',1822370,'Bal Raj Sharma','Pinki Sharma',NULL,'9459507701,  9418096750','9805996060'),(135,'Mohd Ismail','B2','CCT181161',1822371,'Babar Ali','Meena',NULL,'9888482590','9417511983'),(136,'Mohit','B2','CCT181162',1822372,'Satish Kumar','Reeta',NULL,'9467024453, 9789001416','9729374792'),(137,'Mohit Saini','B2','CCT181159',1822374,'Pawan Kumar','Manu Bala',NULL,'9872187365, 9779417469','9501009439'),(138,'Mohsin Bilal','B2','CCT181096',1822376,'Bilal Ahmad Bhat','Parveena Bhat',NULL,'8288809232','7006586762'),(139,'Nagendra Saroj','B2','CCT181138',1822377,'Arjun Lal Saroj','Maya Devi',NULL,'9316048768','9793921706'),(140,'Nalinshay Deep Attri','B2','CCT181001',1822378,'Sandeep Attri','Madhuri Attri',NULL,'9418061999','7018287099'),(141,'Naman','B2','CCT181057',1822379,'Ashok Kumar','Adarsh Rani',NULL,'9466384705','9896277848'),(142,'Nandini','B2','CCT181132',1822380,'Dev Kumar','Dimple',NULL,'9416138235','9671638235'),(143,'Narinder Pal Singh','B2','CCT181058',1822381,'Tarlochan Singh','Sarabjit Kaur',NULL,'9915005436','7508537971'),(144,'Naveen Tewatia','B2','CCT181203',1822382,'Shyamvir Singh','Satawati',NULL,'9991241755, 9991241752','7015500287'),(145,'Navneet Kaur','B2','CCT181059',1822383,'Darshan Singh','Jasvir Kaur',NULL,'8872727326, 7529800000','8872590286'),(146,'Neha Puri','B2','CCT181220',1822385,'Ashok Puri','Chanchla Devi',NULL,'8894191938','8894191938'),(147,'Nidhi Chaudhary','B2','CCT181190',1822386,'Umesh Prasad Chaudhary','Mamta Devi',NULL,'9801659141, 8541989340','9852372087'),(148,'Nikhil Sharma','B2','CCT181192',1822387,'Somdutt','Sarita Sharma',NULL,'8626861945','9816207245'),(149,'Nikunj Gupta','B2','CCT181060',1822388,'Rajinder Kumar Gupta','Anuradha Gupta',NULL,'9815820788, 9779160520','7889106244'),(150,'Nitish Kumar','B2','CCT181143',1822390,'Avtar Singh','Ritu',NULL,'9878379146','9915679146'),(151,'Nitish Kumar','B2','CCT181089',1822389,'Joginder Singh','Geeta Devi',NULL,'8059599089, 8901486390','8168428639'),(152,'Nobelpreet Kaur','B2','CCT181188',1822391,'Jatinderpal Singh','Ratinder Kaur',NULL,'9888476062','8360313100'),(153,'Paras Narang','B2','CCT181061',1822392,'Manohar Lal Narang','Santosh',NULL,'7535027856, 8410738706','9997028699'),(154,'Parth Vishnoi','B2','CCT181181',1822393,'Sanjeev Vishnoi','Kalpana Vishnoi',NULL,'945730068, 7017067309','9759444577'),(155,'Pooja Bhardwaj','B2','CCT181092',1822395,'Raj Kumar','Jinsi Devi',NULL,'9896994444','9896994444'),(156,'Prashant Kumar','B2','CCT181121',1822396,'Mithilesh Mishra','Sarita Mishra',NULL,'7011837700','9999428567'),(157,'Raghav ','B2','CCT181109',1822397,'Mr Satish Gambhir','Mrs Pooja',NULL,'9896502242, 8930433903','7206242998'),(158,'Raghav Batra','B2','CCT181169',1822398,'Baldev Raj Batra','Veenu Batra',NULL,'9839049048','7379171234'),(159,'Raghav Sharma','B2','CCT181091',1822399,'Subhash Sharma','Anju',NULL,'8147521371, 9466065268, 8708716880','7494951129'),(160,'Rahul Kumar','B2','CCT181062',1822400,'Mithlesh Kumar','Poonam',NULL,'7380028750, 9502712206','8897018568'),(161,'Rahul Kumar','B2','CCT181129',1822401,'Bachcha Kumar','Urmila Devi',NULL,'9815143216','9915311928'),(162,'Jaspreet singh saini','B2','CCT181222',1822338,'palwinder singh','manjinder kaur',NULL,'9988080806','9855316875'),(163,'Dilpreet Singh','B2','CCT181225',1822304,'Manjeet Singh','Harpreet Kaur',NULL,'9466213731, 8950342731','7206165894'),(164,'Vinay Sharma','B2','CCT181229',1822469,'Bihari Lal','Bandita Kumari',NULL,'9419811264','9816811558'),(165,'Sahib','B2','CCT181230',1822418,'Sukhminder Singh','Beant Kaur',NULL,'7973829733','7087269056'),(166,'Rohit Babbar','B2','CCT181226',1822413,'Naresh Kumar Babbar','Meenu Babbar',NULL,'8901396699, 8053164802','9991104714'),(167,'Mohit Verma','B2','CCT181223',1822375,'Naresh Kumar','Pooja Verma',NULL,'9417190991, 8968926301','7087763351'),(237,'Rajinder Kaur','C1','CCT181063',1822402,'Karam Singh','Kamaljeet Kaur',NULL,'9501992699','9781834131'),(238,'Rajvinder Kaur','C1','CCT181065',1822404,'Meher Singh','Sukhwinder Kaur',NULL,'7340940398','7340940398'),(239,'Rakesh Thakur','C1','CCT181066',1822405,'Yog Raj','Shubh Lata',NULL,'9463921883','9878801450'),(240,'Ramandeep Kaur','C1','CCT181086',1822406,'Paramjit Singh','Jasvir Kaur',NULL,'9915356511','9878176994'),(241,'Ranjit Singh','C1','CCT181068',1822407,'Ajaib Singh','Mamta Rani',NULL,'8968315086','7986950460'),(242,'Ravendra Kumar Jaiswal','C1','CCT181152',1822408,'Govardhan Prasad Jaiswal','Sitank Devi',NULL,'9425162264, 9977858691','7024590691'),(243,'Ravi Singh','C1','CCT181070',1822409,'Kulwant Singh','Rani',NULL,'9914194558','9914194558'),(244,'Reena Rani','C1','CCT181085',1822410,'Jasvir Singh','Usha Rani',NULL,'9592646695','9877639285'),(245,'Ritul Thakur','C1','CCT181194',1822412,'Ramesh Kumar','Sandhya Devi',NULL,'9888042376, 9569900000','8437151976'),(246,'Rohit Tariyal','C1','CCT181182',1822414,'Ashok Tariyal','Pushpa Tariyal',NULL,'9023617941','9855774510'),(247,'Sachin Bhatti','C1','CCT181210',1822415,'Raj Kumar','Sarabjeet Kaur',NULL,'9888679251, 9814714368','7717249811'),(248,'Sachin Kumar','C1','CCT181146',1822416,'Krishan Prasad Gupta','Sunita Devi',NULL,'9882921073, 9817107335','7018734398'),(249,'Sachin Panday','C1','CCT181201',1822417,'Mahendra Panday','Sunita Panday',NULL,'9855772405','9785636771'),(250,'Sahil','C1','CCT181171',1822419,'Bhupinder','Neeru',NULL,'9812162544, 8059262566','9588316210'),(251,'Sahil Singh','C1','CCT181071',1822420,'Gurmeet Singh','Kamlesh Devi',NULL,'6465684830','7508540830'),(252,'Saksham Sharma','C1','CCT181140',1822421,'Pardeep Kumar','Sunita',NULL,'9914127351','7508155411'),(253,'Sakshi','C1','CCT181199',1822422,'Prem Singh','Sunita Devi',NULL,'8988235975, 8894612526','8988556374'),(254,'Sakshi Singhi','C1','CCT181108',1822423,'Rajneesh Kumar Singhi','Dimple Singhi',NULL,'9810005534','9876194304'),(255,'Satwinder Singh','C1','CCT181149',1822424,'Gurwinder Singh','Navjot Kaur',NULL,'9464958908','9592665586'),(256,'Sharanpreet Kaur','C1','CCT181176',1822425,'Narinder Singh','Jasbir Kaur',NULL,'8198009700','9815651809'),(257,'Shefali Gaba','C1','CCT181110',1822426,'Prem Sagar Gaba','Neelam Gaba',NULL,'9416238386','7015329574'),(258,'Shilpa Verma','C1','CCT181185',1822427,'Raj Kumar','Santosh',NULL,'9816699575','9736115044'),(259,'Shivam Kumar','C1','CCT181073',1822428,'Sunil Kumar Singh','Meena Singh',NULL,'9034383752','7988162352'),(260,'Shivam Patel','C1','CCT181074',1822429,'Sharda Patel','Suman Patel',NULL,'8922822990','9935134809'),(261,'Shivpreet Singh','C1','CCT181075',1822430,'Dalvinder Singh','Gurmail Kaur',NULL,'8968437718','9872685463'),(262,'Shruti Walia','C1','CCT181122',1822431,'Harvinder Walia','Shammi Walia',NULL,'9915616267, 8437386239','9780728727'),(263,'Shubham Dhiman','C1','CCT181208',1822432,'Jawahar Singh','Champa Kumari',NULL,'98717061565, 9459742551','9872488565'),(264,'Sumit Kumar Patel','C1','CCT181139',1822447,'Shambhu Nath Patel','Sunita Patel',NULL,'9934113533','7352017148'),(265,'Shubham Kumar','C1','CCT181167',1822433,'Ram Sakha','Mamta Devi',NULL,'9793084207, 7800096797','9129611035'),(266,'Shubham Kumar Singh','C1','CCT181183',1822434,'Ghanshyam Singh','Sanju Devi',NULL,'9915382091, 9779558973','7696786668'),(267,'Sidhant','C1','CCT181133',1822435,'Ishari Dutt','Yamuna Devi',NULL,'9882100054, 9882154088','9882084936'),(268,'Simran','C1','CCT181076',1822436,'Devinder Parkash','Sunita',NULL,'9814625089','8146867981'),(269,'Simranjeet Kaur','C1','CCT181077',1822439,'Mangat Singh',' Mandeep Kaur',NULL,'9464470238','9878911238'),(270,'Simranjeet Kaur','C1','CCT181078',1822437,'Amarjeet Singh','Balwinder Kaur',NULL,'9779111542','8699618331'),(271,'Simranjeet Kaur','C2','CCT181079',1822438,'Rajinder Singh','Amreek Kaur',NULL,'9781397370','9781917587'),(272,'Simranjit Singh','C2','CCT181195',1822440,'Baljit Singh','Jagtar Singh',NULL,'9815069797, 9872260365','8556999606'),(273,'Simranjot Kaur','C2','CCT181141',1822441,'Randhir Singh','Mandeep Kaur',NULL,'9914879904, 6239330989','8872285590'),(274,'Sudhir Kumar Sada','C2','CCT181180',1822443,'Bihari Lal Sada','Veena Devi',NULL,'9876405138, 8146663158','9779722354'),(275,'Suman Das','C2','CCT181080',1822444,'Chuni Lal Das','Santana Das',NULL,'7797823135, 6296434083','7407583441'),(276,'Suman Singh','C2','CCT181173',1822445,'Manoj Kumar','Shubhadra Kumari',NULL,'9304942105','7808241277'),(277,'Sumit Kumar Ghadai','C2','CCT181125',1822446,'Laxmidhar Ghadai','Sabita Ghadai',NULL,'9417196829, 9915860267','9023489567'),(278,'Sunil Kumar','C2','CCT181093',1822448,'Kashmir Chand','Surinder Rani',NULL,'9876290318','9876290318'),(279,'Sunny Chakraborty','C2','CCT181147',1822449,'Sajal Chakraborty','Sunny Chakraborty',NULL,'9781624271, 9876993108','9056234338'),(280,'Sunpreet Singh Narula','C2','CCT181168',1822450,'Mr Raj Singh','Mrs Charanjeet Kaur',NULL,'9896436809','9896013972'),(281,'Surinder Singh','C2','CCT181119',1822451,'Budh Singh','Harmesh Kaur',NULL,'9417728849, 8591345510','9041952136'),(282,'Tanuj Verma','C2','CCT181178',1822453,'Mukesh Verma','Yashoda Verma',NULL,'9758414605, 9719684605','9997069778'),(283,'Tanveer Singh','C2','CCT181184',1822454,'Manjit Singh','Gurpreet Kaur',NULL,'9023561162','9914054375'),(284,'Taranjeet Singh','C2','CCT181115',1822455,'Gurpreet Singh Walia','Narendar Kaur Walia',NULL,'9450200266, 7007888102','7007803868'),(285,'Tushar Goyal','C2','CCT181094',1822456,'Ashok Kumar','Rekha Goyal',NULL,'9416156426','9467576419'),(286,'Uday Partap Singh','C2','CCT181179',1822457,'Surinder Kumar','Raj Kumari ',NULL,'9463222661, 9464783861','9855682615'),(287,'Umesh Kumar','C2','CCT181098',1822458,'Deep Kumar','Savitri Devi',NULL,'7696627300','9882071838'),(288,'Vansh','C2','CCT181103',1822459,'Satish Kumar','Rajni Devi',NULL,'8437496245','9217191952'),(289,'Vanshika Bajaj','C2','CCT181127',1822460,'Vinay Bajaj','Payal Bajaj',NULL,'8755908841, 8755908840','8410749111'),(290,'Varinder Singh','C2','CCT181083',1822461,'Malkeet Singh','Karamjeet Kaur',NULL,'7009557321','8283058497'),(291,'Varun Sharma','C2','CCT181156',1822462,'Raj Kumar Sharma','Chinta Devi',NULL,'9697584077, 9622750135','9055323119'),(292,'Vasu Krishna','C2','CCT181112',1822463,'Mukesh Yadav','Manju Yadav',NULL,'7078116666','9634780340, 8295503455'),(293,'Vertika Tuteja','C2','CCT181155',1822464,'Mahender','Geeta Tuteja',NULL,'9897391495, 8265820687','7310847102'),(294,'Vijay','C2','CCT181174',1822465,'Balbir Singh','Rajpati',NULL,'9416868028, 9896191096','8295144106'),(295,'Vikas','C2','CCT181136',1822466,'Rajdhan','Usha',NULL,'9459780926, 9816761619','8628994393'),(296,'Vikasdeep Singh','C2','CCT181084',1822467,'Jasvir Singh','Sukhpal Kaur',NULL,'9876825980','9256600546'),(297,'Vikram','C2','CCT181196',1822468,'Ramesh Kumar','Nirmala Devi',NULL,'9463523250, 8284983250','8968501029'),(298,'Yash','C2','CCT181197',1822472,'Ajay','Sunita',NULL,'7009306108, 9501580194','9872326591'),(299,'Yashwant Das','C2','CCT181124',1822473,'Tapeshwar Das','Basanti Devi',NULL,'9216053199, 9592703331','9877687217'),(300,'Hitesh Rajan','C2','CCT181213',1822328,'Harish Rajan','Neetu',NULL,'9316140107, 9815174294','8847632726'),(301,'Surya Parkash','C2','CCT181221',1822452,'Ravinder Kumar','Sunita',NULL,'9466301266','9518066901'),(302,'Simranpreet Singh','C2','CCT181216',1822442,'Joginder Singh','Parkash Kaur',NULL,'9814705040, 8437705040','9592905040'),(303,'Lovish','C2','CCT181191',1822359,'Sunil Kumar',' Anuradha',NULL,'9876680154, 7347547410','9356434166'),(304,'Rajnish Lochab','C2','CCT181064',1822403,'Balraj Lochab','Reena',NULL,'9812241969','7056096626'),(305,'Jasleen Sandhu','C2','CCT181224',1822335,'Gurbachan Singh Sandhu','Jaswinder Kaur',NULL,'8360094974','9414490482');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-19 15:12:08
