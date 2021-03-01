-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: weather_api
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `weather_weatherresult`
--

DROP TABLE IF EXISTS `weather_weatherresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_weatherresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `response_json` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_weatherresult`
--

LOCK TABLES `weather_weatherresult` WRITE;
/*!40000 ALTER TABLE `weather_weatherresult` DISABLE KEYS */;
INSERT INTO `weather_weatherresult` VALUES (3,'{\"coord\": {\"lon\": 27.2129, \"lat\": -25.6954}, \"weather\": [{\"id\": 803, \"main\": \"Clouds\", \"description\": \"broken clouds\", \"icon\": \"04d\"}], \"base\": \"stations\", \"main\": {\"temp\": 40.33, \"feels_like\": 23.29, \"temp_min\": 23.33, \"temp_max\": 23.33, \"pressure\": 1013, \"humidity\": 47, \"sea_level\": 1013, \"grnd_level\": 876}, \"visibility\": 10000, \"wind\": {\"speed\": 0.67, \"deg\": 94}, \"clouds\": {\"all\": 57}, \"dt\": 1614526960, \"sys\": {\"country\": \"ZA\", \"sunrise\": 1614485087, \"sunset\": 1614530576}, \"timezone\": 7200, \"id\": 958724, \"name\": \"Rustenburg\", \"cod\": 200}'),(4,'{\"coord\": {\"lon\": 27.2129, \"lat\": -25.6954}, \"weather\": [{\"id\": 803, \"main\": \"Clouds\", \"description\": \"broken clouds\", \"icon\": \"04d\"}], \"base\": \"stations\", \"main\": {\"temp\": 0.33, \"feels_like\": 23.29, \"temp_min\": 23.33, \"temp_max\": 23.33, \"pressure\": 1013, \"humidity\": 47, \"sea_level\": 1013, \"grnd_level\": 876}, \"visibility\": 10000, \"wind\": {\"speed\": 0.67, \"deg\": 46}, \"clouds\": {\"all\": 57}, \"dt\": 1614526960, \"sys\": {\"country\": \"ZA\", \"sunrise\": 1614485087, \"sunset\": 1614530576}, \"timezone\": 7200, \"id\": 958724, \"name\": \"Rustenburg\", \"cod\": 200}'),(5,'{\"coord\": {\"lon\": 27.2104,\"lat\": -25.6955},\"weather\": [{\"id\": 500,\"main\": \"Rain\",\"description\": \"light rain\",\"icon\": \"10d\"}],\"base\": \"stations\",\"main\": {\"temp\": 25.31,\"feels_like\": 23.6,\"temp_min\": 25.31,\"temp_max\": 25.31,\"pressure\": 1015,\"humidity\": 41,\"sea_level\": 1015,\"grnd_level\": 876},\"visibility\": 10000,\"wind\": {\"speed\": 2.95,\"deg\": 1},\"rain\": {\"1h\": 0.11},\"clouds\": {\"all\": 25},\"dt\": 1614513916,\"sys\": {\"country\": \"ZA\",\"sunrise\": 1614485088,\"sunset\": 1614530577},\"timezone\": 7200,\"id\": 958724,\"name\": \"Rustenburg\",\"cod\": 200}'),(6,'{\"coord\": {\"lon\": 27.2129, \"lat\": -25.6954}, \"weather\": [{\"id\": 800, \"main\": \"Clear\", \"description\": \"clear sky\", \"icon\": \"01n\"}], \"base\": \"stations\", \"main\": {\"temp\": 18.2, \"feels_like\": 16.84, \"temp_min\": 18.2, \"temp_max\": 18.2, \"pressure\": 1017, \"humidity\": 50, \"sea_level\": 1017, \"grnd_level\": 878}, \"visibility\": 10000, \"wind\": {\"speed\": 1.15, \"deg\": 359}, \"clouds\": {\"all\": 0}, \"dt\": 1614537167, \"sys\": {\"country\": \"ZA\", \"sunrise\": 1614485087, \"sunset\": 1614530576}, \"timezone\": 7200, \"id\": 958724, \"name\": \"Rustenburg\", \"cod\": 200}');
/*!40000 ALTER TABLE `weather_weatherresult` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-01  9:51:38
