-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: kompanija
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
-- Table structure for table `korespodencija`
--

DROP TABLE IF EXISTS `korespodencija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korespodencija` (
  `text_poruke` text NOT NULL,
  `datum_poruke` date NOT NULL,
  `status_poruke` enum('Procitana','Neprocitana') NOT NULL,
  `posaljioc_poruke` varchar(45) NOT NULL,
  `primalac_poruke` varchar(45) NOT NULL,
  `id_poruke` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_poruke`),
  KEY `primalac_poruke_idx` (`primalac_poruke`),
  KEY `pošaljioc_poruke_idx` (`posaljioc_poruke`),
  CONSTRAINT `pošaljioc_poruke` FOREIGN KEY (`posaljioc_poruke`) REFERENCES `korisnik` (`korisnicko_ime`),
  CONSTRAINT `primalac_poruke` FOREIGN KEY (`primalac_poruke`) REFERENCES `korisnik` (`korisnicko_ime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korespodencija`
--

LOCK TABLES `korespodencija` WRITE;
/*!40000 ALTER TABLE `korespodencija` DISABLE KEYS */;
INSERT INTO `korespodencija` VALUES ('Ivane, zamoliio bih te za pomoc oko backup-a jucerasnje baze podataka. Bicu u kancelariji od 14 - 17h. Pozdrav.','2022-04-17','Procitana','milan1312','petrov97',1),('Milane, slobodan sam posle 16h, pa cu tad svratiti da ti pomognem. Vidimo se.','2022-04-17','Procitana','petrov97','milan1312',2),('Postovani Marko, saljem vam ovonedeljni izvestaj praktikanata, zajedno sa rang listom(ako vas zanima kriterijum na osnovu kojeg je sastavljena rang lista, javite i poslacu Vam). Srdacan pozdrav.','2022-04-18','Procitana','petrov97','markomark92',3),('Postovani Ivane, hvala na poslatom izvestaju. Mozete mi poslati kriterijum. Hvala unapred.','2022-04-18','Procitana','markomark92','petrov97',4),('Postovani Milane, prema 5 prethodnih nedeljnih izvestaja, pokazali ste se kao najvredniji praktikant u firmi. Svaka cast na trudu i zalaganju, samo tako nastavite! ','2022-04-20','Procitana','markomark92','milan1312',5),('Zahvaljujem se mnogo g. Marko. Potrudicu se da nastavim istim tempom i da rezultati budu sve bolji i bolji. Srdacan pozdrav.','2022-04-20','Neprocitana','milan1312','markomark92',6);
/*!40000 ALTER TABLE `korespodencija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korisnik` (
  `ime` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prezime` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `datum_rođenja` date NOT NULL,
  `email_adresa` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `korisnicko_ime` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kratka_biografija` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fotografija` varchar(200) NOT NULL,
  PRIMARY KEY (`korisnicko_ime`),
  FULLTEXT KEY `idx_description` (`kratka_biografija`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` VALUES ('Marko','Markovic','1992-05-10','markomm@gmail.com','markomark92','Rodjen u Beogradu 5.maja 1992.godine. Zavrsio ETS \"Rade Koncar\" i Elektrotehnicki fakultet.','https://website-api.medigroup.rs/uploads/doctors/3693.jpg'),('Milan','Djordjic','2002-12-13','milan131202@gmail.com','milan1312','Rodjen u Subotici 13.decembra 2002.godine. Zavrsio gimnaziju \"Svetozar Markovic\" u Subotici. Pohadja IT Akademiju, smer Pajton programiranje. Trenutno zaposlen kao praktikant u firmi. Bavi se amaterski šahom','https://i.ibb.co/34zLZKq/IMG-0468.jpg'),('Ivan','Petrov','1997-09-06','ivanpet1@gmail.com','petrov97','Rodjen u Dimitrovgradu 9.juna 1997.godine. Zavrsio srednju tehnicku skolu. Zavrsava master studije na Fakultetu Tehnickih Nauka, smer Racunarstvo i Automatika. Trenutno mentor praktikantima u firmi.','https://media-exp1.licdn.com/dms/image/C5603AQELhPa3hb5h2g/profile-displayphoto-shrink_200_200/0/1516544998591?e=1654128000&v=beta&t=MpfntEqXkABu42igQTs5gAV6nCCrnfcNxeROWqcqEjI');
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `myview`
--

DROP TABLE IF EXISTS `myview`;
/*!50001 DROP VIEW IF EXISTS `myview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `myview` AS SELECT 
 1 AS `ime`,
 1 AS `prezime`,
 1 AS `datum_rođenja`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `plate`
--

DROP TABLE IF EXISTS `plate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plate` (
  `datum_plate` date NOT NULL,
  `iznos_plate` int NOT NULL,
  `primalac_plate` varchar(45) NOT NULL,
  `tip_zaposlenja` varchar(45) NOT NULL,
  `status_plate` enum('Isplacena','Neisplacena') NOT NULL,
  PRIMARY KEY (`primalac_plate`),
  KEY `primalac_plate_idx` (`primalac_plate`),
  FULLTEXT KEY `idx_plata` (`tip_zaposlenja`),
  CONSTRAINT `primalac_plate` FOREIGN KEY (`primalac_plate`) REFERENCES `korisnik` (`korisnicko_ime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plate`
--

LOCK TABLES `plate` WRITE;
/*!40000 ALTER TABLE `plate` DISABLE KEYS */;
INSERT INTO `plate` VALUES ('2022-04-15',120000,'markomark92','Ugovor na odredjeno','Isplacena'),('2022-04-14',50000,'milan1312','Praksa','Isplacena'),('2022-04-20',100000,'petrov97','Ugovor na neodredjeno','Neisplacena');
/*!40000 ALTER TABLE `plate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'kompanija'
--
/*!50003 DROP FUNCTION IF EXISTS `broj_poruka` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `broj_poruka`(p_id varchar(20)) RETURNS int
    DETERMINISTIC
BEGIN

RETURN ( SELECT count(*) FROM korespodencija where primalac_poruke=p_id) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `new_function` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `new_function`(p_id varchar(20)) RETURNS int
    DETERMINISTIC
BEGIN

RETURN ( SELECT count(*) FROM korespodencija where primalac_poruke=p_id) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_korisnik` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_korisnik`(p_korisnicko Varchar(20))
BEGIN
    delete from korisnik where korisnicko_ime=p_korisnicko;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_plate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_plate`(p_primalac Varchar(20))
BEGIN
    delete from plate where primalac_plate=p_primalac;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_poruke` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_poruke`(p_id int)
BEGIN
    delete from korespodencija where p_id=id_poruke;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_korisnik` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_korisnik`(IN p_ime varchar(20), IN p_prezime varchar(20),IN p_datum date, IN p_email Varchar(45), 
p_korisnicko Varchar(20), p_biografija tinytext, p_fotografija Varchar(200))
BEGIN
    insert into korisnik(ime, prezime, datum_rođenja, email_adresa, korisnicko_ime, kratka_biografija, fotografija) 
    values (p_ime, p_prezime, p_datum, p_email, 
p_korisnicko, p_biografija, p_fotografija);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_plate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_plate`(IN p_datum_plate date, IN p_iznos_plate int, IN p_primalac_plate varchar(20), IN p_tip_zaposlenja Varchar(45), 
p_status_plate enum('Isplacena','Neisplacena'))
BEGIN
    insert into plate(datum_plate, iznos_plate, primalac_plate, tip_zaposlenja, status_plate) 
    values (p_datum_plate, p_iznos_plate, p_primalac_plate, p_tip_zaposlenja, p_status_plate);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_poruke` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_poruke`(IN p_text_poruke text, IN p_datum_poruke date, IN p_status_poruke enum('Procitana','Neprocitana'),
 IN p_posaljioc_poruke varchar(45), IN p_primalac_poruke Varchar(45))
BEGIN
    insert into korespodencija(text_poruke, datum_poruke, status_poruke, posaljioc_poruke, primalac_poruke) 
    values (p_text_poruke, p_datum_poruke, p_status_poruke, p_posaljioc_poruke, p_primalac_poruke);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_korisnik` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_korisnik`(p_korisnicko Varchar(20), p_biografija tinytext)
BEGIN
    update korisnik set kratka_biografija=p_biografija where korisnicko_ime=p_korisnicko;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_plate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_plate`(p_primalac Varchar(20), p_iznos int)
BEGIN
    update plate set iznos_plate=p_iznos where primalac_plate=p_primalac;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_poruke` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_poruke`(p_tekst text, p_id int)
BEGIN
    update korespodencija set text_poruke=p_tekst where id_poruke=p_id;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `myview`
--

/*!50001 DROP VIEW IF EXISTS `myview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `myview` AS select `korisnik`.`ime` AS `ime`,`korisnik`.`prezime` AS `prezime`,`korisnik`.`datum_rođenja` AS `datum_rođenja` from `korisnik` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-30  5:19:55
