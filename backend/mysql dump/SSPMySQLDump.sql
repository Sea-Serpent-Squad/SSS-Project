-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: logistic
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

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
-- Table structure for table `должность`
--

DROP TABLE IF EXISTS `должность`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `должность` (
  `ID_Должность` int(11) NOT NULL AUTO_INCREMENT,
  `Название` text NOT NULL,
  PRIMARY KEY (`ID_Должность`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `должность`
--

LOCK TABLES `должность` WRITE;
/*!40000 ALTER TABLE `должность` DISABLE KEYS */;
INSERT INTO `должность` VALUES (1,'Водитель'),(2,'Ответственный'),(3,'мастер');
/*!40000 ALTER TABLE `должность` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `заявка`
--

DROP TABLE IF EXISTS `заявка`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `заявка` ( 
  `ID_Заявка` varchar(12) NOT NULL,
  `ID_Статус` int NOT NULL,
  `ID_Приоритет` int NOT NULL,
  `ID_Сотрудник` int NOT NULL, 
  `Дата-время начало` datetime NOT NULL,
  `Дата-время конец` datetime NOT NULL,
  PRIMARY KEY (`ID_Заявка`),
  KEY `Заявка_fk0` (`ID_Статус`),
  KEY `Заявка_fk1` (`ID_Приоритет`),
  KEY `Заявка_fk3` (`ID_Сотрудник`),
  CONSTRAINT `Заявка_fk0` FOREIGN KEY (`ID_Статус`) REFERENCES `статус` (`ID_Статус`),
  CONSTRAINT `Заявка_fk1` FOREIGN KEY (`ID_Приоритет`) REFERENCES `приоритет` (`ID_Приоритет`),
  CONSTRAINT `Заявка_fk3` FOREIGN KEY (`ID_Сотрудник`) REFERENCES `сотрудник` (`ID_Сотрудник`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заявка`
--

LOCK TABLES `заявка` WRITE;
/*!40000 ALTER TABLE `заявка` DISABLE KEYS */; 
INSERT INTO `заявка` VALUES ('20-10-1',3,3,5,'2020-10-31 08:00:00','2020-10-31 20:00:00'),('20-10-2',4,1,6,'2020-10-31 09:20:00','2020-10-31 15:00:00'),('20-10-3',1,2,7,'2020-10-31 11:00:00','2020-10-31 13:20:00'),('20-10-4',2,2,5,'2020-10-30 11:00:00','2020-10-30 13:20:00');
/*!40000 ALTER TABLE `заявка` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `класстехники`
--

DROP TABLE IF EXISTS `класстехники`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `класстехники` (
  `ID_КлассТехники` int(11) NOT NULL AUTO_INCREMENT,
  `Название` text NOT NULL,
  `Описание` text NOT NULL,
  PRIMARY KEY (`ID_КлассТехники`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `класстехники`
--

LOCK TABLES `класстехники` WRITE;
/*!40000 ALTER TABLE `класстехники` DISABLE KEYS */;
INSERT INTO `класстехники` VALUES (1,'контейнер','закрытое авто. полностью закрытые грузовые авто для грузов, требующих специфических условий перевозки'),(2,'тентованный','закрытое авто. специфичные автомобили, которые могут быть оборудованы дополнительными аксессуарами; их особенность в наличии тента, который можно убрать для того, чтобы погрузить или выгрузить груз и для использования транспорта, как открытой площадки'),(3,'рефрижератор','закрытое авто. вид отличается наличием холодильной или морозильной установки, чтобы можно было перевозить особенные грузы, которые требуют определенной температуры, например, продукты питания, цветы, химия'),(4,'изотермический фургон','закрытое авто. дают возможность четко устанавливать температуру и её поддерживать, что важно для скоропортящихся товаров и товаров, требующих специфических условий; они могут поддерживать необходимую плюсовую или минусовую температуру, обеспечивать стабильность перевозки и хранения'),(5,'микроавтобус','закрытое авто. универсальные транспортные средства, бывают грузовыми, где есть один ряд сидений, посадочных мест от 1 до 3, корпус – металлический, грузовой отсек отделен; грузопассажирскими и пассажирскими'),(6,'бортовой– грузовик','открытое авто. кузов является открытым, а борта можно откинуть; преимущество и причина популярности в том, что есть возможность разгружать со всех сторон, есть полный доступ к грузу, это удобно'),(7,'самосвал','открытое авто. саморазгружающиеся автомобили\nконтейнерные площадки'),(8,'кран','открытое авто. они существуют для того, что перемещать что-либо в пространстве'),(9,'автотранспортер','открытое авто. '),(10,'цистерна','открытое авто. они созданы для жидкостей, которые можно не только перевезти, а и недолго хранить'),(11,'лесовоз','открытое авто. предназначены для перевозки бревен, так же пиломатериалов; они отличаются от сортиментовозов, которыми перевозят длинные продолговатые грузы'),(12,'седельные тягачи','откртое авто. работают с полуприцепами; полуприцепы присоединяются к машине специальным сцепным механизмом'),(13,'бетономешалка',''),(14,'Погрузчик','');
/*!40000 ALTER TABLE `класстехники` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `объект`
--

DROP TABLE IF EXISTS `объект`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `объект` (
  `ID_Объект` int(11) NOT NULL AUTO_INCREMENT,
  `Название` text NOT NULL,
  `Местоположение` text NOT NULL,
  PRIMARY KEY (`ID_Объект`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `объект`
--

LOCK TABLES `объект` WRITE;
/*!40000 ALTER TABLE `объект` DISABLE KEYS */;
INSERT INTO `объект` VALUES (1,'Цех №1',''),(2,'Цех №2',''),(3,'Цех №3',''),(4,'Цех №4',''),(5,'Цех №5',''),(6,'Склад №1',''),(7,'Склад №2',''),(8,'Склад №3',''),(9,'Склад №4',''),(10,'Склад №5',''),(11,'ПБО',''),(12,'СПБО',''),(13,'ДСУ',''),(14,'ЦДНГ',''),(15,'УКПГ',''),(16,'ЯНГКМ',''),(17,'ПСП',''),(18,'ИНТ КМ',''),(19,'ВЖП ККИ',''),(20,'ЯНГКМ-КП43-Скв316',''),(21,'УКПГ',''),(22,'поселок 2А',''),(23,'ВЖК УКПГ',''),(24,'Усть-Кут','');
/*!40000 ALTER TABLE `объект` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `приоритет`
--

DROP TABLE IF EXISTS `приоритет`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `приоритет` (
  `ID_Приоритет` int(11) NOT NULL AUTO_INCREMENT,
  `Название` text NOT NULL,
  PRIMARY KEY (`ID_Приоритет`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `приоритет`
--

LOCK TABLES `приоритет` WRITE;
/*!40000 ALTER TABLE `приоритет` DISABLE KEYS */;
INSERT INTO `приоритет` VALUES (1,'Низкий'),(2,'Средний'),(3,'Высокий');
/*!40000 ALTER TABLE `приоритет` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `сотрудник`
--

DROP TABLE IF EXISTS `сотрудник`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `сотрудник` (
  `ID_Сотрудник` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Должность` int(11) NOT NULL,
  `ФИО` text NOT NULL,
  PRIMARY KEY (`ID_Сотрудник`),
  KEY `Сотрудник_fk0` (`ID_Должность`),
  CONSTRAINT `Сотрудник_fk0` FOREIGN KEY (`ID_Должность`) REFERENCES `должность` (`ID_Должность`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `сотрудник`
--

LOCK TABLES `сотрудник` WRITE;
/*!40000 ALTER TABLE `сотрудник` DISABLE KEYS */;
INSERT INTO `сотрудник` VALUES (1,1,'Катунин С. С.'),(2,1,'Исмагулов А.'),(3,1,'Кузнецов Е.'),(4,1,'Измайлов Н. Н.'),(5,2,'Машков М.'),(6,2,'Иргалиев А.'),(7,2,'Тараканов В.'),(8,3,'Чепомцев Е.Т.');
/*!40000 ALTER TABLE `сотрудник` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `статус`
--

DROP TABLE IF EXISTS `статус`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `статус` (
  `ID_Статус` int(11) NOT NULL AUTO_INCREMENT,
  `Название` text NOT NULL,
  PRIMARY KEY (`ID_Статус`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `статус`
--

LOCK TABLES `статус` WRITE;
/*!40000 ALTER TABLE `статус` DISABLE KEYS */;
INSERT INTO `статус` VALUES (1,'Новый'),(2,'Просмотрен'),(3,'Принят'),(4,'Отклонен');
/*!40000 ALTER TABLE `статус` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `точкамаршрута`
--

DROP TABLE IF EXISTS `точкамаршрута`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `точкамаршрута` (
  `ID_Заявка` varchar(12) NOT NULL,
  `Название` text NOT NULL,
  `Очередность` int NOT NULL,
  `Длительность` time NOT NULL,
  `ID_КлассТехники` int NOT NULL,
  `ID_Объект` int DEFAULT NULL,
  `ID_Транспорт` int NOT NULL,
  `ID_Сотрудник` int NOT NULL,
  `Время прибытия` datetime NOT NULL,
  `Количество_класс` double DEFAULT NULL,
  `СуррКлюч` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`СуррКлюч`),
  KEY `ТочкаМаршрута_fk2` (`ID_КлассТехники`),
  KEY `ТочкаМаршрута_fk4` (`ID_Транспорт`),
  KEY `ТочкаМаршрута_fk5` (`ID_Сотрудник`),
  KEY `ТочкаМаршрута_fk1` (`ID_Объект`),
  KEY `ID_Заявка` (`ID_Заявка`),
  CONSTRAINT `ТочкаМаршрута_fk1` FOREIGN KEY (`ID_Объект`) REFERENCES `объект` (`ID_Объект`),
  CONSTRAINT `ТочкаМаршрута_fk2` FOREIGN KEY (`ID_КлассТехники`) REFERENCES `класстехники` (`ID_КлассТехники`),
  CONSTRAINT `ТочкаМаршрута_fk4` FOREIGN KEY (`ID_Транспорт`) REFERENCES `транспорт` (`ID_Транспорт`),
  CONSTRAINT `ТочкаМаршрута_fk5` FOREIGN KEY (`ID_Сотрудник`) REFERENCES `сотрудник` (`ID_Сотрудник`),
  CONSTRAINT `точкамаршрута_ibfk_1` FOREIGN KEY (`ID_Заявка`) REFERENCES `заявка` (`ID_Заявка`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `точкамаршрута`
--

LOCK TABLES `точкамаршрута` WRITE;
/*!40000 ALTER TABLE `точкамаршрута` DISABLE KEYS */;
INSERT INTO `точкамаршрута` VALUES ('20-10-1','Завоз воды',1,'03:00:00',10,1,1,1,'2020-10-31 08:00:00',10,17),('20-10-1','Завоз воды',2,'01:00:00',5,15,5,2,'2020-10-31 19:00:00',2,18),('20-10-2','Прочистка внутренних дорог',1,'04:30:00',8,15,4,3,'2020-10-31 09:20:00',5,19),('20-10-2','Прочистка внутренних дорог',2,'02:30:00',9,15,3,4,'2020-10-31 12:30:00',3,20),('20-10-3','Погрузка снега',1,'01:00:00',7,20,9,1,'2020-10-31 11:00:00',30,21),('20-10-3','Погрузка снега',2,'01:20:00',5,20,8,2,'2020-10-31 12:00:00',10,22),('20-10-4','ТП: Промывка скважины',1,'01:00:00',10,17,7,3,'2020-10-30 11:00:00',35,23),('20-10-4','ТП: Промывка скважины',2,'01:20:00',5,17,6,4,'2020-10-30 12:00:00',10,24);
/*!40000 ALTER TABLE `точкамаршрута` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `транспорт`
--

DROP TABLE IF EXISTS `транспорт`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `транспорт` (
  `ID_Транспорт` int(11) NOT NULL AUTO_INCREMENT,
  `Название` text NOT NULL,
  `Описание` text NOT NULL,
  `ID_КлассТехники` int(11) NOT NULL,
  `Вместимость` float NOT NULL,
  `Удалена` tinyint(1) NOT NULL,
  `ID_Объект` int NOT NULL,
  PRIMARY KEY (`ID_Транспорт`),
  KEY `Транспорт_fk0` (`ID_КлассТехники`),
  KEY `Транспорт_fk1` (`ID_Объект`),
  CONSTRAINT `Транспорт_fk0` FOREIGN KEY (`ID_КлассТехники`) REFERENCES `класстехники` (`ID_КлассТехники`),
  CONSTRAINT `Транспорт_fk1` FOREIGN KEY (`ID_Объект`) REFERENCES `объект` (`ID_Объект`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `транспорт`
--

LOCK TABLES `транспорт` WRITE;
/*!40000 ALTER TABLE `транспорт` DISABLE KEYS */;
INSERT INTO `транспорт` VALUES (1,'В748АО/138','',10,10,0,1),(2,'К079ВА/138','',14,18,0,2),(3,'К332ВА/138','',9,10,0,3),(4,'К046ВА/138','',8,20,0,4),(5,'Г016ВУ/138','',5,10,0,5),(6,'L200_В748АО/138','',5,3,0,1),(7,'L200_К079ВА/138','',10,2,0,2),(8,'VW_Caravell_К332ВА/138','',5,7,0,3),(9,'L200_К046ВА/138','',7,15,0,4),(10,'VW_Caravell_Г016ВУ/138','',7,20,0,5);
/*!40000 ALTER TABLE `транспорт` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'logistic'
--

--
-- Dumping routines for database 'logistic'
--
/*!50003 DROP PROCEDURE IF EXISTS `getStartEndPointsOfApp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getStartEndPointsOfApp`(IN ID_App int, OUT ОбъектНачало text, OUT ОбъектКонец text)
    COMMENT 'Получение начальной и конечной точки для главной страницы отображения заявок'
BEGIN
  DECLARE lastPos int;
    SET lastPos = (SELECT ID_Объект FROM точкамаршрута WHERE ID_Заявка = ID_App ORDER BY очередность DESC LIMIT 1);
    SET ОбъектНачало = (SELECT Название FROM объект WHERE ID_Объект = (SELECT ID_Объект FROM точкамаршрута WHERE ID_Заявка = ID_App AND Очередность = 1));
    SET ОбъектКонец =  (SELECT Название FROM объект WHERE ID_Объект = lastPos);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-06 21:43:23
