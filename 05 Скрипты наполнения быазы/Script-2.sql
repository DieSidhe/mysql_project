use dudesunited;

/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registered_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `companies` VALUES ('1','Ryan LLC','2002-09-28 12:24:22'),
('2','Thompson Group','1985-08-31 11:53:01'),
('3','Ledner-Leffler','1992-07-29 19:35:53'); 

DROP TABLE IF EXISTS `deal_messages`;
CREATE TABLE `deal_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `based_on` bigint(20) unsigned NOT NULL,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `based_on` (`based_on`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `deal_messages_ibfk_1` FOREIGN KEY (`based_on`) REFERENCES `requested_deals` (`id`),
  CONSTRAINT `deal_messages_ibfk_2` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `deal_messages_ibfk_3` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `deal_messages` VALUES ('1','1','1','1','Doloremque dolore dignissimos fugit placeat. Nisi et libero quaerat et necessitatibus suscipit. Suscipit nemo sed commodi maiores.','1971-05-19 14:32:30'),
('2','2','2','2','Id perferendis aperiam vitae reprehenderit alias. Incidunt assumenda non fugit sit facere architecto possimus. Labore unde facere error delectus necessitatibus. Optio voluptatem dolores architecto odit aut.','1982-11-04 09:52:28'),
('3','3','3','3','Quaerat illum eos id nulla. Quia libero fugiat vero unde atque dolor in.','2005-05-11 04:28:17'),
('4','4','4','4','Voluptatibus perspiciatis numquam assumenda accusantium. Et voluptas est et ut aliquam accusamus quae reprehenderit. Nihil quia ut hic aut qui. Ut quo rem ipsa quia quia aut.','1992-03-03 00:59:36'),
('5','5','5','5','Facilis in aut distinctio deleniti eum ea. Error veritatis tempora laboriosam et et ex. Nostrum odit et nisi. Iste voluptatem qui deleniti est sit.','1998-11-18 16:58:51'),
('6','6','6','6','Veritatis quia dolorum recusandae et. Optio non nulla illo ea dicta. Est id molestiae minima recusandae autem quod dolorem. Et tempora voluptas porro illum.','2019-06-04 13:30:25'),
('7','7','7','7','Magnam reprehenderit quo inventore consequatur voluptate enim expedita. Consequatur est nostrum ab aliquid. Saepe cum soluta nemo harum nulla reiciendis beatae.','2016-09-12 03:06:11'),
('8','8','8','8','Voluptatem non amet illo ut reprehenderit officia. Quod dolore odit esse dolorem earum dolores. Et consequatur minima ratione quisquam totam delectus at. Est laborum nostrum omnis ipsum.','1993-04-28 01:34:54'),
('9','9','9','9','Rerum exercitationem ut facilis sapiente placeat qui occaecati. Et consequatur ut qui consequatur.','1990-08-22 17:22:04'),
('10','10','10','10','Non eos culpa ut voluptatem eos quasi provident. Magni laborum quaerat sed. Fugiat neque rerum aut iusto nobis eum.','2007-11-04 02:02:27'); 

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media` VALUES ('1','1','1','Et id eligendi qui nam natus pariatur distinctio. Dolorum neque tempora sit.','itaque','778',NULL,'1994-10-21 14:21:08','1973-07-13 14:00:24'),
('2','2','2','Hic quisquam distinctio ipsa exercitationem est aut quisquam. Aut molestias voluptatem blanditiis odit et quos fugit. Voluptatum modi ipsum non ullam. Beatae nobis adipisci exercitationem.','ab','1070',NULL,'1998-03-22 01:17:00','2017-07-02 17:26:35'),
('3','3','3','Repudiandae fuga dolor sit repellat illum libero nesciunt. Ut qui doloremque aperiam et suscipit fuga quo.','temporibus','8789',NULL,'1972-06-26 15:40:25','2019-06-12 17:52:11'),
('4','4','4','Aut nam illo maxime dolor non. Quis architecto iure at. Corporis cum impedit hic voluptates voluptatem quia nulla. Iste ut consequatur maiores.','et','6661',NULL,'2015-05-04 12:35:28','2005-10-19 13:41:27'),
('5','5','5','Voluptatem et vero dolores tenetur perferendis qui quas. Non voluptas expedita corrupti quas assumenda. Sit reprehenderit tenetur est in.','iure','8394',NULL,'1986-02-23 09:51:04','1997-05-23 16:24:56'),
('6','6','6','Quas omnis nihil eaque magnam sit et animi consequatur. Tempora culpa qui numquam cum autem. Suscipit laborum dolorem eum laudantium ducimus ipsum voluptatem.','illum','151',NULL,'1980-11-13 12:05:09','1972-12-26 11:25:59'),
('7','7','7','Optio non veniam voluptatibus totam enim. Animi ullam expedita culpa facere provident consequuntur. Qui praesentium quia omnis iste. Fugiat rerum ullam quia eos animi eum expedita.','suscipit','2058',NULL,'1982-06-25 21:03:12','1973-08-20 01:05:06'),
('8','8','8','Asperiores dicta harum dolores facilis cupiditate. Laudantium cupiditate incidunt quo quidem. Aut quod pariatur rerum quia architecto iure cupiditate.','voluptatibus','9724',NULL,'1981-09-12 23:16:53','1976-01-23 14:43:39'),
('9','9','9','Rerum eaque nostrum laudantium facere qui. Dolorem ratione iure repellendus incidunt. Cumque officiis minus laudantium.','at','9145',NULL,'1973-09-24 04:57:39','1988-05-30 04:52:50'),
('10','10','10','Necessitatibus aliquam nihil exercitationem delectus quia sit est. Velit ipsam ut odit et. Aut amet odio sunt dolores qui hic consequuntur.','ut','5861',NULL,'1979-07-03 01:20:06','1984-01-11 23:33:49'); 

DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media_types` VALUES ('1','application/x-dgc-compressed','1972-03-21 03:18:26','1982-08-02 17:12:54'),
('2','application/x-stuffitx','2016-09-09 05:26:40','2011-06-02 23:31:52'),
('3','application/vnd.tmobile-livetv','2010-06-13 23:28:24','2011-11-30 11:15:54'),
('4','application/vnd.enliven','2018-04-27 12:53:32','2002-03-03 13:29:47'),
('5','image/tiff','1971-01-15 00:42:48','2009-05-17 08:16:31'),
('6','application/jsonml+json','1994-09-20 11:49:22','2012-08-29 07:27:04'),
('7','image/x-pcx','1980-07-25 16:23:26','1999-08-28 11:10:54'),
('8','image/vnd.dxf','1980-10-17 04:54:15','1986-05-20 10:17:19'),
('9','application/rss+xml','1985-03-07 08:55:07','1978-03-11 02:58:55'),
('10','application/vnd.seemail','2014-08-14 10:24:17','1984-08-09 00:13:39'); 

DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `bound_to_deal` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `bound_to_deal` (`bound_to_deal`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `photo_albums_ibfk_2` FOREIGN KEY (`bound_to_deal`) REFERENCES `requested_deals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `photo_albums` VALUES ('1','Qui vitae et molestiae voluptas cumque.','1','1'),
('2','Earum ut voluptates alias.','2','2'),
('3','Non voluptatem corporis eaque dolorem.','3','3'),
('4','Similique voluptas vel harum corrupti ea qui illo.','4','4'),
('5','Consequatur veniam ab aspernatur sit et et et.','5','5'),
('6','Dolorem omnis recusandae aliquam dignissimos rerum.','6','6'),
('7','Qui rerum aspernatur possimus et consequatur nihil odio quas.','7','7'),
('8','Et omnis aut voluptate voluptatem quam.','8','8'),
('9','Assumenda ducimus voluptatibus ut totam ut.','9','9'),
('10','Rerum qui est facilis aut consequatur odit.','10','10'); 

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `photos` VALUES ('1','1','1'),
('2','2','2'),
('3','3','3'),
('4','4','4'),
('5','5','5'),
('6','6','6'),
('7','7','7'),
('8','8','8'),
('9','9','9'),
('10','10','10'),
('11','1','1'),
('12','2','2'),
('13','3','3'),
('14','4','4'),
('15','5','5'),
('16','6','6'),
('17','7','7'),
('18','8','8'),
('19','9','9'),
('20','10','10'); 

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `rating` bigint(20) unsigned NOT NULL,
  `prof_field` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `languages` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profiles` VALUES ('1','0','M','1','2006-11-25 11:42:34','209','excepturi','Similique velit nisi cumque dolores nesciunt atque.','Falkland Islands (Malvinas)'),
('2','0','D','2','2003-08-01 08:46:36','584','est','Est officia fuga velit.','China'),
('3','0','D','3','2020-05-05 05:28:45','238','id','Impedit eos est quidem mollitia officia unde.','Ukraine'),
('4','0','M','4','2003-01-30 13:46:07','24','odio','Labore dolorem atque ut maxime ullam.','Botswana'),
('5','0','D','5','1988-02-04 19:42:02','233','eveniet','Nam ad quo et dolores soluta omnis ipsa.','Swaziland'),
('6','0','M','6','1983-06-17 07:41:53','388','delectus','Est commodi soluta totam rem et quisquam.','Bangladesh'),
('7','0','M','7','2012-08-17 14:07:04','717','ut','Consequatur accusantium reprehenderit aut odit est hic provident.','Macedonia'),
('8','0','D','8','1983-06-12 09:02:42','770','voluptas','Fugiat ducimus dicta veritatis aut ea dolorum sunt.','Botswana'),
('9','0','P','9','1973-06-01 17:49:33','956','non','Hic maiores sint natus et.','Ukraine'),
('10','0','D','10','2016-05-06 06:43:37','760','quam','Earum explicabo amet laborum fugiat dolor dolore.','Cape Verde'); 

DROP TABLE IF EXISTS `requested_deals`;
CREATE TABLE `requested_deals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `posted_by` bigint(20) unsigned NOT NULL,
  `picked_by` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `posted_by` (`posted_by`),
  KEY `picked_by` (`picked_by`),
  CONSTRAINT `requested_deals_ibfk_1` FOREIGN KEY (`posted_by`) REFERENCES `users` (`id`),
  CONSTRAINT `requested_deals_ibfk_2` FOREIGN KEY (`picked_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `requested_deals` VALUES ('1','1','1','Quos rerum deserunt placeat rerum deserunt eum asperiores. Quaerat neque expedita quod aut ut tempora.','1982-02-10 02:07:27'),
('2','2','2','Rerum eligendi earum id expedita excepturi ullam molestiae. Cumque sequi reprehenderit adipisci pariatur est omnis blanditiis. Sed sit et doloribus laborum est. Dolor aspernatur corporis harum non.','1978-10-13 03:10:57'),
('3','3','3','Excepturi ipsam in ad sint. Ut consequuntur porro et laboriosam. Deserunt voluptatem facilis rerum.','1994-08-02 07:35:06'),
('4','4','4','Molestias dignissimos id fuga molestiae et et dolores aliquid. Temporibus voluptatibus expedita debitis maiores.','2000-10-19 18:36:00'),
('5','5','5','Voluptas quae ut qui aut quis repudiandae deserunt. Et est pariatur dolorem dolorum iste dignissimos. Necessitatibus nostrum omnis dolores ipsum quibusdam deserunt eum sint.','2003-08-15 13:36:24'),
('6','6','6','Commodi ut aut sit quia maiores et. Porro soluta error cumque sit placeat. Excepturi qui eius vitae ab eius ea. Facilis culpa laboriosam nihil aliquam.','2016-08-28 08:20:38'),
('7','7','7','Est aut minus voluptatem est. Nobis ut ea sapiente rerum atque. Non ut ea dolore et esse veritatis iusto laborum.','1978-07-05 02:19:11'),
('8','8','8','Dolorem fuga minus aut qui. Ut dignissimos non repudiandae quia qui. Officia soluta temporibus non est. Ut unde unde nisi rerum est.','1994-03-29 15:50:08'),
('9','9','9','Impedit voluptas mollitia autem esse impedit labore ea. Vero qui et quibusdam neque.','2005-12-22 15:23:48'),
('10','10','10','Modi est quae et aut. Odit cumque aut dolorem fugiat ab. Cum ullam iste praesentium praesentium fugiat asperiores.','1990-12-22 02:44:15'); 

DROP TABLE IF EXISTS `user_companies`;
CREATE TABLE `user_companies` (
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`company_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `user_companies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_companies_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user_companies` VALUES ('1','1'),
('2','2'),
('3','3'); 

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` VALUES ('1','Bell','Harris','janie99@example.org','19955283164','2b80bd34fcc422935f17d8de7c18335760697a6d'),
('2','Carmen','Wiegand','carli18@example.com','8486725055','8808dee97a9e0914e3bea7e674b04f7d0633d2a7'),
('3','Leonie','Raynor','chandler74@example.com','290204070','4fee2058ffc49e8e32a9f9ce689a3bfecd7a0343'),
('4','Germaine','VonRueden','jarvis04@example.org','19650590636','306f6f65338ef02e098b3536aa19a5dab4c5e58a'),
('5','Evans','O\'Hara','laila91@example.net','45457915626','3562af88d73e3ead1182fd3a0e954c38ee85a2f0'),
('6','Dillon','Powlowski','xkutch@example.com','85814965619','c35033473f0c48accb340198680d4c04f81209fa'),
('7','Salvatore','O\'Keefe','liliane72@example.net','21544010009','38af55b29f15f7aa84644350852042a4697ead85'),
('8','Brant','Mayert','kutch.willie@example.com','90813032077','4196b6f57b386c9f448bb2e5c0d8688aeb757ad7'),
('9','Mariah','Stark','dejuan.prohaska@example.net','2623324162','12a5b40b0d807e962af9a2cebdc10313da876fa6'),
('10','Guillermo','Bradtke','deckow.dan@example.com','71056342985','867cc7c7669c5aeed06c91bc8cddfee7eaf97fc2'); 

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;