use emanagementdb;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `department`;
DROP TABLE IF EXISTS `compliance`;
DROP TABLE IF EXISTS `employee`;
SET FOREIGN_KEY_CHECKS = 1;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deptName` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `compliance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rltype` varchar(15) DEFAULT (NULL),
  `details` varchar(250) DEFAULT (NULL),
  `createDate` date DEFAULT (NULL),
  `departmentId` int DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `FK_DEPART_ID` (`departmentId`),
  CONSTRAINT `FK_DEPART_ID` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) DEFAULT (NULL),
  `lname` varchar(45) DEFAULT (NULL),
  `email` varchar(45) DEFAULT (NULL),
  `phone` varchar(45) DEFAULT (NULL),
  `userid` varchar(45) DEFAULT (NULL),
  `password` varchar(45) DEFAULT (NULL),
  `departmentId` int DEFAULT (NULL),
  `role` varchar(45) DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `FK_DEPARTMENT_ID` (`departmentId`),
  CONSTRAINT `FK_DEPARTMENT_ID` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `status_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_report` (
  `compId` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `empId` int NOT NULL,
  `comments` varchar(15) DEFAULT (NULL),
  `createDate` date DEFAULT (NULL),
  `deptId` int DEFAULT ((0 = NULL)),
  PRIMARY KEY (`id`),
  KEY `statusreport_ibfk_1` (`deptId`),
  KEY `statusreport_ibfk_2` (`empId`),
  KEY `statusreport_ibfk_3` (`compId`),
  CONSTRAINT `statusreport_ibfk_1` FOREIGN KEY (`deptId`) REFERENCES `department` (`id`),
  CONSTRAINT `statusreport_ibfk_2` FOREIGN KEY (`empId`) REFERENCES `employee` (`id`),
  CONSTRAINT `statusreport_ibfk_3` FOREIGN KEY (`compId`) REFERENCES `compliance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `department` WRITE;
INSERT INTO `department` VALUES (1,'CSE'),(2,'MNC');
UNLOCK TABLES;

LOCK TABLES `employee` WRITE;
INSERT INTO `employee` VALUES (5,'john','wick','jhj','987646','admin','admin',1,'admin'),(6,'Bean','London','njbjbk','654845','bean','password',2,'user'),(7,'johnny','deep','jhjfh','5645456','johnny','password',1,'user'),(8,'bumrah','jasprit','nndjj','54545','bumrah','password',2,'user'),(9,'John','Bond','jhjhej','88979879879','john','password',1,'User'),(10,'Keanu ','Reeves','njknkjdn','64646546','keanu','password',1,'user');
UNLOCK TABLES;

Select * from employee;