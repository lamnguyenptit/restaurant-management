-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant_management
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `tblban`
--

DROP TABLE IF EXISTS `tblban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblban` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) NOT NULL,
  `SoCho` int NOT NULL,
  `MoTa` varchar(255) DEFAULT NULL,
  `tblNhaHangId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblBan640391` (`tblNhaHangId`),
  CONSTRAINT `FKtblBan640391` FOREIGN KEY (`tblNhaHangId`) REFERENCES `tblnhahang` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblban`
--

LOCK TABLES `tblban` WRITE;
/*!40000 ALTER TABLE `tblban` DISABLE KEYS */;
INSERT INTO `tblban` VALUES (1,'Ban 1',2,NULL,1),(2,'Ban 2',2,NULL,1),(3,'Ban 3',4,NULL,1),(4,'Ban 4',4,NULL,1),(5,'Ban 5',6,NULL,1),(6,'Ban 6',6,NULL,1),(7,'Ban 7',8,NULL,1),(8,'Ban 8',8,NULL,1),(9,'Ban 9',10,NULL,1),(10,'Ban 10',10,NULL,1);
/*!40000 ALTER TABLE `tblban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbandat`
--

DROP TABLE IF EXISTS `tblbandat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblbandat` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `GhiChu` varchar(255) DEFAULT NULL,
  `tblThongTinDatBanId` int NOT NULL,
  `tblBanId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblBanDat176223` (`tblThongTinDatBanId`),
  KEY `FKtblBanDat712720` (`tblBanId`),
  CONSTRAINT `FKtblBanDat176223` FOREIGN KEY (`tblThongTinDatBanId`) REFERENCES `tblthongtindatban` (`Id`),
  CONSTRAINT `FKtblBanDat712720` FOREIGN KEY (`tblBanId`) REFERENCES `tblban` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbandat`
--

LOCK TABLES `tblbandat` WRITE;
/*!40000 ALTER TABLE `tblbandat` DISABLE KEYS */;
INSERT INTO `tblbandat` VALUES (1,NULL,1,1),(2,NULL,2,2),(3,NULL,2,3),(4,NULL,3,4),(5,NULL,4,5),(6,NULL,5,6),(7,NULL,6,7),(8,NULL,7,8),(9,NULL,8,9),(10,NULL,9,10),(11,NULL,10,1);
/*!40000 ALTER TABLE `tblbandat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcombo`
--

DROP TABLE IF EXISTS `tblcombo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcombo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) NOT NULL,
  `Gia` varchar(255) NOT NULL,
  `MoTa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcombo`
--

LOCK TABLES `tblcombo` WRITE;
/*!40000 ALTER TABLE `tblcombo` DISABLE KEYS */;
INSERT INTO `tblcombo` VALUES (1,'Combo Cơm gà Nước cam','40000',NULL),(2,'Combo Cơm rang Cá nướng','110000',NULL),(3,'Combo Phở bò Nước cam','50000',NULL),(4,'Combo Phở gà Nước cam','45000',NULL),(5,'Combo Hủ tiếu Nước cam','45000',NULL),(6,'Combo Cơm rang Bò lúc lắc','170000',NULL),(7,'Combo Cơm rang Bò lúc lắc Nước cam','175000',NULL),(8,'Combo Cơm rang Bò bít tểt','215000',NULL),(9,'Combo Cơm rang Bò bít tết Nước cam','220000',NULL),(10,'Combo Cơm rang Gà rang muối','170000',NULL);
/*!40000 ALTER TABLE `tblcombo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcombodat`
--

DROP TABLE IF EXISTS `tblcombodat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcombodat` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SoLuong` int NOT NULL,
  `tblBanDatId` int NOT NULL,
  `tblComboId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblComboDa248537` (`tblBanDatId`),
  KEY `FKtblComboDa231532` (`tblComboId`),
  CONSTRAINT `FKtblComboDa231532` FOREIGN KEY (`tblComboId`) REFERENCES `tblcombo` (`Id`),
  CONSTRAINT `FKtblComboDa248537` FOREIGN KEY (`tblBanDatId`) REFERENCES `tblbandat` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcombodat`
--

LOCK TABLES `tblcombodat` WRITE;
/*!40000 ALTER TABLE `tblcombodat` DISABLE KEYS */;
INSERT INTO `tblcombodat` VALUES (1,1,2,1),(3,2,4,2),(5,2,5,4),(7,1,7,6),(9,1,3,3),(10,1,8,1),(11,1,8,6),(12,2,5,1);
/*!40000 ALTER TABLE `tblcombodat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkhachhang`
--

DROP TABLE IF EXISTS `tblkhachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblkhachhang` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) NOT NULL,
  `Sdt` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkhachhang`
--

LOCK TABLES `tblkhachhang` WRITE;
/*!40000 ALTER TABLE `tblkhachhang` DISABLE KEYS */;
INSERT INTO `tblkhachhang` VALUES (1,'John Wick','0123456789','johnwick@gmail.com','My Tho'),(2,'Nguyễn Sơn Tùng','0912876323','tungson@gmail.com','Lang Son'),(3,'Hoàng Đức Anh','0967675782','anh@gmail.com','Hải Phòng'),(4,'Đỗ Hoàng Gia Bảo','01666960845','bao@gmail.com','Lạng Sơn'),(5,'Trần Thị Minh Châu','01222561423','chau@gmail.com','An Giang'),(6,'Phạm Tiến Dũng','01688534475','dung@gmail.com','Đồng Nai'),(7,'	Nguyễn Thái Dương','0986810782 ','duong@gmail.com','Hà Nam'),(8,'Vũ Hương Giang','0967675782','giang@gmail.com','Hà Giang'),(9,'Nguyễn Lê Hiếu','0935234525','hieu@gmail.com','Thanh Hoá'),(10,'	Nguyễn Công Thành','0923445623','thanh@gmail.com','Thái Bình');
/*!40000 ALTER TABLE `tblkhachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmagiamgia`
--

DROP TABLE IF EXISTS `tblmagiamgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmagiamgia` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) NOT NULL,
  `PhanTram` int NOT NULL,
  `TrangThai` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmagiamgia`
--

LOCK TABLES `tblmagiamgia` WRITE;
/*!40000 ALTER TABLE `tblmagiamgia` DISABLE KEYS */;
INSERT INTO `tblmagiamgia` VALUES (1,'XINCHAO',10,_binary '\0'),(2,'XINCHAO1',15,_binary '\0'),(3,'HI',20,_binary '\0'),(5,'HELLO',5,_binary '\0'),(6,'PTIT',25,_binary '\0'),(7,'HNHN',30,_binary '\0'),(8,'CHAONHE',35,_binary '\0'),(9,'HIHI',40,_binary '\0'),(10,'CAMON',45,_binary '\0'),(11,'LMAO',50,_binary '\0');
/*!40000 ALTER TABLE `tblmagiamgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmonan`
--

DROP TABLE IF EXISTS `tblmonan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmonan` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) NOT NULL,
  `Gia` bigint NOT NULL,
  `MoTa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmonan`
--

LOCK TABLES `tblmonan` WRITE;
/*!40000 ALTER TABLE `tblmonan` DISABLE KEYS */;
INSERT INTO `tblmonan` VALUES (1,'Cơm rang',30000,NULL),(2,'Cơm gà',35000,NULL),(3,'Nước cam',10000,NULL),(4,'Cá nướng',100000,NULL),(5,'Gà rang muối',150000,NULL),(6,'Bò lúc lắc',150000,NULL),(7,'Bò bít tết',200000,NULL),(8,'Phở bò',45000,NULL),(9,'Phở gà',40000,NULL),(10,'Hủ tiếu',40000,NULL);
/*!40000 ALTER TABLE `tblmonan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmonancombo`
--

DROP TABLE IF EXISTS `tblmonancombo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmonancombo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `tblMonAnId` int NOT NULL,
  `tblComboId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblMonAnCo808157` (`tblMonAnId`),
  KEY `FKtblMonAnCo531041` (`tblComboId`),
  CONSTRAINT `FKtblMonAnCo531041` FOREIGN KEY (`tblComboId`) REFERENCES `tblcombo` (`Id`),
  CONSTRAINT `FKtblMonAnCo808157` FOREIGN KEY (`tblMonAnId`) REFERENCES `tblmonan` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmonancombo`
--

LOCK TABLES `tblmonancombo` WRITE;
/*!40000 ALTER TABLE `tblmonancombo` DISABLE KEYS */;
INSERT INTO `tblmonancombo` VALUES (1,2,1),(2,3,1),(3,1,2),(4,4,2),(5,3,3),(6,8,3),(7,3,4),(8,9,4),(9,3,5),(10,10,5),(11,1,6),(12,6,6),(13,1,7),(14,3,7),(15,6,7),(16,1,8),(17,7,8),(18,1,9),(19,3,9),(20,7,9),(21,1,10),(22,5,10);
/*!40000 ALTER TABLE `tblmonancombo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmonandat`
--

DROP TABLE IF EXISTS `tblmonandat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmonandat` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SoLuong` int NOT NULL,
  `tblBanDatId` int NOT NULL,
  `tblMonAnId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblMonAnDa606116` (`tblBanDatId`),
  KEY `FKtblMonAnDa866227` (`tblMonAnId`),
  CONSTRAINT `FKtblMonAnDa606116` FOREIGN KEY (`tblBanDatId`) REFERENCES `tblbandat` (`Id`),
  CONSTRAINT `FKtblMonAnDa866227` FOREIGN KEY (`tblMonAnId`) REFERENCES `tblmonan` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmonandat`
--

LOCK TABLES `tblmonandat` WRITE;
/*!40000 ALTER TABLE `tblmonandat` DISABLE KEYS */;
INSERT INTO `tblmonandat` VALUES (1,2,1,1),(2,1,1,3),(3,1,2,2),(4,1,3,4),(5,2,4,5),(7,2,5,6),(8,1,6,7),(9,2,5,1);
/*!40000 ALTER TABLE `tblmonandat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnhahang`
--

DROP TABLE IF EXISTS `tblnhahang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnhahang` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) NOT NULL,
  `DiaChi` varchar(255) NOT NULL,
  `MoTa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnhahang`
--

LOCK TABLES `tblnhahang` WRITE;
/*!40000 ALTER TABLE `tblnhahang` DISABLE KEYS */;
INSERT INTO `tblnhahang` VALUES (1,'Caviar Russe','Mo Lao, Ha Dong, Ha Noi',NULL);
/*!40000 ALTER TABLE `tblnhahang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnhanvien`
--

DROP TABLE IF EXISTS `tblnhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnhanvien` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TaiKhoan` varchar(255) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `Ten` varchar(255) NOT NULL,
  `Sdt` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnhanvien`
--

LOCK TABLES `tblnhanvien` WRITE;
/*!40000 ALTER TABLE `tblnhanvien` DISABLE KEYS */;
INSERT INTO `tblnhanvien` VALUES (1,'lam','123456','Lâm','0972941935','tunglams229@gmail.com','Hà Nội'),(2,'hoang','123456','Hoàng','0323541235','hoang@gmail.com','Hải Dương');
/*!40000 ALTER TABLE `tblnhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblthongtindatban`
--

DROP TABLE IF EXISTS `tblthongtindatban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblthongtindatban` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `GhiChu` varchar(255) DEFAULT NULL,
  `ThanhToan` bit(1) NOT NULL,
  `CheckIn` bit(1) NOT NULL,
  `tblMaGiamGiaId` int DEFAULT NULL,
  `tblNhanVienId` int DEFAULT NULL,
  `tblKhachHangId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblThongTi91170` (`tblKhachHangId`),
  KEY `FKtblThongTi113830` (`tblNhanVienId`),
  KEY `FKtblThongTi327791` (`tblMaGiamGiaId`),
  CONSTRAINT `FKtblThongTi113830` FOREIGN KEY (`tblNhanVienId`) REFERENCES `tblnhanvien` (`Id`),
  CONSTRAINT `FKtblThongTi327791` FOREIGN KEY (`tblMaGiamGiaId`) REFERENCES `tblmagiamgia` (`Id`),
  CONSTRAINT `FKtblThongTi91170` FOREIGN KEY (`tblKhachHangId`) REFERENCES `tblkhachhang` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblthongtindatban`
--

LOCK TABLES `tblthongtindatban` WRITE;
/*!40000 ALTER TABLE `tblthongtindatban` DISABLE KEYS */;
INSERT INTO `tblthongtindatban` VALUES (1,NULL,_binary '\0',_binary '',NULL,NULL,1),(2,NULL,_binary '\0',_binary '',NULL,NULL,2),(3,NULL,_binary '\0',_binary '',NULL,NULL,3),(4,NULL,_binary '\0',_binary '',NULL,NULL,4),(5,NULL,_binary '\0',_binary '',NULL,NULL,5),(6,NULL,_binary '\0',_binary '',NULL,NULL,6),(7,NULL,_binary '\0',_binary '',NULL,NULL,7),(8,NULL,_binary '\0',_binary '',NULL,NULL,8),(9,NULL,_binary '\0',_binary '',NULL,NULL,9),(10,NULL,_binary '\0',_binary '\0',NULL,NULL,10);
/*!40000 ALTER TABLE `tblthongtindatban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'restaurant_management'
--
/*!50003 DROP PROCEDURE IF EXISTS `getDSBanDat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDSBanDat`(IN idThongTinDatBan INT)
BEGIN
	select tblbandat.*, tblban.Ten from tblbandat, tblban
    where tblThongTinDatBanId = idThongTinDatBan
    and tblBanId = tblBan.Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDSComboDat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDSComboDat`(IN idBanDat INT)
BEGIN
	SELECT tblcombodat.*, tblcombo.ten, tblcombo.gia FROM tblcombodat, tblcombo
	where tblcombodat.tblBanDatId = idBanDat
	and tblComboId = tblcombo.Id
    order by tblcombo.Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDSMonAnDat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDSMonAnDat`(IN idBanDat INT)
BEGIN
	SELECT tblmonandat.*, tblmonan.ten, tblmonan.gia FROM tblmonandat, tblmonan
	where 	tblmonandat.tblBanDatId = idBanDat
	and tblMonAnId = tblmonan.Id
    order by tblmonan.Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDSThongTinDatBan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDSThongTinDatBan`()
BEGIN
	select Id, ThanhToan from tblthongtindatban
	where tblthongtindatban.ThanhToan = 0
    and tblthongtindatban.CheckIn = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getThongTinDatBan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getThongTinDatBan`(IN idThongTinDatBan INT)
BEGIN
	select tblthongtindatban.*, tblkhachhang.ten
    from tblthongtindatban, tblkhachhang
	where tblthongtindatban.Id = idThongTinDatBan
    and tblthongtindatban.CheckIn = 1
    and tblKhachHangId = tblkhachhang.Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `kiemtraDN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kiemtraDN`(IN usr VARCHAR(255), IN pwd VARCHAR(255))
BEGIN
	SELECT * FROM tblnhanvien
	WHERE TaiKhoan = usr AND MatKhau = pwd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `luuMGG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `luuMGG`(IN idMaGiamGia INT, IN idThongTinDatBan INT)
BEGIN
	UPDATE tblthongtindatban SET tblMaGiamGiaId = idMaGiamGia where Id = idThongTinDatBan;
    UPDATE tblmagiamgia SET TrangThai = 1 WHERE Id = idMaGiamGia;
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

-- Dump completed on 2021-12-22 13:51:07
