-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bug_check
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `bugdetail`
--

DROP TABLE IF EXISTS `bugdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `threatOverview` text COMMENT '威胁概述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='漏洞详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugdetail`
--

LOCK TABLES `bugdetail` WRITE;
/*!40000 ALTER TABLE `bugdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buginfo`
--

DROP TABLE IF EXISTS `buginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buginfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `project` varchar(255) DEFAULT NULL COMMENT '项目',
  `scanner` int DEFAULT NULL COMMENT '扫描程序',
  `level` int DEFAULT NULL COMMENT '严重等级',
  `publish_date` date DEFAULT NULL COMMENT '发布日期',
  `cve` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '类别',
  `ecosystem` varchar(255) DEFAULT NULL COMMENT '生态系统',
  `cwe` varchar(255) DEFAULT NULL,
  `cvss` varchar(255) DEFAULT NULL,
  `credit` varchar(255) DEFAULT NULL,
  `grade` double DEFAULT NULL COMMENT '分数',
  `description` text COMMENT 'bug描述',
  `introduce_plan` varchar(255) DEFAULT NULL COMMENT '推出计划',
  `threat_overview` text COMMENT '威胁概述',
  `attack_scenario` text COMMENT '攻击场景',
  `affected_object` text COMMENT '受影响的对象',
  `tech_report` text COMMENT '技术报告',
  `repair_procedure` text COMMENT '修复步骤',
  `patch_detail` text COMMENT '补丁详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buginfo`
--

LOCK TABLES `buginfo` WRITE;
/*!40000 ALTER TABLE `buginfo` DISABLE KEYS */;
INSERT INTO `buginfo` VALUES (1,'IDOR Vulnerability Allowing View/Delete of External Users','lunary',1,4,'2024-10-10','CVE-2024-7474','一',NULL,'CWE-284: Improper Access Control','CVSS:3.1/AV:N/AC:L/PR:','meme-dm',9.1,'An IDOR vulnerability in version 1.3.2 allows authenticated users to view or delete external users by manipulating the user ID in the request. This issue was patched in version 1.3.4.','Available publicly on Sep 29 2024 | Available with Premium on Aug 24 2024','The vulnerability arises from the lack of proper access control checks on the user ID parameter in the API endpoints for viewing and deleting external users. This allows an authenticated user to manipulate the ID parameter to access or delete any external user record, leading to unauthorized data access and potential data loss.','An attacker logs into the lunary dashboard and navigates to the task users section. By intercepting the request using a tool like Burp Suite, the attacker modifies the ID parameter in the request to target a different external user. This allows the attacker to view or delete any external user record without proper authorization.','All users of the lunary application version 1.3.2 who have access to the task users section are affected by this vulnerability.','hahahahahaha','Update to version 1.3.4 or later.\nImplement proper access control checks to ensure that users can only access or modify their own records.\nValidate and sanitize user input to prevent manipulation of ID parameters.\nConduct regular security audits and code reviews to identify and fix similar vulnerabilities.','Fixed Version: 1.3.4\nPatch Commit: https://github.com/lunary-ai/lunary/commit/8f563c77d8614a72980113f530c7a9ec15a5f8d5');
/*!40000 ALTER TABLE `buginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepageinfo`
--

DROP TABLE IF EXISTS `homepageinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homepageinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepageinfo`
--

LOCK TABLES `homepageinfo` WRITE;
/*!40000 ALTER TABLE `homepageinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `homepageinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-11 11:39:26
