CREATE DATABASE  IF NOT EXISTS `schooldb7staging` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `schooldb7staging`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: schooldb7staging
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cities_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Αθήνα'),(3,'Βόλος'),(7,'Δράμα'),(10,'Ηράκλειο'),(5,'Θεσσαλονίκη'),(9,'Καλαμάτα'),(6,'Κέρκυρα'),(4,'Λάρισσα'),(2,'Πάτρα'),(8,'Πύργος'),(11,'Χανιά');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `fathername` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_num` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `street_num` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_students_city` (`city_id`),
  CONSTRAINT `fk_students_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Γιάννης','Σπάθας','Θανάσης','spathas@example.com','6900000001','Οδός Ροκ','1','11111',10,'2005-06-10','09866313-1d35-11f0-8d68-d8bbc18cf540','2025-04-19 15:43:27','2025-04-25 16:35:00'),(2,'Μπάμπης','Παπαδόπουλος','Νίκος','babis@example.com','6900000002','Οδός Μπλουζ','2','22222',2,'2006-01-15','09866810-1d35-11f0-8d68-d8bbc18cf540','2025-04-19 15:43:27','2025-04-19 15:43:27'),(3,'Δημήτρης','Σταρόβας','Ανδρέας','starovas@example.com','6900000003','Οδός Χιούμορ','3','33333',3,'2004-11-08','098668fa-1d35-11f0-8d68-d8bbc18cf540','2025-04-19 15:43:27','2025-04-19 15:43:27'),(4,'Αντώνης','Μαρτσάκης','Μανώλης','martakis@example.com','6900000004','Οδός Νησιών','4','44444',1,'2006-05-20','09866979-1d35-11f0-8d68-d8bbc18cf540','2025-04-19 15:43:27','2025-04-19 15:43:27'),(5,'Σωκράτης','Μάλαμας','Κώστας','malamas@example.com','6900000005','Οδός Λυρική','6','55555',2,'2005-08-30','098669e9-1d35-11f0-8d68-d8bbc18cf540','2025-04-19 15:43:27','2025-04-25 16:34:34'),(6,'Θανάσης','Παπακωνσταντίνου','Πέτρος','thanasis@example.com','6900000006','Οδός Αντίστασης','6','66666',3,'2004-03-01','09866a57-1d35-11f0-8d68-d8bbc18cf540','2025-04-19 15:43:27','2025-04-19 15:43:27'),(7,'Νίκος','Ξυδάκης','Μάρκος','xydakis@example.com','6900000007','Οδός Παράδοσης','7','77777',1,'2005-10-25','09866acf-1d35-11f0-8d68-d8bbc18cf540','2025-04-19 15:43:27','2025-04-19 15:43:27'),(8,'Ευστάθιος','Δάκαρης','Δημήτριος','dakaris@example.com','6900000008','Οδός Κλασικής','8','88888',2,'2005-09-09','09866b3e-1d35-11f0-8d68-d8bbc18cf540','2025-04-19 15:43:27','2025-04-19 15:43:27'),(9,'Λεωνίδας','Μπαλάφας','Ιωάννης','balafas@example.com','6900000009','Οδός Funk','9','99999',3,'2006-02-17','09866bc9-1d35-11f0-8d68-d8bbc18cf540','2025-04-19 15:43:27','2025-04-19 15:43:27'),(10,'Μαρία','Παπαγεωργίου','Σπύρος','maria@example.com','6900000010','Οδός Ακουστικής','10','10101',1,'2006-12-05','09866c4a-1d35-11f0-8d68-d8bbc18cf540','2025-04-19 15:43:27','2025-04-25 17:31:50');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `vat` varchar(45) NOT NULL,
  `fathername` varchar(45) DEFAULT NULL,
  `phone_num` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `street` varchar(45) DEFAULT NULL,
  `street_num` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_teachers_lastname` (`lastname`) /*!80000 INVISIBLE */,
  KEY `idx_teachers_vat` (`vat`) /*!80000 INVISIBLE */,
  KEY `idx_teachers_city_id` (`city_id`),
  CONSTRAINT `fk_teachers_city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Αθανάσιος','Ανδρούτσος','876543210','Ανδρέας','6935565765','a8ana@gmail.com','Πατησίων','76','10434',10,'e27aee5e-f447-4203-9b4a-7c638f422057','2025-03-17 18:01:18','2025-04-25 16:23:28'),(2,'Άννα','Γιαννούτσου','12345678','Κώ','12345678','anna@gmail.com','Γεωργούτσου','12','67856',5,'68bc653a-abc7-4c30-8eb9-247b6b380d2e','2025-03-17 18:01:18','2025-03-17 18:01:18'),(3,'Μάκης','Καπέτης','987654321','Ευάγγελος','6935465768','makis@gmail.com','Πατησίων','76','10434',4,'94110e89-c23b-4c41-8c6b-f3e8b1fe9664','2025-03-17 18:01:18','2025-04-22 17:14:10'),(4,'Νίκη','Γιαννούτσου','918273645','Αθανάσιος','6934564890','niki@gmail.com','Λαμπρούτσου','12','65098',7,'31cff198-3280-46c3-bd32-6b4b1fb80ba6','2025-03-17 18:01:18','2025-04-22 16:01:44'),(5,'Κωνσταντίνος','Ρούμπας','456782341','Κλεάνθης','69987678767','kostis@gmail.com','Φράγκου','37','34567',3,'c69e23eb-5027-4bf3-a141-cc1a142d93dc','2025-03-17 18:01:18','2025-03-17 18:01:18'),(6,'Ελένη','Λαμπρούτσου','9078563411','Λάμπρος','2111309876','eleni@aueb.gr','Αδριανής','12','98076',7,'5c2c955d-98b1-47ca-bce6-3803f7754805','2025-03-17 18:01:18','2025-03-17 18:01:18'),(8,'Ανδρέας','Ανδρούτσος','9812002345','Αθανάσιος','2103098765','andreas@gmail.com','Ανακούς','119','10434',5,'71b0c190-c607-4004-94c4-17b1822d6704','2025-03-17 18:01:18','2025-03-17 18:01:18'),(10,'Κων/νος','Ανδρούτσος','0000088888','Αθανάσιος','2108203817','a8anassis@gmail.com','Πατησίων','99','14342',7,'0e645adb-2159-4265-8b47-36833e2acb35','2025-03-29 18:56:26','2025-03-30 09:27:12'),(11,'Ηλιάννα','ΓΙΑΝΝΟΥΤΣΟΥ','1100110011','Ανδρέας','2108203817','illianna@gmail.com','Patission','76','10434',11,'8bf4c053-f719-4d55-93d5-53e5ada4dace','2025-04-03 13:02:18','2025-04-03 13:02:18'),(12,'Αναστάσιος','ANDROUTSOS','0000088855','Νάκας','2108203817','anastasis@aueb.gr','Patission','76','10434',3,'e5e030c6-8876-4705-851d-7d7d5d654b6a','2025-04-03 13:03:42','2025-04-03 13:03:42'),(14,'Evan','Test','123123122','Test','123123123','s75@yahoo.gr','asd','123','12333',7,'eb1dd9b3-b0b2-47f0-b750-93c94861520e','2025-04-13 06:27:52','2025-04-13 17:19:53'),(17,'Evan','TestAdd','1231231225','Test','123123123','test@test.gr','asd','123','123332',1,'4d098087-f95c-4f9c-8dd6-17b5e1e5b50f','2025-04-19 11:11:37','2025-04-19 11:11:37'),(18,'Evanννγγ','Testααα','1231231228','Test','123123123111','tes222t@test.gr','asd','123','123123',5,'2a372ec6-f87e-40aa-a824-32b9f716503b','2025-04-22 15:59:38','2025-04-22 17:28:32'),(19,'Evangelos','Test','1231231222','Test','123123123111','22test@test.gr','asd','123','123332',2,'0746d461-8307-463f-8a7d-71308c96f823','2025-04-22 17:21:58','2025-04-22 17:21:58'),(20,'Evanασδ','Test','12312312122','Test','123123123111','tσσest@test.gr','asd','123','123332',4,'766b994d-8558-4fc8-b44f-a6f80a841fb6','2025-04-22 17:29:01','2025-04-22 17:29:01');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` enum('ADMIN','LIGHT_ADMIN') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'thanos@aueb.gr','$2a$12$aHazLO91r.h7IUSzLfXfhejbBZyTRg2HIHwmXdhzKrMLOjLqL0zZy','ADMIN'),(2,'anna@gmail.com','$2a$12$.j.oBMUr8T1P8kdTWydAIOBr7SmOofxSwF/wlkZSCs5higLC7hVpO','LIGHT_ADMIN'),(3,'niki@aueb.gr','$2a$12$bI/ti.LEbS5BwzzQL0OsXefEQRT3m6wuLmFkyluUYtlKbkVEJStey','ADMIN'),(4,'niki2@gmail.com','$2a$12$chRNgLtEpqnZLn8GnYfBSOt4y5PiXkvOmkubaunF8TmDyYIe2yKoS','ADMIN'),(5,'aggeliki@aueb.gr','$2a$12$cQlgj.ho0cTGHlcuNUjm1edvBd5yEgNszG7nDDzGz2WejyPkmZ3t.','ADMIN'),(6,'niki2@aueb.gr','$2a$12$cvB41VUtFcfzieOnVtJ/cuxQINNn4HA5qjIn1QtD5ojBeWcbzv0Se','LIGHT_ADMIN');
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

-- Dump completed on 2025-04-26  9:31:31
