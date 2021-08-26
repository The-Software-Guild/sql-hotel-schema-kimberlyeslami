-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: kimberlyeslamihoteldb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `room_has_reservations`
--

DROP TABLE IF EXISTS `room_has_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_has_reservations` (
  `Room_roomId` int NOT NULL,
  `Reservations_reservationId` int NOT NULL,
  `Reservations_Guest_guestId` int NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `totalRoomCost` DOUBLE NOT NULL,
  PRIMARY KEY (`Room_roomId`,`Reservations_reservationId`,`Reservations_Guest_guestId`),
  KEY `fk_Room_has_Reservations_Reservations1_idx` (`Reservations_reservationId`,`Reservations_Guest_guestId`),
  KEY `fk_Room_has_Reservations_Room1_idx` (`Room_roomId`),
  CONSTRAINT `fk_Room_has_Reservations_Reservations1` FOREIGN KEY (`Reservations_reservationId`, `Reservations_Guest_guestId`) REFERENCES `reservations` (`reservationId`, `Guest_guestId`),
  CONSTRAINT `fk_Room_has_Reservations_Room1` FOREIGN KEY (`Room_roomId`) REFERENCES `room` (`roomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_has_reservations`
--

LOCK TABLES `room_has_reservations` WRITE;
/*!40000 ALTER TABLE `room_has_reservations` DISABLE KEYS */;
INSERT INTO `room_has_reservations` VALUES (201,4,5,'2023-03-06','2023-03-07','199.99'),(202,7,7,'2023-03-29','2023-03-31','349.98'),(203,2,3,'2023-02-05','2023-02-10','999.95'),(203,21,5,'2023-09-13','2023-09-15','399.98'),(204,16,9,'2023-07-13','2023-07-14','184.99'),(301,9,9,'2023-04-09','2023-04-13','799.96'),(301,24,2,'2023-11-22','2023-11-25','599.97'),(302,6,6,'2023-03-18','2023-03-23','924.95'),(302,25,11,'2023-12-24','2023-12-28','699.96'),(303,18,3,'2023-07-28','2023-07-29','199.99'),(304,14,6,'2023-06-17','2023-06-18','184.99'),(401,11,11,'2023-05-30','2023-06-02','1,199.97'),(401,17,10,'2023-07-18','2023-07-21','1,259.97'),(401,22,4,'2023-11-22','2023-11-25','1,199.97');
/*!40000 ALTER TABLE `room_has_reservations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-23 17:18:07
