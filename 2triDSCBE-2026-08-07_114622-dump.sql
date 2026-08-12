
DROP TABLE IF EXISTS `Cliente`;

CREATE TABLE `Cliente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `CPF` char(14) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(512) NOT NULL,
  `Celular` char(14) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CPF` (`CPF`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `Cliente` WRITE;

INSERT INTO `Cliente` VALUES (1,'Nycolas','888.888.888.88','nycolas.galvao@GMAIL','#Perola21%','(42)99999-4444'),(5,'Bridget','324.858.878.94','bridget.ligoski@gmail.com','#Unika23%','(42)99934-9588'),(6,'Unika','454.678.323.74','Unika.lima@gmail.com','#Bridget22%','(42)99942-4537'),(7,'Rosa','454.378.334.21','rosa.ligoski@gmail.com','#Esmeralda20%','(42)99233-4111'),(8,'Eduardo','333.374.534.21','Eduardo.ligoski@gmail.com','#Esmeralda20%','(42)23333-4121'),(9,'Alauanny','312.554.568.56','Alauanny.lima@gmail.com','#Assas20%','(42)2455-4661'),(10,'Flavio','222.154.548.66','Flavio.ligoski@gmail.com','3432MR%','(42)2345-6334'),(11,'Pietro','442.133.456.05','pietrinho.raivoso@gmail.com','Ruvinhoscomestilo','(42)43587-6900'),(12,'Guilherme','772.213.456.67','guilherme.luiz@gmail.com','meajudaaaaaaaaa','(42)12557-6344'),(13,'Richard','442.richard.12','richard.promarx@gmail.com','novingas-e-veinhas','(42)Richa-1214');

UNLOCK TABLES;

SELECT Email,Senha from Cliente
WHERE * Email =  'bridget.ligoski@gmail.com';

SELECT * FROM Cliente WHERE id < 6;

SELECT * FROM Cliente WHERE id >= 3 AND LENGTH(Senha) <20;

DELETE FROM Cliente WHERE id = 10

UPDATE Cliente SET nome = 'Richardinho', Email = 'Richard.pro.MAX@veinhas' WHERE id ='13';
