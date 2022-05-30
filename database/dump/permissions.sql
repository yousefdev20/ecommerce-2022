-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: 192.168.208.3    Database: iron
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'show_users','admin',NULL,NULL),(2,'delete_user','admin',NULL,NULL),(3,'add_users','admin',NULL,NULL),(4,'show_orders','admin',NULL,NULL),(5,'show_order_details','admin',NULL,NULL),(6,'edit_order','admin',NULL,NULL),(7,'show_invoice','admin',NULL,NULL),(8,'show_categories','admin',NULL,NULL),(9,'edit_category','admin',NULL,NULL),(10,'add_category','admin',NULL,NULL),(11,'delete_categories','admin',NULL,NULL),(12,'delete_color','admin',NULL,NULL),(13,'add_color','admin',NULL,NULL),(14,'show_colors','admin',NULL,NULL),(15,'edit_color','admin',NULL,NULL),(16,'edit_product','admin',NULL,NULL),(17,'add_products','admin',NULL,NULL),(18,'delete_products','admin',NULL,NULL),(19,'show_products','admin',NULL,NULL),(20,'show_admins','admin',NULL,NULL),(21,'add_admin','admin',NULL,NULL),(22,'edit_admin','admin',NULL,NULL),(23,'delete_admin','admin',NULL,NULL),(24,'show_reports','admin',NULL,NULL),(26,'show_exclusive_product','admin',NULL,NULL),(27,'show_deals','admin',NULL,NULL),(28,'show_currencies','admin',NULL,NULL),(29,'add_currency','admin',NULL,NULL),(30,'edit_currency','admin',NULL,NULL),(31,'delete_currency','admin',NULL,NULL),(32,'show_countries','admin',NULL,NULL),(33,'edit_country','admin',NULL,NULL),(34,'add_country','admin',NULL,NULL),(35,'delete_country','admin',NULL,NULL),(36,'show_medias','admin',NULL,NULL),(37,'delete_media','admin',NULL,NULL),(39,'show_roles','admin',NULL,NULL),(40,'show_session_recording','admin',NULL,NULL),(41,'edit_role','admin',NULL,NULL),(42,'add_role','admin',NULL,NULL),(43,'delete_role','admin',NULL,NULL),(44,'show_logs','admin',NULL,NULL),(45,'show_permissions','admin',NULL,NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 12:34:45
