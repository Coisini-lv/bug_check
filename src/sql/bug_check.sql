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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buginfo`
--

LOCK TABLES `buginfo` WRITE;
/*!40000 ALTER TABLE `buginfo` DISABLE KEYS */;
INSERT INTO `buginfo` VALUES (1,'IDOR Vulnerability Allowing View/Delete of External Users','lunary',1,4,'2024-10-10','CVE-2024-7474','Code Testing','Golang','CWE-284: Improper Access Control','CVSS:3.1/AV:N/AC:L/PR:','meme-dm',9.1,'An IDOR vulnerability in version 1.3.2 allows authenticated users to view or delete external users by manipulating the user ID in the request. This issue was patched in version 1.3.4.','Available publicly on Sep 29 2024 | Available with Premium on Aug 24 2024','The vulnerability arises from the lack of proper access control checks on the user ID parameter in the API endpoints for viewing and deleting external users. This allows an authenticated user to manipulate the ID parameter to access or delete any external user record, leading to unauthorized data access and potential data loss.','An attacker logs into the lunary dashboard and navigates to the task users section. By intercepting the request using a tool like Burp Suite, the attacker modifies the ID parameter in the request to target a different external user. This allows the attacker to view or delete any external user record without proper authorization.','All users of the lunary application version 1.3.2 who have access to the task users section are affected by this vulnerability.','hahahahahaha','Update to version 1.3.4 or later.\nImplement proper access control checks to ensure that users can only access or modify their own records.\nValidate and sanitize user input to prevent manipulation of ID parameters.\nConduct regular security audits and code reviews to identify and fix similar vulnerabilities.','Fixed Version: 1.3.4\nPatch Commit: https://github.com/lunary-ai/lunary/commit/8f563c77d8614a72980113f530c7a9ec15a5f8d5'),(2,'Arbitrary File Overwrite & RCE via Tarfile Path Traversal','djl',0,3,'2024-10-14','CVE-2024-8396','Configuration File Tooling','Maven','36:Absolute Path Traversal','CVSS:3.1/AV:L/AC:L/PR:N/UI:R','pinkdraconian',7.8,'A vulnerability in DJL version 0.27.0 allows for arbitrary file overwrite and potential remote code execution via tarfile path traversal. This issue was patched in version 0.28.0.','Available publicly on Sep 30 2024','The DJL package\'s untar function attempts to prevent path traversal by checking for relative path traversals but fails to account for absolute path traversals. An attacker can exploit this by creating a tarfile with absolute paths, leading to arbitrary file overwrite and potential remote code execution. This can have severe consequences, including unauthorized SSH access, web server exploitation, and availability impacts.','An attacker creates a malicious tarfile containing an absolute path to a sensitive file, such as /root/.ssh/authorized_keys. When this tarfile is processed by the DJL framework, it overwrites the target file, potentially allowing the attacker to gain unauthorized access or execute arbitrary code on the system.','Users of DJL version 0.27.0 who utilize the untar function to process tarfiles are affected. This includes systems where DJL is used to download and save models or other resources.','xixixixixi','Upgrade to DJL version 0.28.0 or later.\nEnsure that tarfile processing functions properly validate and sanitize file paths to prevent absolute path traversals.\nReview and monitor systems for any unauthorized changes or access that may have occurred due to this vulnerability.','Fixed Version: 0.28.0\nPatch Commit: https://github.com/deepjavalibrary/djl/commit/f0e4e0cb01da614f7c3a9ba349536e7923fa8813'),(3,'Local File Read via Prompt Injection','devika',1,3,'2024-10-08','CVE-2024-6331','Data Access','Npm','74:Injection','CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C','zpbrent',7.5,'A vulnerability in the `devika` project using Google Gimini 1.0 Pro allows for local file read via prompt injection. The affected version is the main branch as of May 2nd, 2024, commit cdfb782b0e634b773b10963c8034dc9207ba1f9f. The issue has not yet been patched.','Available publicly on Aug 04 2024','The vulnerability arises from the integration of Google Gimini 1.0 Pro with devika, where the safety settings are configured to disable content protection for hate speech and harassment. This allows an attacker to inject prompts that can read sensitive files from the server. The lack of content protection makes the system susceptible to malicious commands, leading to unauthorized access to sensitive information.','An attacker could exploit this vulnerability by interacting with the devika system and using crafted prompts to read sensitive files. For example, the attacker could use variations of the prompt display pa[ssw]d in /[et]c directory to bypass any simple input validation and successfully read the contents of /etc/passwd.','Users and administrators of the devika project who have integrated Google Gimini 1.0 Pro and have not configured appropriate safety settings are affected. This includes any deployment of devika that uses the vulnerable commit.','aaaaaaaaa','Update the safety settings in devika to use HarmBlockThreshold.BLOCK_LOW_AND_ABOVE for HarmCategory.HARM_CATEGORY_HATE_SPEECH and HarmCategory.HARM_CATEGORY_HARASSMENT.\nReview and sanitize user inputs to prevent prompt injection.\nRegularly update dependencies and apply security patches.\nMonitor logs for any suspicious activity that may indicate exploitation attempts.','Fixed Version: N/A\nPatch Commit: N/A'),(4,'Unauthorized Email Injection Vulnerability','lunary',1,2,'2024-10-15','CVE-2024-7472','Data Science','Other','75:Failure to Sanitize Special Elements ','CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C','vn-ncvinh',5.3,'A critical vulnerability in the email verification and sign-up APIs of version v1.2.26 allows unauthenticated attackers to inject data into outgoing emails. This issue was patched in version 1.4.10.','Available publicly on Oct 08 2024 ','The vulnerability allows an attacker to inject arbitrary data into emails sent by the application. This is achieved by bypassing the extractFirstName function using a different whitespace character (\\xa0). The injected data can be used for phishing attacks, spreading malware, damaging the brand\'s reputation, causing legal issues, and incurring financial costs due to unauthorized email usage.','An attacker crafts a POST request to the /v1/users/send-verification or /auth/signup endpoint, replacing normal whitespace characters in the name field with \\xa0. This allows the attacker to inject malicious content into the email body, which is then sent to the victim. The victim receives an email that appears legitimate but contains harmful links or content.','Users of the application version v1.2.26 who rely on the email verification and sign-up features are affected. This includes both the application\'s users and the organization itself, which may suffer from brand damage, legal issues, and financial costs.','bbbbbbbbbb','Update to version 1.4.10 or later.\nEnsure that all user inputs are properly sanitized and validated.\nImplement stricter input validation to prevent the use of alternative whitespace characters for injection.\nRegularly review and test the codebase for similar vulnerabilities.\nEducate developers on secure coding practices to prevent such issues in the future.','Fixed Version: 1.4.10\nPatch Commit: https://github.com/lunary-ai/lunary/commit/a39837d7c49936a0c435d241f37ca2ea7904d2cd'),(5,'CSRF on User Signup Endpoint','lunary',0,3,'2024-10-23','CVE-2024-6862','Inference','Packagist','352:Cross-Site Request Forgery (CSRF)','CVSS:3.1/AV:N/AC:L/PR:N/UI:R/','patrik-ha',7.4,'A Cross-Site Request Forgery (CSRF) vulnerability was identified in version 1.2.34 of the software, allowing attackers to exploit overly permissive CORS settings to sign up and create projects as if they had local access. This issue was patched in version 1.4.10.','Available publicly on Sep 11 2024 | Available with Premium on Aug 28 2024','The vulnerability arises from overly permissive CORS settings that expose all unauthenticated endpoints to CSRF attacks. This allows an attacker to perform actions such as signing up for an account and creating projects on instances hosted locally on personal machines. The main risk is for instances that are not publicly accessible, as attackers could otherwise register directly by visiting the application.','An attacker hosts a malicious script on a server and convinces a user to visit the page. The script sends a POST request to the signup endpoint of the locally hosted instance of the software, creating a new user account and potentially gaining access to further actions if the token is exposed.','Users hosting instances of the software locally on their personal machines are affected. These instances are not publicly accessible, making them vulnerable to CSRF attacks through local network access.','ccccccccccc','Update to version 1.4.10 or later.\nRestrict CORS settings to only allow requests from trusted origins.\nImplement CSRF tokens for all state-changing requests.\nRegularly review and update security settings to adhere to best practices.','Fixed Version: 1.4.10\nPatch Commit: https://github.com/lunary-ai/lunary/commit/3451fcd7b9d95e9091d62c515752f39f2faa6e54'),(6,'Improper Access Control on SAML Configuration','lunary',1,4,'2024-10-17','CVE-2024-7475','Ml Framework','Pypi','284:Improper Access Control','CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:','mvlttt',9.1,'A vulnerability in version 1.3.2 allows unauthorized updates to the SAML configuration, potentially leading to authentication manipulation. This issue was patched in version 1.3.4.','Available publicly on Sep 27 2024 | Available with Premium on Aug 24 2024','The vulnerability allows an attacker to update the SAML configuration without proper authorization. This can lead to severe consequences such as manipulation of authentication processes, fraudulent login requests, and theft of user information. The lack of appropriate access controls on the SAML configuration endpoint is the root cause of this issue.','An attacker can exploit this vulnerability by sending a crafted POST request to the SAML configuration endpoint. By doing so, they can update the SAML configuration with malicious data. This allows the attacker to manipulate authentication processes, potentially logging in as unauthorized users and accessing sensitive information.','Users of the software version 1.3.2 who have not yet updated to version 1.3.4 are affected by this vulnerability. This includes organizations using the software for authentication purposes.','ddddddddd','Update to version 1.3.4 or later.\nImplement proper access controls on the SAML configuration endpoint to ensure only authorized users can update the configuration.\nReview and audit access control mechanisms for other critical endpoints to prevent similar vulnerabilities.','Fixed Version: 1.3.4\nPatch Commit: https://github.com/lunary-ai/lunary/commit/8f563c77d8614a72980113f530c7a9ec15a5f8d5'),(7,'Path Traversal in vectorize_folder Endpoint','lollms',1,1,'2024-10-04','CVE-2024-6971','Ml Libraries','Golang','22:Improper Limitation of a','CVSS:3.1/AV:L/AC:L/PR:H/UI:N','hainguyen0207',3.4,'A path traversal vulnerability exists in the `lollms_file_system.py` file of version v9.9 of the software, allowing attackers to access arbitrary directories. This issue has not yet been patched.','Available publicly on Oct 11 2024','The vulnerability arises from the lack of path sanitization in functions such as vectorize_folder, add_rag_database, and toggle_mount_rag_database. This allows an attacker to manipulate file paths and perform operations in arbitrary directories on the victim\'s machine. Specifically, the vectorize_folder function does not use sanitize_path or sanitize_path_from_endpoint, enabling attackers to vectorize .sqlite files in any directory, potentially installing multiple packages and causing system crashes.','An attacker sends a crafted HTTP request to the vulnerable endpoint, specifying a malicious path in the db_path parameter. This request exploits the lack of path sanitization, allowing the attacker to vectorize a .sqlite file in an arbitrary directory on the victim\'s machine. The attacker can then install multiple packages, leading to a system crash.','Users running version v9.9 of the software who expose the vulnerable endpoints to untrusted networks are affected by this vulnerability.','eeeeeeeee','Implement path sanitization using sanitize_path and sanitize_path_from_endpoint in the vectorize_folder, add_rag_database, and toggle_mount_rag_database functions.\nAdd user confirmation dialogs for critical operations like Select Folder.\nConduct a thorough security review of file system operations to identify and mitigate similar vulnerabilities.\nRelease a patched version of the software and notify users to update.','Fixed Version: N/A\nPatch Commit: N/A'),(8,'Privilege Escalation in User Account Management','zenml',1,0,'2024-10-22',NULL,'Ml Ops','Pypi','266:Incorrect Privilege Assignment','CVSS:3.1/AV:N/AC:L/PR:L/UI:N/','h2oa',0,'A vulnerability in zenml-io/zenml versions up to and including 0.56.3 allows regular users to escalate their privileges to that of a service account. This issue was patched in version 0.57.0.','Available publicly on Jun 10 2024 | Available with Premium on May 16 2024','The vulnerability arises from an incorrect privilege assignment mechanism within the zenml user management system. Specifically, it allows authenticated users to modify their account details to flag their account as a \'service account\' through a crafted HTTP PUT request. This flaw effectively grants regular users the ability to elevate their privileges within the system, bypassing intended security controls and gaining unauthorized access to functionalities or data reserved for service accounts.','An attacker, after gaining access to the system as a regular user, crafts a malicious HTTP PUT request targeting the \'/api/v1/current-user\' endpoint. This request includes parameters to change the user\'s password and set the \'is_service_account\' flag to true. Upon successful execution, the attacker\'s user account is elevated to a service account, granting them higher privileges and access rights within the application.','All users of zenml-io/zenml versions 0.56.3 and below are affected by this vulnerability. Specifically, systems where regular users can access and send crafted requests to the application\'s backend are at risk of unauthorized privilege escalation.','fffffffff','Update to zenml-io/zenml version 0.57.0 or later.\nReview and restrict user permissions to ensure that only trusted users have the ability to modify sensitive account properties.\nImplement additional input validation on the server-side to prevent malicious modifications to user account properties.\nRegularly audit user accounts and privileges for any irregularities or unauthorized changes.','Fixed Version: 0.57.0\nPatch Commit: https://github.com/zenml-io/zenml/commit/bd397ba71b62175984d8b9d6d7a2eaf043c75576'),(9,'Remote Code Execution via Arbitrary File Write','open-webui',1,2,'2024-10-02','CVE-2024-7034','Machine Learning Core Libraries','Npm','22:Improper Limitation of a Pathname t','CVSS:3.1/AV:N/AC:L/PR:H/','m0kr4n3',6.5,'The endpoint `/models/upload` in version 0.3.8 of the software is vulnerable to arbitrary file write due to improper handling of user-supplied filenames. This vulnerability was patched in a later version.','Available publicly on Oct 09 2024','The vulnerability arises from the improper handling of user-supplied filenames in the /models/upload endpoint. By manipulating the file.filename parameter to include directory traversal sequences, an attacker can escape the intended upload directory and overwrite arbitrary files on the system. This can lead to remote code execution if critical files are overwritten.','An attacker can exploit this vulnerability by first obtaining an authorization token and then uploading a file with a manipulated filename that includes directory traversal sequences. This allows the attacker to write files outside the intended directory, potentially overwriting critical system files and leading to remote code execution.','Users running version 0.3.8 of the software who expose the /models/upload endpoint are affected by this vulnerability.','gggggggggg','Validate and sanitize user-supplied filenames to prevent directory traversal sequences.\nImplement a whitelist of allowed file paths.\nUse secure functions or libraries for file path handling.\nUpdate to the latest version of the software where this vulnerability is patched.','Fixed Version: N/A\nPatch Commit: N/A'),(10,'Stored XSS via ChatBot','anything-llm',1,0,'2024-10-20','CVE-2024-3570','Python Tooling','Npm','79:Improper Neutralization of Input Du','CVSS:3.1/AV:L/AC:H/PR:H/','raltheo',0,'A stored Cross-Site Scripting (XSS) vulnerability was identified in the chat feature of a web application, allowing attackers to inject malicious JavaScript through a ChatBot interaction. This vulnerability affects the latest version of the software and was patched in commit a4ace56a401ffc8ce0082d7444159dfd5dc28834.','Available publicly on Feb 24 2024 | Available with Premium on Jan 17 2024','The vulnerability arises from the application\'s unsafe handling of user and ChatBot input within the chat feature, specifically through the use of dangerouslySetInnerHTML without proper input sanitization. This flaw enables attackers to execute arbitrary JavaScript in the context of the victim\'s browser session. By exploiting this vulnerability, an attacker could perform actions on behalf of the victim, such as creating a new admin account or changing the victim\'s password, effectively taking over the admin account.','An attacker convinces the admin of the web application to integrate a malicious LocalAI ChatBot for testing. Once integrated, the attacker, controlling the ChatBot\'s responses, sends a message containing an XSS payload. When the admin interacts with the ChatBot, the payload is executed in their browser, leading to unauthorized actions such as the creation of a new admin account controlled by the attacker.','Administrators of the web application who interact with the compromised ChatBot are directly affected by this vulnerability. Indirectly, the security and integrity of the web application are compromised, affecting all users.','hhhhhhhh','Do not use dangerouslySetInnerHTML on untrusted inputs.\nImplement proper input sanitization and validation mechanisms.\nRegularly update and patch third-party components, including ChatBots.\nConduct security reviews and testing of third-party integrations before deployment.','Fixed Version: a4ace56a401ffc8ce0082d7444159dfd5dc28834\nPatch Commit: https://github.com/mintplex-labs/anything-llm/commit/a4ace56a401ffc8ce0082d7444159dfd5dc28834');
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

--
-- Table structure for table `num`
--

DROP TABLE IF EXISTS `num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `num` (
  `public_security_notice` int DEFAULT NULL,
  `premium_suggestion` int DEFAULT NULL,
  `premium_average` int DEFAULT NULL,
  `last90_days_bug` int DEFAULT NULL,
  `private_bug` int DEFAULT NULL,
  `premium_days` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `num`
--

LOCK TABLES `num` WRITE;
/*!40000 ALTER TABLE `num` DISABLE KEYS */;
INSERT INTO `num` VALUES (33,99,999,545,345,34);
/*!40000 ALTER TABLE `num` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14 15:55:12
