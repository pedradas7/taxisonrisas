CREATE DATABASE  IF NOT EXISTS `sonrisa` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sonrisa`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sonrisa
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `fk_cliente_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_cliente_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operadora`
--

DROP TABLE IF EXISTS `operadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operadora` (
  `idoperadora` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idoperadora`),
  KEY `fk_operadora_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_operadora_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operadora`
--

LOCK TABLES `operadora` WRITE;
/*!40000 ALTER TABLE `operadora` DISABLE KEYS */;
/*!40000 ALTER TABLE `operadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamo`
--

DROP TABLE IF EXISTS `reclamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclamo` (
  `idreclamo` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idreclamo`),
  KEY `fk_reclamo_cliente1_idx` (`idcliente`),
  CONSTRAINT `fk_reclamo_cliente1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo`
--

LOCK TABLES `reclamo` WRITE;
/*!40000 ALTER TABLE `reclamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `reclamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `idtaxista` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `lugarorigen` varchar(45) DEFAULT NULL,
  `lugardestino` varchar(45) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idservicio`),
  KEY `fk_servicio_taxista_idx` (`idtaxista`),
  KEY `fk_servicio_cliente1_idx` (`idcliente`),
  CONSTRAINT `fk_servicio_cliente1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_taxista` FOREIGN KEY (`idtaxista`) REFERENCES `taxista` (`idtaxista`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxista`
--

DROP TABLE IF EXISTS `taxista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxista` (
  `idtaxista` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idtaxista`),
  KEY `fk_taxista_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_taxista_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxista`
--

LOCK TABLES `taxista` WRITE;
/*!40000 ALTER TABLE `taxista` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `nombre_usuario` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Olympia','Hammond','19323467','091-110-7234','eros@penatibusetmagnis.edu','in faucibus','eu,'),(2,'Lamar','Waters','16414854','045-255-8425','egestas@urna.edu','aliquet libero.','fames'),(3,'Wesley','Franks','28202469','023-009-5377','nibh.Quisque@tempus.edu','ipsum ac','et'),(4,'Ezekiel','Browning','16126338','067-004-1767','scelerisque.lorem@utmolestiein.co.uk','ut, molestie','tincidunt'),(5,'Pascale','Blackburn','17788819','025-935-0662','tellus.faucibus.leo@tinciduntcongue.edu','odio. Aliquam','eget'),(6,'Chaney','Chaney','37779580','022-560-9683','vel.turpis.Aliquam@nec.com','Aenean eget','aliquet'),(7,'Maya','Newman','9999317','043-204-2331','dolor.elit.pellentesque@luctusvulputatenisi.edu','nisi. Mauris','velit.'),(8,'Louis','Stanton','13580077','086-823-7035','imperdiet.non@aodiosemper.co.uk','odio. Aliquam','a,'),(9,'Cleo','Barton','50525038','089-205-3879','dolor.egestas@pede.com','semper pretium','amet,'),(10,'Lance','Mcintosh','12128405','041-496-0399','Quisque@faucibusorciluctus.co.uk','mauris, rhoncus','elit.'),(11,'Hanna','Francis','12503359','040-992-9594','tellus.id.nunc@egetipsumDonec.net','Aenean eget','dis'),(12,'Abbot','Mathews','32396354','013-225-8595','sapien.molestie@nunc.org','Phasellus elit','ridiculus'),(13,'Suki','Ortiz','18310936','072-004-9194','ultrices.mauris@utquam.edu','tincidunt. Donec','id,'),(14,'Nehru','West','38388543','016-416-1813','sapien.gravida.non@Crasloremlorem.com','auctor odio','lacus.'),(15,'Luke','Booker','10260169','052-889-6032','lorem.auctor.quis@imperdietnecleo.edu','Aenean eget','amet,'),(16,'Jared','Marshall','13243925','089-188-7242','vestibulum.massa@rutrumurna.co.uk','amet, consectetuer','Donec'),(17,'Josiah','Harrell','8501172','058-289-7493','mi.tempor@eratvitaerisus.ca','mauris ut','velit'),(18,'Rowan','Knight','43237520','005-629-7878','enim@neccursusa.edu','molestie tellus.','cubilia'),(19,'Mona','Simpson','49509977','065-343-7083','accumsan.interdum.libero@Nunclaoreetlectus.org','in, dolor.','vestibulum.'),(20,'Liberty','Ellison','11515615','096-031-5301','Nunc@euenim.net','risus. Donec','odio.'),(21,'Nina','Abbott','33723387','056-920-6652','nunc.nulla@nisi.edu','pede sagittis','nec'),(22,'Buckminster','Schneider','37269325','027-449-7426','Integer.id@rhoncusid.com','augue eu','amet'),(23,'Christen','Tyson','39725506','060-896-4122','risus@Utsagittislobortis.com','tristique ac,','ipsum'),(24,'Beverly','Reid','48658930','049-859-1198','nisi.sem.semper@nisiAenean.com','nec tellus.','convallis,'),(25,'Elton','Riley','31379257','045-355-8174','nulla.Integer.urna@pede.com','metus. In','sit'),(26,'Clarke','Bonner','49033008','008-231-4624','turpis.vitae.purus@Integertinciduntaliquam.co.uk','dui. Cum','Duis'),(27,'Flynn','Harmon','38768051','047-254-4171','libero.mauris@magnis.net','vel, mauris.','elementum'),(28,'Farrah','Pratt','33764010','057-287-2721','consequat.lectus@iaculis.net','facilisis vitae,','Nullam'),(29,'Dana','Gamble','50375073','003-013-8557','ac.feugiat@NullainterdumCurabitur.org','et ultrices','mauris'),(30,'Quintessa','Ortiz','46329170','086-128-3467','congue.elit@tempus.org','consectetuer euismod','est'),(31,'Conan','Becker','23955933','050-223-8739','tempor.est@vitaemaurissit.net','urna, nec','turpis'),(32,'Kevin','Higgins','25259918','099-853-9674','Praesent.eu@loremvitaeodio.co.uk','mauris elit,','luctus'),(33,'Sophia','Edwards','38207588','080-879-6584','et.arcu@sodales.net','eu turpis.','parturient'),(34,'Blaze','York','33569513','025-224-1770','vitae@Etiamligulatortor.org','tempus eu,','Proin'),(35,'Idona','Holden','33373925','069-664-1621','cubilia@infaucibusorci.org','Suspendisse ac','quis,'),(36,'Ralph','Dodson','6185804','052-826-9109','fames@acurnaUt.net','pulvinar arcu','luctus'),(37,'Pearl','Barber','45368524','008-579-0141','nisl.sem.consequat@semsempererat.com','nisi. Cum','sem'),(38,'Echo','Mcconnell','28352151','064-913-2245','vehicula.aliquet@magna.com','Mauris blandit','tellus.'),(39,'Blake','Baird','39036131','011-790-6004','egestas.a@iaculis.net','neque. Sed','Vivamus'),(40,'Virginia','Pruitt','22250523','089-714-3723','justo.Proin@sitametrisus.co.uk','quam. Pellentesque','Donec'),(41,'Aaron','Wallace','14471060','015-174-4899','massa.Quisque.porttitor@ridiculusmus.ca','Vestibulum ante','nibh'),(42,'Dominic','Rios','44479508','083-106-3063','libero.mauris.aliquam@eu.net','Fusce aliquam,','nunc'),(43,'Myles','Jensen','15868014','099-396-7897','cursus@netuset.net','dolor vitae','ligula.'),(44,'Brennan','Pace','38371536','004-673-3014','nunc.ac.mattis@mollisvitaeposuere.edu','et libero.','imperdiet'),(45,'Hyacinth','Cole','33132944','006-820-3919','aliquet.molestie@Duiselementum.ca','elementum, lorem','amet'),(46,'Daphne','Navarro','46323113','025-933-3087','ante.ipsum@Quisqueornaretortor.edu','nunc, ullamcorper','Mauris'),(47,'Cally','Bell','28188771','004-711-1412','id.ante.Nunc@aliquetsem.co.uk','odio. Aliquam','semper'),(48,'Ulysses','Grimes','27760532','077-866-7110','Cras.lorem@dictumProineget.org','placerat, augue.','placerat,'),(49,'Indira','Chapman','16351074','095-366-7050','euismod.ac.fermentum@montes.co.uk','ultrices sit','Pellentesque'),(50,'Darius','Garza','24998153','044-189-7437','condimentum.eget@mitemporlorem.com','congue a,','lacus.'),(51,'Allistair','Kane','31743294','077-121-2971','nibh.Phasellus@justoeu.co.uk','sit amet,','dolor'),(52,'Mannix','Velazquez','18770985','070-179-7132','Vivamus@Nullam.com','Quisque nonummy','a,'),(53,'Emma','Mcmillan','43932749','074-127-1374','magna.Praesent.interdum@Phasellusdapibus.org','mauris a','lobortis'),(54,'Phelan','Richards','19929357','064-385-7891','nunc.ac.mattis@diamPellentesquehabitant.edu','sed, est.','velit'),(55,'Willow','Strong','16013774','075-154-2388','lectus.Nullam.suscipit@sagittis.com','eleifend non,','Phasellus'),(56,'Martin','Stein','17845126','008-195-4208','per@eudoloregestas.com','id risus','augue.'),(57,'Mannix','Brewer','30198663','009-615-2601','aliquet.Proin@liberoettristique.edu','In faucibus.','blandit'),(58,'Rama','Chase','19625147','064-985-3633','mattis.ornare@Aliquam.com','Phasellus vitae','iaculis'),(59,'Xerxes','Bruce','9705014','087-550-0925','porttitor@egestasadui.com','molestie pharetra','Phasellus'),(60,'Indigo','Bennett','11040817','093-891-0085','cursus.in@quis.ca','malesuada fames','posuere,'),(61,'Grant','Willis','19264240','003-292-9624','euismod.enim.Etiam@ametconsectetueradipiscing.com','non magna.','vitae,'),(62,'Aurora','Fitzgerald','16422852','094-927-0995','eu@dolor.co.uk','Pellentesque habitant','auctor,'),(63,'Kaitlin','Chandler','45806389','087-186-6284','Nunc@Integer.com','ultricies dignissim','Integer'),(64,'Sydney','Dalton','34219609','088-457-9149','aliquam.adipiscing@aliquet.co.uk','Suspendisse aliquet,','Quisque'),(65,'Laura','Henderson','46465174','081-642-6947','eget.venenatis@atpedeCras.net','Cum sociis','tellus.'),(66,'Halla','Washington','27197915','075-036-9735','sollicitudin.adipiscing.ligula@ullamcorperviverra.com','Sed molestie.','enim.'),(67,'Echo','Houston','34794649','080-155-1673','Aliquam.erat.volutpat@cubilia.edu','magna. Phasellus','volutpat.'),(68,'Zachary','Barnes','50032525','052-351-4935','mi.ac@volutpatNullafacilisis.net','at, iaculis','auctor'),(69,'Ann','Cantrell','37589914','095-473-8810','bibendum.Donec.felis@nisl.edu','vehicula aliquet','mi'),(70,'Idona','Reilly','30407016','027-829-1563','odio.Phasellus@Vestibulumut.ca','luctus. Curabitur','tellus'),(71,'Mara','Walter','49969168','088-386-7753','parturient.montes.nascetur@vel.ca','id ante','felis'),(72,'Frances','Kramer','16572418','038-401-2701','magna.Suspendisse.tristique@luctussitamet.edu','tempor bibendum.','elit'),(73,'Robert','Everett','25230117','036-800-7248','montes.nascetur.ridiculus@felis.org','faucibus orci','Integer'),(74,'Shafira','Franco','41574309','076-063-5232','Suspendisse@sempererat.edu','adipiscing lobortis','risus.'),(75,'Nora','Bass','42501324','072-648-2416','diam.nunc@utpellentesqueeget.net','lobortis risus.','sollicitudin'),(76,'Noel','Byrd','37780494','005-644-3262','magna.a.neque@afeugiattellus.co.uk','habitant morbi','mauris'),(77,'Doris','Bray','48222143','034-150-2164','Duis@lectuspedeultrices.ca','scelerisque sed,','pede,'),(78,'Nola','Lott','44520627','076-773-5789','Vivamus.sit@Vivamus.org','quis arcu','mi'),(79,'Jenette','Gomez','21523463','044-719-8212','nulla@fames.co.uk','Donec feugiat','semper'),(80,'Halla','Thornton','50146108','077-410-1501','elementum.dui@sapienmolestieorci.com','tincidunt, neque','Fusce'),(81,'Ivory','Abbott','50938816','094-334-6832','nulla.Donec.non@utipsumac.org','vestibulum lorem,','dolor'),(82,'Freya','Harrell','46730523','029-207-1209','eu@lacus.edu','et risus.','eu,'),(83,'Quinn','Dunn','19880068','045-618-2209','tortor.Integer@nascetur.co.uk','eu, placerat','ultrices'),(84,'Hayfa','Hatfield','9625557','098-666-4076','ultrices@Morbiaccumsanlaoreet.org','ullamcorper, nisl','Ut'),(85,'Rebekah','Blair','29612846','097-447-3682','vitae@Nullaeget.net','neque pellentesque','felis.'),(86,'Jeremy','Burris','31776851','037-059-2653','lacinia.vitae.sodales@facilisisnonbibendum.edu','imperdiet dictum','Ut'),(87,'Jasmine','Prince','21704404','056-488-1784','eget.varius@sapienNuncpulvinar.co.uk','ipsum. Phasellus','ipsum'),(88,'Aline','Cameron','29453305','083-853-1685','Nunc.mauris.sapien@arcuAliquamultrices.co.uk','amet ante.','a,'),(89,'Kyle','Durham','49054627','010-132-1291','eleifend.nec@Loremipsum.org','adipiscing non,','In'),(90,'Jolie','Meadows','44322877','043-898-2179','metus@eleifendnuncrisus.org','dui quis','magna'),(91,'Uriah','Nicholson','45095452','092-581-0562','erat.semper@non.net','lobortis risus.','sed'),(92,'Irma','Sweet','33118418','007-294-8442','tortor@Sedcongue.org','Quisque ac','convallis'),(93,'Aspen','Hebert','46731630','041-919-3761','malesuada@tellusloremeu.edu','ridiculus mus.','in'),(94,'Kimberly','Fields','13445471','000-277-4615','amet.consectetuer@ategestas.co.uk','non, sollicitudin','facilisis.'),(95,'Sarah','Cobb','25664204','068-984-1631','sed.dictum.eleifend@aliquetnecimperdiet.org','dictum. Proin','nascetur'),(96,'Natalie','Madden','15598156','096-215-8967','Vivamus.non.lorem@Vivamussitamet.com','fringilla. Donec','Mauris'),(97,'Merritt','Willis','14212962','094-839-2873','ullamcorper.Duis@nislelementumpurus.com','molestie arcu.','interdum'),(98,'Sierra','Campbell','7284974','064-694-3324','viverra@vulputatenisisem.org','Vivamus sit','mus.'),(99,'Sydnee','Haynes','44090038','081-971-3058','consequat.enim.diam@bibendumDonec.edu','Fusce feugiat.','cursus'),(100,'Caldwell','Peck','32486100','033-981-0882','montes.nascetur@acturpis.net','lorem lorem,','posuere'),(101,'Britanni','Bass','37964246','035-360-9031','lectus@inconsequat.ca','sagittis augue,','pede.'),(102,'Hadassah','Hodge','20602240','076-321-0948','nulla.ante@tortornibhsit.org','Nulla dignissim.','pede,'),(103,'Benedict','Briggs','23145791','059-760-8798','Morbi.vehicula.Pellentesque@nuncest.co.uk','mi pede,','scelerisque'),(104,'Sade','Randolph','50020272','032-074-0722','turpis@nibh.edu','metus. Vivamus','hendrerit.'),(105,'Vaughan','Barnett','23538757','087-242-8159','ac.metus.vitae@ornare.com','Cum sociis','Nullam'),(106,'Libby','Bird','12825925','046-653-1367','tellus.imperdiet@tellusPhaselluselit.co.uk','sem magna','a'),(107,'Colin','Stafford','25697119','054-801-5425','commodo.tincidunt@ut.net','non, vestibulum','Nam'),(108,'Adele','Church','40954959','056-376-7878','amet@ornaretortorat.ca','nec, cursus','blandit.'),(109,'Amber','Santos','17994283','079-784-8887','neque.Nullam.ut@penatibusetmagnis.co.uk','ullamcorper. Duis','nisi.'),(110,'Courtney','Hess','40244325','074-343-1845','rutrum.eu@viverra.co.uk','Curabitur egestas','convallis'),(111,'Lucy','Franks','41908299','005-774-2147','Curabitur.dictum.Phasellus@Suspendissealiquet.edu','non massa','netus'),(112,'Vanna','Meyers','44069937','007-903-1516','In.faucibus.Morbi@magna.org','libero. Integer','semper'),(113,'Kylan','Reeves','16349999','002-816-1933','tincidunt.neque@dictummagna.com','a ultricies','Aliquam'),(114,'August','Mckenzie','9867506','079-858-4952','arcu.et@semegetmassa.org','luctus et','sit'),(115,'Eve','Wall','42324538','040-815-7953','ante.dictum.cursus@utpellentesqueeget.co.uk','ipsum cursus','elementum,'),(116,'Ivy','Waters','16468591','096-167-7430','ridiculus@tellusAeneanegestas.edu','eu neque','eros.'),(117,'Macaulay','Valdez','13274479','067-235-8356','metus.In@liberoduinec.ca','enim, sit','malesuada'),(118,'Christen','Harper','20000555','099-210-5530','Donec@nec.net','magna. Nam','mi'),(119,'Erich','Travis','28071587','058-719-9045','eu.metus@ultrices.org','nostra, per','diam'),(120,'Aurora','Hood','48199819','034-969-1100','sodales.at.velit@tortordictum.edu','Nullam scelerisque','Nulla'),(121,'Kyra','Joyner','14924209','048-880-3809','Donec.est@Phasellusornare.org','sed, est.','diam'),(122,'Selma','Randolph','26592491','056-007-7395','scelerisque@dapibusgravida.ca','Etiam imperdiet','euismod'),(123,'Reed','Oneill','43497578','098-148-8932','penatibus@In.ca','sem eget','ut'),(124,'Isaac','Carroll','27814365','072-839-3462','lectus.sit.amet@nibhAliquam.ca','sit amet','rutrum'),(125,'Shoshana','Tate','47335288','035-387-9408','congue.a@quis.edu','lorem, eget','convallis'),(126,'Reuben','Tucker','16096221','032-443-3713','eros.non.enim@tortor.com','lacinia. Sed','bibendum'),(127,'Blair','Osborn','29713811','094-081-8694','In@a.edu','egestas. Aliquam','feugiat'),(128,'Jacob','Merritt','29220926','073-456-9106','molestie.in@euturpis.net','scelerisque, lorem','cursus'),(129,'Chancellor','Lowery','37912807','072-822-9539','Etiam.bibendum@tellus.co.uk','quam dignissim','In'),(130,'Samson','Herring','19785394','088-323-2449','sapien.Aenean@nulla.ca','varius ultrices,','iaculis'),(131,'Chelsea','Mcconnell','19756484','032-864-2860','ante.bibendum.ullamcorper@mauriseu.edu','arcu. Vestibulum','faucibus'),(132,'Herrod','Hurst','31352547','000-596-1267','parturient.montes@ultricesiaculis.org','nisi. Aenean','non,'),(133,'Drake','Madden','9244365','072-349-0186','neque.Nullam@leo.com','at, velit.','vitae'),(134,'Nehru','Harding','22749720','061-825-1361','orci.luctus@tellus.ca','magna. Phasellus','Fusce'),(135,'Fleur','Mckee','28097130','064-589-5149','mi.felis.adipiscing@ipsumcursus.ca','euismod est','malesuada'),(136,'Graiden','Carson','44912817','040-044-5456','est@libero.ca','vestibulum lorem,','Vestibulum'),(137,'Lester','Hebert','34176332','055-888-2187','aliquam.iaculis@auctorvelit.co.uk','augue, eu','eu'),(138,'Blake','Anthony','20384790','085-853-8485','Aliquam.tincidunt@nibhdolornonummy.edu','velit eget','mauris'),(139,'Evan','Clemons','7303451','050-025-9790','iaculis.quis@eu.net','tellus lorem','Integer'),(140,'Whilemina','Garrett','16717476','071-482-7966','sit.amet.faucibus@ullamcorper.edu','cursus in,','bibendum'),(141,'Beau','Espinoza','15941904','060-183-8940','volutpat.Nulla@liberoettristique.ca','egestas. Duis','eget'),(142,'Eve','Tyson','18033421','008-028-8430','ipsum@magnanecquam.org','purus sapien,','feugiat.'),(143,'Veda','Guy','45859868','085-209-9312','dui.augue@Donecnibhenim.ca','auctor non,','sociis'),(144,'Leilani','Cervantes','37086868','023-949-6876','malesuada@odiosagittis.co.uk','quam, elementum','Nulla'),(145,'Kylie','Moses','20545515','045-696-4460','enim.sit@Donecvitae.edu','id, erat.','Mauris'),(146,'Dominic','Leach','24402077','031-464-3014','Donec@Duis.ca','fermentum risus,','tempus'),(147,'Chanda','Morrison','21582213','088-286-7800','semper@maurisaliquameu.ca','Ut nec','consectetuer'),(148,'Francis','Pierce','10776949','083-037-7867','sociosqu.ad.litora@Cras.edu','porttitor eros','nunc,'),(149,'Barbara','Andrews','44644757','055-454-6165','turpis.vitae.purus@vulputate.ca','augue scelerisque','fringilla'),(150,'Shafira','Dickerson','19655401','027-087-0176','Morbi@Aliquamornarelibero.edu','libero mauris,','Suspendisse'),(151,'Echo','Maxwell','26249431','075-662-0535','Maecenas.malesuada@Sedneque.co.uk','metus urna','Donec'),(152,'Barry','Velazquez','33527345','055-320-7294','non.nisi.Aenean@eratSed.org','a, facilisis','enim'),(153,'Dante','Le','21021942','059-065-7648','enim.sit@molestie.net','mi lacinia','pede'),(154,'Amity','Collier','24421483','078-200-9409','erat.vel@erat.ca','egestas lacinia.','parturient'),(155,'Melvin','Harmon','7009967','032-703-7632','Mauris@disparturient.com','Morbi sit','sed,'),(156,'Pascale','Cooper','12608788','039-293-3967','mauris@Suspendissenonleo.org','consectetuer adipiscing','et,'),(157,'Raja','Huber','19121397','033-151-4819','pede.nonummy.ut@ultricesmauris.com','dolor sit','mauris'),(158,'Adena','Humphrey','18660493','061-551-5250','ante.dictum.cursus@eueuismod.co.uk','pulvinar arcu','dolor'),(159,'Mari','Joseph','33991056','017-370-9975','justo.sit.amet@felis.edu','ornare, lectus','id,'),(160,'Oleg','Terrell','14720476','030-576-4131','Cras@velsapien.edu','erat neque','Pellentesque'),(161,'Maile','Ray','36485917','026-618-5196','nulla.Integer.urna@augue.edu','montes, nascetur','In'),(162,'Renee','Mueller','13106352','003-893-5961','convallis.ante.lectus@imperdiet.co.uk','lobortis, nisi','vitae'),(163,'Gareth','Holcomb','24345577','025-630-1366','Aliquam@sollicitudincommodo.net','mauris elit,','nec,'),(164,'Wade','Sims','50006366','004-576-7580','Nunc.commodo@orciUt.edu','venenatis a,','Duis'),(165,'Charlotte','Mclean','14029114','033-491-4829','nec@nuncinterdum.net','Sed dictum.','orci,'),(166,'Malachi','Nash','33282460','018-407-6715','mi.ac.mattis@tempus.com','metus. Vivamus','blandit'),(167,'Baxter','Massey','18230404','025-505-7411','in.molestie.tortor@nec.co.uk','neque vitae','sed'),(168,'Christopher','House','36754618','094-214-0454','natoque.penatibus@iaculis.net','interdum feugiat.','enim,'),(169,'Moses','Haley','19257457','001-318-0570','Suspendisse@Pellentesquetincidunttempus.edu','non, vestibulum','Phasellus'),(170,'Christine','Koch','34835859','015-753-6824','mi.Duis@dolor.com','nascetur ridiculus','tincidunt'),(171,'Micah','David','10858134','048-402-1171','sit@auctornon.ca','Cras eu','Nam'),(172,'Quyn','Freeman','5569785','087-794-9552','luctus@Quisquevarius.co.uk','mi enim,','interdum.'),(173,'Leroy','Wolf','23261261','081-965-0589','arcu.Vestibulum@imperdiet.edu','nec tempus','Etiam'),(174,'Nathaniel','Marshall','9138290','033-330-7385','natoque@nonleo.ca','Mauris quis','Aliquam'),(175,'Kirk','Dixon','50573354','012-957-3257','dui.Cras@at.edu','lectus. Cum','Sed'),(176,'Zephr','Pace','14214919','095-335-5212','condimentum.eget.volutpat@velitAliquam.co.uk','ridiculus mus.','Etiam'),(177,'Priscilla','Harrison','50747147','091-932-3023','erat.Vivamus.nisi@egetmagna.org','a, magna.','ut'),(178,'Thaddeus','Stuart','22218187','080-217-1051','metus.In.lorem@urnaetarcu.org','Nulla facilisi.','ultrices'),(179,'Florence','Johns','37459249','080-842-9229','dictum@urna.com','dictum. Proin','dapibus'),(180,'Lacota','Warren','27070942','051-751-4130','Sed.nulla.ante@facilisisvitaeorci.org','sapien. Aenean','elit'),(181,'Ryder','Walls','45033176','042-365-5501','lectus@velitegestaslacinia.co.uk','sed tortor.','et,'),(182,'Jane','Barrett','36700881','061-248-3050','Mauris.molestie@malesuadaaugue.edu','amet orci.','vitae,'),(183,'Xantha','Atkins','38632708','040-014-1510','elit@necurna.net','dignissim lacus.','arcu'),(184,'Ella','Alvarez','33780191','060-066-0073','nonummy.Fusce@semperNam.edu','Aenean eget','vulputate'),(185,'Ramona','Chandler','41078093','020-090-2552','nisl.arcu.iaculis@urna.edu','cursus a,','eu'),(186,'Driscoll','Clay','27997025','011-010-9114','felis@velarcuCurabitur.net','luctus. Curabitur','in'),(187,'Evelyn','Simon','48300558','082-031-0766','vehicula.Pellentesque.tincidunt@mollislectuspede.net','vel, venenatis','nulla.'),(188,'Chadwick','Pierce','46680285','064-862-6083','vitae@adipiscing.org','Sed malesuada','eros.'),(189,'Joan','Leblanc','46771061','001-923-9808','Suspendisse@duiquis.net','justo sit','leo.'),(190,'Carly','Vargas','39783531','054-624-8347','ultricies@mi.net','fermentum arcu.','urna,'),(191,'Martena','Mcmillan','40662728','078-795-5395','at.pede@lacusAliquamrutrum.edu','et netus','ligula'),(192,'Kay','Bernard','38114978','088-420-7242','in.lobortis@diameudolor.co.uk','amet massa.','erat,'),(193,'Carol','Eaton','20992420','078-250-8186','libero@augueSed.com','risus. In','non,'),(194,'Steven','Marshall','43868346','026-783-1358','mi@vellectusCum.org','lacus. Ut','ligula'),(195,'Keefe','Roy','30480474','057-875-2676','eu@a.co.uk','Donec est','ornare.'),(196,'Jack','Molina','50856913','021-831-1604','magna.et.ipsum@vulputateveliteu.com','interdum. Curabitur','eu'),(197,'Daria','Snider','28184879','078-621-6975','id.ante.dictum@utmiDuis.edu','vehicula risus.','diam.'),(198,'Liberty','Gilmore','10417657','019-252-9938','lacus.Mauris@dolor.co.uk','imperdiet non,','non,'),(199,'Francis','Morales','34138439','091-429-4674','Quisque@justoPraesent.co.uk','nisl. Quisque','pede.'),(200,'Justin','French','23957016','048-402-3885','feugiat.Sed@eratinconsectetuer.edu','Sed auctor','sit'),(201,'Jolene','Gallagher','7829750','096-473-9410','Sed@hendreritDonecporttitor.co.uk','Aenean eget','Pellentesque'),(202,'Cadman','Baldwin','12174075','074-587-1103','arcu@eratSed.edu','vel, vulputate','mi'),(203,'Wyatt','Everett','20103116','027-714-4520','libero.nec.ligula@est.org','diam. Sed','ac'),(204,'Sopoline','Hopkins','38731078','025-605-6900','eleifend.non@mollis.ca','Nam tempor','Proin'),(205,'Merritt','Jordan','21357866','000-159-4122','Vestibulum.ante@odioAliquam.co.uk','luctus lobortis.','lacinia.'),(206,'Hector','Norton','14407965','061-854-0837','tincidunt.vehicula@posuerecubiliaCurae.edu','est. Nunc','diam'),(207,'Justin','Mcgee','6016556','099-233-2468','Nulla.semper.tellus@magnaa.edu','ornare. Fusce','dictum'),(208,'Shellie','Key','33788808','069-997-8443','quis.pede.Suspendisse@egetlaoreet.com','posuere at,','ligula.'),(209,'Walter','Alvarez','27017914','065-089-2756','Etiam.laoreet@scelerisquemollisPhasellus.edu','tellus, imperdiet','in'),(210,'Priscilla','Trujillo','14032387','019-163-0031','iaculis.quis@dignissim.co.uk','sit amet','vitae'),(211,'Raja','Blackwell','6046751','045-581-7150','risus.Morbi@acurna.org','nunc id','Nam'),(212,'Wayne','Hopper','34047269','011-447-1500','Curae.Phasellus.ornare@dictumsapienAenean.co.uk','lorem tristique','ipsum.'),(213,'Adam','Chan','41657862','044-294-8190','tristique.pellentesque.tellus@nislQuisque.edu','sit amet','pharetra.'),(214,'Baxter','Herring','10457750','003-599-0486','semper.auctor.Mauris@Vivamusrhoncus.net','enim diam','luctus'),(215,'Fitzgerald','Patton','32479356','028-565-3154','nec.ligula@ipsumnonarcu.edu','orci, adipiscing','Nunc'),(216,'Echo','Ramirez','39518638','058-467-7259','sed.pede.nec@Integerurna.org','eleifend nec,','lectus,'),(217,'Bianca','Oconnor','38747326','015-193-4536','ipsum.Suspendisse@Phasellus.net','viverra. Donec','dis'),(218,'Kasper','French','33993811','000-564-7687','eget@maurissit.edu','nunc risus','amet,'),(219,'Lester','Gregory','27683284','083-668-0419','metus.In.nec@arcueu.net','nibh. Aliquam','mauris'),(220,'Evelyn','Snider','48554417','016-449-2193','eu.dui@ligula.net','lorem. Donec','viverra.'),(221,'Bo','Woodard','30236987','067-386-9057','sagittis.placerat@adipiscing.org','Vestibulum accumsan','ipsum.'),(222,'Addison','Andrews','47833470','085-645-7103','nisl@justositamet.net','ridiculus mus.','magna.'),(223,'Orla','Battle','19219095','058-726-6674','quam.elementum@est.org','urna et','ante'),(224,'Adrienne','Haley','17673203','047-345-5844','vitae.aliquet@temporbibendum.ca','ipsum. Suspendisse','vulputate,'),(225,'Xyla','Larsen','23789784','047-430-2723','eros@sitamet.co.uk','Morbi neque','gravida.'),(226,'Tanner','Walters','24241120','069-795-1365','gravida@NullafacilisiSed.edu','imperdiet, erat','orci.'),(227,'Moses','Bray','8496885','099-313-2508','ullamcorper.Duis.cursus@miAliquamgravida.edu','dapibus rutrum,','sem'),(228,'Thane','Fitzpatrick','10093031','054-207-3303','natoque.penatibus.et@Maecenasmi.com','Aliquam ornare,','eget'),(229,'Yolanda','Gill','19333740','038-612-7827','dis@est.com','lobortis risus.','eu'),(230,'Joan','Elliott','16363824','077-239-7725','tempus.mauris@egestas.ca','imperdiet, erat','blandit'),(231,'Riley','Booker','36433164','063-611-8966','nec@temporerat.net','interdum. Sed','ad'),(232,'Kirby','Freeman','10013253','078-888-7789','magnis@mitempor.com','non, vestibulum','tempus'),(233,'Ulla','Valdez','11471842','098-379-6737','urna.et.arcu@gravidanunc.co.uk','Nunc commodo','Morbi'),(234,'Fritz','Lott','7413870','089-489-4198','lacus@Nunc.ca','morbi tristique','Donec'),(235,'Dillon','Leach','13474575','073-554-3876','neque.Nullam.ut@adipiscingfringillaporttitor.co.uk','consectetuer, cursus','sem'),(236,'Russell','Burke','28151494','083-338-1664','Nunc@necorciDonec.org','Pellentesque ultricies','hendrerit'),(237,'Winifred','Hopper','16858402','067-490-8231','Pellentesque.habitant.morbi@magnisdis.net','magna a','auctor'),(238,'Xerxes','Potts','18365218','097-122-3562','Nullam.lobortis.quam@musAeneaneget.edu','posuere cubilia','Quisque'),(239,'Leah','Watts','39839100','017-629-7474','sem.ut.cursus@ultriciesadipiscingenim.org','molestie arcu.','scelerisque'),(240,'Robert','Fischer','43178298','070-202-6025','aliquet.molestie@leoVivamusnibh.org','tempor, est','Suspendisse'),(241,'Wallace','Stevens','35699757','032-825-5039','amet.consectetuer@interdum.ca','et malesuada','Fusce'),(242,'Emily','Wilkerson','15308284','032-169-5365','metus.sit@velitegestaslacinia.edu','orci, adipiscing','quam'),(243,'Wynne','Foreman','21843648','035-056-1121','libero.dui@DonecestNunc.edu','vitae risus.','Suspendisse'),(244,'Brielle','Haney','37374404','000-742-9556','sem.Pellentesque@ridiculus.com','nisi magna','lacus.'),(245,'Quincy','Sharpe','21138159','086-939-4997','magna.Praesent@sociosquadlitora.ca','semper rutrum.','eu,'),(246,'Iliana','Mann','39757462','021-088-1048','enim.nisl.elementum@parturientmontes.co.uk','arcu. Vestibulum','dui,'),(247,'Mallory','Dawson','43882305','024-613-2880','risus.Quisque.libero@dolornonummy.edu','sit amet,','consectetuer,'),(248,'Christine','Hutchinson','33810672','043-335-5464','Vivamus@sociisnatoque.ca','nunc sed','et'),(249,'Quemby','Evans','12213651','065-611-7079','risus@sapiengravida.com','est mauris,','nec'),(250,'Rhonda','Mayo','23976903','073-525-9529','iaculis.aliquet.diam@sagittisplaceratCras.org','fames ac','imperdiet'),(251,'Lucius','Petty','37042648','051-171-5538','ornare.In@parturient.ca','magna. Suspendisse','Cras'),(252,'Akeem','Farmer','46591593','043-159-4466','euismod.urna@Nuncac.org','sociis natoque','parturient'),(253,'Tanya','Harrington','37588444','059-935-6862','volutpat.Nulla@Nullam.edu','facilisis lorem','Nullam'),(254,'Joel','Suarez','42092268','043-813-1583','non.dapibus.rutrum@sedpedeCum.org','justo eu','dui,'),(255,'Elliott','Osborn','26228542','020-829-5549','quam.dignissim@enimnon.co.uk','ut dolor','sem'),(256,'Asher','Miranda','27362765','039-781-5448','sapien.imperdiet@nonenimcommodo.com','netus et','est'),(257,'Preston','Peters','37661542','050-196-8002','vehicula@porttitorinterdumSed.co.uk','in sodales','Phasellus'),(258,'Denton','Aguirre','46110638','096-568-2038','In.tincidunt@volutpatNulla.ca','enim, gravida','vel'),(259,'Emma','Ashley','22988135','063-298-9023','scelerisque.neque.sed@Maurisvestibulumneque.ca','quis diam','vulputate,'),(260,'Kiara','Middleton','34894039','040-825-6862','odio@habitantmorbi.edu','pharetra sed,','amet'),(261,'Christine','Ruiz','22456725','083-665-8904','fermentum@urnaVivamusmolestie.org','ante bibendum','turpis.'),(262,'Tamekah','Sweet','6180581','000-551-7131','at.pede@egestasadui.ca','Quisque tincidunt','enim.'),(263,'Dalton','Rogers','13405103','010-583-5112','congue.a@velquam.ca','imperdiet ornare.','Nullam'),(264,'Rudyard','Cannon','16855610','065-179-4009','lacinia.at.iaculis@Nullaegetmetus.edu','pede, ultrices','quis'),(265,'Isadora','Kelley','39922866','039-879-4754','nascetur@ipsumprimis.com','iaculis aliquet','malesuada'),(266,'Luke','Fulton','27696522','099-935-5762','ullamcorper@consequat.ca','dignissim magna','lacus.'),(267,'Whilemina','Booker','44645872','093-634-7280','velit.Sed.malesuada@gravidasagittis.net','nec ante.','facilisis'),(268,'Carla','Carey','45670967','094-396-2590','velit.Cras.lorem@euaccumsan.edu','orci tincidunt','habitant'),(269,'Neve','Rodriguez','15468671','022-517-1986','nibh.vulputate@placerateget.co.uk','libero. Proin','gravida'),(270,'Grady','Barton','40311060','045-479-8098','fermentum@Etiam.ca','sodales at,','Ut'),(271,'Karyn','Leach','32614935','092-219-9143','auctor.quis@Phasellus.com','id risus','odio'),(272,'Calista','Wilkerson','34301341','089-553-3237','et.pede@elit.org','cursus. Integer','ac'),(273,'Buffy','Abbott','5600610','098-029-3080','amet@Integerid.com','sem ut','convallis'),(274,'Scarlet','Savage','11447018','032-061-3630','Fusce@lectus.ca','odio vel','montes,'),(275,'Shelly','Hale','13394407','060-516-3668','egestas.a@in.net','dui quis','amet,'),(276,'Zeus','Holder','36633371','062-262-5732','pede.et.risus@hendrerit.edu','nec, imperdiet','congue'),(277,'Sawyer','Parrish','47676704','059-737-1335','vel@sem.org','Sed eu','at,'),(278,'Alexa','Pennington','20582918','069-449-4573','ut@inhendrerit.org','arcu. Sed','ipsum'),(279,'Edan','Paul','16631590','088-245-3914','elit.Aliquam.auctor@cubiliaCuraePhasellus.ca','ipsum primis','tempor,'),(280,'Courtney','Flowers','24983265','086-583-2692','purus.ac.tellus@DonectinciduntDonec.ca','augue scelerisque','nec'),(281,'Caldwell','Hines','30130430','081-924-8925','Etiam.bibendum@ametnulla.edu','ipsum. Curabitur','sit'),(282,'Zachery','Wilkins','31768452','079-880-7011','pede.et.risus@atvelit.ca','lectus convallis','auctor'),(283,'Rogan','Wolf','50755084','018-826-9846','adipiscing@laciniaSedcongue.edu','sem ut','Sed'),(284,'Tanya','Wood','47278758','011-948-6291','lectus.rutrum@sitamet.ca','magna et','at'),(285,'Nolan','Smith','21655648','022-978-1958','magnis.dis@ipsumprimis.ca','Nunc laoreet','Proin'),(286,'Vielka','Ford','40774789','012-923-9107','blandit.at@velit.net','volutpat. Nulla','ullamcorper'),(287,'Jessamine','Byrd','5056423','011-349-7937','elementum.at@rhoncusProin.net','elementum, dui','sit'),(288,'Ali','Mcknight','18570158','078-672-2009','sem.vitae.aliquam@consequat.edu','dolor sit','ultricies'),(289,'Shad','Benjamin','20655432','072-779-7359','eu.neque.pellentesque@nonnisiAenean.co.uk','vulputate velit','sit'),(290,'Chastity','Hopkins','20364787','074-605-6784','nunc.In.at@bibendumullamcorper.co.uk','egestas a,','parturient'),(291,'Regina','Golden','48359462','047-208-5717','sociis.natoque@velpedeblandit.edu','Quisque purus','mus.'),(292,'Edan','Lynn','48626341','076-415-6425','nibh.sit.amet@quis.net','et arcu','lectus'),(293,'Tana','Winters','44098641','082-903-2960','natoque.penatibus@Integertinciduntaliquam.com','elit. Etiam','tortor'),(294,'Christopher','Paul','8703098','065-263-5693','diam.dictum@mattisCraseget.com','odio. Nam','dis'),(295,'Stewart','Mcknight','40856353','059-061-7623','ultrices.Duis.volutpat@sem.edu','et ultrices','vel'),(296,'Adara','Figueroa','30244863','037-320-6606','lorem.sit@molestie.org','elementum, lorem','Fusce'),(297,'Chastity','Ayala','49536685','000-543-2290','Quisque@Naminterdum.ca','dictum eu,','dis'),(298,'Angela','King','5469804','094-295-8196','molestie@Etiamimperdietdictum.edu','sem semper','facilisi.'),(299,'Destiny','Cruz','16037242','089-165-8630','urna.Vivamus@pedeCum.net','Maecenas mi','sapien,'),(300,'Amethyst','Buck','16689928','038-033-2475','cursus@Aliquameratvolutpat.net','auctor ullamcorper,','rutrum'),(301,'q234','234','234','234','234','234','23423');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `idvehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idtaxista` int(11) NOT NULL,
  `placa` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idvehiculo`),
  KEY `fk_vehiculo_taxista1_idx` (`idtaxista`),
  CONSTRAINT `fk_vehiculo_taxista1` FOREIGN KEY (`idtaxista`) REFERENCES `taxista` (`idtaxista`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-15  8:52:51
