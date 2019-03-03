-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: proj_music
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `album` (
  `album_id` varchar(20) NOT NULL,
  `album_name` varchar(80) NOT NULL,
  `album_publishtime` int(10) DEFAULT NULL,
  `album_company` varchar(20) DEFAULT NULL,
  `artist_id` varchar(20) NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `album_fk` (`artist_id`),
  CONSTRAINT `album_fk` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES ('10750','学不会',1325203200,'华纳唱片','3684'),('10770','JJ陆',1224259200,'海蝶音乐','3684'),('13140','小黄',1283961600,'李荣浩音乐工作室','4292'),('13935','WU HA',1093996800,'环球唱片','10562'),('15184','太美丽',1154361600,'伊世代娱乐','7219'),('19318','明天过后',1219766400,'天娱传媒','6472'),('21330','J-Top冠军精选',1146758400,'Sony BMG','7219'),('21349','看我72变',1046966400,'Sony','7219'),('2262033','有形的翅膀',1349971200,'美妙音乐','10562'),('2339617','不想放手',1214755200,'新艺宝','2116'),('25379','爱久见人心',1344556800,'环球唱片','8325'),('25394','丝路',1125504000,'滚石唱片','8325'),('25429','勇气',965059200,'滚石唱片','8325'),('2643348','爱，不解释',1387468800,'天娱传媒','6472'),('2704008','渺小',1384358400,'华研唱片','9548'),('28519','经典全纪录(主打精华版)',1172678400,'华纳唱片','9272'),('28520','逆光',1174492800,'华纳唱片','9272'),('28558','我要的幸福',975600000,'华纳唱片','9272'),('29443','My Love',1314892800,'华研国际','9548'),('3154175','绅士',1433433600,'海蝶音乐','5781'),('3190030','小幸运',1436457600,'华研国际','9548'),('34780271','初学者',1468771200,'海蝶','5781'),('36796018','戒烟',1510588800,'华纳唱片','4292'),('38296010','我们',1523289600,'环球唱片','2116'),('38430015','飞云之下',1524412800,'肆想文化','3684'),('38592123','哑巴',1525881600,'华宇世博','5781'),('39723555','只要平凡',1529856000,'麦特文化','6472'),('6434','认了吧',1177344000,'新艺宝','2116'),('73471718','如河',1537804800,'山南光线影业有限公司','10562'),('73914415','耳朵',1539705600,'华纳音乐','4292');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `on_delete_album` BEFORE DELETE ON `album` FOR EACH ROW begin
	delete from song where song.album_id = old.album_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `artist` (
  `artist_id` varchar(20) NOT NULL,
  `artist_name` varchar(80) NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES ('10562','张韶涵'),('2116','陈奕迅'),('3684','林俊杰'),('4292','李荣浩'),('5781','薛之谦'),('6472','张杰'),('7219','蔡依林'),('8325','梁静茹'),('9272','孙燕姿'),('9548','田馥甄');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `on_delete_artist` BEFORE DELETE ON `artist` FOR EACH ROW begin
	delete from album where album.artist_id = old.artist_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `artist_album_song`
--

DROP TABLE IF EXISTS `artist_album_song`;
/*!50001 DROP VIEW IF EXISTS `artist_album_song`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `artist_album_song` AS SELECT 
 1 AS `artist_id`,
 1 AS `artist_name`,
 1 AS `album_id`,
 1 AS `album_name`,
 1 AS `album_publishtime`,
 1 AS `album_company`,
 1 AS `song_id`,
 1 AS `song_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `user_id` varchar(20) DEFAULT NULL,
  `song_id` varchar(20) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES ('2552','108138','这歌不错','2018-12-19 23:23:23'),('3553','108138','说到梦，我就想到唐僧的取经梦...','2018-12-19 12:12:12'),('4554','108138','楼上举报了','2018-12-19 17:17:17'),('1551','108463','                    你好','2019-01-13 00:03:14'),('1551','108463','                    难受啊','2019-01-13 00:03:27'),('1551','108138','                    the song is so fancy!','2019-01-13 18:48:26'),('1551','108138','                    the song sounds great!','2019-01-13 19:19:36'),('4555','108132','                    你好','2019-02-13 21:37:02'),('4555','139806','                    hello','2019-02-13 21:53:44');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `playlist` (
  `playlist_id` varchar(20) NOT NULL,
  `playlist_name` varchar(20) NOT NULL,
  `creator_id` varchar(20) DEFAULT NULL,
  `created_time` varchar(10) DEFAULT NULL,
  `labels` varchar(20) DEFAULT NULL,
  `playlist_pic_path` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES ('1551','my_favourite','1551','1543663232','我喜欢的','(3)'),('4555','my_favourite','4555','1550051105','我喜欢的','(3)'),('4556','my_favourite','4556','1550063199','我喜欢的','(3)'),('666','我**已经报警了','1551','1543663232','伤感','(2)'),('667','情歌王','2552','1543663232','情歌','(4)'),('668','流行金曲','1551','1543663232','流行','(5)'),('669','不可不听古典曲','3553','1543663232','古典','(6)'),('670','说到翻唱','4554','1543663234','翻唱','(7)');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `song` (
  `song_id` varchar(20) NOT NULL,
  `song_name` varchar(80) NOT NULL,
  `album_id` varchar(20) NOT NULL,
  PRIMARY KEY (`song_id`),
  KEY `song_fk` (`album_id`),
  CONSTRAINT `song_fk` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES ('108132','独奏','10750'),('108134','学不会','10750'),('108136','故事细腻','10750'),('108138','那些你很冒险的梦','10750'),('108140','白羊梦','10750'),('108142','灵魂的共鸣','10750'),('108144','We Together','10750'),('108146','Cinderella','10750'),('108148','白兰花','10750'),('108150','陌生老朋友','10750'),('108152','不存在的情人','10750'),('108154','Love U U','10750'),('108458','SIXOLOGY','10770'),('108463','不潮不用花钱','10770'),('108468','小酒窝','10770'),('108473','黑武士','10770'),('108478','醉赤壁','10770'),('108482','由你选择','10770'),('108485','Always Online','10770'),('108487','街道','10770'),('108490','主角','10770'),('108493','我还想她','10770'),('108498','点一把火炬','10770'),('108503','期待爱','10770'),('108507','Cries in a Distance','10770'),('108511','爱与希望','10770'),('1293886117','年少有为','73914415'),('1305547844','贫穷或富有','73914415'),('1309866644','张家明和婉君','73914415'),('1311345324','如河','73471718'),('1318234981','乐团','73914415'),('1318234982','我知道是你','73914415'),('1318234987','贝贝','73914415'),('1318235595','耳朵','73914415'),('133998','老街','13140'),('134000','小黄','13140'),('139806','WU HA','13935'),('139808','快乐崇拜','13935'),('139812','我让你走了','13935'),('139815','声东击西','13935'),('139818','KISS NIGHT','13935'),('139821','我不识广东话','13935'),('139825','DO THAT TO ME ONE MORE TIME','13935'),('139829','圆心','13935'),('139833','太想爱你','13935'),('139837','说到做到','13935'),('150413','太美丽广播电台','15184'),('150414','忘不了','15184'),('150415','太美丽','15184'),('150416','追','15184'),('150417','那一瞬间','15184'),('150418','Walk On','15184'),('150419','自导自演的悲剧','15184'),('150420','祝你幸福','15184'),('150421','似曾相识','15184'),('150422','今天你要嫁给我','15184'),('150423','每一面都美','15184'),('150424','不爱','15184'),('150425','Olia','15184'),('191240','远走高飞','19318'),('191244','恒星流星','19318'),('191248','明天过后','19318'),('191252','我们都一样','19318'),('191254','天下','19318'),('191256','回忆的独奏','19318'),('191258','往事随风','19318'),('191260','留言','19318'),('191264','Cheer Up','19318'),('191268','仰望星空','19318'),('209728','我要的选择','21330'),('209729','看我72变','21330'),('209730','说爱你','21330'),('209731','假面的告白','21330'),('209732','爱情36计','21330'),('209733','就是爱','21330'),('209734','柠檬草的味道','21330'),('209735','海盗','21330'),('209736','独占神话','21330'),('209737','消失的城堡','21330'),('209738','爆米花的味道','21330'),('209740','衣服占心术','21330'),('209742','野蛮游戏','21330'),('209744','许愿池的希腊少女','21330'),('209746','天空','21330'),('209748','招牌动作','21330'),('209750','Love Love Love','21330'),('209752','反覆记号','21330'),('209754','睁一只眼 闭一只眼','21330'),('209756','布拉格广场','21330'),('209758','倒带','21330'),('209760','骑士精神','21330'),('209762','J-Top HITS (招牌动作＋看我72变＋说爱你＋睁一只眼闭一只眼＋布拉格广场＋倒带)','21330'),('210042','说爱你','21349'),('210045','看我72变','21349'),('210047','假面的告白','21349'),('210048','奴隶船','21349'),('210049','布拉格广场','21349'),('210050','做一天的你','21349'),('210053','Prove It','21349'),('210056','爆米花的味道','21349'),('210058','马甲上的绳索','21349'),('210060','好东西','21349'),('210062','骑士精神','21349'),('254037','爱久见人心','25379'),('254038','小爱情','25379'),('254039','偶阵雨','25379'),('254041','会过去的','25379'),('254043','至少爱','25379'),('254045','一路两个人','25379'),('254047','没有人像你','25379'),('254049','她','25379'),('254051','Bonjour','25379'),('254053','心电感应','25379'),('254055','环游四季的爱','25379'),('254180','丝路','25394'),('254182','我还记得','25394'),('254184','瘦瘦的','25394'),('254186','路','25394'),('254189','一对一','25394'),('254191','可惜不是你','25394'),('254193','下一秒钟','25394'),('254195','很久以后','25394'),('254198','因为还是会','25394'),('254200','好夜晚Good Night','25394'),('254485','勇气','25429'),('254486','如果有一天','25429'),('254487','半个月亮','25429'),('254489','没有水的游泳池','25429'),('254491','最烂的理由','25429'),('254494','爱你不是两三天','25429'),('254496','爱计较','25429'),('254498','昨天','25429'),('254500','多数是晴天','25429'),('254502','最后','25429'),('25640388','That Girl','2262033'),('25640392','淋雨一直走','2262033'),('25640395','最近好吗','2262033'),('25640409','有形的翅膀','2262033'),('25640410','我没改变','2262033'),('25640411','讲不听','2262033'),('25640412','Honesty','2262033'),('25640413','If I\'m The One For You','2262033'),('25640415','王子病','2262033'),('25640416','兄弟姐妹','2262033'),('25640417','是我','2262033'),('25906116','土星环','2339617'),('25906117','独居动物','2339617'),('25906118','然后怎样','2339617'),('25906119','漂亮小姐','2339617'),('25906120','27 Seconds (Music Box of \'然后怎样\')','2339617'),('25906121','臭美','2339617'),('25906122','倒带人生','2339617'),('25906123','Aren\'t You Glad','2339617'),('25906124','不要说话','2339617'),('25906125','7','2339617'),('25906126','路...一直都在','2339617'),('27599258','我在这','2643348'),('27808036','因为爱情来得不容易','2643348'),('27853883','爱，不解释','2643348'),('27968284','渺小','2704008'),('28018072','不醉不会','2704008'),('28018075','你就不要想起我','2704008'),('28038055','爱着爱着就永远','2704008'),('28038057','口袋的温度','2704008'),('28038058','矛盾','2704008'),('28038059','无常','2704008'),('28038060','终身大事','2704008'),('28038061','你快乐未必我快乐','2704008'),('28038062','这个人已经与我无关','2704008'),('28059417','他不懂','2643348'),('28126755','两全','2643348'),('28126757','你在哪里','2643348'),('28126758','演技派','2643348'),('28126759','RIPCORD','2643348'),('28126760','逆态度','2643348'),('286980','雨天','28519'),('286982','我要的幸福','28519'),('286984','天黑黑','28519'),('286986','第六感','28519'),('286988','The Moment','28519'),('286990','奔','28519'),('286992','害怕','28519'),('286994','太阳底下','28519'),('286996','懂事','28519'),('286997','风筝','28519'),('286999','神奇','28519'),('287001','我不难过','28519'),('287004','我也很想他','28519'),('287006','梦不落','28519'),('287008','Silent All These Years','28519'),('287010','任性','28519'),('287012','第一天','28519'),('287014','我不爱','28519'),('287016','梦想天空','28519'),('287018','开始懂了','28519'),('287019','爱情证书','28519'),('287021','绿光','28519'),('287023','爱情字典','28519'),('287025','原点','28519'),('287027','超快感','28519'),('287029','逃亡','28519'),('287031','隐形人','28519'),('287033','难得一见','28519'),('287035','遇见','28519'),('287037','完美的一天','28519'),('287039','直来直往','28519'),('287041','眼泪成诗','28519'),('287043','同类','28519'),('287045','零缺点','28519'),('287048','很好','28519'),('287050','我的爱','28519'),('287055','Intro','28520'),('287057','逆光','28520'),('287059','梦游','28520'),('287061','咕叽咕叽','28520'),('287063','我怀念的','28520'),('287065','安宁','28520'),('287067','飘着','28520'),('287069','爱情的花样','28520'),('287071','漩涡','28520'),('287073','需要你','28520'),('287075','关于','28520'),('287077','Outro','28520'),('287713','On The Road(Demo1) - demo','28558'),('287716','我要的幸福','28558'),('287717','坏天气','28558'),('287718','零缺点','28558'),('287719','开始懂了','28558'),('287722','中间地带','28558'),('287724','相信','28558'),('287726','累赘','28558'),('287728','难得一见','28558'),('287730','害怕','28558'),('287733','星期一 天气晴  我离开你','28558'),('287736','On The Road(Demo2) - demo','28558'),('296832','乌托邦','29443'),('296833','要说什么','29443'),('296834','My Love','29443'),('296835','请你给我好一点的情敌','29443'),('296836','还是要幸福','29443'),('296837','魔鬼中的天使','29443'),('296838','无事生非','29443'),('296839','花花世界','29443'),('296840','影子的影子','29443'),('296841','你','29443'),('32192436','绅士','3154175'),('32507038','演员','3154175'),('32507039','下雨了','3154175'),('33206214','小幸运','3190030'),('412902689','初学者','34780271'),('415792881','刚刚好','34780271'),('417859631','我好像在哪见过你','34780271'),('421148953','绅士','34780271'),('421148954','小孩','34780271'),('421148955','Stay Here','34780271'),('421148956','下雨了','34780271'),('421160836','演员','34780271'),('421160837','一半','34780271'),('421160838','花儿和少年','34780271'),('518686034','戒烟','36796018'),('551816010','我们','38296010'),('554242032','飞云之下','38430015'),('557583281','哑巴','38592123'),('570334069','成长之重量','73914415'),('574919767','只要平凡','39723555'),('65525','烟味','6434'),('65528','淘汰','6434'),('65531','快乐男生','6434'),('65533','红玫瑰','6434'),('65535','月黑风高','6434'),('65536','爱情转移','6434'),('65538','好久不见','6434'),('65540','爱是一本书','6434'),('65543','第一个雅皮士','6434'),('65546','白色球鞋','6434'),('65549','月球上的人','6434'),('862129612','王牌冤家','73914415'),('862130427','念念又不忘','73914415');
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_playlist`
--

DROP TABLE IF EXISTS `song_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `song_playlist` (
  `song_id` varchar(20) NOT NULL,
  `playlist_id` varchar(20) NOT NULL,
  PRIMARY KEY (`song_id`,`playlist_id`),
  KEY `song_playlist_ibfk_2` (`playlist_id`),
  CONSTRAINT `song_playlist_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `song_playlist_ibfk_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_playlist`
--

LOCK TABLES `song_playlist` WRITE;
/*!40000 ALTER TABLE `song_playlist` DISABLE KEYS */;
INSERT INTO `song_playlist` VALUES ('108134','1551'),('108136','1551'),('108138','1551'),('108140','1551'),('108463','1551'),('25640388','4556'),('108132','666'),('108134','666'),('108136','666'),('108132','667'),('108134','667'),('108136','667'),('108138','667'),('108140','667'),('108142','667'),('108144','667'),('108132','668'),('108134','668'),('108136','668'),('108138','668'),('108140','668'),('108142','668'),('108144','668'),('108146','668'),('108148','668'),('108150','668'),('108132','669'),('108132','670');
/*!40000 ALTER TABLE `song_playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_comment_song`
--

DROP TABLE IF EXISTS `user_comment_song`;
/*!50001 DROP VIEW IF EXISTS `user_comment_song`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `user_comment_song` AS SELECT 
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `content`,
 1 AS `song_id`,
 1 AS `song_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_playlist`
--

DROP TABLE IF EXISTS `user_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_playlist` (
  `user_id` varchar(20) NOT NULL,
  `playlist_id` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`,`playlist_id`),
  KEY `playlist_id` (`playlist_id`),
  CONSTRAINT `user_playlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_playlist_ibfk_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_playlist`
--

LOCK TABLES `user_playlist` WRITE;
/*!40000 ALTER TABLE `user_playlist` DISABLE KEYS */;
INSERT INTO `user_playlist` VALUES ('4556','666'),('1551','668'),('1551','670');
/*!40000 ALTER TABLE `user_playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_playlist_song`
--

DROP TABLE IF EXISTS `user_playlist_song`;
/*!50001 DROP VIEW IF EXISTS `user_playlist_song`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `user_playlist_song` AS SELECT 
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `playlist_id`,
 1 AS `playlist_name`,
 1 AS `song_id`,
 1 AS `song_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_pic_path` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1551','略略略','5c1f0f71ab3bc35c1cdd16194df88037','(1)'),('2552','我的代码还没打完','5c1f0f71ab3bc35c1cdd16194df88037',''),('3553','我是谁','5c1f0f71ab3bc35c1cdd16194df88037',''),('4554','喜欢听歌','5c1f0f71ab3bc35c1cdd16194df88037',''),('4555','hello','e10adc3949ba59abbe56e057f20f883e','(1)'),('4556','难受啊','e10adc3949ba59abbe56e057f20f883e','(1)');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `on_delete_user` BEFORE DELETE ON `users` FOR EACH ROW begin
	delete from playlist where playlist.playlist_id = old.user_id;
	delete from playlist where playlist.creator_id = old.user_id;
    delete from user_playlist where user_playlist.user_id = old.user_id;
    delete from comments where comments.user_id = old.user_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `artist_album_song`
--

/*!50001 DROP VIEW IF EXISTS `artist_album_song`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `artist_album_song` (`artist_id`,`artist_name`,`album_id`,`album_name`,`album_publishtime`,`album_company`,`song_id`,`song_name`) AS select `artist`.`artist_id` AS `artist_id`,`artist`.`artist_name` AS `artist_name`,`album`.`album_id` AS `album_id`,`album`.`album_name` AS `album_name`,`album`.`album_publishtime` AS `album_publishtime`,`album`.`album_company` AS `album_company`,`song`.`song_id` AS `song_id`,`song`.`song_name` AS `song_name` from ((`artist` join `album` on((`artist`.`artist_id` = `album`.`artist_id`))) join `song` on((`album`.`album_id` = `song`.`album_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_comment_song`
--

/*!50001 DROP VIEW IF EXISTS `user_comment_song`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_comment_song` (`user_id`,`user_name`,`content`,`song_id`,`song_name`) AS select `users`.`user_id` AS `user_id`,`users`.`user_name` AS `user_name`,`comments`.`content` AS `content`,`comments`.`song_id` AS `song_id`,`song`.`song_name` AS `song_name` from ((`users` join `comments` on((`users`.`user_id` = `comments`.`user_id`))) join `song` on((`comments`.`song_id` = `song`.`song_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_playlist_song`
--

/*!50001 DROP VIEW IF EXISTS `user_playlist_song`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_playlist_song` (`user_id`,`user_name`,`playlist_id`,`playlist_name`,`song_id`,`song_name`) AS select `users`.`user_id` AS `user_id`,`users`.`user_name` AS `user_name`,`playlist`.`playlist_id` AS `playlist_id`,`playlist`.`playlist_name` AS `playlist_name`,`song_playlist`.`song_id` AS `song_id`,`song`.`song_name` AS `song_name` from ((((`users` join `user_playlist` on((`users`.`user_id` = `user_playlist`.`user_id`))) join `playlist` on((`user_playlist`.`playlist_id` = `playlist`.`playlist_id`))) join `song_playlist` on((`user_playlist`.`playlist_id` = `song_playlist`.`playlist_id`))) join `song` on((`song_playlist`.`song_id` = `song`.`song_id`))) */;
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

-- Dump completed on 2019-03-03 16:00:39
