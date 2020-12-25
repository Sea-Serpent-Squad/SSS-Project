CREATE DATABASE  IF NOT EXISTS `logistic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `logistic`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: logistic
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `должность`
--

DROP TABLE IF EXISTS `должность`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `должность` (
  `ID_Должность` int NOT NULL AUTO_INCREMENT,
  `Название` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_Должность`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Table structure for table `заявка`CREATE DATABASE  IF NOT EXISTS `logistic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `logistic`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: logistic
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `должность`
--

DROP TABLE IF EXISTS `должность`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `должность` (
  `ID_Должность` int NOT NULL AUTO_INCREMENT,
  `Название` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_Должность`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заявка` (
  `ID_Заявка` varchar(12) CHARACTER SET utf8 NOT NULL,
  `ID_Статус` int NOT NULL,
  `ID_Приоритет` int NOT NULL,
  `ID_Сотрудник` int NOT NULL,
  `Дата-время начало` datetime NOT NULL,
  `Дата-время конец` datetime NOT NULL,
  `ID_Объект` int DEFAULT NULL,
  `ОписаниеРабот` text CHARACTER SET utf8,
  PRIMARY KEY (`ID_Заявка`),
  KEY `Заявка_fk0` (`ID_Статус`),
  KEY `Заявка_fk1` (`ID_Приоритет`),
  KEY `Заявка_fk3` (`ID_Сотрудник`),
  KEY `ID_Объект` (`ID_Объект`),
  CONSTRAINT `Заявка_fk0` FOREIGN KEY (`ID_Статус`) REFERENCES `статус` (`ID_Статус`),
  CONSTRAINT `Заявка_fk1` FOREIGN KEY (`ID_Приоритет`) REFERENCES `приоритет` (`ID_Приоритет`),
  CONSTRAINT `Заявка_fk3` FOREIGN KEY (`ID_Сотрудник`) REFERENCES `сотрудник` (`ID_Сотрудник`),
  CONSTRAINT `заявка_ibfk_1` FOREIGN KEY (`ID_Объект`) REFERENCES `объект` (`ID_Объект`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заявка`
--

LOCK TABLES `заявка` WRITE;
/*!40000 ALTER TABLE `заявка` DISABLE KEYS */;
INSERT INTO `заявка` VALUES ('20-10-1',3,3,5,'2020-10-31 08:00:00','2020-10-31 20:00:00',13,'ТП: Завоз воды'),('20-10-2',4,1,6,'2020-10-31 09:20:00','2020-10-31 15:00:00',12,'Прочистка внутренних дорог'),('20-10-3',1,2,7,'2020-10-31 11:00:00','2020-10-31 13:20:00',25,'Погрузка снега'),('20-10-4',2,2,5,'2020-10-30 11:00:00','2020-10-30 13:20:00',12,'ТП: Промывка скважины');
/*!40000 ALTER TABLE `заявка` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `класстехники`
--

DROP TABLE IF EXISTS `класстехники`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `класстехники` (
  `ID_КлассТехники` int NOT NULL AUTO_INCREMENT,
  `Название` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Описание` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_КлассТехники`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `класстехники`
--

LOCK TABLES `класстехники` WRITE;
/*!40000 ALTER TABLE `класстехники` DISABLE KEYS */;
INSERT INTO `класстехники` VALUES (1,'Контейнер','закрытое авто. полностью закрытые грузовые авто для грузов, требующих специфических условий перевозки'),(2,'Тентованный','закрытое авто. специфичные автомобили, которые могут быть оборудованы дополнительными аксессуарами; их особенность в наличии тента, который можно убрать для того, чтобы погрузить или выгрузить груз и для использования транспорта, как открытой площадки'),(3,'Рефрижератор','закрытое авто. вид отличается наличием холодильной или морозильной установки, чтобы можно было перевозить особенные грузы, которые требуют определенной температуры, например, продукты питания, цветы, химия'),(4,'Изотермический фургон','закрытое авто. дают возможность четко устанавливать температуру и её поддерживать, что важно для скоропортящихся товаров и товаров, требующих специфических условий; они могут поддерживать необходимую плюсовую или минусовую температуру, обеспечивать стабильность перевозки и хранения'),(5,'Микроавтобус','закрытое авто. универсальные транспортные средства, бывают грузовыми, где есть один ряд сидений, посадочных мест от 1 до 3, корпус – металлический, грузовой отсек отделен; грузопассажирскими и пассажирскими'),(6,'Бортовой– грузовик','открытое авто. кузов является открытым, а борта можно откинуть; преимущество и причина популярности в том, что есть возможность разгружать со всех сторон, есть полный доступ к грузу, это удобно'),(7,'Самосвал','открытое авто. саморазгружающиеся автомобили\nконтейнерные площадки'),(8,'Кран','открытое авто. они существуют для того, что перемещать что-либо в пространстве'),(9,'Автотранспортер','открытое авто. '),(10,'Цистерна','открытое авто. они созданы для жидкостей, которые можно не только перевезти, а и недолго хранить'),(11,'Лесовоз','открытое авто. предназначены для перевозки бревен, так же пиломатериалов; они отличаются от сортиментовозов, которыми перевозят длинные продолговатые грузы'),(12,'Седельные тягачи','откртое авто. работают с полуприцепами; полуприцепы присоединяются к машине специальным сцепным механизмом'),(13,'Бетономешалка',''),(14,'Погрузчик','');
/*!40000 ALTER TABLE `класстехники` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `объект`
--

DROP TABLE IF EXISTS `объект`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `объект` (
  `ID_Объект` int NOT NULL AUTO_INCREMENT,
  `Название` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Местоположение` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_Объект`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `объект`
--

LOCK TABLES `объект` WRITE;
/*!40000 ALTER TABLE `объект` DISABLE KEYS */;
INSERT INTO `объект` VALUES (1,'Цех №1',''),(2,'Цех №2',''),(3,'Цех №3',''),(4,'Цех №4',''),(5,'Цех №5',''),(6,'Склад №1',''),(7,'Склад №2',''),(8,'Склад №3',''),(9,'Склад №4',''),(10,'Склад №5',''),(11,'ПБО',''),(12,'СПБО',''),(13,'ДСУ',''),(14,'ЦДНГ',''),(15,'УКПГ',''),(16,'ЯНГКМ',''),(17,'ПСП',''),(18,'ИНТ КМ',''),(19,'ВЖП ККИ',''),(20,'ЯНГКМ-КП43-Скв316',''),(21,'УКПГ',''),(22,'поселок 2А',''),(23,'ВЖК УКПГ',''),(24,'Усть-Кут',''),(25,'АСОИУ',' ');
/*!40000 ALTER TABLE `объект` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `приоритет`
--

DROP TABLE IF EXISTS `приоритет`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `приоритет` (
  `ID_Приоритет` int NOT NULL AUTO_INCREMENT,
  `Название` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_Приоритет`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `сотрудник` (
  `ID_Сотрудник` int NOT NULL AUTO_INCREMENT,
  `ID_Должность` int NOT NULL,
  `ФИО` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_Сотрудник`),
  KEY `Сотрудник_fk0` (`ID_Должность`),
  CONSTRAINT `Сотрудник_fk0` FOREIGN KEY (`ID_Должность`) REFERENCES `должность` (`ID_Должность`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `статус` (
  `ID_Статус` int NOT NULL AUTO_INCREMENT,
  `Название` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_Статус`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `точкамаршрута` (
  `ID_Заявка` varchar(12) CHARACTER SET utf8 NOT NULL,
  `Название` text CHARACTER SET utf8 NOT NULL,
  `Очередность` int NOT NULL,
  `Длительность` time NOT NULL,
  `ID_КлассТехники` int NOT NULL,
  `ID_Объект` int DEFAULT NULL,
  `ID_Транспорт` int DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `точкамаршрута`
--

LOCK TABLES `точкамаршрута` WRITE;
/*!40000 ALTER TABLE `точкамаршрута` DISABLE KEYS */;
INSERT INTO `точкамаршрута` VALUES ('20-10-1','Завоз воды',1,'02:00:00',10,1,NULL,1,'2020-10-31 11:00:00',10,17),('20-10-1','Перевозка сотрудников',2,'01:00:00',5,15,NULL,2,'2020-10-31 16:00:00',2,18),('20-10-2','Перенос снега для транспортировки',1,'04:30:00',8,15,NULL,3,'2020-10-31 09:20:00',5,19),('20-10-2','Транспортировка снега',2,'02:30:00',9,15,NULL,4,'2020-10-31 12:30:00',3,20),('20-10-3','Перевозка снега',1,'01:00:00',7,20,NULL,1,'2020-10-31 11:00:00',30,21),('20-10-3','Перевозка сотрудников',2,'01:20:00',5,20,NULL,2,'2020-10-31 12:00:00',10,22),('20-10-4','Завоз дистиллированной воды',1,'03:00:00',10,17,1,3,'2020-10-31 08:00:00',35,23),('20-10-4','Перевозка сотрудников',2,'01:20:00',5,17,NULL,4,'2020-10-31 12:00:00',10,24),('20-10-1','Привозка',1,'04:00:00',10,1,NULL,1,'2020-10-31 13:00:00',10,25),('20-10-1','Завоз воды',3,'02:00:00',10,1,NULL,4,'2020-10-31 11:00:00',10,26);
/*!40000 ALTER TABLE `точкамаршрута` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `транспорт`
--

DROP TABLE IF EXISTS `транспорт`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `транспорт` (
  `ID_Транспорт` int NOT NULL AUTO_INCREMENT,
  `Название` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Описание` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ID_КлассТехники` int NOT NULL,
  `Вместимость` float NOT NULL,
  `Удалена` tinyint(1) NOT NULL,
  `ID_Объект` int NOT NULL,
  PRIMARY KEY (`ID_Транспорт`),
  KEY `Транспорт_fk0` (`ID_КлассТехники`),
  KEY `Транспорт_fk1` (`ID_Объект`),
  CONSTRAINT `Транспорт_fk0` FOREIGN KEY (`ID_КлассТехники`) REFERENCES `класстехники` (`ID_КлассТехники`),
  CONSTRAINT `Транспорт_fk1` FOREIGN KEY (`ID_Объект`) REFERENCES `объект` (`ID_Объект`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `транспорт`
--

LOCK TABLES `транспорт` WRITE;
/*!40000 ALTER TABLE `транспорт` DISABLE KEYS */;
INSERT INTO `транспорт` VALUES (1,'В748АО/138','',10,10,0,1),(2,'К079ВА/138','',14,18,0,2),(3,'К332ВА/138','',9,10,0,3),(4,'К046ВА/138','',8,20,0,4),(5,'Г016ВУ/138','',5,10,0,5),(6,'L200_В748АО/138','',5,3,0,1),(7,'L200_К079ВА/138','',10,2,0,2),(8,'VW_Caravell_К332ВА/138','',5,7,0,3),(9,'L200_К046ВА/138','',7,15,0,4),(10,'VW_Caravell_Г016ВУ/138','',7,20,0,5),(11,'С616АО/138',' ',10,10,0,3);
/*!40000 ALTER TABLE `транспорт` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'logistic'
--

--
-- Dumping routines for database 'logistic'
--
/*!50003 DROP PROCEDURE IF EXISTS `getBusyCars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getBusyCars`(IN `busyCars` bool, IN `id_app` varchar(12), IN `type` int, IN `order` int)
    COMMENT 'order - очередность вирт техники'
begin
declare dateApp date;
declare startTask time;
declare endTask time;
set dateApp = (select date(`Дата-время начало`) from `заявка` where `id_заявка` = `id_app`); 
set startTask = (select min(time(`Время прибытия`)) from `точкамаршрута` where `ID_Заявка` = `id_app` and `Очередность` = `order` );

set startTask = subtime(startTask, '01:00:00'); 
set endTask = (select max(time(addtime(`Время прибытия`, `длительность`))) from `точкамаршрута` where `ID_Заявка` = `id_app` and `Очередность` = `order`);
IF `busyCars` IS TRUE THEN
select `Название` from `транспорт` where `id_транспорт` IN ( select `id_транспорт` from `точкамаршрута` where `ID_Транспорт` IS NOT NULL and DATE(`Время прибытия`) = dateApp and `ID_КлассТехники` = `type` and ((time(`Время прибытия`) <= startTask and time(addtime(`Время прибытия`, `Длительность`)) > startTask) 
or (time(`Время прибытия`) < endTask and time(`Время прибытия`) > startTask) or (time(`Время прибытия`) < endTask and time(addtime(`Время прибытия`, `длительность`)) > endTask)) );
ELSE 
select `Название` from `транспорт` where `ID_КлассТехники` = `type` and `id_транспорт` NOT IN ( select `id_транспорт` from `точкамаршрута` where `ID_Транспорт` IS NOT NULL and DATE(`Время прибытия`) = dateApp and `ID_КлассТехники` = `type` and ((time(`Время прибытия`) <= startTask and time(addtime(`Время прибытия`, `Длительность`)) > startTask) 
or (time(`Время прибытия`) < endTask and time(`Время прибытия`) > startTask) or (time(`Время прибытия`) < endTask and time(addtime(`Время прибытия`, `длительность`)) > endTask)) );
END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFilledRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getFilledRow`(IN `ID` varchar(12))
    COMMENT 'Получение заполненной информации о заявке'
BEGIN   
	 DECLARE lastPos int;
     DECLARE ОбъектНачало text;
     DECLARE ОбъектКонец text;
     DECLARE МестоРаботы text;
	 SET lastPos = (SELECT `ID_Объект` FROM `точкамаршрута` WHERE `ID_Заявка` = `ID` AND ADDDATE(`Время прибытия`, `Длительность`) = (SELECT MAX(ADDDATE(B.`Время прибытия`, B.`Длительность`)) from `точкамаршрута` B where `id`= B.`ID_Заявка`));
     
     SET ОбъектНачало = (SELECT `Название` FROM `объект` WHERE `ID_Объект` = (SELECT `ID_Объект` FROM `точкамаршрута` WHERE `ID_Заявка` = `ID` AND  `Время прибытия` = (SELECT MIN(B.`Время прибытия`) from `точкамаршрута` B where `id`= B.`ID_Заявка`)));
     SET ОбъектКонец =  (SELECT `Название` FROM `объект` WHERE `ID_Объект` = lastPos);
     
     IF (ОбъектНачало = ОбъектКонец) THEN SET МестоРаботы = ОбъектНачало; 
     ELSE SET МестоРаботы = CONCAT(ОбъектНачало, ' - ', ОбъектКонец);
     END IF;
     
     SELECT B.`Название` as `Статус`, `ID` as `№ заявки`, A.`ОписаниеРабот` as `Описание работ`, CONCAT(time(A.`Дата-время начало`), ' - ',time(A.`Дата-время конец`)) as `Время подачи`, D.`Название` as `Приоритет`,  (SELECT `Название` from `объект` where `id_объект` = A.`id_объект`) as `Цех`, МестоРаботы as `Место работы`
     FROM `статус` B, `заявка` A, `приоритет` D WHERE A.`ID_заявка` = `ID` AND B.`ID_Статус` = A.`ID_Статус` AND D.`ID_Приоритет` = A.`ID_Приоритет`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrderInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getOrderInfo`(IN `id` varchar(12))
begin
	declare places text; 

	declare uniquePlaceFound int;
    set uniquePlaceFound = (select count(distinct(`ID_Объект`)) from `точкамаршрута` where `ID_Заявка` = `id`); 
    if (uniquePlaceFound = 1) then set places = (select (select `Название` from `объект` where `ID_Объект` = A.`ID_Объект`) from `точкамаршрута` A where `ID_Заявка` = `id` order by `ID_Заявка` limit 1);
    else set places = (select group_concat(`Название` SEPARATOR ' - ') from `объект` where `ID_Объект` IN ( select `ID_Объект` from `точкамаршрута` A where `ID_Заявка` = `id` ));
    end if; 
	
    
	select  `id` as 'ID', 
    B.`Название` as `Статус`,
    (select `название` from `объект` where `ID_Объект` = (A.`id_объект`)) as 'Цех',
    CONCAT(time(A.`Дата-время начало`), ' - ',time(A.`Дата-время конец`), ' ', date(A.`Дата-время конец`)) as 'Время и дата выполнения',
    places as 'Место работы', (select `ФИО` from `сотрудник` where `id_сотрудник` = A.`ID_Сотрудник`) as 'Ответственный',
    CONCAT((select `ОписаниеРабот` FROM `заявка` where `ID_Заявка` = `id`),'. Операции: ', (SELECT lower(group_concat(`Название` SEPARATOR ', ' )) from `точкамаршрута` where `ID_Заявка` = `id` Order by `Очередность`)) as 'Описание работы'
    from `заявка` A, `статус` B where A.`ID_Заявка` = `id` and B.`ID_Статус` = A.`ID_Статус`;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRealCars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getRealCars`(IN `busyCars` bool, IN `id_app` varchar(12), IN `type` int, IN `order` int)
    COMMENT 'order - очередность вирт техники'
begin
declare dateApp date;
declare startTask time;
declare endTask time;
set dateApp = (select date(`Дата-время начало`) from `заявка` where `id_заявка` = `id_app`); 
set startTask = (select min(time(`Время прибытия`)) from `точкамаршрута` where `ID_Заявка` = `id_app` and `Очередность` = `order` );

set startTask = subtime(startTask, '01:00:00'); 
set endTask = (select max(time(addtime(`Время прибытия`, `длительность`))) from `точкамаршрута` where `ID_Заявка` = `id_app` and `Очередность` = `order`);
IF `busyCars` IS TRUE THEN
select `id_транспорт`, `Название` from `транспорт` where `id_транспорт` IN ( select `id_транспорт` from `точкамаршрута` where `ID_Транспорт` IS NOT NULL and DATE(`Время прибытия`) = dateApp and `ID_КлассТехники` = `type` and ((time(`Время прибытия`) <= startTask and time(addtime(`Время прибытия`, `Длительность`)) > startTask) 
or (time(`Время прибытия`) < endTask and time(`Время прибытия`) > startTask) or (time(`Время прибытия`) < endTask and time(addtime(`Время прибытия`, `длительность`)) > endTask)) );
ELSE 
select `id_транспорт`, `Название` from `транспорт` where `ID_КлассТехники` = `type` and `id_транспорт` NOT IN ( select `id_транспорт` from `точкамаршрута` where `ID_Транспорт` IS NOT NULL and DATE(`Время прибытия`) = dateApp and `ID_КлассТехники` = `type` and ((time(`Время прибытия`) <= startTask and time(addtime(`Время прибытия`, `Длительность`)) > startTask) 
or (time(`Время прибытия`) < endTask and time(`Время прибытия`) > startTask) or (time(`Время прибытия`) < endTask and time(addtime(`Время прибытия`, `длительность`)) > endTask)) );
END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getWorksLocsAndTimesOfApp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getWorksLocsAndTimesOfApp`(IN `id` varchar(12))
begin
    select 
    (select `ID_КлассТехники` from `класстехники` where `ID_КлассТехники` = A.`ID_КлассТехники`) as 'ID_КлассТехники',
    (select C.`Название` from `класстехники` C where C.`ID_КлассТехники` = A.`ID_КлассТехники`) as 'Техника', 
    (select B.`Название` from `объект` B where B.`ID_Объект` = A.`ID_Объект`) as 'Локация',
    (select group_concat(concat('[',D.`Название`,',', D.`Время прибытия`, ',', ADDTIME(D.`Время прибытия`, D.`Длительность`),']')) from `точкамаршрута` D where D.`ID_Заявка` = `id` and D.`ID_КлассТехники` = A.`ID_КлассТехники` and D.`Очередность` = A.`Очередность`) as 'Таймлайн'
    from `точкамаршрута` A where `id` = A.`ID_Заявка` group by `Очередность` order by `Очередность`; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getWorksTimesOfRealCar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getWorksTimesOfRealCar`(IN `id_car` int)
BEGIN

select `Время прибытия` as 'Начало', (addtime(`Время прибытия`, `Длительность`)) as 'Конец' from `точкамаршрута` where `ID_Транспорт` = `id_car`;

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

-- Dump completed on 2020-12-25  7:11:24
--

DROP TABLE IF EXISTS `заявка`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заявка` (
  `ID_Заявка` varchar(12) CHARACTER SET utf8 NOT NULL,
  `ID_Статус` int NOT NULL,
  `ID_Приоритет` int NOT NULL,
  `ID_Сотрудник` int NOT NULL,
  `Дата-время начало` datetime NOT NULL,
  `Дата-время конец` datetime NOT NULL,
  `ID_Объект` int DEFAULT NULL,
  `ОписаниеРабот` text CHARACTER SET utf8,
  PRIMARY KEY (`ID_Заявка`),
  KEY `Заявка_fk0` (`ID_Статус`),
  KEY `Заявка_fk1` (`ID_Приоритет`),
  KEY `Заявка_fk3` (`ID_Сотрудник`),
  KEY `ID_Объект` (`ID_Объект`),
  CONSTRAINT `Заявка_fk0` FOREIGN KEY (`ID_Статус`) REFERENCES `статус` (`ID_Статус`),
  CONSTRAINT `Заявка_fk1` FOREIGN KEY (`ID_Приоритет`) REFERENCES `приоритет` (`ID_Приоритет`),
  CONSTRAINT `Заявка_fk3` FOREIGN KEY (`ID_Сотрудник`) REFERENCES `сотрудник` (`ID_Сотрудник`),
  CONSTRAINT `заявка_ibfk_1` FOREIGN KEY (`ID_Объект`) REFERENCES `объект` (`ID_Объект`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заявка`
--

LOCK TABLES `заявка` WRITE;
/*!40000 ALTER TABLE `заявка` DISABLE KEYS */;
INSERT INTO `заявка` VALUES ('20-10-1',3,3,5,'2020-10-31 08:00:00','2020-10-31 20:00:00',13,'ТП: Завоз воды'),('20-10-2',4,1,6,'2020-10-31 09:20:00','2020-10-31 15:00:00',12,'Прочистка внутренних дорог'),('20-10-3',1,2,7,'2020-10-31 11:00:00','2020-10-31 13:20:00',25,'Погрузка снега'),('20-10-4',2,2,5,'2020-10-30 11:00:00','2020-10-30 13:20:00',12,'ТП: Промывка скважины');
/*!40000 ALTER TABLE `заявка` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `класстехники`
--

DROP TABLE IF EXISTS `класстехники`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `класстехники` (
  `ID_КлассТехники` int NOT NULL AUTO_INCREMENT,
  `Название` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Описание` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_КлассТехники`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `класстехники`
--

LOCK TABLES `класстехники` WRITE;
/*!40000 ALTER TABLE `класстехники` DISABLE KEYS */;
INSERT INTO `класстехники` VALUES (1,'Контейнер','закрытое авто. полностью закрытые грузовые авто для грузов, требующих специфических условий перевозки'),(2,'Тентованный','закрытое авто. специфичные автомобили, которые могут быть оборудованы дополнительными аксессуарами; их особенность в наличии тента, который можно убрать для того, чтобы погрузить или выгрузить груз и для использования транспорта, как открытой площадки'),(3,'Рефрижератор','закрытое авто. вид отличается наличием холодильной или морозильной установки, чтобы можно было перевозить особенные грузы, которые требуют определенной температуры, например, продукты питания, цветы, химия'),(4,'Изотермический фургон','закрытое авто. дают возможность четко устанавливать температуру и её поддерживать, что важно для скоропортящихся товаров и товаров, требующих специфических условий; они могут поддерживать необходимую плюсовую или минусовую температуру, обеспечивать стабильность перевозки и хранения'),(5,'Микроавтобус','закрытое авто. универсальные транспортные средства, бывают грузовыми, где есть один ряд сидений, посадочных мест от 1 до 3, корпус – металлический, грузовой отсек отделен; грузопассажирскими и пассажирскими'),(6,'Бортовой– грузовик','открытое авто. кузов является открытым, а борта можно откинуть; преимущество и причина популярности в том, что есть возможность разгружать со всех сторон, есть полный доступ к грузу, это удобно'),(7,'Самосвал','открытое авто. саморазгружающиеся автомобили\nконтейнерные площадки'),(8,'Кран','открытое авто. они существуют для того, что перемещать что-либо в пространстве'),(9,'Автотранспортер','открытое авто. '),(10,'Цистерна','открытое авто. они созданы для жидкостей, которые можно не только перевезти, а и недолго хранить'),(11,'Лесовоз','открытое авто. предназначены для перевозки бревен, так же пиломатериалов; они отличаются от сортиментовозов, которыми перевозят длинные продолговатые грузы'),(12,'Седельные тягачи','откртое авто. работают с полуприцепами; полуприцепы присоединяются к машине специальным сцепным механизмом'),(13,'Бетономешалка',''),(14,'Погрузчик','');
/*!40000 ALTER TABLE `класстехники` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `объект`
--

DROP TABLE IF EXISTS `объект`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `объект` (
  `ID_Объект` int NOT NULL AUTO_INCREMENT,
  `Название` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Местоположение` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_Объект`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `объект`
--

LOCK TABLES `объект` WRITE;
/*!40000 ALTER TABLE `объект` DISABLE KEYS */;
INSERT INTO `объект` VALUES (1,'Цех №1',''),(2,'Цех №2',''),(3,'Цех №3',''),(4,'Цех №4',''),(5,'Цех №5',''),(6,'Склад №1',''),(7,'Склад №2',''),(8,'Склад №3',''),(9,'Склад №4',''),(10,'Склад №5',''),(11,'ПБО',''),(12,'СПБО',''),(13,'ДСУ',''),(14,'ЦДНГ',''),(15,'УКПГ',''),(16,'ЯНГКМ',''),(17,'ПСП',''),(18,'ИНТ КМ',''),(19,'ВЖП ККИ',''),(20,'ЯНГКМ-КП43-Скв316',''),(21,'УКПГ',''),(22,'поселок 2А',''),(23,'ВЖК УКПГ',''),(24,'Усть-Кут',''),(25,'АСОИУ',' ');
/*!40000 ALTER TABLE `объект` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `приоритет`
--

DROP TABLE IF EXISTS `приоритет`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `приоритет` (
  `ID_Приоритет` int NOT NULL AUTO_INCREMENT,
  `Название` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_Приоритет`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `сотрудник` (
  `ID_Сотрудник` int NOT NULL AUTO_INCREMENT,
  `ID_Должность` int NOT NULL,
  `ФИО` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_Сотрудник`),
  KEY `Сотрудник_fk0` (`ID_Должность`),
  CONSTRAINT `Сотрудник_fk0` FOREIGN KEY (`ID_Должность`) REFERENCES `должность` (`ID_Должность`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `статус` (
  `ID_Статус` int NOT NULL AUTO_INCREMENT,
  `Название` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_Статус`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `точкамаршрута` (
  `ID_Заявка` varchar(12) CHARACTER SET utf8 NOT NULL,
  `Название` text CHARACTER SET utf8 NOT NULL,
  `Очередность` int NOT NULL,
  `Длительность` time NOT NULL,
  `ID_КлассТехники` int NOT NULL,
  `ID_Объект` int DEFAULT NULL,
  `ID_Транспорт` int DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `точкамаршрута`
--

LOCK TABLES `точкамаршрута` WRITE;
/*!40000 ALTER TABLE `точкамаршрута` DISABLE KEYS */;
INSERT INTO `точкамаршрута` VALUES ('20-10-1','Завоз воды',1,'02:00:00',10,1,NULL,1,'2020-10-31 11:00:00',10,17),('20-10-1','Перевозка сотрудников',2,'01:00:00',5,15,NULL,2,'2020-10-31 16:00:00',2,18),('20-10-2','Перенос снега для транспортировки',1,'04:30:00',8,15,NULL,3,'2020-10-31 09:20:00',5,19),('20-10-2','Транспортировка снега',2,'02:30:00',9,15,NULL,4,'2020-10-31 12:30:00',3,20),('20-10-3','Перевозка снега',1,'01:00:00',7,20,NULL,1,'2020-10-31 11:00:00',30,21),('20-10-3','Перевозка сотрудников',2,'01:20:00',5,20,NULL,2,'2020-10-31 12:00:00',10,22),('20-10-4','Завоз дистиллированной воды',1,'03:00:00',10,17,1,3,'2020-10-31 08:00:00',35,23),('20-10-4','Перевозка сотрудников',2,'01:20:00',5,17,NULL,4,'2020-10-31 12:00:00',10,24),('20-10-1','Привозка',1,'04:00:00',10,1,NULL,1,'2020-10-31 13:00:00',10,25),('20-10-1','Завоз воды',3,'02:00:00',10,1,NULL,4,'2020-10-31 11:00:00',10,26);
/*!40000 ALTER TABLE `точкамаршрута` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `транспорт`
--

DROP TABLE IF EXISTS `транспорт`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `транспорт` (
  `ID_Транспорт` int NOT NULL AUTO_INCREMENT,
  `Название` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Описание` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ID_КлассТехники` int NOT NULL,
  `Вместимость` float NOT NULL,
  `Удалена` tinyint(1) NOT NULL,
  `ID_Объект` int NOT NULL,
  PRIMARY KEY (`ID_Транспорт`),
  KEY `Транспорт_fk0` (`ID_КлассТехники`),
  KEY `Транспорт_fk1` (`ID_Объект`),
  CONSTRAINT `Транспорт_fk0` FOREIGN KEY (`ID_КлассТехники`) REFERENCES `класстехники` (`ID_КлассТехники`),
  CONSTRAINT `Транспорт_fk1` FOREIGN KEY (`ID_Объект`) REFERENCES `объект` (`ID_Объект`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `транспорт`
--

LOCK TABLES `транспорт` WRITE;
/*!40000 ALTER TABLE `транспорт` DISABLE KEYS */;
INSERT INTO `транспорт` VALUES (1,'В748АО/138','',10,10,0,1),(2,'К079ВА/138','',14,18,0,2),(3,'К332ВА/138','',9,10,0,3),(4,'К046ВА/138','',8,20,0,4),(5,'Г016ВУ/138','',5,10,0,5),(6,'L200_В748АО/138','',5,3,0,1),(7,'L200_К079ВА/138','',10,2,0,2),(8,'VW_Caravell_К332ВА/138','',5,7,0,3),(9,'L200_К046ВА/138','',7,15,0,4),(10,'VW_Caravell_Г016ВУ/138','',7,20,0,5),(11,'С616АО/138',' ',10,10,0,3);
/*!40000 ALTER TABLE `транспорт` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'logistic'
--

--
-- Dumping routines for database 'logistic'
--
/*!50003 DROP PROCEDURE IF EXISTS `getBusyCars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getBusyCars`(IN `busyCars` bool, IN `id_app` varchar(12), IN `type` int, IN `order` int)
    COMMENT 'order - очередность вирт техники'
begin
declare dateApp date;
declare startTask time;
declare endTask time;
set dateApp = (select date(`Дата-время начало`) from `заявка` where `id_заявка` = `id_app`); 
set startTask = (select min(time(`Время прибытия`)) from `точкамаршрута` where `ID_Заявка` = `id_app` and `Очередность` = `order` );

set startTask = subtime(startTask, '01:00:00'); 
set endTask = (select max(time(addtime(`Время прибытия`, `длительность`))) from `точкамаршрута` where `ID_Заявка` = `id_app` and `Очередность` = `order`);
IF `busyCars` IS TRUE THEN
select `Название` from `транспорт` where `id_транспорт` IN ( select `id_транспорт` from `точкамаршрута` where `ID_Транспорт` IS NOT NULL and DATE(`Время прибытия`) = dateApp and `ID_КлассТехники` = `type` and ((time(`Время прибытия`) <= startTask and time(addtime(`Время прибытия`, `Длительность`)) > startTask) 
or (time(`Время прибытия`) < endTask and time(`Время прибытия`) > startTask) or (time(`Время прибытия`) < endTask and time(addtime(`Время прибытия`, `длительность`)) > endTask)) );
ELSE 
select `Название` from `транспорт` where `ID_КлассТехники` = `type` and `id_транспорт` NOT IN ( select `id_транспорт` from `точкамаршрута` where `ID_Транспорт` IS NOT NULL and DATE(`Время прибытия`) = dateApp and `ID_КлассТехники` = `type` and ((time(`Время прибытия`) <= startTask and time(addtime(`Время прибытия`, `Длительность`)) > startTask) 
or (time(`Время прибытия`) < endTask and time(`Время прибытия`) > startTask) or (time(`Время прибытия`) < endTask and time(addtime(`Время прибытия`, `длительность`)) > endTask)) );
END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFilledRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getFilledRow`(IN `ID` varchar(12))
    COMMENT 'Получение заполненной информации о заявке'
BEGIN   
	 DECLARE lastPos int;
     DECLARE ОбъектНачало text;
     DECLARE ОбъектКонец text;
     DECLARE МестоРаботы text;
	 SET lastPos = (SELECT `ID_Объект` FROM `точкамаршрута` WHERE `ID_Заявка` = `ID` AND ADDDATE(`Время прибытия`, `Длительность`) = (SELECT MAX(ADDDATE(B.`Время прибытия`, B.`Длительность`)) from `точкамаршрута` B where `id`= B.`ID_Заявка`));
     
     SET ОбъектНачало = (SELECT `Название` FROM `объект` WHERE `ID_Объект` = (SELECT `ID_Объект` FROM `точкамаршрута` WHERE `ID_Заявка` = `ID` AND  `Время прибытия` = (SELECT MIN(B.`Время прибытия`) from `точкамаршрута` B where `id`= B.`ID_Заявка`)));
     SET ОбъектКонец =  (SELECT `Название` FROM `объект` WHERE `ID_Объект` = lastPos);
     
     IF (ОбъектНачало = ОбъектКонец) THEN SET МестоРаботы = ОбъектНачало; 
     ELSE SET МестоРаботы = CONCAT(ОбъектНачало, ' - ', ОбъектКонец);
     END IF;
     
     SELECT B.`Название` as `Статус`, `ID` as `№ заявки`, A.`ОписаниеРабот` as `Описание работ`, CONCAT(time(A.`Дата-время начало`), ' - ',time(A.`Дата-время конец`)) as `Время подачи`, D.`Название` as `Приоритет`,  (SELECT `Название` from `объект` where `id_объект` = A.`id_объект`) as `Цех`, МестоРаботы as `Место работы`
     FROM `статус` B, `заявка` A, `приоритет` D WHERE A.`ID_заявка` = `ID` AND B.`ID_Статус` = A.`ID_Статус` AND D.`ID_Приоритет` = A.`ID_Приоритет`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrderInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getOrderInfo`(IN `id` varchar(12))
begin
	declare places text; 

	declare uniquePlaceFound int;
    set uniquePlaceFound = (select count(distinct(`ID_Объект`)) from `точкамаршрута` where `ID_Заявка` = `id`); 
    if (uniquePlaceFound = 1) then set places = (select (select `Название` from `объект` where `ID_Объект` = A.`ID_Объект`) from `точкамаршрута` A where `ID_Заявка` = `id` order by `ID_Заявка` limit 1);
    else set places = (select group_concat(`Название` SEPARATOR ' - ') from `объект` where `ID_Объект` IN ( select `ID_Объект` from `точкамаршрута` A where `ID_Заявка` = `id` ));
    end if; 
	
    
	select  `id` as 'ID', 
    B.`Название` as `Статус`,
    (select `название` from `объект` where `ID_Объект` = (A.`id_объект`)) as 'Цех',
    CONCAT(time(A.`Дата-время начало`), ' - ',time(A.`Дата-время конец`), ' ', date(A.`Дата-время конец`)) as 'Время и дата выполнения',
    places as 'Место работы', (select `ФИО` from `сотрудник` where `id_сотрудник` = A.`ID_Сотрудник`) as 'Ответственный',CREATE DATABASE  IF NOT EXISTS `logistic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `logistic`;
-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: logistic
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
  `Название` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID_Должность`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `ID_Заявка` varchar(12) CHARACTER SET utf8 NOT NULL,
  `ID_Статус` int(11) NOT NULL,
  `ID_Приоритет` int(11) NOT NULL,
  `ID_Сотрудник` int(11) NOT NULL,
  `Дата-время начало` datetime NOT NULL,
  `Дата-время конец` datetime NOT NULL,
  `ID_Объект` int(11) DEFAULT NULL,
  `ОписаниеРабот` text CHARACTER SET utf8,
  PRIMARY KEY (`ID_Заявка`),
  KEY `Заявка_fk0` (`ID_Статус`),
  KEY `Заявка_fk1` (`ID_Приоритет`),
  KEY `Заявка_fk3` (`ID_Сотрудник`),
  KEY `ID_Объект` (`ID_Объект`),
  CONSTRAINT `Заявка_fk0` FOREIGN KEY (`ID_Статус`) REFERENCES `статус` (`ID_Статус`),
  CONSTRAINT `Заявка_fk1` FOREIGN KEY (`ID_Приоритет`) REFERENCES `приоритет` (`ID_Приоритет`),
  CONSTRAINT `Заявка_fk3` FOREIGN KEY (`ID_Сотрудник`) REFERENCES `сотрудник` (`ID_Сотрудник`),
  CONSTRAINT `заявка_ibfk_1` FOREIGN KEY (`ID_Объект`) REFERENCES `объект` (`ID_Объект`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заявка`
--

LOCK TABLES `заявка` WRITE;
/*!40000 ALTER TABLE `заявка` DISABLE KEYS */;
INSERT INTO `заявка` VALUES ('20-10-1',3,3,5,'2020-10-31 08:00:00','2020-10-31 20:00:00',13,'ТП: Завоз воды'),('20-10-2',4,1,6,'2020-10-31 09:20:00','2020-10-31 15:00:00',12,'Прочистка внутренних дорог'),('20-10-3',1,2,7,'2020-10-31 11:00:00','2020-10-31 13:20:00',25,'Погрузка снега'),('20-10-4',2,2,5,'2020-10-30 11:00:00','2020-10-30 13:20:00',12,'ТП: Промывка скважины');
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
  `Название` text CHARACTER SET utf8 NOT NULL,
  `Описание` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID_КлассТехники`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `класстехники`
--

LOCK TABLES `класстехники` WRITE;
/*!40000 ALTER TABLE `класстехники` DISABLE KEYS */;
INSERT INTO `класстехники` VALUES (1,'Контейнер','закрытое авто. полностью закрытые грузовые авто для грузов, требующих специфических условий перевозки'),(2,'Тентованный','закрытое авто. специфичные автомобили, которые могут быть оборудованы дополнительными аксессуарами; их особенность в наличии тента, который можно убрать для того, чтобы погрузить или выгрузить груз и для использования транспорта, как открытой площадки'),(3,'Рефрижератор','закрытое авто. вид отличается наличием холодильной или морозильной установки, чтобы можно было перевозить особенные грузы, которые требуют определенной температуры, например, продукты питания, цветы, химия'),(4,'Изотермический фургон','закрытое авто. дают возможность четко устанавливать температуру и её поддерживать, что важно для скоропортящихся товаров и товаров, требующих специфических условий; они могут поддерживать необходимую плюсовую или минусовую температуру, обеспечивать стабильность перевозки и хранения'),(5,'Микроавтобус','закрытое авто. универсальные транспортные средства, бывают грузовыми, где есть один ряд сидений, посадочных мест от 1 до 3, корпус – металлический, грузовой отсек отделен; грузопассажирскими и пассажирскими'),(6,'Бортовой– грузовик','открытое авто. кузов является открытым, а борта можно откинуть; преимущество и причина популярности в том, что есть возможность разгружать со всех сторон, есть полный доступ к грузу, это удобно'),(7,'Самосвал','открытое авто. саморазгружающиеся автомобили\nконтейнерные площадки'),(8,'Кран','открытое авто. они существуют для того, что перемещать что-либо в пространстве'),(9,'Автотранспортер','открытое авто. '),(10,'Цистерна','открытое авто. они созданы для жидкостей, которые можно не только перевезти, а и недолго хранить'),(11,'Лесовоз','открытое авто. предназначены для перевозки бревен, так же пиломатериалов; они отличаются от сортиментовозов, которыми перевозят длинные продолговатые грузы'),(12,'Седельные тягачи','откртое авто. работают с полуприцепами; полуприцепы присоединяются к машине специальным сцепным механизмом'),(13,'Бетономешалка',''),(14,'Погрузчик','');
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
  `Название` text CHARACTER SET utf8 NOT NULL,
  `Местоположение` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID_Объект`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `объект`
--

LOCK TABLES `объект` WRITE;
/*!40000 ALTER TABLE `объект` DISABLE KEYS */;
INSERT INTO `объект` VALUES (1,'Цех №1',''),(2,'Цех №2',''),(3,'Цех №3',''),(4,'Цех №4',''),(5,'Цех №5',''),(6,'Склад №1',''),(7,'Склад №2',''),(8,'Склад №3',''),(9,'Склад №4',''),(10,'Склад №5',''),(11,'ПБО',''),(12,'СПБО',''),(13,'ДСУ',''),(14,'ЦДНГ',''),(15,'УКПГ',''),(16,'ЯНГКМ',''),(17,'ПСП',''),(18,'ИНТ КМ',''),(19,'ВЖП ККИ',''),(20,'ЯНГКМ-КП43-Скв316',''),(21,'УКПГ',''),(22,'поселок 2А',''),(23,'ВЖК УКПГ',''),(24,'Усть-Кут',''),(25,'АСОИУ',' ');
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
  `Название` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID_Приоритет`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `ФИО` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID_Сотрудник`),
  KEY `Сотрудник_fk0` (`ID_Должность`),
  CONSTRAINT `Сотрудник_fk0` FOREIGN KEY (`ID_Должность`) REFERENCES `должность` (`ID_Должность`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `Название` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID_Статус`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `ID_Заявка` varchar(12) CHARACTER SET utf8 NOT NULL,
  `Название` text CHARACTER SET utf8 NOT NULL,
  `Очередность` int(11) NOT NULL,
  `Длительность` time NOT NULL,
  `ID_КлассТехники` int(11) NOT NULL,
  `ID_Объект` int(11) DEFAULT NULL,
  `ID_Транспорт` int(11) DEFAULT NULL,
  `ID_Сотрудник` int(11) DEFAULT NULL,
  `Время прибытия` datetime NOT NULL,
  `Количество_класс` double DEFAULT NULL,
  `СуррКлюч` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `точкамаршрута`
--

LOCK TABLES `точкамаршрута` WRITE;
/*!40000 ALTER TABLE `точкамаршрута` DISABLE KEYS */;
INSERT INTO `точкамаршрута` VALUES ('20-10-1','Завоз воды',1,'02:00:00',10,1,NULL,NULL,'2020-10-31 11:00:00',10,17),('20-10-1','Перевозка сотрудников',1,'01:00:00',5,15,NULL,NULL,'2020-10-31 16:00:00',2,18),('20-10-2','Перенос снега для транспортировки',1,'04:30:00',8,15,NULL,NULL,'2020-10-31 09:20:00',5,19),('20-10-2','Транспортировка снега',2,'02:30:00',9,15,NULL,NULL,'2020-10-31 12:30:00',3,20),('20-10-3','Перевозка снега',1,'01:00:00',7,20,NULL,NULL,'2020-10-31 11:00:00',30,21),('20-10-3','Перевозка сотрудников',2,'01:20:00',5,20,NULL,NULL,'2020-10-31 12:00:00',10,22),('20-10-4','Завоз дистиллированной воды',1,'03:00:00',10,17,1,3,'2020-10-31 08:00:00',35,23),('20-10-4','Перевозка сотрудников',2,'01:20:00',5,17,NULL,NULL,'2020-10-31 12:00:00',10,24),('20-10-1','Привозка',2,'04:00:00',10,1,NULL,NULL,'2020-10-31 13:00:00',10,25),('20-10-1','Завоз воды',1,'02:00:00',10,1,NULL,NULL,'2020-10-31 11:00:00',10,26);
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
  `Название` text CHARACTER SET utf8 NOT NULL,
  `Описание` text CHARACTER SET utf8 NOT NULL,
  `ID_КлассТехники` int(11) NOT NULL,
  `Вместимость` float NOT NULL,
  `Удалена` tinyint(1) NOT NULL,
  `ID_Объект` int(11) NOT NULL,
  PRIMARY KEY (`ID_Транспорт`),
  KEY `Транспорт_fk0` (`ID_КлассТехники`),
  KEY `Транспорт_fk1` (`ID_Объект`),
  CONSTRAINT `Транспорт_fk0` FOREIGN KEY (`ID_КлассТехники`) REFERENCES `класстехники` (`ID_КлассТехники`),
  CONSTRAINT `Транспорт_fk1` FOREIGN KEY (`ID_Объект`) REFERENCES `объект` (`ID_Объект`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `транспорт`
--

LOCK TABLES `транспорт` WRITE;
/*!40000 ALTER TABLE `транспорт` DISABLE KEYS */;
INSERT INTO `транспорт` VALUES (1,'В748АО/138','',10,10,0,1),(2,'К079ВА/138','',14,18,0,2),(3,'К332ВА/138','',9,10,0,3),(4,'К046ВА/138','',8,20,0,4),(5,'Г016ВУ/138','',5,10,0,5),(6,'L200_В748АО/138','',5,3,0,1),(7,'L200_К079ВА/138','',10,2,0,2),(8,'VW_Caravell_К332ВА/138','',5,7,0,3),(9,'L200_К046ВА/138','',7,15,0,4),(10,'VW_Caravell_Г016ВУ/138','',7,20,0,5),(11,'С616АО/138',' ',10,10,0,3);
/*!40000 ALTER TABLE `транспорт` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'logistic'
--

--
-- Dumping routines for database 'logistic'
--
/*!50003 DROP PROCEDURE IF EXISTS `getBusyCars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getBusyCars`(IN `busyCars` bool, IN `id_app` varchar(12), IN `type` int, IN `order` int)
    COMMENT 'order - очередность вирт техники'
begin
declare dateApp date;
declare startTask time;
declare endTask time;
set dateApp = (select date(`Дата-время начало`) from `заявка` where `id_заявка` = `id_app`); 
set startTask = (select min(time(`Время прибытия`)) from `точкамаршрута` where `ID_Заявка` = `id_app` and `Очередность` = `order` );

set startTask = subtime(startTask, '01:00:00'); 
set endTask = (select max(time(addtime(`Время прибытия`, `длительность`))) from `точкамаршрута` where `ID_Заявка` = `id_app` and `Очередность` = `order`);
IF `busyCars` IS TRUE THEN
select `Название` from `транспорт` where `id_транспорт` IN ( select `id_транспорт` from `точкамаршрута` where `ID_Транспорт` IS NOT NULL and DATE(`Время прибытия`) = dateApp and `ID_КлассТехники` = `type` and ((time(`Время прибытия`) <= startTask and time(addtime(`Время прибытия`, `Длительность`)) > startTask) 
or (time(`Время прибытия`) < endTask and time(`Время прибытия`) > startTask) or (time(`Время прибытия`) < endTask and time(addtime(`Время прибытия`, `длительность`)) > endTask)) );
ELSE 
select `Название` from `транспорт` where `ID_КлассТехники` = `type` and `id_транспорт` NOT IN ( select `id_транспорт` from `точкамаршрута` where `ID_Транспорт` IS NOT NULL and DATE(`Время прибытия`) = dateApp and `ID_КлассТехники` = `type` and ((time(`Время прибытия`) <= startTask and time(addtime(`Время прибытия`, `Длительность`)) > startTask) 
or (time(`Время прибытия`) < endTask and time(`Время прибытия`) > startTask) or (time(`Время прибытия`) < endTask and time(addtime(`Время прибытия`, `длительность`)) > endTask)) );
END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFilledRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getFilledRow`(IN `ID` varchar(12))
    COMMENT 'Получение заполненной информации о заявке'
BEGIN   
	 DECLARE lastPos int;
     DECLARE ОбъектНачало text;
     DECLARE ОбъектКонец text;
     DECLARE МестоРаботы text;
	 SET lastPos = (SELECT `ID_Объект` FROM `точкамаршрута` WHERE `ID_Заявка` = `ID` AND ADDDATE(`Время прибытия`, `Длительность`) = (SELECT MAX(ADDDATE(B.`Время прибытия`, B.`Длительность`)) from `точкамаршрута` B where `id`= B.`ID_Заявка`));
     
     SET ОбъектНачало = (SELECT `Название` FROM `объект` WHERE `ID_Объект` = (SELECT `ID_Объект` FROM `точкамаршрута` WHERE `ID_Заявка` = `ID` AND  `Время прибытия` = (SELECT MIN(B.`Время прибытия`) from `точкамаршрута` B where `id`= B.`ID_Заявка`) AND `Очередность` = 1 limit 1));
     SET ОбъектКонец =  (SELECT `Название` FROM `объект` WHERE `ID_Объект` = lastPos);
     
     IF (ОбъектНачало = ОбъектКонец) THEN SET МестоРаботы = ОбъектНачало; 
     ELSE SET МестоРаботы = CONCAT(ОбъектНачало, ' - ', ОбъектКонец);
     END IF;
     
     SELECT B.`Название` as `Статус`, `ID` as `№ заявки`, A.`ОписаниеРабот` as `Описание работ`, CONCAT(time(A.`Дата-время начало`), ' - ',time(A.`Дата-время конец`)) as `Время подачи`, D.`Название` as `Приоритет`,  (SELECT `Название` from `объект` where `id_объект` = A.`id_объект`) as `Цех`, МестоРаботы as `Место работы`
     FROM `статус` B, `заявка` A, `приоритет` D WHERE A.`ID_заявка` = `ID` AND B.`ID_Статус` = A.`ID_Статус` AND D.`ID_Приоритет` = A.`ID_Приоритет`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrderInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getOrderInfo`(IN `id` varchar(12))
begin
	declare places text; 

	declare uniquePlaceFound int;
    set uniquePlaceFound = (select count(distinct(`ID_Объект`)) from `точкамаршрута` where `ID_Заявка` = `id`); 
    if (uniquePlaceFound = 1) then set places = (select (select `Название` from `объект` where `ID_Объект` = A.`ID_Объект`) from `точкамаршрута` A where `ID_Заявка` = `id` order by `ID_Заявка` limit 1);
    else set places = (select group_concat(`Название` SEPARATOR ' - ') from `объект` where `ID_Объект` IN ( select `ID_Объект` from `точкамаршрута` A where `ID_Заявка` = `id` ));
    end if; 
	
    
	select  `id` as 'ID', 
    B.`Название` as `Статус`,
    (select `название` from `объект` where `ID_Объект` = (A.`id_объект`)) as 'Цех',
    CONCAT(time(A.`Дата-время начало`), ' - ',time(A.`Дата-время конец`), ' ', date(A.`Дата-время конец`)) as 'Время и дата выполнения',
    places as 'Место работы', (select `ФИО` from `сотрудник` where `id_сотрудник` = A.`ID_Сотрудник`) as 'Ответственный',
    CONCAT((select `ОписаниеРабот` FROM `заявка` where `ID_Заявка` = `id`),'. Операции: ', (SELECT lower(group_concat(`Название` SEPARATOR ', ' )) from `точкамаршрута` where `ID_Заявка` = `id` Order by `Очередность`)) as 'Описание работы'
    from `заявка` A, `статус` B where A.`ID_Заявка` = `id` and B.`ID_Статус` = A.`ID_Статус`;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRealCars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getRealCars`(IN `busyCars` bool, IN `id_app` varchar(12), IN `type` int, IN `order` int)
    COMMENT 'order - очередность вирт техники'
begin
declare dateApp date;
declare startTask time;
declare endTask time;
set dateApp = (select date(`Дата-время начало`) from `заявка` where `id_заявка` = `id_app`); 
set startTask = (select min(time(`Время прибытия`)) from `точкамаршрута` where `ID_Заявка` = `id_app` and `Очередность` = `order` );

set startTask = subtime(startTask, '01:00:00'); 
set endTask = (select max(time(addtime(`Время прибытия`, `длительность`))) from `точкамаршрута` where `ID_Заявка` = `id_app` and `Очередность` = `order`);
IF `busyCars` IS TRUE THEN
select `id_транспорт`, `Название` from `транспорт` where `id_транспорт` IN ( select `id_транспорт` from `точкамаршрута` where `ID_Транспорт` IS NOT NULL and DATE(`Время прибытия`) = dateApp and `ID_КлассТехники` = `type` and ((time(`Время прибытия`) <= startTask and time(addtime(`Время прибытия`, `Длительность`)) > startTask) 
or (time(`Время прибытия`) < endTask and time(`Время прибытия`) > startTask) or (time(`Время прибытия`) < endTask and time(addtime(`Время прибытия`, `длительность`)) > endTask)) );
ELSE 
select `id_транспорт`, `Название` from `транспорт` where `ID_КлассТехники` = `type` and `id_транспорт` NOT IN ( select `id_транспорт` from `точкамаршрута` where `ID_Транспорт` IS NOT NULL and DATE(`Время прибытия`) = dateApp and `ID_КлассТехники` = `type` and ((time(`Время прибытия`) <= startTask and time(addtime(`Время прибытия`, `Длительность`)) > startTask) 
or (time(`Время прибытия`) < endTask and time(`Время прибытия`) > startTask) or (time(`Время прибытия`) < endTask and time(addtime(`Время прибытия`, `длительность`)) > endTask)) );
END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getWorksLocsAndTimesOfApp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getWorksLocsAndTimesOfApp`(IN `id` varchar(12))
begin
    select 
    (select `ID_КлассТехники` from `класстехники` where `ID_КлассТехники` = A.`ID_КлассТехники`) as 'ID_КлассТехники',
    (select C.`Название` from `класстехники` C where C.`ID_КлассТехники` = A.`ID_КлассТехники`) as 'Техника', 
    (select B.`Название` from `объект` B where B.`ID_Объект` = A.`ID_Объект`) as 'Локация',
    (select group_concat(concat('[',D.`Название`,',', D.`Время прибытия`, ',', ADDTIME(D.`Время прибытия`, D.`Длительность`),']')) from `точкамаршрута` D where D.`ID_Заявка` = `id` and D.`ID_КлассТехники` = A.`ID_КлассТехники` and D.`Очередность` = A.`Очередность`) as 'Таймлайн'
    from `точкамаршрута` A where `id` = A.`ID_Заявка` group by `Очередность` order by `Очередность`; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getWorksTimesOfRealCar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getWorksTimesOfRealCar`(IN `id_car` int)
BEGIN

select `Время прибытия` as 'Начало', (addtime(`Время прибытия`, `Длительность`)) as 'Конец' from `точкамаршрута` where `ID_Транспорт` = `id_car`;

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

-- Dump completed on 2020-12-25 10:08:09
    CONCAT((select `ОписаниеРабот` FROM `заявка` where `ID_Заявка` = `id`),'. Операции: ', (SELECT lower(group_concat(`Название` SEPARATOR ', ' )) from `точкамаршрута` where `ID_Заявка` = `id` Order by `Очередность`)) as 'Описание работы'
    from `заявка` A, `статус` B where A.`ID_Заявка` = `id` and B.`ID_Статус` = A.`ID_Статус`;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `
														      RealCars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getRealCars`(IN `busyCars` bool, IN `id_app` varchar(12), IN `type` int, IN `order` int)
    COMMENT 'order - очередность вирт техники'
begin
declare dateApp date;
declare startTask time;
declare endTask time;
set dateApp = (select date(`Дата-время начало`) from `заявка` where `id_заявка` = `id_app`); 
set startTask = (select min(time(`Время прибытия`)) from `точкамаршрута` where `ID_Заявка` = `id_app` and `Очередность` = `order` );

set startTask = subtime(startTask, '01:00:00'); 
set endTask = (select max(time(addtime(`Время прибытия`, `длительность`))) from `точкамаршрута` where `ID_Заявка` = `id_app` and `Очередность` = `order`);
IF `busyCars` IS TRUE THEN
select `id_транспорт`, `Название` from `транспорт` where `id_транспорт` IN ( select `id_транспорт` from `точкамаршрута` where `ID_Транспорт` IS NOT NULL and DATE(`Время прибытия`) = dateApp and `ID_КлассТехники` = `type` and ((time(`Время прибытия`) <= startTask and time(addtime(`Время прибытия`, `Длительность`)) > startTask) 
or (time(`Время прибытия`) < endTask and time(`Время прибытия`) > startTask) or (time(`Время прибытия`) < endTask and time(addtime(`Время прибытия`, `длительность`)) > endTask)) );
ELSE 
select `id_транспорт`, `Название` from `транспорт` where `ID_КлассТехники` = `type` and `id_транспорт` NOT IN ( select `id_транспорт` from `точкамаршрута` where `ID_Транспорт` IS NOT NULL and DATE(`Время прибытия`) = dateApp and `ID_КлассТехники` = `type` and ((time(`Время прибытия`) <= startTask and time(addtime(`Время прибытия`, `Длительность`)) > startTask) 
or (time(`Время прибытия`) < endTask and time(`Время прибытия`) > startTask) or (time(`Время прибытия`) < endTask and time(addtime(`Время прибытия`, `длительность`)) > endTask)) );
END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getWorksLocsAndTimesOfApp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`localhost` PROCEDURE `getWorksLocsAndTimesOfApp`(IN `id` varchar(12))
begin
    select 
    (select `ID_КлассТехники` from `класстехники` where `ID_КлассТехники` = A.`ID_КлассТехники`) as 'ID_КлассТехники',
    (select C.`Название` from `класстехники` C where C.`ID_КлассТехники` = A.`ID_КлассТехники`) as 'Техника', 
    (select B.`Название` from `объект` B where B.`ID_Объект` = A.`ID_Объект`) as 'Локация',
    (select group_concat(concat('[',D.`Название`,',', D.`Время прибытия`, ',', ADDTIME(D.`Время прибытия`, D.`Длительность`),']')) from `точкамаршрута` D where D.`ID_Заявка` = `id` and D.`ID_КлассТехники` = A.`ID_КлассТехники` and D.`Очередность` = A.`Очередность`) as 'Таймлайн'
    from `точкамаршрута` A where `id` = A.`ID_Заявка` group by `Очередность` order by `Очередность`; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getWorksTimesOfRealCar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getWorksTimesOfRealCar`(IN `id_car` int)
BEGIN

select `Время прибытия` as 'Начало', (addtime(`Время прибытия`, `Длительность`)) as 'Конец' from `точкамаршрута` where `ID_Транспорт` = `id_car`;

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

-- Dump completed on 2020-12-25  7:11:24
