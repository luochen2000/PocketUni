/*
SQLyog Ultimate v8.32 
MySQL - 5.5.36 : Database - toutiao
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`toutiao` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `toutiao`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `entity_type` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entity_index` (`entity_id`,`entity_type`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`content`,`user_id`,`entity_id`,`entity_type`,`created_date`,`status`) values (1,'Comment 0',1,1,1,'2019-03-16 15:06:58',0),(2,'Comment 1',1,1,1,'2019-03-16 15:06:58',0),(3,'Comment 2',1,1,1,'2019-03-16 15:06:58',0),(4,'Comment 0',2,2,1,'2019-03-16 15:06:58',0),(5,'Comment 1',2,2,1,'2019-03-16 15:06:58',0),(6,'Comment 2',2,2,1,'2019-03-16 15:06:58',0),(7,'Comment 0',3,3,1,'2019-03-16 15:06:58',0),(8,'Comment 1',3,3,1,'2019-03-16 15:06:58',0),(9,'Comment 2',3,3,1,'2019-03-16 15:06:58',0),(10,'Comment 0',4,4,1,'2019-03-16 15:06:59',0),(11,'Comment 1',4,4,1,'2019-03-16 15:06:59',0),(12,'Comment 2',4,4,1,'2019-03-16 15:06:59',0),(13,'Comment 0',5,5,1,'2019-03-16 15:06:59',0),(14,'Comment 1',5,5,1,'2019-03-16 15:06:59',0),(15,'Comment 2',5,5,1,'2019-03-16 15:06:59',0),(16,'Comment 0',6,6,1,'2019-03-16 15:06:59',0),(17,'Comment 1',6,6,1,'2019-03-16 15:06:59',0),(18,'Comment 2',6,6,1,'2019-03-16 15:06:59',0),(19,'Comment 0',7,7,1,'2019-03-16 15:06:59',0),(20,'Comment 1',7,7,1,'2019-03-16 15:06:59',0),(21,'Comment 2',7,7,1,'2019-03-16 15:06:59',0),(22,'Comment 0',8,8,1,'2019-03-16 15:06:59',0),(23,'Comment 1',8,8,1,'2019-03-16 15:06:59',0),(24,'Comment 2',8,8,1,'2019-03-16 15:06:59',0),(25,'Comment 0',9,9,1,'2019-03-16 15:06:59',0),(26,'Comment 1',9,9,1,'2019-03-16 15:06:59',0),(27,'Comment 2',9,9,1,'2019-03-16 15:06:59',0),(28,'Comment 0',10,10,1,'2019-03-16 15:06:59',0),(29,'Comment 1',10,10,1,'2019-03-16 15:06:59',0),(30,'Comment 2',10,10,1,'2019-03-16 15:06:59',0),(31,'Comment 0',11,11,1,'2019-03-16 15:06:59',0),(32,'Comment 1',11,11,1,'2019-03-16 15:06:59',0),(33,'Comment 2',11,11,1,'2019-03-16 15:06:59',0),(34,'123',14,12,1,'2019-03-23 13:24:09',0),(35,'4',14,11,1,'2019-03-23 13:36:53',0),(36,'45',15,14,1,'2019-03-23 18:34:43',0),(37,'rrrrrrr',20,15,1,'2019-03-24 13:56:31',0),(38,'ffffffffffffffff',21,15,1,'2019-03-24 13:56:42',0);

/*Table structure for table `login_ticket` */

DROP TABLE IF EXISTS `login_ticket`;

CREATE TABLE `login_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ticket` varchar(45) NOT NULL,
  `expired` datetime NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_UNIQUE` (`ticket`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `login_ticket` */

insert  into `login_ticket`(`id`,`user_id`,`ticket`,`expired`,`status`) values (1,1,'TICKET1','2019-03-16 15:06:58',2),(2,2,'TICKET2','2019-03-16 20:06:58',2),(3,3,'TICKET3','2019-03-17 01:06:58',2),(4,4,'TICKET4','2019-03-17 06:06:59',2),(5,5,'TICKET5','2019-03-17 11:06:59',2),(6,6,'TICKET6','2019-03-17 16:06:59',2),(7,7,'TICKET7','2019-03-17 21:06:59',2),(8,8,'TICKET8','2019-03-18 02:06:59',2),(9,9,'TICKET9','2019-03-18 07:06:59',2),(10,10,'TICKET10','2019-03-18 12:06:59',2),(11,11,'TICKET11','2019-03-18 17:06:59',2),(12,12,'d70706bcc4704a0f8f43fb75f95b0a0d','2019-03-17 15:10:38',1),(13,13,'ed1d349768524b359171031de254a830','2019-03-17 15:11:58',0),(14,14,'261aa99afd3746e9af2fb0bf870e9f15','2019-03-24 13:09:26',1),(15,15,'370d6df284fa429b9c4c642b0f66f9f6','2019-03-24 17:16:32',0),(16,16,'863064e849774b54b5b35c18d3577aef','2019-03-25 13:50:03',1),(17,17,'05f3706ed3cc4a7f95ebe2d33b075f28','2019-03-25 13:55:13',1),(18,18,'b0425f00ee7e4fc798774769e679b7c2','2019-03-25 13:55:34',1),(19,19,'2759fcd53d3f468ea1d399fe73797045','2019-03-25 13:55:44',1),(20,17,'a0c6935ca58d4f4aa032195e4edbd873','2019-03-25 13:55:56',1),(21,20,'c320fb4608c44aa59339255c3436ddae','2019-03-25 13:56:25',1),(22,21,'43b53697045a4556ad3e257f4d57f690','2019-03-25 13:56:39',1),(23,17,'841da0252b304248bc988e31f089bba0','2019-03-25 13:56:54',0);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `content` text,
  `created_date` datetime DEFAULT NULL,
  `has_read` int(11) DEFAULT NULL,
  `conversation_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_index` (`conversation_id`),
  KEY `created_date` (`created_date`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`id`,`from_id`,`to_id`,`content`,`created_date`,`has_read`,`conversation_id`) values (1,3,12,'用户qq赞了你的资讯,http://127.0.0.1:8080/news/11','2019-03-16 15:10:40',0,'3_12'),(2,3,12,'用户qq赞了你的资讯,http://127.0.0.1:8080/news/10','2019-03-16 15:10:42',0,'3_12'),(3,3,12,'用户qq赞了你的资讯,http://127.0.0.1:8080/news/11','2019-03-16 15:10:43',0,'3_12'),(4,3,12,'用户qq赞了你的资讯,http://127.0.0.1:8080/news/9','2019-03-16 15:10:44',0,'3_12'),(5,3,12,'用户qq赞了你的资讯,http://127.0.0.1:8080/news/8','2019-03-16 15:10:45',0,'3_12'),(6,3,12,'用户qq赞了你的资讯,http://127.0.0.1:8080/news/7','2019-03-16 15:11:41',0,'3_12'),(7,3,14,'用户asd赞了你的资讯,http://127.0.0.1:8080/news/12','2019-03-23 13:17:44',0,'3_14'),(8,3,14,'用户asd赞了你的资讯,http://127.0.0.1:8080/news/12','2019-03-23 13:23:59',0,'3_14'),(9,3,14,'用户asd赞了你的资讯,http://127.0.0.1:8080/news/12','2019-03-23 13:24:50',0,'3_14'),(10,3,15,'用户zx赞了你的资讯,http://127.0.0.1:8080/news/13','2019-03-23 18:30:36',0,'3_15'),(11,3,15,'用户zx赞了你的资讯,http://127.0.0.1:8080/news/14','2019-03-23 18:30:36',0,'3_15'),(12,3,16,'用户zxy赞了你的资讯,http://127.0.0.1:8080/news/14','2019-03-24 13:50:05',0,'3_16'),(13,3,16,'用户zxy赞了你的资讯,http://127.0.0.1:8080/news/13','2019-03-24 13:50:06',0,'3_16'),(14,3,16,'用户zxy赞了你的资讯,http://127.0.0.1:8080/news/12','2019-03-24 13:50:07',0,'3_16'),(15,3,16,'用户zxy赞了你的资讯,http://127.0.0.1:8080/news/11','2019-03-24 13:52:36',0,'3_16'),(16,3,18,'用户aaaaaa赞了你的资讯,http://127.0.0.1:8080/news/15','2019-03-24 13:55:35',0,'3_18'),(17,3,19,'用户sssssssss赞了你的资讯,http://127.0.0.1:8080/news/15','2019-03-24 13:55:45',0,'3_19'),(18,3,17,'你上次的登陆ip异常','2019-03-24 13:55:56',0,'3_17'),(19,3,17,'用户qqq赞了你的资讯,http://127.0.0.1:8080/news/15','2019-03-24 13:56:08',0,'3_17'),(20,3,17,'你上次的登陆ip异常','2019-03-24 13:56:54',0,'3_17'),(21,3,17,'用户qqq赞了你的资讯,http://127.0.0.1:8080/news/14','2019-03-24 14:51:17',0,'3_17'),(22,3,17,'用户qqq赞了你的资讯,http://127.0.0.1:8080/news/13','2019-03-24 14:51:17',0,'3_17'),(23,3,17,'用户qqq赞了你的资讯,http://127.0.0.1:8080/news/12','2019-03-24 14:51:18',0,'3_17'),(24,3,17,'用户qqq赞了你的资讯,http://127.0.0.1:8080/news/11','2019-03-24 14:51:19',0,'3_17'),(25,3,17,'用户qqq赞了你的资讯,http://127.0.0.1:8080/news/10','2019-03-24 14:51:19',0,'3_17'),(26,3,17,'用户qqq赞了你的资讯,http://127.0.0.1:8080/news/9','2019-03-24 14:51:20',0,'3_17'),(27,3,17,'用户qqq赞了你的资讯,http://127.0.0.1:8080/news/8','2019-03-24 14:51:20',0,'3_17');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL DEFAULT '',
  `link` varchar(256) NOT NULL DEFAULT '',
  `image` varchar(256) NOT NULL DEFAULT '',
  `like_count` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`link`,`image`,`like_count`,`comment_count`,`created_date`,`user_id`) values (1,'TITLE{0}','http://www.nowcoder.com/0.html','http://images.nowcoder.com/head/593m.png',1,0,'2019-03-16 15:06:58',1),(2,'TITLE{1}','http://www.nowcoder.com/1.html','http://images.nowcoder.com/head/226m.png',2,1,'2019-03-16 20:06:58',2),(3,'TITLE{2}','http://www.nowcoder.com/2.html','http://images.nowcoder.com/head/347m.png',3,2,'2019-03-17 01:06:58',3),(4,'TITLE{3}','http://www.nowcoder.com/3.html','http://images.nowcoder.com/head/56m.png',4,3,'2019-03-17 06:06:59',4),(5,'TITLE{4}','http://www.nowcoder.com/4.html','http://images.nowcoder.com/head/11m.png',5,4,'2019-03-17 11:06:59',5),(6,'TITLE{5}','http://www.nowcoder.com/5.html','http://images.nowcoder.com/head/109m.png',6,5,'2019-03-17 16:06:59',6),(7,'TITLE{6}','http://www.nowcoder.com/6.html','http://images.nowcoder.com/head/439m.png',0,6,'2019-03-17 21:06:59',7),(8,'TITLE{7}','http://www.nowcoder.com/7.html','http://images.nowcoder.com/head/4m.png',1,7,'2019-03-18 02:06:59',8),(9,'TITLE{8}','http://www.nowcoder.com/8.html','http://images.nowcoder.com/head/134m.png',1,8,'2019-03-18 07:06:59',9),(10,'TITLE{9}','http://www.nowcoder.com/9.html','http://images.nowcoder.com/head/486m.png',1,9,'2019-03-18 12:06:59',10),(11,'TITLE{10}','http://www.nowcoder.com/10.html','http://images.nowcoder.com/head/803m.png',3,4,'2019-03-18 17:06:59',11),(12,'魅力草原','123','http://127.0.0.1:8080/image?name=2ef696b001834e9abbfa66b569274534.jpeg',3,1,'2019-03-23 13:09:43',14),(13,'fsadf','asd','http://127.0.0.1:8080/image?name=5b6545ffea49415588b954d68a95bc68.png',3,0,'2019-03-23 18:30:18',15),(14,'asd','rgrg','http://127.0.0.1:8080/image?name=fe281c4771054e838746614271e57a3f.jpeg',3,1,'2019-03-23 18:30:26',15),(15,'qqqq','qqqq','http://127.0.0.1:8080/image?name=5d1858b3622a428fac7d5820e15d3bfd.jpeg',3,2,'2019-03-24 13:55:20',17);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(128) NOT NULL DEFAULT '',
  `salt` varchar(32) NOT NULL DEFAULT '',
  `head_url` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`,`salt`,`head_url`) values (2,'USER1','newpassword','','http://images.nowcoder.com/head/538t.png'),(3,'USER2','newpassword','','http://images.nowcoder.com/head/172t.png'),(4,'USER3','newpassword','','http://images.nowcoder.com/head/619t.png'),(5,'USER4','newpassword','','http://images.nowcoder.com/head/712t.png'),(6,'USER5','newpassword','','http://images.nowcoder.com/head/223t.png'),(7,'USER6','newpassword','','http://images.nowcoder.com/head/480t.png'),(8,'USER7','newpassword','','http://images.nowcoder.com/head/835t.png'),(9,'USER8','newpassword','','http://images.nowcoder.com/head/855t.png'),(10,'USER9','newpassword','','http://images.nowcoder.com/head/200t.png'),(11,'USER10','newpassword','','http://images.nowcoder.com/head/141t.png'),(12,'qq','7BB13418C731F0E1C62257D4D4A0E833','051f1','http://images.nowcoder.com/head/161t.png'),(13,'ww','7E8BCE45617B943CB4E95C94CE0DDF40','ed820','http://images.nowcoder.com/head/489t.png'),(14,'asd','61B548250C150490417B45E7FE7A0289','62860','http://images.nowcoder.com/head/452t.png'),(15,'zx','BF8A0088F91615D22E92054A9252295A','0c6c0','http://images.nowcoder.com/head/220t.png'),(16,'zxy','2246E10CC725225B09D392086995690B','ca019','http://images.nowcoder.com/head/416t.png'),(17,'qqq','72ABF56E4BAFF36E1180CEE819599454','657a2','http://images.nowcoder.com/head/122t.png'),(18,'aaaaaa','9F8E0729F090D4046239791DE8C4D72B','a383d','http://images.nowcoder.com/head/113t.png'),(19,'sssssssss','36090D61DC62AA549E543E117C63DC8F','894df','http://images.nowcoder.com/head/675t.png'),(20,'rrrrrr','E26524E22C0B59D4E695C400710A04CA','c5595','http://images.nowcoder.com/head/26t.png'),(21,'fffffffff','121F3065E245821482D57306D4751EBC','d0bcb','http://images.nowcoder.com/head/702t.png');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
