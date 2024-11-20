-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: instagram_db
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL DEFAULT (uuid()),
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `bio` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('a34d02ce-97dd-11ef-aa44-6fb230d7a8c2','judy','judy@example.com','hashed_password8','profile8.jpg','Bio of Judy','2024-10-31 23:12:45','2024-10-31 23:12:45',NULL,NULL),('c3500c2e-97d8-11ef-aa44-6fb230d7a8c2','alice','alice@example.com','hashed_password1','profile1.jpg','Bio of Alice','2024-10-31 22:37:51','2024-10-31 22:37:51',NULL,NULL),('c35014f8-97d8-11ef-aa44-6fb230d7a8c2','bob','bob@example.com','hashed_password2','profile2.jpg','Bio of Bob','2024-10-31 22:37:51','2024-10-31 22:37:51',NULL,NULL),('c3501818-97d8-11ef-aa44-6fb230d7a8c2','charlie','charlie@example.com','hashed_password3','profile3.jpg','Bio of Charlie','2024-10-31 22:37:51','2024-10-31 22:37:51',NULL,NULL),('c3501a48-97d8-11ef-aa44-6fb230d7a8c2','dave','dave@example.com','hashed_password4','profile4.jpg','Bio of Dave','2024-10-31 22:37:51','2024-10-31 22:37:51',NULL,NULL),('c3501c50-97d8-11ef-aa44-6fb230d7a8c2','eve','eve@example.com','hashed_password5','profile5.jpg','Bio of Eve','2024-10-31 22:37:51','2024-10-31 22:37:51',NULL,NULL),('c3501e4e-97d8-11ef-aa44-6fb230d7a8c2','frank','frank@example.com','hashed_password6','profile6.jpg','Bio of Frank','2024-10-31 22:37:51','2024-10-31 22:37:51',NULL,NULL),('c3502024-97d8-11ef-aa44-6fb230d7a8c2','grace','grace@example.com','hashed_password7','profile7.jpg','Bio of Grace','2024-10-31 22:37:51','2024-10-31 22:37:51',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20 13:08:29
