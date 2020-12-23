-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rezerwacja_restauracji
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `klienci`
--

DROP TABLE IF EXISTS `klienci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klienci` (
  `id_klienta` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `nr_tel` varchar(15) NOT NULL,
  PRIMARY KEY (`id_klienta`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klienci`
--

LOCK TABLES `klienci` WRITE;
/*!40000 ALTER TABLE `klienci` DISABLE KEYS */;
INSERT INTO `klienci` VALUES (1,'Jan','Kowalski','607965465'),(2,'Anna','Nowak','873973036'),(3,'Tomasz','Kot','435296909'),(4,'Erik','Romanow','+7 6438345'),(5,'Jagoda','Mazur','743826522'),(6,'Natalia','Nałkowska','836926534'),(7,'Tadeusz','Norek','690345132'),(8,'Milena','Len','+49 6546543');
/*!40000 ALTER TABLE `klienci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezerwacje`
--

DROP TABLE IF EXISTS `rezerwacje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezerwacje` (
  `nr_rezerwacji` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `godzina` time NOT NULL,
  `liczba_osob` int NOT NULL,
  `klient` int NOT NULL,
  PRIMARY KEY (`nr_rezerwacji`),
  KEY `klient` (`klient`),
  CONSTRAINT `rezerwacje_ibfk_1` FOREIGN KEY (`klient`) REFERENCES `klienci` (`id_klienta`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezerwacje`
--

LOCK TABLES `rezerwacje` WRITE;
/*!40000 ALTER TABLE `rezerwacje` DISABLE KEYS */;
INSERT INTO `rezerwacje` VALUES (1,'2015-05-19','18:00:00',5,1),(2,'2016-10-21','10:00:00',10,3),(3,'2016-12-01','15:00:00',4,2),(4,'2017-03-08','14:30:00',8,2),(5,'2017-12-06','10:00:00',12,8),(6,'2018-06-13','16:00:00',3,4),(7,'2018-08-15','12:30:00',12,5),(8,'2019-04-22','19:00:00',6,8),(9,'2019-11-01','13:00:00',25,6),(10,'2020-07-01','18:00:00',100,7),(11,'2020-08-20','12:00:00',2,7),(12,'2020-10-11','11:00:00',6,3),(13,'2020-12-01','16:30:00',4,8),(14,'2020-12-01','17:00:00',3,2);
/*!40000 ALTER TABLE `rezerwacje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sekcje`
--

DROP TABLE IF EXISTS `sekcje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sekcje` (
  `id_sekcji` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) NOT NULL,
  `ilosc_stolikow` int NOT NULL,
  `lokalizacja` varchar(100) NOT NULL,
  PRIMARY KEY (`id_sekcji`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekcje`
--

LOCK TABLES `sekcje` WRITE;
/*!40000 ALTER TABLE `sekcje` DISABLE KEYS */;
INSERT INTO `sekcje` VALUES (1,'Sala Główna',20,'Parter'),(2,'Sala Weselna',50,'Parter'),(3,'Pokoje Prywatne',4,'Pierwsze piętro'),(4,'Sala Konferencyjna',3,'Pierwsze piętro'),(5,'Taras',10,'Pierwsze piętro'),(6,'Ogród',20,'Plener');
/*!40000 ALTER TABLE `sekcje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stoliki`
--

DROP TABLE IF EXISTS `stoliki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stoliki` (
  `nr_stolika` char(4) NOT NULL,
  `ilosc_miejsc` int NOT NULL,
  `sekcja` int NOT NULL,
  PRIMARY KEY (`nr_stolika`),
  KEY `sekcja` (`sekcja`),
  CONSTRAINT `stoliki_ibfk_1` FOREIGN KEY (`sekcja`) REFERENCES `sekcje` (`id_sekcji`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stoliki`
--

LOCK TABLES `stoliki` WRITE;
/*!40000 ALTER TABLE `stoliki` DISABLE KEYS */;
INSERT INTO `stoliki` VALUES ('G009',6,1),('G012',5,1),('G013',5,1),('G019',5,1),('G020',4,1),('K002',10,4),('O015',6,6),('O020',4,6),('P001',12,3),('T001',2,6),('T007',7,5),('T010',5,6),('W035',8,2);
/*!40000 ALTER TABLE `stoliki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `szczegoly_rezerwacji`
--

DROP TABLE IF EXISTS `szczegoly_rezerwacji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `szczegoly_rezerwacji` (
  `id_szczegolow` int NOT NULL AUTO_INCREMENT,
  `rezerwacja` int NOT NULL,
  `typ` varchar(50) NOT NULL,
  `rodzaj` varchar(20) NOT NULL,
  `uczulenia` varchar(255) DEFAULT NULL,
  `preferencje` varchar(255) DEFAULT NULL,
  `uwagi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_szczegolow`),
  UNIQUE KEY `rezerwacja` (`rezerwacja`),
  CONSTRAINT `szczegoly_rezerwacji_ibfk_1` FOREIGN KEY (`rezerwacja`) REFERENCES `rezerwacje` (`nr_rezerwacji`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `szczegoly_rezerwacji`
--

LOCK TABLES `szczegoly_rezerwacji` WRITE;
/*!40000 ALTER TABLE `szczegoly_rezerwacji` DISABLE KEYS */;
INSERT INTO `szczegoly_rezerwacji` VALUES (8,2,'Rezerwacja indiwidualna','A la carte','Orzechy','Miejsce przy oknie',NULL),(9,5,'Przyjęcie urodzinowe','A la carte',NULL,NULL,NULL),(10,6,'Rezerwacja indiwidualna','A la carte','Gluten','Miejsce w zaciszu',NULL),(11,7,'Konferencja','Bufet',NULL,NULL,NULL),(12,9,'Bankiet firmowy','Bufet',NULL,NULL,NULL),(13,10,'Wesele','Bufet',NULL,NULL,NULL),(14,12,'Rezerwacja indiwidualna','A la carte','Laktoza',NULL,'Jedzenie wegańskie'),(15,14,'Rezerwacja indiwidualna','A la carte','Brak uczuleń','Brak preferencji','Brak uwag');
/*!40000 ALTER TABLE `szczegoly_rezerwacji` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_szczegoly_rezerwacji` BEFORE INSERT ON `szczegoly_rezerwacji` FOR EACH ROW BEGIN
  IF NEW.uczulenia is null
  THEN
    SET NEW.uczulenia = 'Brak uczuleń';
  END IF;    
  
  IF NEW.preferencje is null
  THEN
    SET NEW.preferencje = 'Brak preferencji';
  END IF;    
  
  IF NEW.uwagi is null
  THEN
    SET NEW.uwagi = 'Brak uwag';    
  END IF;
  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `zarezerwowane_stoliki`
--

DROP TABLE IF EXISTS `zarezerwowane_stoliki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zarezerwowane_stoliki` (
  `rezerwacja` int NOT NULL,
  `stolik` char(4) DEFAULT NULL,
  `sekcja` int DEFAULT NULL,
  `czas_zakonczenia` time DEFAULT NULL,
  KEY `rezerwacja` (`rezerwacja`),
  KEY `stolik` (`stolik`),
  CONSTRAINT `zarezerwowane_stoliki_ibfk_1` FOREIGN KEY (`rezerwacja`) REFERENCES `rezerwacje` (`nr_rezerwacji`),
  CONSTRAINT `zarezerwowane_stoliki_ibfk_2` FOREIGN KEY (`stolik`) REFERENCES `stoliki` (`nr_stolika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zarezerwowane_stoliki`
--

LOCK TABLES `zarezerwowane_stoliki` WRITE;
/*!40000 ALTER TABLE `zarezerwowane_stoliki` DISABLE KEYS */;
INSERT INTO `zarezerwowane_stoliki` VALUES (1,'G012',NULL,'20:03:00'),(2,'G012',NULL,'12:37:00'),(2,'G013',NULL,'12:37:00'),(3,'T010',NULL,'16:40:00'),(4,'G019',NULL,'17:05:00'),(4,'G020',NULL,'17:05:00'),(5,'P001',NULL,'13:00:00'),(6,'O020',NULL,'17:42:00'),(7,NULL,4,'15:00:00'),(8,'O015',NULL,'20:25:00'),(9,NULL,1,'21:00:00'),(10,NULL,2,'24:00:00'),(11,'T001',NULL,'14:07:00'),(12,'G009',NULL,'12:58:00'),(13,'G012',NULL,NULL);
/*!40000 ALTER TABLE `zarezerwowane_stoliki` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_zarezerwowane_stoliki` BEFORE INSERT ON `zarezerwowane_stoliki` FOR EACH ROW BEGIN
IF new.stolik in (select stolik from zarezerwowane_stoliki zs, rezerwacje r where r.nr_rezerwacji=zs.rezerwacja and czas_zakonczenia is null and sekcja is null)
  THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stolik jest obecnie zajęty. Wybierz inny stolik.';
  END IF;
  
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'rezerwacja_restauracji'
--

--
-- Dumping routines for database 'rezerwacja_restauracji'
--
/*!50003 DROP FUNCTION IF EXISTS `ilosc_rezerwacji` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ilosc_rezerwacji`() RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE ile INT;
    SELECT COUNT(*) INTO @ile FROM rezerwacje;
    RETURN @ile;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sredni_czas_rezerwacji` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sredni_czas_rezerwacji`()
BEGIN
SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(zs.czas_zakonczenia,r.godzina)))/count(r.nr_rezerwacji)) as średni_czas FROM zarezerwowane_stoliki zs, rezerwacje r where r.nr_rezerwacji=zs.rezerwacja and czas_zakonczenia is not null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 16:06:18
