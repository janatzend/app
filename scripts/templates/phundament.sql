-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: dev-phundament-4
-- ------------------------------------------------------
-- Server version	10.1.5-MariaDB-1~trusty-log

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

DROP SCHEMA IF EXISTS phundament;
CREATE SCHEMA phundament;
USE phundament;

--
-- Table structure for table `app_auth_assignment`
--

DROP TABLE IF EXISTS `app_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `app_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `app_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_auth_assignment`
--

LOCK TABLES `app_auth_assignment` WRITE;
/*!40000 ALTER TABLE `app_auth_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_auth_item`
--

DROP TABLE IF EXISTS `app_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `app_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `app_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_auth_item`
--

LOCK TABLES `app_auth_item` WRITE;
/*!40000 ALTER TABLE `app_auth_item` DISABLE KEYS */;
INSERT INTO `app_auth_item` VALUES ('Pages',2,'Pages Module',NULL,NULL,1442316391,1442316391);
/*!40000 ALTER TABLE `app_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_auth_item_child`
--

DROP TABLE IF EXISTS `app_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `app_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `app_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `app_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `app_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_auth_item_child`
--

LOCK TABLES `app_auth_item_child` WRITE;
/*!40000 ALTER TABLE `app_auth_item_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_auth_rule`
--

DROP TABLE IF EXISTS `app_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_auth_rule`
--

LOCK TABLES `app_auth_rule` WRITE;
/*!40000 ALTER TABLE `app_auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_language`
--

DROP TABLE IF EXISTS `app_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_language` (
  `language_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name_ascii` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_language`
--

LOCK TABLES `app_language` WRITE;
/*!40000 ALTER TABLE `app_language` DISABLE KEYS */;
INSERT INTO `app_language` VALUES ('af-ZA','af','za','Afrikaans','Afrikaans',0),('ar-AR','ar','ar','‏العربية‏','Arabic',0),('az-AZ','az','az','Azərbaycan dili','Azerbaijani',0),('be-BY','be','by','Беларуская','Belarusian',0),('bg-BG','bg','bg','Български','Bulgarian',0),('bn-IN','bn','in','বাংলা','Bengali',0),('bs-BA','bs','ba','Bosanski','Bosnian',0),('ca-ES','ca','es','Català','Catalan',0),('cs-CZ','cs','cz','Čeština','Czech',0),('cy-GB','cy','gb','Cymraeg','Welsh',0),('da-DK','da','dk','Dansk','Danish',0),('de-DE','de','de','Deutsch','German',0),('el-GR','el','gr','Ελληνικά','Greek',0),('en-GB','en','gb','English (UK)','English (UK)',1),('en-PI','en','pi','English (Pirate)','English (Pirate)',0),('en-UD','en','ud','English (Upside Down)','English (Upside Down)',0),('en-US','en','us','English (US)','English (US)',1),('eo-EO','eo','eo','Esperanto','Esperanto',0),('es-ES','es','es','Español (España)','Spanish (Spain)',0),('es-LA','es','la','Español','Spanish',0),('et-EE','et','ee','Eesti','Estonian',0),('eu-ES','eu','es','Euskara','Basque',0),('fa-IR','fa','ir','‏فارسی‏','Persian',0),('fb-LT','fb','lt','Leet Speak','Leet Speak',0),('fi-FI','fi','fi','Suomi','Finnish',0),('fo-FO','fo','fo','Føroyskt','Faroese',0),('fr-CA','fr','ca','Français (Canada)','French (Canada)',0),('fr-FR','fr','fr','Français (France)','French (France)',0),('fy-NL','fy','nl','Frysk','Frisian',0),('ga-IE','ga','ie','Gaeilge','Irish',0),('gl-ES','gl','es','Galego','Galician',0),('he-IL','he','il','‏עברית‏','Hebrew',0),('hi-IN','hi','in','हिन्दी','Hindi',0),('hr-HR','hr','hr','Hrvatski','Croatian',0),('hu-HU','hu','hu','Magyar','Hungarian',0),('hy-AM','hy','am','Հայերեն','Armenian',0),('id-ID','id','id','Bahasa Indonesia','Indonesian',0),('is-IS','is','is','Íslenska','Icelandic',0),('it-IT','it','it','Italiano','Italian',0),('ja-JP','ja','jp','日本語','Japanese',0),('ka-GE','ka','ge','ქართული','Georgian',0),('km-KH','km','kh','ភាសាខ្មែរ','Khmer',0),('ko-KR','ko','kr','한국어','Korean',0),('ku-TR','ku','tr','Kurdî','Kurdish',0),('la-VA','la','va','lingua latina','Latin',0),('lt-LT','lt','lt','Lietuvių','Lithuanian',0),('lv-LV','lv','lv','Latviešu','Latvian',0),('mk-MK','mk','mk','Македонски','Macedonian',0),('ml-IN','ml','in','മലയാളം','Malayalam',0),('ms-MY','ms','my','Bahasa Melayu','Malay',0),('nb-NO','nb','no','Norsk (bokmål)','Norwegian (bokmal)',0),('ne-NP','ne','np','नेपाली','Nepali',0),('nl-NL','nl','nl','Nederlands','Dutch',0),('nn-NO','nn','no','Norsk (nynorsk)','Norwegian (nynorsk)',0),('pa-IN','pa','in','ਪੰਜਾਬੀ','Punjabi',0),('pl-PL','pl','pl','Polski','Polish',0),('ps-AF','ps','af','‏پښتو‏','Pashto',0),('pt-BR','pt','br','Português (Brasil)','Portuguese (Brazil)',0),('pt-PT','pt','pt','Português (Portugal)','Portuguese (Portugal)',0),('ro-RO','ro','ro','Română','Romanian',0),('ru-RU','ru','ru','Русский','Russian',0),('sk-SK','sk','sk','Slovenčina','Slovak',0),('sl-SI','sl','si','Slovenščina','Slovenian',0),('sq-AL','sq','al','Shqip','Albanian',0),('sr-RS','sr','rs','Српски','Serbian',0),('sv-SE','sv','se','Svenska','Swedish',0),('sw-KE','sw','ke','Kiswahili','Swahili',0),('ta-IN','ta','in','தமிழ்','Tamil',0),('te-IN','te','in','తెలుగు','Telugu',0),('th-TH','th','th','ภาษาไทย','Thai',0),('tl-PH','tl','ph','Filipino','Filipino',0),('tr-TR','tr','tr','Türkçe','Turkish',0),('uk-UA','uk','ua','Українська','Ukrainian',0),('vi-VN','vi','vn','Tiếng Việt','Vietnamese',0),('xx-XX','xx','xx','Fejlesztő','Developer',0),('zh-CN','zh','cn','中文(简体)','Simplified Chinese (China)',0),('zh-HK','zh','hk','中文(香港)','Traditional Chinese (Hong Kong)',0),('zh-TW','zh','tw','中文(台灣)','Traditional Chinese (Taiwan)',0);
/*!40000 ALTER TABLE `app_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_language_source`
--

DROP TABLE IF EXISTS `app_language_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_language_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_language_source`
--

LOCK TABLES `app_language_source` WRITE;
/*!40000 ALTER TABLE `app_language_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_language_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_language_translate`
--

DROP TABLE IF EXISTS `app_language_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_language_translate` (
  `id` int(11) NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `translation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`,`language`),
  KEY `language_translate_idx_language` (`language`),
  CONSTRAINT `language_translate_ibfk_1` FOREIGN KEY (`language`) REFERENCES `app_language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `language_translate_ibfk_2` FOREIGN KEY (`id`) REFERENCES `app_language_source` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_language_translate`
--

LOCK TABLES `app_language_translate` WRITE;
/*!40000 ALTER TABLE `app_language_translate` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_language_translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_migration`
--

DROP TABLE IF EXISTS `app_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_migration` (
  `version` varchar(180) NOT NULL,
  `alias` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_migration`
--

LOCK TABLES `app_migration` WRITE;
/*!40000 ALTER TABLE `app_migration` DISABLE KEYS */;
INSERT INTO `app_migration` VALUES ('m000000_000000_base','@app/migrations',1442316389),('m140209_132017_init','@dektrium/user/migrations',1442316390),('m140403_174025_create_account_table','@dektrium/user/migrations',1442316390),('m140504_113157_update_tables','@dektrium/user/migrations',1442316390),('m140504_130429_create_token_table','@dektrium/user/migrations',1442316390),('m140506_102106_rbac_init','@yii/rbac/migrations',1442316391),('m140830_171933_fix_ip_field','@dektrium/user/migrations',1442316391),('m140830_172703_change_account_table_name','@dektrium/user/migrations',1442316391),('m141002_030233_translate_manager','@vendor/lajax/yii2-translate-manager/migrations',1442316391),('m141222_110026_update_ip_field','@dektrium/user/migrations',1442316391),('m150309_153255_create_tree_manager_table','@vendor/dmstr/yii2-pages-module/migrations',1442316391),('m150623_164544_auth_items','@vendor/dmstr/yii2-pages-module/migrations',1442316391);
/*!40000 ALTER TABLE `app_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_profile`
--

DROP TABLE IF EXISTS `app_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_profile`
--

LOCK TABLES `app_profile` WRITE;
/*!40000 ALTER TABLE `app_profile` DISABLE KEYS */;
INSERT INTO `app_profile` VALUES (1,NULL,NULL,'admin@myapp.local','632c8988831808e77ad27c4215384254',NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_social_account`
--

DROP TABLE IF EXISTS `app_social_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(70) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_social_account`
--

LOCK TABLES `app_social_account` WRITE;
/*!40000 ALTER TABLE `app_social_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_social_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_token`
--

DROP TABLE IF EXISTS `app_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_token`
--

LOCK TABLES `app_token` WRITE;
/*!40000 ALTER TABLE `app_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,'admin','admin@myapp.local','$2y$10$VwdpooHtu.A/BJF4ZQaA5u0EBg515mMJ6chSR6NlCLuKwDPb3ju26','MWcsPMdnFyHS1IyBlNupmcLxr7NG3UHE',1442316450,NULL,NULL,NULL,1442316392,1442316392,0);
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dmstr_page`
--

DROP TABLE IF EXISTS `dmstr_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dmstr_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique tree node identifier',
  `root` int(11) DEFAULT NULL COMMENT 'Tree root identifier',
  `lft` int(11) NOT NULL COMMENT 'Nested set left property',
  `rgt` int(11) NOT NULL COMMENT 'Nested set right property',
  `lvl` smallint(5) NOT NULL COMMENT 'Nested set level / depth',
  `page_title` varchar(255) DEFAULT NULL COMMENT 'The page title',
  `name` varchar(60) NOT NULL COMMENT 'The tree node name / label',
  `name_id` varchar(255) NOT NULL COMMENT 'The unique name_id',
  `slug` varchar(255) DEFAULT NULL COMMENT 'The auto generated slugged name_id',
  `route` varchar(255) DEFAULT NULL COMMENT 'The controller/view route',
  `view` varchar(255) DEFAULT NULL COMMENT 'The view to render through the given route',
  `default_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'SEO - meta keywords - comma seperated',
  `default_meta_description` text COMMENT 'SEO - meta description',
  `request_params` text COMMENT 'JSON - request params',
  `owner` int(11) DEFAULT NULL COMMENT 'The owner user id how created the page node',
  `access_owner` int(11) DEFAULT NULL,
  `access_domain` varchar(8) DEFAULT NULL,
  `access_read` varchar(255) DEFAULT NULL,
  `access_update` varchar(255) DEFAULT NULL,
  `access_delete` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT 'The icon to use for the node',
  `icon_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Icon Type: 1 = CSS Class, 2 = Raw Markup',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is active (will be set to false on deletion)',
  `selected` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the node is selected/checked by default',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the node is enabled',
  `readonly` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the node is read only (unlike disabled - will allow toolbar actions)',
  `visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is visible',
  `collapsed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the node is collapsed by default',
  `movable_u` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is movable one position up',
  `movable_d` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is movable one position down',
  `movable_l` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is movable to the left (from sibling to parent)',
  `movable_r` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is movable to the right (from sibling to child)',
  `removable` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is removable (any children below will be moved as siblings before deletion)',
  `removable_all` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the node is removable along with descendants',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_id_UNIQUE` (`name_id`),
  KEY `tbl_tree_NK1` (`root`),
  KEY `tbl_tree_NK2` (`lft`),
  KEY `tbl_tree_NK3` (`rgt`),
  KEY `tbl_tree_NK4` (`lvl`),
  KEY `tbl_tree_NK5` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmstr_page`
--

LOCK TABLES `dmstr_page` WRITE;
/*!40000 ALTER TABLE `dmstr_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `dmstr_page` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-24 11:11:32
