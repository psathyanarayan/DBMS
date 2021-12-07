-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: lib
-- ------------------------------------------------------
-- Server version	5.7.36-0ubuntu0.18.04.1

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
-- Table structure for table `AUTHOR`
--

DROP TABLE IF EXISTS `AUTHOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHOR` (
  `Author_Id` int(11) NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `Phone_No` int(11) DEFAULT NULL,
  `Status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Author_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHOR`
--

LOCK TABLES `AUTHOR` WRITE;
/*!40000 ALTER TABLE `AUTHOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTHOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK`
--

DROP TABLE IF EXISTS `BOOK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK` (
  `Book_Id` int(11) NOT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `Language_Id` int(11) DEFAULT NULL,
  `MRP` int(11) DEFAULT NULL,
  `Publisher_Id` int(11) DEFAULT NULL,
  `Published_Date` date DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Book_Id`),
  KEY `Language_Id` (`Language_Id`),
  CONSTRAINT `BOOK_ibfk_1` FOREIGN KEY (`Language_Id`) REFERENCES `LANGUAGE` (`Language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK`
--

LOCK TABLES `BOOK` WRITE;
/*!40000 ALTER TABLE `BOOK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOOK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_AUTHOR`
--

DROP TABLE IF EXISTS `BOOK_AUTHOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK_AUTHOR` (
  `Book_Id` int(11) NOT NULL,
  `Author_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Book_Id`),
  KEY `Author_Id` (`Author_Id`),
  CONSTRAINT `BOOK_AUTHOR_ibfk_1` FOREIGN KEY (`Author_Id`) REFERENCES `AUTHOR` (`Author_Id`),
  CONSTRAINT `BOOK_AUTHOR_ibfk_2` FOREIGN KEY (`Book_Id`) REFERENCES `BOOK` (`Book_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_AUTHOR`
--

LOCK TABLES `BOOK_AUTHOR` WRITE;
/*!40000 ALTER TABLE `BOOK_AUTHOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOOK_AUTHOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_ISSUE`
--

DROP TABLE IF EXISTS `BOOK_ISSUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK_ISSUE` (
  `Issue_Id` int(11) NOT NULL,
  `DATE_Of_Issue` date DEFAULT NULL,
  `Book_Id` int(11) DEFAULT NULL,
  `Member_Id` int(11) DEFAULT NULL,
  `Expected_Date_Of_Return` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Issue_Id`),
  KEY `Book_Id` (`Book_Id`),
  KEY `Member_Id` (`Member_Id`),
  CONSTRAINT `BOOK_ISSUE_ibfk_1` FOREIGN KEY (`Book_Id`) REFERENCES `BOOK` (`Book_Id`),
  CONSTRAINT `BOOK_ISSUE_ibfk_2` FOREIGN KEY (`Member_Id`) REFERENCES `MEMBER` (`Member_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_ISSUE`
--

LOCK TABLES `BOOK_ISSUE` WRITE;
/*!40000 ALTER TABLE `BOOK_ISSUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOOK_ISSUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LANGUAGE`
--

DROP TABLE IF EXISTS `LANGUAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LANGUAGE` (
  `Language_id` int(1) NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LANGUAGE`
--

LOCK TABLES `LANGUAGE` WRITE;
/*!40000 ALTER TABLE `LANGUAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `LANGUAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LATE_FEE_RULE`
--

DROP TABLE IF EXISTS `LATE_FEE_RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LATE_FEE_RULE` (
  `FromDays` int(11) NOT NULL,
  `ToDays` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`FromDays`,`ToDays`,`Amount`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LATE_FEE_RULE`
--

LOCK TABLES `LATE_FEE_RULE` WRITE;
/*!40000 ALTER TABLE `LATE_FEE_RULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `LATE_FEE_RULE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEMBER`
--

DROP TABLE IF EXISTS `MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEMBER` (
  `Member_Id` int(11) NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Branch_Code` int(11) DEFAULT NULL,
  `Roll_Number` int(11) DEFAULT NULL,
  `Phone_No` int(11) DEFAULT NULL,
  `Email_Id` varchar(25) DEFAULT NULL,
  `Date_of_join` date DEFAULT NULL,
  `Status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Member_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBER`
--

LOCK TABLES `MEMBER` WRITE;
/*!40000 ALTER TABLE `MEMBER` DISABLE KEYS */;
/*!40000 ALTER TABLE `MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUBLISHER`
--

DROP TABLE IF EXISTS `PUBLISHER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUBLISHER` (
  `Publisher_id` int(11) NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Address` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUBLISHER`
--

LOCK TABLES `PUBLISHER` WRITE;
/*!40000 ALTER TABLE `PUBLISHER` DISABLE KEYS */;
/*!40000 ALTER TABLE `PUBLISHER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07  5:44:32
