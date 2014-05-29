-- MySQL dump 10.13  Distrib 5.5.27, for Win32 (x86)
--
-- Host: localhost    Database: votedb
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `selectitem`
--

DROP TABLE IF EXISTS `selectitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selectitem` (
  `id` varchar(35) NOT NULL,
  `themeid` varchar(35) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `themeid` (`themeid`),
  CONSTRAINT `selectitem_ibfk_1` FOREIGN KEY (`themeid`) REFERENCES `selecttheme` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selectitem`
--

LOCK TABLES `selectitem` WRITE;
/*!40000 ALTER TABLE `selectitem` DISABLE KEYS */;
INSERT INTO `selectitem` VALUES ('00CGQ05OD01pRCl5FaMMiyYIA9DUhijW','O4FZLGPx4KjIaajFKqN6TLSWVtWlmuV9','铁观音',3),('3mlg8gY9S1GPmoW0E31NDrdDH2fybYzi','B64iirBr6UeHulW06m03kXzNyTIFKaAf','网络工程',2),('ad9i6BRMy47VGfjouE5NAS8kXYn1e4wX','VoCCtroVlF7RlPX60Ij8XGxycbufrMSh','飞度',3),('AkdOQAjzpwceZjxngtLFcFGLucpzdVJN','M7ylSJSqhYDcXh6LlAmO1E33Q6LvAIhM','雨天',1),('cADPNPFFnp3tg9jImCTWYh48m1HmcCBb','VoCCtroVlF7RlPX60Ij8XGxycbufrMSh','大黄蜂',5),('dsBnvI13yEuxliIKjdjvCWIcAiV4V3WX','vnuyvww9tEmGgMXC8fFmLBS0oIKSd7t8','python',1),('EKqult0AtLD61qM67VNW4NrE9XxCjYUi','O4FZLGPx4KjIaajFKqN6TLSWVtWlmuV9','花茶',2),('FUym6OeZlpVl8jJ44Y4ZYD3ZYf1lcHQ8','vnuyvww9tEmGgMXC8fFmLBS0oIKSd7t8','java',5),('fxt0QimADk0QLaPFDuRj84rTtAgsr7QI','O4FZLGPx4KjIaajFKqN6TLSWVtWlmuV9','绿茶',3),('kufjwlIQf8yEmQPkJdm8XSMuyaLSa4el','VoCCtroVlF7RlPX60Ij8XGxycbufrMSh','QQ',5),('L9u3H1KlfIqvwIGY8sbe7mMmUG825oYn','bGMrMVMlGWxEmqHwhpxYJiYVzE3n2L6z','black',2),('lmNAnUc9o7Rp0ky1ya8YAbq09qtTkvCZ','B64iirBr6UeHulW06m03kXzNyTIFKaAf','车辆工程',1),('lYqxIZUgkYKDMm9P1JcRfZDuv948yoKu','bGMrMVMlGWxEmqHwhpxYJiYVzE3n2L6z','red',5),('nnLiMgx7fsCL8xuo0M6Am9X3ML87qbPO','vnuyvww9tEmGgMXC8fFmLBS0oIKSd7t8','c#',3),('nnMaYmtWU2q0zbEneQ3bqCsx3ikbupQz','vnuyvww9tEmGgMXC8fFmLBS0oIKSd7t8','c++',3),('U10ZSkxZkAbTymMF9MJsM5TBmpYu7gKK','bGMrMVMlGWxEmqHwhpxYJiYVzE3n2L6z','blue',2),('u5hOUgfhklKDPk8TeMv4i02EBwynU7pe','VoCCtroVlF7RlPX60Ij8XGxycbufrMSh','Q7',2),('Wsr7PiEX0d7STH2F0a3tMJp1GPRwCoU6','bGMrMVMlGWxEmqHwhpxYJiYVzE3n2L6z','green',1),('wW0jsCEH7jZZj65XETPcCoI6TN9fsRPm','B64iirBr6UeHulW06m03kXzNyTIFKaAf','金融工程',2),('X9tMsnaEM9561LVOsZPksBzZ7viiAJHX','B64iirBr6UeHulW06m03kXzNyTIFKaAf','自动化',1),('xIG3O3mhhGTz28IacQuuZbUw9XO3IOlD','B64iirBr6UeHulW06m03kXzNyTIFKaAf','软件工程',2),('y1AfRNXVuTmwQ92Hzu5kg6692n1bdx3u','M7ylSJSqhYDcXh6LlAmO1E33Q6LvAIhM','下雪',3),('YDoVGvWD9d0BfIP3etqBHbVNCxvnMdXu','O4FZLGPx4KjIaajFKqN6TLSWVtWlmuV9','红茶',1),('Z4aKjII49nbVpdYzZp8DQiwmU0UAtEn5','M7ylSJSqhYDcXh6LlAmO1E33Q6LvAIhM','晴天',4);
/*!40000 ALTER TABLE `selectitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selecttheme`
--

DROP TABLE IF EXISTS `selecttheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selecttheme` (
  `id` varchar(35) NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selecttheme`
--

LOCK TABLES `selecttheme` WRITE;
/*!40000 ALTER TABLE `selecttheme` DISABLE KEYS */;
INSERT INTO `selecttheme` VALUES ('1d55goIBCJrgxCZ8Bp8a0fl5tR635HSx','你喜欢的颜色？',10,0),('B64iirBr6UeHulW06m03kXzNyTIFKaAf','最坑爹的专业',10,0),('bGMrMVMlGWxEmqHwhpxYJiYVzE3n2L6z','你喜欢的颜色？',10,0),('M7ylSJSqhYDcXh6LlAmO1E33Q6LvAIhM','喜欢的天气',10,1),('O4FZLGPx4KjIaajFKqN6TLSWVtWlmuV9','最受欢迎的茶叶',10,0),('vnuyvww9tEmGgMXC8fFmLBS0oIKSd7t8','你喜欢的编程语言？',10,0),('VoCCtroVlF7RlPX60Ij8XGxycbufrMSh','最叼的车子',11,0),('ZbW5BfcqquwwsT8oPkCVF9omncZO65KS','最叼的车子',10,0);
/*!40000 ALTER TABLE `selecttheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `name` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin'),('ä½ç¦','123456'),('Oscar','8699496'),('shinn','8699496');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_allvote`
--

DROP TABLE IF EXISTS `v_allvote`;
/*!50001 DROP VIEW IF EXISTS `v_allvote`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_allvote` (
  `theme_id` tinyint NOT NULL,
  `item_id` tinyint NOT NULL,
  `theme` tinyint NOT NULL,
  `item` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `count` tinyint NOT NULL,
  `total` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_allvote`
--

/*!50001 DROP TABLE IF EXISTS `v_allvote`*/;
/*!50001 DROP VIEW IF EXISTS `v_allvote`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_allvote` AS select `selecttheme`.`id` AS `theme_id`,`selectitem`.`id` AS `item_id`,`selecttheme`.`theme` AS `theme`,`selectitem`.`item` AS `item`,`selecttheme`.`status` AS `status`,`selectitem`.`count` AS `count`,`selecttheme`.`total` AS `total` from (`selecttheme` join `selectitem`) where (`selectitem`.`themeid` = `selecttheme`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-26 19:24:43
