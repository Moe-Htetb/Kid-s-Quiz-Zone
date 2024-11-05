-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: quizedb
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level` (
  `levelid` int NOT NULL,
  `levelname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`levelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'Basic'),(2,'Intermediate'),(3,'Advance');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `quizid` int NOT NULL AUTO_INCREMENT,
  `questions` varchar(500) DEFAULT NULL,
  `option1` varchar(100) DEFAULT NULL,
  `option2` varchar(100) DEFAULT NULL,
  `option3` varchar(100) DEFAULT NULL,
  `correctanswer` varchar(100) DEFAULT NULL,
  `levelid` int DEFAULT NULL,
  PRIMARY KEY (`quizid`),
  KEY `levelid_idx` (`levelid`),
  CONSTRAINT `levelid` FOREIGN KEY (`levelid`) REFERENCES `level` (`levelid`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (3,'If 3x = 15, what is the value of x?	','5','15','25','5',1),(4,'What color is the sky?	','red','blue','purple','blue',1),(5,'Which animal says \"Meow\"?','mouse','dog','cat','cat',1),(6,'How many legs does a spider have?','5','8','4','8',1),(7,'How many days are in a week?','six','seven','eight','seven',1),(8,'What is the capital of Kayin State?	','Hpa-an','Myawaddy','Kyarinnseikgyi','Hpa-an',1),(9,'Which river flows through Hpa-an?','Ayarwaddy','Thanlwin','Sittaung','Thanlwin',1),(10,'What is the official language of Myanmar?','Kayin','English','Burmese','Burmese',1),(11,'What is Myanmar currency called?	','Kyat','Baht','Yupee','Kyat',1),(12,'What is the result of 8 squared (8²)	','16','64','61','64',1),(13,'What is 20 divided by 4?','2','5','4','5',1),(14,'Which river is the longest in Myanmar?	','Ayarwaddy','Thanlwin','Chindwin','Ayarwaddy',1),(15,'If you have 12 apples and you give 4 away, how many apples do you have left?','6','8','10','8',1),(16,'What is the value of x in the equation 2x + 5 = 15?','12','5','10','5',2),(17,'What is the value of π (pi) to two decimal places?','3.14','3.15','3.124','3.14',2),(18,'What is the value of 3x if x = 7?','21','14','24','21',2),(19,'What is the square root of 81?','1','10','9','9',2),(20,'What is the smallest prime number?','1','2','3','2',2),(21,'Which country is the largest by land area?','China','Canada','Russia','Russia',2),(22,'Which element is essential for breathing?','Hydrogen','Oxygen','Nitrogen','Oxygen',2),(23,'What is the tallest mountain in the world?','Zwekabin','Mount Everest','Kangchenjunga','Mount Everest',2),(24,'What is the capital city of Japan?','Tokyo','Bangkok','Seoul','Tokyo',2),(25,'Which device is used to input text into a computer','Mouse','Keyboard','Printer','Keyboard',2),(26,'Which king founded the First Burmese Empire?','Bayinnaung','Thibaw','Anawrahta','Anawrahta',2),(27,'Which of the following is Myanmar’s national flower?','Paduk','Jasmine','Cherry','Paduk',2),(28,'Which UNESCO World Heritage Site is located in Myanmar?','Bagan','Yangon','Hpa-an','Bagan',2),(29,'Which festival celebrates the full moon and marks the end of the BuddhismLent in Myanmar?','Thagyin','Thadingyut','Kason','Thadingyut',2),(30,'What is the primary ingredient in the traditional Myanmar dish \"Mohinga\"?','Pork','Beef','Fish','Fish',2),(31,'Which UNESCO World Heritage Site is located in Myanmar?','Bagan','Yangon','Hpa-an','Bagan',3),(32,'Which Myanmar city is known for its royal palaces and rich cultural heritage?','Yangon','Mandalay','Mawlamyine','Mandalay',3),(33,'Which of the following are traditional Myanmar instruments?','Saung (Harp)','Piano','Xylophone','Saung (Harp)',3),(34,'Which lake in Myanmar is the largest freshwater lake?','Inle Lake',' Kandawgyi Lake','Indawgyi Lake','Indawgyi Lake',3),(35,'Ngwe Saung Beach is located in which region of Myanmar?',' Rakhine State','Ayeyarwady Region ','Mon State','Ayeyarwady Region ',3),(36,'During which months does the hot season typically occur in Myanmar?',' November to February','June to September','March to May','March to May',3),(37,'Which university is considered the oldest and one of the most prestigious in Myanmar?','Yangon University','University of Computer Studies, Hpa-an','University of Medicine 1','Yangon University',3),(38,'What is the main focus of the curriculum at computer universities in Myanmar?','Civil Engineering','Electronic Enginerring',' Computer Science and Information Technology ',' Computer Science and Information Technology ',3),(39,'What is the term for kindergarten education in Myanmar?',' Pre-Primary School','KG (Kindergarten)','Junior School','KG (Kindergarten)',3),(40,'What is the meaning of \"exhausted\"?','Very tired ','Excited',' Bored','Very tired',3),(41,'Which ocean is the largest by surface area?','Atlantic Ocean','Pacific Ocean','Arctic Ocean','Pacific Ocean',3),(42,'What is the capital city of Myanmar?','Yangon','Mandalay','Naypyitaw','Naypyitaw',3),(43,'Which mountain is the highest in Myanmar?',' Mount Zwegabin',' Mount Popa','Hkakabo Razi ','Hkakabo Razi ',3),(44,'When did Myanmar gain independence from British colonial rule?','1974','1945','1948','1948',3),(45,'Which famous pagoda in Yangon is considered one of the most sacred Buddhist sites in Myanmar?','Shwedagon','Botataung','Mahamuni Pagoda','Shwedagon',3),(46,'What is the chemical symbol for gold?','Ag','Fe','Au','Au',1),(47,'Which planet is closest to the Sun?',' Venus','Mercury',' Mars','Mercury',1),(48,'How many bones are in the human body?','202','206','208','206',1),(49,'Which of the following is a synonym for \"benevolent\"?','Kind','Angry','Bitter','Kind',1),(50,'What is the opposite of \"ancient\"?','Old','Modern','Antique','Modern',1),(51,'What is the square root of 144?','10','11','12','12',1),(52,'If you divide 60 by 5, what is the result?','12','11','10','12',1),(53,'What is 8 cubed (8³)?','54','512','128','512',1),(54,'Solve for x: 2x + 3 = 9','x = 4','x = 2','x = 3','x = 3',1),(55,'What is the area of a rectangle with length 10 and width 4?','40','44','50','40',1),(56,'Which famous Myanmar actress is married to actor Pyay Ti Oo?','Thet Mon Myint','Eindra Kyaw Zin ','Soe Myat Thuzar','Eindra Kyaw Zin ',1),(57,'Who is known as a top Myanmar hip-hop artist?',' Zaw Win Htut','R Zarni','Sai Sai Kham Leng','Sai Sai Kham Leng',1),(58,'What do we call a picture on the computer screen that we click on to open a program?','icon','file','folder','icon',1),(59,'Which part of the computer is used to print documents?','monitor','printer','mouse','printer',1),(60,'What is the full form of USB?','United Storage Base','Unlimited Speed Base','Universal Serial Bus','Universal Serial Bus',1),(61,'The cave is sometimes used for ______ and religious ceremonies.','Medidation','Sports','Dancing','Medidation',2),(62,'Who was the last king of Myanmar?','King Thibaw','King Bayinnaung',' King Anawrahta','King Thibaw',2),(63,'What is Myanmar traditional form of dress called?','skirt','pants','longyi','longyi',2),(64,'Which region is famous for its floating gardens and leg-rowing fishermen?','Shan','Kayin','Rakhine','Shan',2),(65,'Which famous lake is located in Shan State?','Kandawgyi Lake','Taungthaman Lake',' Inle Lake',' Inle Lake',2),(66,'Which festival celebrates the Burmese New Year with water splashing?','Tazaungdaing','Thingyan','Waso','Thingyan',2),(67,'Which festival celebrates the Buddha birth, enlightenment, and passing?',' Kason Full Moon Festiva','Thingyan',' Tazaungdaing',' Kason Full Moon Festiva',2),(68,'If a pizza is cut into 8 slices and you eat 3 slices, how many slices are left?','4','5','6','5',2),(69,'What is half of 100?','25','75','50','50',2),(70,'If you have 5 toy cars and you get 3 more, how many toy cars do you have now?','8','7','6','8',2),(71,'What is the sum of the angles in a triangle?','270','360','180','180',2),(72,'If a book costs $10 and you have $25, how much money will you have left after buying the book?','$15','$10','$12','$15',2),(73,'The sun is shining _____.','softly','brightly','quickely','brightly',2),(74,'My favorite color is _____.','blcak','black','block','black',2),(75,'What is the longest bridge in Myanmar?','Pakokku Brigde','Thanlyin Bridge','Thanlwin Bridge','Pakokku Brigde',2),(76,'What is the former name of Yangon?','Rangoon','Mandalay','Naypyitaw','Rangoon',3),(77,'Which river runs through Yangon?','Chindwin River','Yangon River','Salween River','Yangon River',3),(78,'Which famous market is known for its local goods and souvenirs in Yangon?','Thiri Mingalar Market',' Mingalar Market','Bogyoke Aung San Market','Bogyoke Aung San Market',3),(79,'What is the name of the historic train station in Yangon?','Yangon Central Railway Station','Naypyidaw Railway Station','Mandalay Railway Station',' Yangon Central Railway Station',3),(80,'What is a common ingredient in Myanmar famous tea leaf salad?','Spinach','Tea leaves','Kale','Tea leaves',3),(81,'What is the solution to the equation 2x + 3 = 11?','4','2','5','4',3),(82,'What is the value of 2x-4 = 4?','4','-4','2','4',3),(83,'If a car travels 60 miles in 1 hour, how far will it travel in 3 hours?','120 miles','180 miles','60 miles','180 miles',3),(84,'If 5x = 20 , x is ?','4','5','6','4',3),(85,'The entrance examination for universities in Myanmar is called the ______.',' SAT','ACT',' Matriculation',' Matriculation',3),(86,'Students at the University of Computer Studies learn about ______ programming languages.','Computer','Cooking','Music ','Computer',3),(87,'Students at the University of Computer Studies often participate in ______ projects.','Group','Outdoor','Non of these','Group',3),(88,'Many students at UCSH enjoy exploring ______ in Hpa-An during weekends.','Nature','Shopping Malls','Urban areas','Nature',3),(89,'What is the famous cinema in Hpa-an?','TatNayWin','Mingalar','Cineplex','TatNayWin',3),(90,'Which cave near by University of Computer Studies, Hpa-an?','Saden Cave','Yathaypyan Cave','Ba Yin Nyi Cave','Yathaypyan Cave',3),(91,'If 4x = 20, x=?','2','5','4','5',1),(92,'Which device helps you click on things on the screen?','Mouse','Monitor','CPU','Mouse',2),(93,'What is the \"brain\" of the computer called?','CPU','Mouse','Monitor','CPU',1),(94,'What is the values of 3 square','9','10','11','9',1);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (24,'Shin Thant Aung','shinthanta06@gmail.com','123'),(34,'Host','admin@gmail.com','admin'),(35,'Aaron','aaron@gmail.com','aaron'),(36,'Aaron','aaron11@gmail.com','aaron'),(37,'mgmg','mgmg12@gmail.com','mgmg'),(38,'Kyal Sin Win','kyal@gmail.com','1234'),(39,'Zwe Thant Zin','zwe@gmail.com','111'),(40,'Thurein Soe','thureinsoe@gmail.com','123456'),(41,'winepyae','winepyae@gmail.com','winewine'),(42,'Mi Kay Thi Khaing','kaythi@gmail.com','123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-23 10:17:54
