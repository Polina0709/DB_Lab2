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
-- Table structure for table `stories`
--

DROP TABLE IF EXISTS `stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stories` (
  `id` char(36) NOT NULL DEFAULT (uuid()),
  `user_id` char(36) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `stories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `stories_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stories`
--

LOCK TABLES `stories` WRITE;
/*!40000 ALTER TABLE `stories` DISABLE KEYS */;
INSERT INTO `stories` VALUES ('eaaf4bc6-97d9-11ef-aa44-6fb230d7a8c2','c3500c2e-97d8-11ef-aa44-6fb230d7a8c2','story1.jpg','2024-11-01 22:46:07','2024-10-31 22:46:07','2024-10-31 22:46:07',NULL,NULL),('eaaf897e-97d9-11ef-aa44-6fb230d7a8c2','c35014f8-97d8-11ef-aa44-6fb230d7a8c2','story2.jpg','2024-11-01 22:46:07','2024-10-31 22:46:07','2024-10-31 22:46:07',NULL,NULL),('eaaf8bea-97d9-11ef-aa44-6fb230d7a8c2','c3501818-97d8-11ef-aa44-6fb230d7a8c2','story3.jpg','2024-11-01 22:46:07','2024-10-31 22:46:07','2024-10-31 22:46:07',NULL,NULL),('eaaf8d84-97d9-11ef-aa44-6fb230d7a8c2','c3501a48-97d8-11ef-aa44-6fb230d7a8c2','story4.jpg','2024-11-01 22:46:07','2024-10-31 22:46:07','2024-10-31 22:46:07',NULL,NULL),('eaaf8f00-97d9-11ef-aa44-6fb230d7a8c2','c3501c50-97d8-11ef-aa44-6fb230d7a8c2','story5.jpg','2024-11-01 22:46:07','2024-10-31 22:46:07','2024-10-31 22:46:07',NULL,NULL),('eaaf907c-97d9-11ef-aa44-6fb230d7a8c2','c3501e4e-97d8-11ef-aa44-6fb230d7a8c2','story6.jpg','2024-11-01 22:46:07','2024-10-31 22:46:07','2024-10-31 22:46:07',NULL,NULL),('eaaf91da-97d9-11ef-aa44-6fb230d7a8c2','c3502024-97d8-11ef-aa44-6fb230d7a8c2','story7.jpg','2024-11-01 22:46:07','2024-10-31 22:46:07','2024-10-31 22:46:07',NULL,NULL);
/*!40000 ALTER TABLE `stories` ENABLE KEYS */;
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
