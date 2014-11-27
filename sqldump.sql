-- MySQL dump 10.13  Distrib 5.6.12, for osx10.7 (x86_64)
--
-- Host: localhost    Database: hangman
-- ------------------------------------------------------
-- Server version	5.6.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user social auth',7,'add_usersocialauth'),(20,'Can change user social auth',7,'change_usersocialauth'),(21,'Can delete user social auth',7,'delete_usersocialauth'),(22,'Can add nonce',8,'add_nonce'),(23,'Can change nonce',8,'change_nonce'),(24,'Can delete nonce',8,'delete_nonce'),(25,'Can add association',9,'add_association'),(26,'Can change association',9,'change_association'),(27,'Can delete association',9,'delete_association'),(28,'Can add question',10,'add_question'),(29,'Can change question',10,'change_question'),(30,'Can delete question',10,'delete_question'),(31,'Can add score',11,'add_score'),(32,'Can change score',11,'change_score'),(33,'Can delete score',11,'delete_score');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$7Qq4wAfRsH86$wdMSTNpGzaXstLwjmBqBai7XDfpEURslnw79IEfxpaQ=','2014-01-10 11:54:32',1,'eldho','','','dits59@yahoo.com',1,1,'2014-01-10 11:54:32'),(2,'!OwasKl7DNLTg9h9iZGnWCN2A72NeBjDi8kwq7Tip','2014-01-10 15:57:16',0,'eldhosejohnk','Eldhose','John','dits59@yahoo.com',0,1,'2014-01-10 12:47:01'),(3,'pbkdf2_sha256$12000$2iIGUhEJg0r5$rrxdIfeg2G9zvQuQV4XNNvbX3ZYXlElTtbpwv1WEJgs=','2014-01-10 17:45:35',1,'tintu','','','d@d.com',1,1,'2014-01-10 17:44:10');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-01-10 17:48:50',3,10,'1','Question object',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'user social auth','social_auth','usersocialauth'),(8,'nonce','social_auth','nonce'),(9,'association','social_auth','association'),(10,'question','hangmanapp','question'),(11,'score','hangmanapp','score');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('01cjn0iwm3a3fj0d1yfockjvoq2fykl2','MmY5NzdkYWI2YmY5OGYxMjBhMjhlNWE3M2M3NmY5OWRhZDhlNTg3NTp7ImZhY2Vib29rX3N0YXRlIjoiV1F4bTZvT2lkWTNhZ0h1dGRqQWpHSjlHU1ZrdUUwYmkifQ==','2014-01-24 12:47:01'),('8afulgdachrq12c82ex0bb6pnxmr6l60','NDQ4Yjg0ZDIyN2ViZjE1ODI4NGZmN2JkMDgzYzFmYTczNTgxMGNkYTqAAn1xAShVDmZhY2Vib29rX3N0YXRlcQJYIAAAAEhCNDhrZXVwR3ZwQzVoVkRzTVJxbnUzb1RzMkpLc2FtcQNYDwAAAF9zZXNzaW9uX2V4cGlyeXEEY2RhdGV0aW1lCmRhdGV0aW1lCnEFVQoH3gMLDC0bCXVbY2RqYW5nby51dGlscy50aW1lem9uZQpVVEMKcQYpUnEHhlJxCFUSX2F1dGhfdXNlcl9iYWNrZW5kcQlVLXNvY2lhbF9hdXRoLmJhY2tlbmRzLmZhY2Vib29rLkZhY2Vib29rQmFja2VuZHEKVQ1fYXV0aF91c2VyX2lkcQuKAQJVHnNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZHEMWAgAAABmYWNlYm9va3ENdS4=','2014-03-11 12:45:27'),('g92tj9178phanragrgt9uag6j0rzfivc','YzA4ZTdkZWRiN2Q2NmY4NjllMTk1MDlhZjcwYzFlNjJlYmY1NDViZTqAAn1xAShVDmZhY2Vib29rX3N0YXRlcQJYIAAAAG4wWnBCM3JKVUF4VHFUQk9nUEJlOFFpZjJZSnNIeHRKcQNYDwAAAF9zZXNzaW9uX2V4cGlyeXEEY2RhdGV0aW1lCmRhdGV0aW1lCnEFVQoH3gMLDC0bBen3Y2RqYW5nby51dGlscy50aW1lem9uZQpVVEMKcQYpUnEHhlJxCFUSX2F1dGhfdXNlcl9iYWNrZW5kcQlVLXNvY2lhbF9hdXRoLmJhY2tlbmRzLmZhY2Vib29rLkZhY2Vib29rQmFja2VuZHEKVQ1fYXV0aF91c2VyX2lkcQuKAQJVHnNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZHEMWAgAAABmYWNlYm9va3ENdS4=','2014-03-11 12:45:27'),('m72njr1zsok3355ozrfxf7at07qy16sa','YWE4OTNjMzVhMzg2MTkzMGZmNzIxMDMwZmU2NWU1NTFjZmRmZjRlOTqAAn1xAShVDmZhY2Vib29rX3N0YXRlcQJYIAAAAFI1QmdYT3VUTnpMRVhSMUNTaXdRbThHRTczTkdDS3NRcQNVHnNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZHEEWAgAAABmYWNlYm9va3EFVQ1fYXV0aF91c2VyX2lkcQaKAQJVEl9hdXRoX3VzZXJfYmFja2VuZHEHVS1zb2NpYWxfYXV0aC5iYWNrZW5kcy5mYWNlYm9vay5GYWNlYm9va0JhY2tlbmRxCFgPAAAAX3Nlc3Npb25fZXhwaXJ5cQljZGF0ZXRpbWUKZGF0ZXRpbWUKcQpVCgfeAwsMLRwDTWFjZGphbmdvLnV0aWxzLnRpbWV6b25lClVUQwpxCylScQyGUnENdS4=','2014-03-11 12:45:28'),('o9cq9y5oed5039lzeyqvhnx5b3qwdm16','YzI2NGM1OGIxMTc0N2Y3MGZlMDZmZTRlYzY1OGU4MWI0MjI4M2E5YzqAAn1xAShVDmZhY2Vib29rX3N0YXRlcQJYIAAAAFV5VmpIZmFhdzN4aGVpR2cyY1dndmFBeFJlRkt6UFp5cQNYDwAAAF9zZXNzaW9uX2V4cGlyeXEEY2RhdGV0aW1lCmRhdGV0aW1lCnEFVQoH3gMLDC0bB10BY2RqYW5nby51dGlscy50aW1lem9uZQpVVEMKcQYpUnEHhlJxCFUSX2F1dGhfdXNlcl9iYWNrZW5kcQlVLXNvY2lhbF9hdXRoLmJhY2tlbmRzLmZhY2Vib29rLkZhY2Vib29rQmFja2VuZHEKVQ1fYXV0aF91c2VyX2lkcQuKAQJVHnNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZHEMWAgAAABmYWNlYm9va3ENdS4=','2014-03-11 12:45:27'),('plgrxo5u7l2wmjftohgx80orzu5kr7q3','ZWNkYTdlMGM1ZDJmMzJlYmJmY2NmNjM0NzBhZmYxYzU0YzI3NGQwYTqAAn1xAShVDmZhY2Vib29rX3N0YXRlcQJYIAAAAEp0RHFYRUJxSDJXb0t1aGNYOVE3SGo1Z0hmOXJJdlRocQNYDwAAAF9zZXNzaW9uX2V4cGlyeXEEY2RhdGV0aW1lCmRhdGV0aW1lCnEFVQoH3gMLDC0bAr22Y2RqYW5nby51dGlscy50aW1lem9uZQpVVEMKcQYpUnEHhlJxCFUSX2F1dGhfdXNlcl9iYWNrZW5kcQlVLXNvY2lhbF9hdXRoLmJhY2tlbmRzLmZhY2Vib29rLkZhY2Vib29rQmFja2VuZHEKVQ1fYXV0aF91c2VyX2lkcQuKAQJVHnNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZHEMWAgAAABmYWNlYm9va3ENdS4=','2014-03-11 12:45:27'),('ti9hcmy09a69fzu3ydf2errein23c0or','OGI4NDZhMWM2ZDhjMzA1NWJiMzZkZGE3ZDlmYTRiYWUzMjBkYTNjOTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQN1Lg==','2014-01-24 17:45:35'),('v1ld2p9ukiccvgby7eyp50ug42xyguxb','NTM2MzNiNzg3NTQwMjRhN2Y3MDk1ZjU1MTgzMzJhYTEyMjZiYjc1OTp7ImZhY2Vib29rX3N0YXRlIjoidlRGTGg1NVZOTTNTeHhaZWxCNHVYUkxCQ0QyTnFPbEgifQ==','2014-01-24 12:47:09'),('wz68nvp11r8bczeawmy19waqtrdxb9nl','MzRhOThhZDgyMmFkZjE2MWJhMmQ2ZTMyNjRmODgyNjE5MjhhZjUyYTqAAn1xAVUOZmFjZWJvb2tfc3RhdGVxAlggAAAANGpGZVlSN2pxdlZpU3ZjdkVMMlB1NEh4NmJpblB0VFpxA3Mu','2014-01-24 15:11:16');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hangmanapp_question`
--

DROP TABLE IF EXISTS `hangmanapp_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hangmanapp_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL,
  `hint` varchar(100) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `created_by_id` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_30517dd0` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hangmanapp_question`
--

LOCK TABLES `hangmanapp_question` WRITE;
/*!40000 ALTER TABLE `hangmanapp_question` DISABLE KEYS */;
INSERT INTO `hangmanapp_question` VALUES (1,'Asia','continent',3);
/*!40000 ALTER TABLE `hangmanapp_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hangmanapp_score`
--

DROP TABLE IF EXISTS `hangmanapp_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hangmanapp_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question_id` (`question_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `question_id_refs_id_4f8c443c` FOREIGN KEY (`question_id`) REFERENCES `hangmanapp_question` (`id`),
  CONSTRAINT `user_id_refs_id_de6cfae5` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hangmanapp_score`
--

LOCK TABLES `hangmanapp_score` WRITE;
/*!40000 ALTER TABLE `hangmanapp_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `hangmanapp_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_url` (`server_url`,`handle`),
  KEY `social_auth_association_93d95bdf` (`issued`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_url` (`server_url`,`timestamp`,`salt`),
  KEY `social_auth_nonce_d80b9c9a` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `provider` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_e6cbdf29` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,2,'facebook','780901951','{\"access_token\": \"CAAAABOSSmgEBAKNOtCjRBlafqTxEVOs7MLu2oYILtmyhqDpKiORVfX7mCsEdx0awYjAd8YD3sSSmL49HUp2Sl1F9UTMU7bNhmFwKn0D4xN4oHidIozH1W0mssMFGmNWaRnbZA8tsKjCbEulne1UM7ZCOgzjS3j4LdjZBG0AUDVcLr8BOOCe\", \"expires\": \"5172491\", \"id\": \"780901951\"}');
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-10 23:32:49
