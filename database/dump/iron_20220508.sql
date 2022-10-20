-- MySQL dump 10.13  Distrib 8.0.28, for Linux (aarch64)
--
-- Host: 192.168.32.2    Database: iron
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.8-MariaDB-1:10.5.8+maria~focal

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','admin@admin.com',NULL,'$2y$10$YLMr8eycnbkuPktHWydPneybrkkEFGCzc1lrwSdYRBIX257goDa3G',NULL,NULL,NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_addresses`
--

DROP TABLE IF EXISTS `billing_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billing_addresses_country_id_index` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_addresses`
--

LOCK TABLES `billing_addresses` WRITE;
/*!40000 ALTER TABLE `billing_addresses` DISABLE KEYS */;
INSERT INTO `billing_addresses` VALUES (1,'test','test','test','test','test','Florida','32824','test@test.com','123',NULL,NULL,'test',1,1,'2022-04-12 14:48:51','2022-04-12 14:48:51'),(2,'test','test','test','test','test','test','test','test@test.com','333333',NULL,NULL,'test',1,NULL,'2022-04-16 12:08:12','2022-04-16 12:08:12'),(3,'Test','Test','Test','Test','Test','Test','Test','Test@Test.com','1222122',NULL,NULL,'Test',1,3,'2022-04-16 12:10:52','2022-04-16 12:10:52'),(4,'Kurian','Verghser',NULL,'p o box','amman','amman',NULL,'verghesekurian@gmail.com','0553765449',NULL,NULL,NULL,1,NULL,'2022-04-21 06:44:14','2022-04-21 06:44:14'),(5,'test test','test test','test test','test test','test test','test test','32824','test@test.com','test test',NULL,NULL,'test',1,NULL,'2022-04-23 10:51:40','2022-04-23 10:51:40');
/*!40000 ALTER TABLE `billing_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_ar_unique` (`name_ar`),
  UNIQUE KEY `categories_name_en_unique` (`name_en`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'storage/categories/2022-04-12/JzLYHuxQDC4qMJgArmccxqv6aGULr0yLR4vafiKW.png',NULL,'كمبيوتر','Computer',1,NULL,'2022-04-12 21:35:03'),(2,'storage/categories/2022-04-12/hPPzynW2MTlKgQQiH9eLdo2chxkprcO3EHdLViRR.png',1,'Test','Test',2,'2022-04-12 14:46:24','2022-04-12 14:46:24'),(3,'storage/categories/2022-04-12/ji0CDSXWFjsxc5AMjmjX6S5iYUu1asfNClehybEY.png',NULL,'Category1','Category',1,'2022-04-12 14:46:42','2022-04-12 14:46:42'),(4,'storage/categories/2022-04-20/1gCPN1DdRJeSkiJMRQnumgw4RUK6Aj8xv8OwNRqa.png',NULL,'قمصان','Shirts',1,'2022-04-20 06:21:54','2022-04-20 06:21:54');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_coupon`
--

DROP TABLE IF EXISTS `category_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_coupon` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_coupon_category_id_index` (`category_id`),
  KEY `category_coupon_coupon_id_foreign` (`coupon_id`),
  CONSTRAINT `category_coupon_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `category_coupon_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupon_codes` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_coupon`
--

LOCK TABLES `category_coupon` WRITE;
/*!40000 ALTER TABLE `category_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `colors_name_ar_unique` (`name_ar`),
  UNIQUE KEY `colors_name_en_unique` (`name_en`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'احمر','Red','Red',NULL,'2022-04-14 08:01:28'),(2,'Black','Black','Black','2022-04-12 14:45:26','2022-04-12 14:45:26'),(3,'White','White','White','2022-04-12 14:45:34','2022-04-12 14:45:34'),(4,'Green','Green','Green','2022-04-12 14:45:43','2022-04-12 14:45:43'),(5,'Blue','Blue','Blue','2022-04-12 14:45:50','2022-04-12 14:45:50'),(6,'Brown','Brown','Brown','2022-04-12 14:46:06','2022-04-12 14:46:06');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_us` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us`
--

LOCK TABLES `contact_us` WRITE;
/*!40000 ALTER TABLE `contact_us` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `countries_name_en_index` (`name_en`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Jordan','Jordan','Jordan','Jordan','2022-04-12 14:48:20','2022-04-12 14:48:20');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_codes`
--

DROP TABLE IF EXISTS `coupon_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_codes_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_codes`
--

LOCK TABLES `coupon_codes` WRITE;
/*!40000 ALTER TABLE `coupon_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currencies_name_ar_unique` (`name_ar`),
  UNIQUE KEY `currencies_name_en_unique` (`name_en`),
  UNIQUE KEY `currencies_code_ar_unique` (`code_ar`),
  UNIQUE KEY `currencies_code_en_unique` (`code_en`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'الاردن','Jordan','د.ا','JOD',0.72,NULL,NULL),(2,'USD','USD','USD','USD',1.00,NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_product`
--

DROP TABLE IF EXISTS `deal_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal_product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_product_product_id_index` (`product_id`),
  KEY `deal_product_deal_id_foreign` (`deal_id`),
  CONSTRAINT `deal_product_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deal_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_product`
--

LOCK TABLES `deal_product` WRITE;
/*!40000 ALTER TABLE `deal_product` DISABLE KEYS */;
INSERT INTO `deal_product` VALUES (2,2,1,NULL,NULL),(3,2,2,NULL,NULL),(4,2,3,NULL,NULL);
/*!40000 ALTER TABLE `deal_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deals`
--

DROP TABLE IF EXISTS `deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `expiration_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deals_expiration_date_index` (`expiration_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deals`
--

LOCK TABLES `deals` WRITE;
/*!40000 ALTER TABLE `deals` DISABLE KEYS */;
INSERT INTO `deals` VALUES (2,'2022-10-19 09:59:00','2022-04-12 14:50:55','2022-04-12 14:50:55');
/*!40000 ALTER TABLE `deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exclusive_products`
--

DROP TABLE IF EXISTS `exclusive_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exclusive_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `expiration_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exclusive_products_product_id_foreign` (`product_id`),
  CONSTRAINT `exclusive_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exclusive_products`
--

LOCK TABLES `exclusive_products` WRITE;
/*!40000 ALTER TABLE `exclusive_products` DISABLE KEYS */;
INSERT INTO `exclusive_products` VALUES (1,1,'2022-12-31 10:59:00','2022-04-12 14:49:54','2022-04-12 14:49:54');
/*!40000 ALTER TABLE `exclusive_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
INSERT INTO `failed_jobs` VALUES (1,'293d3f7b-c735-42f0-8fba-011d62799941','redis','default','{\"uuid\":\"293d3f7b-c735-42f0-8fba-011d62799941\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"YzttWEljkrAqrzYlqQdWPvQU23YK2yps\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-12 14:48:53'),(2,'4200149f-00dc-4d78-8731-62b8c6b2caf8','redis','default','{\"uuid\":\"4200149f-00dc-4d78-8731-62b8c6b2caf8\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"bz4heIrerhgm96VstzLsioIIu9QRprJt\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-12 15:44:45'),(3,'ba354770-9009-4b94-a267-8a2c22526ad8','redis','default','{\"uuid\":\"ba354770-9009-4b94-a267-8a2c22526ad8\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"Arm6fBwwyoiMK3pRon4u99aYACuBeyE6\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-12 15:45:03'),(4,'b0d91053-8744-41c7-ba0d-d45d24c339a0','redis','default','{\"uuid\":\"b0d91053-8744-41c7-ba0d-d45d24c339a0\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"uuPn4zU4dCiIxD6VPhLF43q7v7By0jya\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-12 21:17:08'),(5,'3444e0a8-24b9-444c-99dd-ee9f63b257e2','redis','default','{\"uuid\":\"3444e0a8-24b9-444c-99dd-ee9f63b257e2\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"XjjF9EB1fLrVvxNxRPO1Hu0Y39VkTZDs\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-12 21:17:20'),(6,'948f5877-61cd-4a59-ba4e-7223368d6296','redis','default','{\"uuid\":\"948f5877-61cd-4a59-ba4e-7223368d6296\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"85bpvu9e01LW0k0EY8LKGJsypkupCfxj\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-12 21:22:12'),(7,'6d0a920f-16da-46f5-91ef-38ed9b1279fc','redis','default','{\"uuid\":\"6d0a920f-16da-46f5-91ef-38ed9b1279fc\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"al2CRO4q69dmLUZBLe2Q9eqKc0zHxEtn\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-12 21:32:34'),(8,'883e22fb-3713-4150-a3e2-2ff1fee2e0a6','redis','default','{\"uuid\":\"883e22fb-3713-4150-a3e2-2ff1fee2e0a6\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"R2IUM7JuZSgAAWRQNm4chWDlBpjFgLbR\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-13 05:58:56'),(9,'ac501b8c-42da-448a-b0ee-0965fa61220b','redis','default','{\"uuid\":\"ac501b8c-42da-448a-b0ee-0965fa61220b\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"qEPkWReZvguQ534wCM0sRUYS7a0ZiZrb\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-14 15:37:24'),(10,'5823b91c-ecb2-4d51-bb3f-b4fca7ee332a','redis','default','{\"uuid\":\"5823b91c-ecb2-4d51-bb3f-b4fca7ee332a\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"lzBnUauW9rfE399ftTLHCMzoS6MLXAjZ\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-14 15:39:15'),(11,'4585845d-c162-4a36-a17a-b7a789b18c3e','redis','default','{\"uuid\":\"4585845d-c162-4a36-a17a-b7a789b18c3e\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:11;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"hNHHwRzmRVOfPUtKgmqyyG7lVDJobxPE\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-14 20:04:25'),(12,'b450e9a1-612f-48d6-88c1-5282b8ce7509','redis','default','{\"uuid\":\"b450e9a1-612f-48d6-88c1-5282b8ce7509\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"TzrPm9SFa141nzfUDbABHPDiF9W206N7\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-14 20:23:22'),(13,'cd6f6a10-98cd-4a7c-b553-09a7bdd13e5a','redis','default','{\"uuid\":\"cd6f6a10-98cd-4a7c-b553-09a7bdd13e5a\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"iw9tDRdNO1jLbG2uymKGmBXIM2eNLhQj\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-16 12:08:14'),(14,'b45079e3-29f0-47c3-b6f1-d7bc0f04be71','redis','default','{\"uuid\":\"b45079e3-29f0-47c3-b6f1-d7bc0f04be71\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"X9RbCgjJwSTBq1Gkc9aZyqsTtSbi5TWg\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-16 12:10:53'),(15,'9f38d6c5-545b-4211-820d-8fb46c49adcc','redis','default','{\"uuid\":\"9f38d6c5-545b-4211-820d-8fb46c49adcc\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"VdTZtPA2U9FramctQVv8vr8A1FtdBa0k\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-21 06:44:15'),(16,'49fdcb22-21b5-4f4f-97cf-37f5cb85aae4','redis','default','{\"uuid\":\"49fdcb22-21b5-4f4f-97cf-37f5cb85aae4\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:16;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"7UKjCxrnW1bqgTZuREbTP8TL71PoQdwy\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-04-23 10:51:41'),(17,'af24274c-b6a2-48c1-9a55-c524c57cacd8','redis','default','{\"uuid\":\"af24274c-b6a2-48c1-9a55-c524c57cacd8\",\"displayName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\",\"command\":\"O:52:\\\"App\\\\Jobs\\\\Orders\\\\Mail\\\\SendOrderCreatedSuccessfullyJob\\\":11:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";i:17;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"IFHlaQKG2QWpCypZwvKR0vROQvnj5pMF\",\"attempts\":0}','ErrorException: Undefined property: Illuminate\\Database\\Eloquent\\Relations\\BelongsTo::$email in /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php:41\nStack trace:\n#0 /var/www/html/Iron/app/Jobs/Orders/Mail/SendOrderCreatedSuccessfullyJob.php(41): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Orders\\Mail\\SendOrderCreatedSuccessfullyJob->handle()\n#2 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/html/Iron/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/html/Iron/vendor/symfony/console/Application.php(1015): Illuminate\\Console\\Command->run()\n#30 /var/www/html/Iron/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/html/Iron/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/html/Iron/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/html/Iron/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}','2022-05-07 08:55:31');
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_user_id_foreign` (`user_id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  KEY `invoices_id_index` (`id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,1,7,'2022-04-12 21:33:56','2022-04-12 21:33:56'),(2,1,1,'2022-04-14 08:00:47','2022-04-14 08:00:47');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'english','en','test','ltr',1,NULL,NULL),(2,'arabic','ar','test','ltr',1,NULL,NULL);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logs_user_id_foreign` (`user_id`),
  CONSTRAINT `logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'public/media/2022-04-14/CMN5dnRzo9ndrI90mibaEk01qjAge9wxO7TxQUOv.jpg',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_02_03_082939_create_sizes_table',1),(6,'2022_02_03_093833_create_products_table',1),(7,'2022_02_03_101346_create_product_descriptions_table',1),(8,'2022_02_03_102509_create_colors_table',1),(9,'2022_02_03_103345_create_product_sizes_table',1),(10,'2022_02_03_103906_create_product_colors_table',1),(11,'2022_02_03_110600_create_currencies_table',1),(12,'2022_02_03_111219_create_categories_table',1),(13,'2022_02_03_111640_create_orders_table',1),(14,'2022_02_03_112252_create_billing_addresses_table',1),(15,'2022_02_03_112314_create_shipping_addresses_table',1),(16,'2022_02_03_114617_create_coupon_codes_table',1),(17,'2022_02_03_130123_create_category_coupon_table',1),(18,'2022_02_03_130708_create_order_product_table',1),(19,'2022_02_03_130829_create_workflows_table',1),(20,'2022_02_03_131032_create_product_images_table',1),(21,'2022_02_03_170535_add_foreign_keys_to_products_table',1),(22,'2022_02_05_144017_add_foreign_keys_to_product_sizes_table',1),(23,'2022_02_05_144231_add_foreign_keys_to_product_color_table',1),(24,'2022_02_05_144408_add_foreign_keys_to_orders_table',1),(25,'2022_02_05_144834_add_foreign_keys_to_category_coupon_table',1),(26,'2022_02_05_145107_add_foreign_keys_to_order_product_table',1),(27,'2022_02_05_145134_add_foreign_keys_to_product_images_table',1),(28,'2022_02_05_161849_create_admins_table',1),(29,'2022_02_09_093611_create_deals_table',1),(30,'2022_02_09_095839_create_deal_product_table',1),(31,'2022_02_09_110416_add_foreign_keys_to_deal_product_table',1),(32,'2022_02_15_090357_create_product_favorites_table',1),(33,'2022_03_02_092849_create_countries_table',1),(34,'2022_03_05_162203_create_contact_us_table',1),(35,'2022_03_14_152239_create_exclusive_products_table',1),(36,'2022_03_18_211640_create_sliders_table',1),(37,'2022_03_21_122735_create_reports_table',1),(38,'2022_03_23_065911_create_media_table',1),(39,'2022_03_24_084839_create_packages_table',1),(40,'2022_03_24_085118_add_foreign_key_package_id_to_products_table',1),(41,'2022_03_24_085658_create_package_items_table',1),(42,'2022_03_25_221415_create_product_reviews_table',1),(43,'2022_04_02_172205_create_permission_tables',1),(44,'2022_04_02_195753_create_invoices_table',1),(45,'2022_04_17_074847_create_logs_table',2),(46,'2022_04_17_082512_create_jobs_table',2),(47,'2022_04_22_061025_create_settings_table',2),(48,'2022_04_22_061502_create_languages_table',2),(49,'2022_04_24_081306_create_product_size_color_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `color_id` bigint(20) unsigned DEFAULT NULL,
  `size_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_index` (`order_id`),
  KEY `order_product_product_id_index` (`product_id`),
  KEY `order_product_color_id_foreign` (`color_id`),
  KEY `order_product_size_id_foreign` (`size_id`),
  CONSTRAINT `order_product_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_product_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,1,3,NULL,NULL,NULL,NULL),(2,1,3,NULL,NULL,NULL,NULL),(3,1,3,NULL,NULL,NULL,NULL),(4,1,3,NULL,NULL,NULL,NULL),(5,1,3,NULL,NULL,NULL,NULL),(6,1,3,NULL,NULL,NULL,NULL),(75,7,1,1,2,NULL,NULL),(76,7,8,1,3,NULL,NULL),(77,8,8,1,3,NULL,NULL),(78,8,8,1,3,NULL,NULL),(79,8,8,6,3,NULL,NULL),(80,8,8,6,3,NULL,NULL),(81,8,8,2,3,NULL,NULL),(82,8,8,2,3,NULL,NULL),(83,9,1,NULL,NULL,NULL,NULL),(84,9,1,NULL,NULL,NULL,NULL),(85,9,1,NULL,NULL,NULL,NULL),(86,9,1,NULL,NULL,NULL,NULL),(87,10,1,NULL,NULL,NULL,NULL),(88,10,1,NULL,NULL,NULL,NULL),(89,10,1,NULL,NULL,NULL,NULL),(90,10,1,NULL,NULL,NULL,NULL),(91,11,1,NULL,NULL,NULL,NULL),(92,11,1,NULL,NULL,NULL,NULL),(93,12,4,NULL,NULL,NULL,NULL),(94,12,4,NULL,NULL,NULL,NULL),(95,12,5,NULL,NULL,NULL,NULL),(96,12,5,NULL,NULL,NULL,NULL),(97,12,6,NULL,NULL,NULL,NULL),(98,12,2,1,3,NULL,NULL),(99,12,2,1,3,NULL,NULL),(100,12,2,1,3,NULL,NULL),(101,12,2,1,3,NULL,NULL),(102,12,2,1,3,NULL,NULL),(103,12,2,1,3,NULL,NULL),(104,12,2,1,3,NULL,NULL),(105,12,2,1,3,NULL,NULL),(106,12,2,1,3,NULL,NULL),(107,12,2,1,3,NULL,NULL),(108,12,2,1,3,NULL,NULL),(109,12,2,1,3,NULL,NULL),(110,12,2,1,3,NULL,NULL),(111,12,2,1,3,NULL,NULL),(112,12,2,1,3,NULL,NULL),(113,12,2,1,3,NULL,NULL),(114,12,2,1,3,NULL,NULL),(115,12,2,1,3,NULL,NULL),(116,12,2,1,3,NULL,NULL),(117,12,2,1,3,NULL,NULL),(118,12,2,1,3,NULL,NULL),(119,12,2,1,3,NULL,NULL),(120,12,2,1,3,NULL,NULL),(121,12,2,1,3,NULL,NULL),(122,12,2,1,3,NULL,NULL),(123,12,2,1,3,NULL,NULL),(124,12,2,1,3,NULL,NULL),(125,12,2,1,3,NULL,NULL),(126,12,2,1,3,NULL,NULL),(127,12,2,1,3,NULL,NULL),(128,12,2,1,3,NULL,NULL),(129,12,2,1,3,NULL,NULL),(130,12,2,1,3,NULL,NULL),(131,12,2,1,3,NULL,NULL),(132,12,2,1,3,NULL,NULL),(133,12,2,1,3,NULL,NULL),(134,12,2,1,3,NULL,NULL),(135,12,2,1,3,NULL,NULL),(136,12,2,1,3,NULL,NULL),(137,12,2,1,3,NULL,NULL),(138,12,2,1,3,NULL,NULL),(139,12,2,1,3,NULL,NULL),(140,12,2,1,3,NULL,NULL),(141,12,2,1,3,NULL,NULL),(142,12,2,1,3,NULL,NULL),(143,12,2,1,3,NULL,NULL),(144,12,2,1,3,NULL,NULL),(145,12,2,1,3,NULL,NULL),(146,12,2,1,3,NULL,NULL),(147,12,2,1,3,NULL,NULL),(148,12,2,1,3,NULL,NULL),(149,12,2,1,3,NULL,NULL),(150,12,2,1,3,NULL,NULL),(151,12,2,1,3,NULL,NULL),(152,12,2,1,3,NULL,NULL),(153,12,2,1,3,NULL,NULL),(154,12,2,1,3,NULL,NULL),(155,12,2,1,3,NULL,NULL),(156,12,2,1,3,NULL,NULL),(157,12,2,1,3,NULL,NULL),(158,12,2,1,3,NULL,NULL),(159,12,2,1,3,NULL,NULL),(160,12,2,1,3,NULL,NULL),(161,12,2,1,3,NULL,NULL),(162,12,2,1,3,NULL,NULL),(163,12,2,1,3,NULL,NULL),(164,12,2,1,3,NULL,NULL),(165,12,2,1,3,NULL,NULL),(166,12,2,1,3,NULL,NULL),(167,12,2,1,3,NULL,NULL),(168,12,2,1,3,NULL,NULL),(169,12,2,1,3,NULL,NULL),(170,12,2,1,3,NULL,NULL),(171,12,2,1,3,NULL,NULL),(172,12,2,1,3,NULL,NULL),(173,12,2,1,3,NULL,NULL),(174,12,2,1,3,NULL,NULL),(175,12,2,1,3,NULL,NULL),(176,12,2,1,3,NULL,NULL),(177,12,2,1,3,NULL,NULL),(178,12,2,1,3,NULL,NULL),(179,12,2,1,3,NULL,NULL),(180,12,2,1,3,NULL,NULL),(181,12,2,1,3,NULL,NULL),(182,12,2,1,3,NULL,NULL),(183,12,2,1,3,NULL,NULL),(184,12,2,1,3,NULL,NULL),(185,12,2,1,3,NULL,NULL),(186,12,2,1,3,NULL,NULL),(187,12,2,1,3,NULL,NULL),(188,12,2,1,3,NULL,NULL),(189,12,2,1,3,NULL,NULL),(190,12,2,1,3,NULL,NULL),(191,12,2,1,3,NULL,NULL),(192,12,2,1,3,NULL,NULL),(193,13,4,NULL,NULL,NULL,NULL),(194,13,4,NULL,NULL,NULL,NULL),(195,13,3,NULL,NULL,NULL,NULL),(196,13,3,NULL,NULL,NULL,NULL),(197,14,2,NULL,NULL,NULL,NULL),(198,14,2,NULL,NULL,NULL,NULL),(199,14,2,NULL,NULL,NULL,NULL),(200,15,10,1,NULL,NULL,NULL),(201,16,10,NULL,NULL,NULL,NULL),(202,16,10,NULL,NULL,NULL,NULL),(203,16,10,NULL,NULL,NULL,NULL),(204,16,10,NULL,NULL,NULL,NULL),(205,16,9,NULL,NULL,NULL,NULL),(206,16,9,NULL,NULL,NULL,NULL),(207,16,9,NULL,NULL,NULL,NULL),(208,16,9,NULL,NULL,NULL,NULL),(209,17,9,NULL,NULL,NULL,NULL),(210,17,8,NULL,NULL,NULL,NULL),(211,17,7,NULL,NULL,NULL,NULL),(212,17,6,NULL,NULL,NULL,NULL),(213,17,2,1,NULL,NULL,NULL),(214,17,2,1,NULL,NULL,NULL),(215,17,2,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `workflow_id` bigint(20) unsigned DEFAULT NULL,
  `coupon_id` bigint(20) unsigned DEFAULT NULL,
  `currency_id` bigint(20) unsigned NOT NULL,
  `shipping_address_id` bigint(20) unsigned DEFAULT NULL,
  `billing_address_id` bigint(20) unsigned DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `paid_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` enum('1','2','3','4','5','6','7') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_currency_id_index` (`currency_id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_workflow_id_foreign` (`workflow_id`),
  KEY `orders_coupon_id_foreign` (`coupon_id`),
  KEY `orders_shipping_address_id_foreign` (`shipping_address_id`),
  KEY `orders_billing_address_id_foreign` (`billing_address_id`),
  CONSTRAINT `orders_billing_address_id_foreign` FOREIGN KEY (`billing_address_id`) REFERENCES `billing_addresses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orders_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupon_codes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orders_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `orders_shipping_address_id_foreign` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_addresses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `orders_workflow_id_foreign` FOREIGN KEY (`workflow_id`) REFERENCES `workflows` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,NULL,NULL,2,NULL,1,390.00,'1','5',NULL,NULL,'2022-04-12 14:48:51','2022-04-14 08:00:47'),(2,1,NULL,NULL,1,NULL,1,1579.20,'0','1',NULL,NULL,'2022-04-12 15:44:44','2022-04-12 15:44:44'),(3,1,NULL,NULL,1,NULL,1,1579.20,'0','1',NULL,NULL,'2022-04-12 15:45:02','2022-04-12 15:45:02'),(4,1,NULL,NULL,2,NULL,1,534.00,'0','1',NULL,NULL,'2022-04-12 21:17:08','2022-04-12 21:17:08'),(5,1,NULL,NULL,2,NULL,1,534.00,'0','1',NULL,NULL,'2022-04-12 21:17:19','2022-04-12 21:17:19'),(6,1,NULL,NULL,1,NULL,1,682.60,'0','1',NULL,NULL,'2022-04-12 21:22:11','2022-04-12 21:22:11'),(7,1,NULL,NULL,2,NULL,1,271.11,'1','3',NULL,NULL,'2022-04-12 21:32:32','2022-04-12 21:33:56'),(8,1,NULL,NULL,1,NULL,1,1128.00,'0','1',NULL,NULL,'2022-04-13 05:58:54','2022-04-13 05:58:54'),(9,1,NULL,NULL,1,NULL,1,28.80,'0','1',NULL,NULL,'2022-04-14 15:37:22','2022-04-14 15:37:22'),(10,1,NULL,NULL,2,NULL,1,40.00,'0','1',NULL,NULL,'2022-04-14 15:39:13','2022-04-14 15:39:13'),(11,1,NULL,NULL,1,NULL,1,14.40,'0','1',NULL,NULL,'2022-04-14 20:04:22','2022-04-14 20:04:22'),(12,1,NULL,NULL,1,NULL,1,6193.60,'0','1',NULL,NULL,'2022-04-14 20:23:20','2022-04-14 20:23:20'),(13,NULL,NULL,NULL,1,NULL,2,267.60,'0','1',NULL,NULL,'2022-04-16 12:08:12','2022-04-16 12:08:12'),(14,3,NULL,NULL,1,NULL,3,181.44,'0','1',NULL,NULL,'2022-04-16 12:10:52','2022-04-16 12:10:52'),(15,NULL,NULL,NULL,1,NULL,4,120.00,'0','1',NULL,NULL,'2022-04-21 06:44:14','2022-04-21 06:44:14'),(16,NULL,NULL,NULL,1,NULL,5,872.00,'0','1',NULL,NULL,'2022-04-23 10:51:40','2022-04-23 10:51:40'),(17,1,NULL,NULL,1,NULL,1,672.44,'0','1',NULL,NULL,'2022-05-07 08:55:31','2022-05-07 08:55:31');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_items`
--

DROP TABLE IF EXISTS `package_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` bigint(20) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_items`
--

LOCK TABLES `package_items` WRITE;
/*!40000 ALTER TABLE `package_items` DISABLE KEYS */;
INSERT INTO `package_items` VALUES (10,1,'test','2022-05-07 08:56:58','2022-05-07 08:56:58'),(11,1,'tester','2022-05-07 08:56:58','2022-05-07 08:56:58'),(12,1,'item1','2022-05-07 08:56:58','2022-05-07 08:56:58');
/*!40000 ALTER TABLE `package_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `packages_product_id_foreign` (`product_id`),
  CONSTRAINT `packages_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,2,'2022-04-12 14:43:56','2022-04-12 14:43:56');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\Admin\\Admin',1,'admin','d483e3da211c5a64adc7e3f0960b0dec5965f7e68565904259eea3a318f97b3b','[\"*\"]','2022-04-12 14:40:40','2022-04-12 14:39:35','2022-04-12 14:40:40'),(2,'App\\Models\\Admin\\Admin',1,'admin','07364e1cbb18f2ed25d62dc9b3787f54226e6f7d096683a0962b1e7175df53f9','[\"*\"]','2022-04-12 21:18:34','2022-04-12 14:41:18','2022-04-12 21:18:34'),(3,'App\\Models\\User',1,'user','22204e89066377be915bf4af164e5aab7fa3d024e9f2ebf09a70976c40efdd32','[\"*\"]','2022-04-12 14:47:13','2022-04-12 14:42:39','2022-04-12 14:47:13'),(4,'App\\Models\\User',1,'user','37b7909ad0bc00d65546c13c4da32f3a2c3b626bb448e84d4c663fe16158e6ea','[\"*\"]','2022-04-12 15:46:39','2022-04-12 14:47:24','2022-04-12 15:46:39'),(5,'App\\Models\\User',1,'user','3ed15c935cb45c22e6456c0b0c4029dd36f892f0b1a7e4857e80c33a338eda34','[\"*\"]','2022-04-14 20:16:30','2022-04-12 15:27:56','2022-04-14 20:16:30'),(6,'App\\Models\\User',1,'user','5243a751f1c37ae77d0cdc577dee61099d5644c80a04a255da74c49b2111d0ea','[\"*\"]',NULL,'2022-04-12 15:47:30','2022-04-12 15:47:30'),(7,'App\\Models\\User',1,'user','d3be78f1e319b54a4478d464e8e0ff97c3881be6f1feb6dd092be476f6a23c83','[\"*\"]','2022-04-12 21:21:23','2022-04-12 19:25:54','2022-04-12 21:21:23'),(8,'App\\Models\\Admin\\Admin',1,'admin','205c6dc33fea228fb04635b6476a5cb39b6aac005589799ebc9dae77068da7aa','[\"*\"]','2022-04-14 07:58:11','2022-04-12 21:21:14','2022-04-14 07:58:11'),(9,'App\\Models\\User',1,'user','b78b53401548a1fceeed66388bdd562c2125d3e3921c7f3a8f3edbf040e172c8','[\"*\"]','2022-04-12 21:25:43','2022-04-12 21:21:44','2022-04-12 21:25:43'),(10,'App\\Models\\User',1,'user','738a1f91e8bb5a81a8d6d4e4f2e0a3bebfb7cf957c946dfef41bcf02d55facca','[\"*\"]','2022-04-13 18:03:12','2022-04-12 21:32:20','2022-04-13 18:03:12'),(11,'App\\Models\\User',2,'user','5ecc105d787f0474e7b868329d81b24649409fc315743d6c40635c9a4cf6449f','[\"*\"]','2022-04-13 08:49:23','2022-04-13 08:48:51','2022-04-13 08:49:23'),(12,'App\\Models\\User',2,'user','d454febb3c41592d899d0b7b02ec3c3a6d07487352f59fb02b2ab88931267670','[\"*\"]','2022-04-13 08:51:06','2022-04-13 08:50:43','2022-04-13 08:51:06'),(13,'App\\Models\\User',2,'user','b58604eee2d15dabfb5adb4028369bcf147b84583dd07d4dd1cfed603530d59d','[\"*\"]','2022-04-13 11:02:28','2022-04-13 08:51:25','2022-04-13 11:02:28'),(14,'App\\Models\\User',1,'user','3cd71385b1a2a297abefef3cf3574513c843681332c749fb680d9c989c92022a','[\"*\"]','2022-04-14 07:59:32','2022-04-13 18:05:49','2022-04-14 07:59:32'),(15,'App\\Models\\Admin\\Admin',1,'admin','4ab550b08694f6a3ae04c69bab39e1831c5aa09052863974c0042c3b56fddb41','[\"*\"]','2022-04-20 08:56:00','2022-04-14 07:58:42','2022-04-20 08:56:00'),(16,'App\\Models\\User',1,'user','bbbf6760d0dcfe903c5e607228c2c4ab089ef933d2f837cd2b1e1fd967722977','[\"*\"]','2022-04-15 11:30:03','2022-04-14 07:59:37','2022-04-15 11:30:03'),(17,'App\\Models\\User',1,'user','e6e8f1385e7a90eef1ae3cb34a10f354888c55d24dc9e9ebce6a6e6b207d5a8a','[\"*\"]',NULL,'2022-04-14 20:16:40','2022-04-14 20:16:40'),(18,'App\\Models\\User',1,'user','dcbf6d2910cc3efd86bc1fa6c1650ed5cdc90fed20e99119537f514f11ced6c2','[\"*\"]','2022-04-14 20:17:03','2022-04-14 20:16:52','2022-04-14 20:17:03'),(19,'App\\Models\\User',1,'user','3a1f4e3aaffca17b383b80aaf6df9d967bbde8c0db69fa7534f065481f8d75cc','[\"*\"]','2022-05-07 08:59:12','2022-04-14 20:23:10','2022-05-07 08:59:12'),(20,'App\\Models\\Admin\\Admin',1,'admin','2b145d07234e9265577063d8ec2e8204b49b92cc95bf2db7f4347fb8454c962e','[\"*\"]','2022-04-14 20:31:24','2022-04-14 20:27:36','2022-04-14 20:31:24'),(21,'App\\Models\\User',1,'user','9242e766a8e340dd77ea2af54ff237ea5f848e45b930fe22ae80ca1fda7eceaa','[\"*\"]',NULL,'2022-04-15 11:30:09','2022-04-15 11:30:09'),(22,'App\\Models\\User',3,'user','947b0c004d326329ca7ee6501502d7e19f9164493cda5df2477cd8334ab7c216','[\"*\"]','2022-04-16 12:11:12','2022-04-16 12:10:00','2022-04-16 12:11:12'),(23,'App\\Models\\Admin\\Admin',1,'admin','983c925c6253c2f15e24552a726bd4c175a5246013b3909ae438265d52716a90','[\"*\"]','2022-04-20 06:24:25','2022-04-20 06:17:03','2022-04-20 06:24:25'),(24,'App\\Models\\Admin\\Admin',1,'admin','e3f386d41230478c97f1260e8424ae9dffffb869f0085c1b586730663688d4f1','[\"*\"]','2022-04-20 08:46:02','2022-04-20 08:33:28','2022-04-20 08:46:02'),(25,'App\\Models\\Admin\\Admin',1,'admin','09f0cc1b25119a2ba4b6fd3cbc3b0ec8786bc6458d584b0e0eee60edc3c8af68','[\"*\"]','2022-04-20 09:24:34','2022-04-20 08:56:44','2022-04-20 09:24:34'),(26,'App\\Models\\Admin\\Admin',1,'admin','a076e533e6024d72916822697a10106c904b4d09c27e96dd899d1f17572c2b51','[\"*\"]','2022-04-21 06:34:36','2022-04-21 06:34:20','2022-04-21 06:34:36'),(27,'App\\Models\\User',1,'user','c07d3b88cf76ac6d6f599de20d8b7e105c529fe66002c341572efb8e4944354f','[\"*\"]','2022-04-29 10:31:23','2022-04-29 10:31:18','2022-04-29 10:31:23'),(28,'App\\Models\\Admin\\Admin',1,'admin','a9d2e3bf19b7c1c622b666bb7cd0ea18b78d4bbabf2d4439786bd9a1c40f0513','[\"*\"]','2022-05-07 08:57:17','2022-05-07 08:43:22','2022-05-07 08:57:17'),(29,'App\\Models\\User',1,'user','3c7db21be5f10cd5c62dfbf6ae33bf9f74abc88f17d2524a41a898b3b672310a','[\"*\"]','2022-05-07 08:59:33','2022-05-07 08:59:29','2022-05-07 08:59:33');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_color`
--

DROP TABLE IF EXISTS `product_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_color` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `color_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_color_product_id_index` (`product_id`),
  KEY `product_color_color_id_foreign` (`color_id`),
  CONSTRAINT `product_color_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_color_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_color`
--

LOCK TABLES `product_color` WRITE;
/*!40000 ALTER TABLE `product_color` DISABLE KEYS */;
INSERT INTO `product_color` VALUES (10,5,1,NULL,NULL),(11,5,2,NULL,NULL),(12,5,3,NULL,NULL),(13,5,4,NULL,NULL),(14,5,5,NULL,NULL),(15,5,6,NULL,NULL),(22,7,1,NULL,NULL),(23,7,2,NULL,NULL),(24,7,3,NULL,NULL),(25,7,4,NULL,NULL),(26,7,5,NULL,NULL),(27,7,6,NULL,NULL),(28,8,1,NULL,NULL),(29,8,2,NULL,NULL),(30,8,3,NULL,NULL),(31,8,4,NULL,NULL),(32,8,5,NULL,NULL),(33,8,6,NULL,NULL),(34,9,1,NULL,NULL),(35,9,2,NULL,NULL),(36,9,3,NULL,NULL),(37,9,4,NULL,NULL),(38,9,5,NULL,NULL),(39,9,6,NULL,NULL),(41,4,1,NULL,NULL),(42,4,2,NULL,NULL),(43,4,3,NULL,NULL),(44,4,4,NULL,NULL),(45,4,5,NULL,NULL),(46,4,6,NULL,NULL),(48,3,1,NULL,NULL),(49,1,1,NULL,NULL),(50,6,1,NULL,NULL),(51,6,2,NULL,NULL),(52,6,3,NULL,NULL),(53,6,4,NULL,NULL),(54,6,5,NULL,NULL),(55,6,6,NULL,NULL),(58,11,4,NULL,NULL),(60,10,4,NULL,NULL),(61,2,1,NULL,NULL);
/*!40000 ALTER TABLE `product_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_descriptions`
--

DROP TABLE IF EXISTS `product_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_descriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_ar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_descriptions_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_descriptions`
--

LOCK TABLES `product_descriptions` WRITE;
/*!40000 ALTER TABLE `product_descriptions` DISABLE KEYS */;
INSERT INTO `product_descriptions` VALUES (1,'Product 1','Product 1','10','10','10','2022-04-12 14:40:40','2022-04-12 21:39:45'),(2,'Product 2','Product 2','10','10','10','2022-04-12 14:43:56','2022-05-07 08:56:58'),(3,'Product 3','Product 3','10','10','10','2022-04-12 14:44:40','2022-04-12 21:39:38'),(4,'Product 4','Product 4','10','10','10','2022-04-12 15:39:35','2022-04-12 21:39:18'),(5,'Product 5','Product 5','10','10','10','2022-04-12 15:40:15','2022-04-12 15:40:15'),(6,'Product 6','Product 6','10','10','10','2022-04-12 15:40:52','2022-04-14 08:00:56'),(7,'Product 7','Product 7','01','10','101','2022-04-12 15:41:57','2022-04-12 15:41:57'),(8,'Product 8','Product 8','01','10','101','2022-04-12 15:42:25','2022-04-12 15:42:25'),(9,'Product 9','Product 9','10','101','10','2022-04-12 15:44:06','2022-04-12 15:44:06'),(10,NULL,NULL,'null','null','null','2022-04-20 06:24:12','2022-04-20 08:55:56'),(11,NULL,NULL,NULL,NULL,NULL,'2022-04-20 08:35:14','2022-04-20 08:35:14');
/*!40000 ALTER TABLE `product_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_favorites`
--

DROP TABLE IF EXISTS `product_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_favorites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_favorites_user_id_index` (`user_id`),
  KEY `product_favorites_product_id_index` (`product_id`),
  CONSTRAINT `product_favorites_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_favorites`
--

LOCK TABLES `product_favorites` WRITE;
/*!40000 ALTER TABLE `product_favorites` DISABLE KEYS */;
INSERT INTO `product_favorites` VALUES (1,1,3,NULL,NULL),(3,1,1,NULL,NULL),(4,1,9,NULL,NULL),(5,1,8,NULL,NULL),(6,1,7,NULL,NULL),(8,1,2,NULL,NULL),(9,1,6,NULL,NULL);
/*!40000 ALTER TABLE `product_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_index` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,10,'storage/products/description/2022-04-20/Imdjnn9jfwllIqn4Bq7g8MHipIrc6cCbPBNWoYfD.jpg','2022-04-20 06:24:12','2022-04-20 06:24:12');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `rate` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
INSERT INTO `product_reviews` VALUES (1,1,'4','test',1,NULL,NULL,NULL,'2022-04-12 14:43:03','2022-04-12 14:43:03'),(2,2,'1','Test',1,NULL,NULL,NULL,'2022-04-12 15:29:04','2022-04-12 15:29:04'),(3,3,'4','Test',1,NULL,NULL,NULL,'2022-04-12 15:29:25','2022-04-12 15:29:25'),(4,9,'5','Test',1,NULL,NULL,NULL,'2022-04-12 16:00:53','2022-04-12 16:00:53'),(5,8,'1','Test',1,NULL,NULL,NULL,'2022-04-12 16:01:25','2022-04-12 16:01:25'),(6,1,'4','sssss',2,NULL,NULL,NULL,'2022-04-13 10:30:34','2022-04-13 10:30:34'),(7,1,'1','xxxx',2,NULL,NULL,NULL,'2022-04-13 10:30:51','2022-04-13 10:30:51'),(8,1,'1','xxxx',2,NULL,NULL,NULL,'2022-04-13 10:30:56','2022-04-13 10:30:56'),(9,1,'1','sssss',2,NULL,NULL,NULL,'2022-04-13 10:31:23','2022-04-13 10:31:23'),(10,1,'2','2',2,NULL,NULL,NULL,'2022-04-13 10:39:38','2022-04-13 10:39:38'),(11,1,'2','2',2,NULL,NULL,NULL,'2022-04-13 10:39:38','2022-04-13 10:39:38'),(12,1,'1','2',2,NULL,NULL,NULL,'2022-04-13 10:39:46','2022-04-13 10:39:46'),(13,1,'1','w',2,NULL,NULL,NULL,'2022-04-13 10:39:53','2022-04-13 10:39:53'),(14,2,'1','test',2,NULL,NULL,NULL,'2022-04-13 10:45:02','2022-04-13 10:45:02'),(15,1,'5','test review',1,NULL,NULL,NULL,'2022-04-13 18:02:37','2022-04-13 18:02:37');
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_size_color`
--

DROP TABLE IF EXISTS `product_size_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_size_color` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `size_id` bigint(20) unsigned NOT NULL,
  `color_id` bigint(20) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_size_color_product_id_foreign` (`product_id`),
  KEY `product_size_color_size_id_foreign` (`size_id`),
  KEY `product_size_color_color_id_foreign` (`color_id`),
  CONSTRAINT `product_size_color_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `product_size_color_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_size_color_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_size_color`
--

LOCK TABLES `product_size_color` WRITE;
/*!40000 ALTER TABLE `product_size_color` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_size_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sizes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `size` enum('1','2','3','4','5','6') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_sizes_product_id_index` (`product_id`),
  CONSTRAINT `product_sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
INSERT INTO `product_sizes` VALUES (25,5,'1','2022-04-12 15:40:15','2022-04-12 15:40:15'),(26,5,'2','2022-04-12 15:40:15','2022-04-12 15:40:15'),(27,5,'3','2022-04-12 15:40:15','2022-04-12 15:40:15'),(28,5,'4','2022-04-12 15:40:15','2022-04-12 15:40:15'),(29,5,'5','2022-04-12 15:40:15','2022-04-12 15:40:15'),(30,5,'6','2022-04-12 15:40:15','2022-04-12 15:40:15'),(37,7,'1','2022-04-12 15:41:57','2022-04-12 15:41:57'),(38,7,'2','2022-04-12 15:41:57','2022-04-12 15:41:57'),(39,7,'3','2022-04-12 15:41:57','2022-04-12 15:41:57'),(40,7,'4','2022-04-12 15:41:57','2022-04-12 15:41:57'),(41,7,'5','2022-04-12 15:41:57','2022-04-12 15:41:57'),(42,7,'6','2022-04-12 15:41:57','2022-04-12 15:41:57'),(43,8,'1','2022-04-12 15:42:25','2022-04-12 15:42:25'),(44,8,'2','2022-04-12 15:42:25','2022-04-12 15:42:25'),(45,8,'3','2022-04-12 15:42:25','2022-04-12 15:42:25'),(46,8,'4','2022-04-12 15:42:25','2022-04-12 15:42:25'),(47,8,'5','2022-04-12 15:42:25','2022-04-12 15:42:25'),(48,8,'6','2022-04-12 15:42:25','2022-04-12 15:42:25'),(49,9,'1','2022-04-12 15:44:06','2022-04-12 15:44:06'),(50,9,'2','2022-04-12 15:44:06','2022-04-12 15:44:06'),(51,9,'3','2022-04-12 15:44:06','2022-04-12 15:44:06'),(52,9,'4','2022-04-12 15:44:06','2022-04-12 15:44:06'),(53,9,'5','2022-04-12 15:44:06','2022-04-12 15:44:06'),(54,9,'6','2022-04-12 15:44:06','2022-04-12 15:44:06'),(61,4,'1','2022-04-12 21:39:18','2022-04-12 21:39:18'),(62,4,'2','2022-04-12 21:39:18','2022-04-12 21:39:18'),(63,4,'3','2022-04-12 21:39:18','2022-04-12 21:39:18'),(64,4,'4','2022-04-12 21:39:18','2022-04-12 21:39:18'),(65,4,'5','2022-04-12 21:39:18','2022-04-12 21:39:18'),(66,4,'6','2022-04-12 21:39:18','2022-04-12 21:39:18'),(73,3,'1','2022-04-12 21:39:38','2022-04-12 21:39:38'),(74,3,'2','2022-04-12 21:39:38','2022-04-12 21:39:38'),(75,3,'3','2022-04-12 21:39:38','2022-04-12 21:39:38'),(76,3,'4','2022-04-12 21:39:38','2022-04-12 21:39:38'),(77,3,'5','2022-04-12 21:39:38','2022-04-12 21:39:38'),(78,3,'6','2022-04-12 21:39:38','2022-04-12 21:39:38'),(79,1,'1','2022-04-12 21:39:45','2022-04-12 21:39:45'),(80,1,'2','2022-04-12 21:39:45','2022-04-12 21:39:45'),(81,1,'3','2022-04-12 21:39:45','2022-04-12 21:39:45'),(82,1,'4','2022-04-12 21:39:45','2022-04-12 21:39:45'),(83,1,'5','2022-04-12 21:39:45','2022-04-12 21:39:45'),(84,1,'6','2022-04-12 21:39:45','2022-04-12 21:39:45'),(85,6,'1','2022-04-14 08:00:56','2022-04-14 08:00:56'),(86,6,'2','2022-04-14 08:00:56','2022-04-14 08:00:56'),(87,6,'3','2022-04-14 08:00:56','2022-04-14 08:00:56'),(88,6,'4','2022-04-14 08:00:56','2022-04-14 08:00:56'),(89,6,'5','2022-04-14 08:00:56','2022-04-14 08:00:56'),(90,6,'6','2022-04-14 08:00:56','2022-04-14 08:00:56'),(98,11,'3','2022-04-20 08:35:14','2022-04-20 08:35:14'),(101,10,'1','2022-04-20 08:55:56','2022-04-20 08:55:56'),(102,10,'2','2022-04-20 08:55:56','2022-04-20 08:55:56'),(103,2,'1','2022-05-07 08:56:58','2022-05-07 08:56:58'),(104,2,'2','2022-05-07 08:56:58','2022-05-07 08:56:58'),(105,2,'3','2022-05-07 08:56:58','2022-05-07 08:56:58'),(106,2,'4','2022-05-07 08:56:58','2022-05-07 08:56:58'),(107,2,'5','2022-05-07 08:56:58','2022-05-07 08:56:58'),(108,2,'6','2022-05-07 08:56:58','2022-05-07 08:56:58');
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` double(8,2) DEFAULT NULL,
  `sale_price` double(8,2) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pieces` int(11) DEFAULT NULL,
  `kg` double(8,2) DEFAULT NULL,
  `sale_unit` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `currency_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `product_description_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_id_index` (`id`),
  KEY `products_currency_id_index` (`currency_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_product_description_id_foreign` (`product_description_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `products_product_description_id_foreign` FOREIGN KEY (`product_description_id`) REFERENCES `product_descriptions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Product 1','Product 1',11.00,10.00,90,'storage/products/2022-04-12/x9Z3I6XdY6v9uQJVHl5ArLOuhPvxwcEHSn3PGnpb.png',1,NULL,'2',2,1,1,'2022-04-12 14:40:40','2022-04-14 20:04:22'),(2,'Product 2','Product 2',85.00,84.00,50,'storage/products/2022-04-12/3aqTpx6ThCYiO0w4u1HQswf7cXdee3Yx7LVXCAZ2.png',NULL,NULL,'3',2,3,2,'2022-04-12 14:43:56','2022-05-07 08:56:58'),(3,'Product 3','Product 3',66.00,65.00,98,'storage/products/2022-04-12/KCQf3i717soPdM1RyGS8bLELbNngBEa0y3ujbO9r.png',NULL,10.00,'1',2,1,3,'2022-04-12 14:44:40','2022-04-16 12:08:12'),(4,'Product 4','Product 4',88.00,87.00,96,'storage/products/2022-04-12/i6Mi6RTCSEJelacmQJvPb2FY1t3VvE7qjJPkohAS.png',1,NULL,'2',1,1,4,'2022-04-12 15:39:35','2022-04-16 12:08:12'),(5,'Product 5','Product 5',88.00,87.00,83,'storage/products/2022-04-12/B1vnrxU7SUdeGtsLodof6gCv3Reeaz97vmhJGRA2.png',NULL,10.00,'1',1,1,5,'2022-04-12 15:40:15','2022-04-14 20:23:20'),(6,'Product 6','Product 6',101.00,100.00,59,'storage/products/2022-04-12/YVayi67mhVyBu79W1fn7MC3SQvIFhpr92oOc130D.png',1,NULL,'2',1,1,6,'2022-04-12 15:40:52','2022-05-07 08:55:31'),(7,'Product 7','Product 7',106.00,105.00,9,'storage/products/2022-04-12/j3DtAsyOZuovJKpGsxvqZUISxO7SuTprBqUoqREr.png',NULL,2.00,'1',1,1,7,'2022-04-12 15:41:57','2022-05-07 08:55:31'),(8,'Product 8','Product 8',189.00,188.00,7,'storage/products/2022-04-12/ajMhfiAUKZeqcbyXJlYiwAhrsj2XEbGjhNw8jrD8.png',NULL,3.00,'1',1,1,8,'2022-04-12 15:42:25','2022-05-07 08:55:31'),(9,'Product 9','Product 9',99.00,98.00,5,'storage/products/2022-04-12/GHbRe5VPOk8nayCRxzBe5lPPf00kPEkP3viNGaA9.png',1,1.00,'1',1,1,9,'2022-04-12 15:44:06','2022-05-07 08:55:31'),(10,'T Shirts','تي شيرت',150.00,120.00,5,'storage/products/2022-04-20/Uc7NMv31nMH6AUa0JM8lXUVdDCwGBL7cXJeiY5zZ.jpg',10,NULL,'2',1,4,10,'2022-04-20 06:24:12','2022-04-23 10:51:40'),(11,'T shirts','قمصان',150.00,100.00,10,'storage/products/2022-04-20/aQfBiwbvp1KDpZrDP6PuMxUGzrBFNAOylDACDhcZ.jpg',10,NULL,'2',1,4,11,'2022-04-20 08:35:14','2022-04-20 08:35:14');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `orders` int(11) DEFAULT NULL,
  `delivered_order` int(11) DEFAULT NULL,
  `customers` int(11) DEFAULT NULL,
  `products` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,7,0,1,9,'2022-04-12 21:33:21','2022-04-12 21:33:21'),(2,7,0,1,9,'2022-04-12 21:33:26','2022-04-12 21:33:26'),(3,7,0,1,9,'2022-04-12 21:33:29','2022-04-12 21:33:29'),(4,7,0,1,9,'2022-04-12 21:33:32','2022-04-12 21:33:32'),(5,7,0,1,9,'2022-04-12 21:33:34','2022-04-12 21:33:34'),(6,7,0,1,9,'2022-04-12 21:33:36','2022-04-12 21:33:36'),(7,7,0,1,9,'2022-04-12 21:33:37','2022-04-12 21:33:37'),(8,8,0,2,9,'2022-04-14 07:54:02','2022-04-14 07:54:02'),(9,8,1,2,9,'2022-04-14 08:01:02','2022-04-14 08:01:02'),(10,9,1,2,9,'2022-04-14 15:38:01','2022-04-14 15:38:01'),(11,10,1,2,9,'2022-04-14 15:40:01','2022-04-14 15:40:01'),(12,11,1,2,9,'2022-04-14 20:05:01','2022-04-14 20:05:01'),(13,12,1,2,9,'2022-04-14 20:24:02','2022-04-14 20:24:02'),(14,13,1,2,9,'2022-04-16 12:09:02','2022-04-16 12:09:02'),(15,13,1,3,9,'2022-04-16 12:10:01','2022-04-16 12:10:01'),(16,14,1,3,9,'2022-04-16 12:11:02','2022-04-16 12:11:02'),(17,14,1,3,10,'2022-04-20 06:25:01','2022-04-20 06:25:01'),(18,14,1,3,11,'2022-04-20 08:36:01','2022-04-20 08:36:01'),(19,15,1,3,11,'2022-04-21 06:45:01','2022-04-21 06:45:01'),(20,16,1,3,11,'2022-04-23 10:52:01','2022-04-23 10:52:01'),(21,17,1,3,11,'2022-05-07 08:56:01','2022-05-07 08:56:01');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_addresses`
--

DROP TABLE IF EXISTS `shipping_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipping_addresses_country_id_index` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_addresses`
--

LOCK TABLES `shipping_addresses` WRITE;
/*!40000 ALTER TABLE `shipping_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sizes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sizes`
--

LOCK TABLES `sizes` WRITE;
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;
INSERT INTO `sizes` VALUES (1,'sm',NULL,NULL,'2022-04-12 14:38:32','2022-04-12 14:38:32'),(2,'md',NULL,NULL,'2022-04-12 14:38:32','2022-04-12 14:38:32'),(3,'lg',NULL,NULL,'2022-04-12 14:38:32','2022-04-12 14:38:32'),(4,'xl',NULL,NULL,'2022-04-12 14:38:32','2022-04-12 14:38:32'),(5,'xxl',NULL,NULL,'2022-04-12 14:38:32','2022-04-12 14:38:32'),(6,'xxxl',NULL,NULL,'2022-04-12 14:38:32','2022-04-12 14:38:32');
/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sliders_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (2,2,'2022-04-12 14:43:56','2022-04-12 14:43:56'),(3,3,'2022-04-12 14:44:40','2022-04-12 14:44:40'),(4,4,'2022-04-12 15:39:35','2022-04-12 15:39:35'),(5,5,'2022-04-12 15:40:15','2022-04-12 15:40:15');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Yousef','Yousef','yousef.dev20@gmail.com','00962790000000','$2y$10$xPgDxsGPTCQ8R6lYVyA.0OeyiVSafHEIT6zffijFIGmabPACiKPpW',NULL,NULL,NULL,'2022-04-12 14:42:34','2022-04-12 14:42:34'),(2,'Vergheseessse','Kurian Oommen','verghesekurian@gmail.com','971553765449','$2y$10$KIZ0KXIVFFaQWApMwE.y8elZ9EZW4jlB6VWXkUkbE.Gh5c1po8g4.',NULL,NULL,NULL,'2022-04-13 08:48:39','2022-04-13 08:51:06'),(3,'Test','Test','test@test.com','000000000000','$2y$10$3EjZn/fj0TA3zbYq8OF.9eperfbezFNJlCPrfvd1UwjhR5ZHaIqaS',NULL,NULL,NULL,'2022-04-16 12:09:51','2022-04-16 12:09:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflows` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-08  9:13:31
