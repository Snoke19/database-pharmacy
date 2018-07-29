-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: apteka_curs_bd
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
-- Table structure for table `custom`
--

DROP TABLE IF EXISTS `custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom` (
  `id_custom` int(11) NOT NULL COMMENT 'id_custom - первинний ключ таблиці замовлення',
  `с_date_of_purchase` date NOT NULL COMMENT 'с_date_of_purchase - дата купівлі',
  `с_number` int(11) NOT NULL COMMENT 'с_number - кількість медикаментів (куплені)',
  `medication_id_medication` int(11) NOT NULL COMMENT 'medication_id_medication - медикаменти',
  `price_id_price` int(11) NOT NULL COMMENT 'price_id_price - ціна за один',
  `employee_id_employee` int(11) NOT NULL COMMENT 'employee_id_employee - працівник',
  `customer_id_customer` int(11) DEFAULT NULL COMMENT 'customer_id_customer - покупець',
  `situation_social_id_situation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_custom`),
  KEY `fk_custom_medication1_idx` (`medication_id_medication`),
  KEY `fk_custom_price1_idx` (`price_id_price`),
  KEY `fk_custom_employee1_idx` (`employee_id_employee`),
  KEY `fk_custom_customer1_idx` (`customer_id_customer`),
  KEY `fk_custom_situation_social1_idx` (`situation_social_id_situation`),
  CONSTRAINT `fk_custom_customer1` FOREIGN KEY (`customer_id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_employee1` FOREIGN KEY (`employee_id_employee`) REFERENCES `employee` (`id_employee`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_medication1` FOREIGN KEY (`medication_id_medication`) REFERENCES `medication` (`id_medication`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_price1` FOREIGN KEY (`price_id_price`) REFERENCES `price` (`id_price`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_situation_social1` FOREIGN KEY (`situation_social_id_situation`) REFERENCES `situation_social` (`id_situation`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom`
--

LOCK TABLES `custom` WRITE;
/*!40000 ALTER TABLE `custom` DISABLE KEYS */;
INSERT INTO `custom` VALUES (1,'2015-05-01',2,3,103,5,1,2),(2,'2015-05-01',1,4,104,4,2,1),(3,'2015-05-03',1,5,105,5,3,2),(4,'2015-05-05',3,16,116,5,4,3),(5,'2015-05-05',1,18,118,5,5,2),(6,'2015-05-08',2,12,112,5,NULL,1),(7,'2015-05-08',2,15,115,4,NULL,2),(8,'2015-05-09',1,12,112,5,NULL,NULL),(9,'2015-05-11',1,29,129,5,NULL,NULL),(10,'2015-05-11',2,13,113,4,NULL,NULL),(11,'2015-05-14',1,9,109,4,NULL,3),(12,'2015-05-15',1,10,110,4,NULL,NULL),(13,'2015-05-15',1,10,110,5,NULL,NULL),(14,'2015-05-16',1,18,118,5,NULL,1),(15,'2015-05-16',2,17,127,4,NULL,NULL),(16,'2015-05-16',2,14,114,5,NULL,2),(17,'2015-05-25',2,1,101,4,NULL,NULL),(18,'2015-05-29',4,1,101,4,1,2);
/*!40000 ALTER TABLE `custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL COMMENT 'id_customer - первинний ключ для таблиці customer',
  `cu_name` varchar(45) DEFAULT NULL COMMENT 'cu_name - ім`я покупця',
  `cu_surname` varchar(45) DEFAULT NULL COMMENT 'cu_surname - прізвище покупця',
  `cu_telephone` bigint(20) DEFAULT NULL COMMENT 'cu_telephone - телефон покупця',
  `cu_city` varchar(45) DEFAULT NULL COMMENT 'cu_city - місто покупця',
  `cu_address` varchar(45) DEFAULT NULL COMMENT 'cu_address - адреса покупця',
  `situation_social_id_situation` int(11) NOT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `fk_customer_situation_social1_idx` (`situation_social_id_situation`),
  CONSTRAINT `fk_customer_situation_social1` FOREIGN KEY (`situation_social_id_situation`) REFERENCES `situation_social` (`id_situation`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Дужникова','Галина',80954643433,'Івано-Франківськ','вул. Василь`янок 4А',2),(2,'Воронін','Юрій',80978685543,'Івано-Франківськ','вул. Вовчинецька 4А',1),(3,'Дужникова','Галина',80953543533,'Івано-Франківськ','вул. Височана 3Б',2),(4,'Мельниченко','Тетяна',80978547433,'Івано-Франківськ','вул. Тисменицька 10А',3),(5,'Грабовий','Олег',80634643433,'Івано-Франківськ','вул. Галицька 20',2),(6,'Монюк','Юра',80955345435,'Київ','вул. Хрещатик 20А',2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `id_delivery` int(11) NOT NULL COMMENT 'id_delivery - первинний ключ для таблиці поставка',
  `d_delivery_date` date DEFAULT NULL COMMENT 'd_delivery_date - дата поставки',
  `d_number_of_medicines` int(11) DEFAULT NULL COMMENT 'd_number_of_medicines - кількість медикаментів',
  `d_delivery_price` float(10,2) NOT NULL COMMENT 'd_ delivery_price - ціна поставки',
  `supplier_id_provider` int(11) NOT NULL COMMENT 'supplier_id_provider - постачальник',
  `medication_id_medication` int(11) NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `fk_delivery_supplier1_idx` (`supplier_id_provider`),
  KEY `fk_delivery_medication1_idx` (`medication_id_medication`),
  CONSTRAINT `fk_delivery_medication1` FOREIGN KEY (`medication_id_medication`) REFERENCES `medication` (`id_medication`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_supplier1` FOREIGN KEY (`supplier_id_provider`) REFERENCES `supplier` (`id_provider`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'2015-04-10',10,1700.00,1,1),(2,'2015-04-10',10,2400.00,1,2),(3,'2015-04-10',20,2300.00,1,3),(4,'2015-04-10',25,150.00,2,4),(5,'2015-04-14',15,770.00,2,5),(6,'2015-04-14',12,1400.00,2,6),(7,'2015-04-14',11,900.00,2,7),(8,'2015-04-15',25,11600.00,4,8),(9,'2015-04-15',25,10200.00,4,9),(10,'2015-04-15',25,5400.00,4,10),(11,'2015-04-20',25,90.00,5,11),(12,'2015-04-20',25,1250.00,5,12),(13,'2015-04-20',25,5378.00,5,13),(14,'2015-04-21',10,800.00,5,14),(15,'2015-04-21',14,1200.00,3,15),(16,'2015-04-21',13,2220.00,3,16),(17,'2015-04-21',18,4410.00,3,17),(18,'2015-04-21',19,80.00,1,18),(19,'2015-04-23',5,1120.00,1,19),(20,'2015-04-23',8,470.00,1,20),(21,'2015-04-23',9,700.00,3,21),(22,'2015-04-23',10,420.00,5,22),(23,'2015-04-25',25,1450.00,5,23),(24,'2015-04-25',25,990.00,5,24),(25,'2015-04-25',25,1000.00,3,25),(26,'2015-04-25',30,900.00,3,26),(27,'2015-04-29',25,730.00,3,27),(28,'2015-04-29',25,740.00,2,28),(29,'2015-04-29',30,2980.00,2,29),(30,'2015-04-29',25,5790.00,2,30);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL COMMENT 'id_employee - первинний ключ для таблиці працівники',
  `e_name` varchar(45) DEFAULT NULL COMMENT 'e_name - ім`я',
  `e_middle_name` varchar(45) DEFAULT NULL COMMENT 'e_middle_name - по батькові',
  `e_surname` varchar(45) DEFAULT NULL COMMENT 'e_surname - прізвище',
  `e_phone_home` bigint(20) DEFAULT NULL COMMENT 'e_phone_home - домашній телефон',
  `e_mobile_phone` bigint(20) DEFAULT NULL COMMENT 'e_mobile_phone - мобільний телефон',
  `e_email` varchar(45) DEFAULT NULL COMMENT 'e_email - емаїл',
  `e_city` varchar(45) DEFAULT NULL COMMENT 'e_city - місто',
  `e_street` varchar(45) DEFAULT NULL COMMENT 'e_street - вулиця',
  `e_position` varchar(45) NOT NULL COMMENT 'e_position - посада',
  `e_salary` int(11) NOT NULL COMMENT 'e_salary - зарплата',
  PRIMARY KEY (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Юра','Сергійович','Пасічинський',32435,80954535331,'pas1997@gmail.com','Івано-Франківськ','вул. Коновальця 12B','Директор',20000),(2,'Іванка','Ігорівна','Черевайко',32556,80954352342,'Ivankas@gmail.com','Івано-Франківськ','вул. Мазепи 10','Бухгалтер',17000),(3,'Юля','Володимирівна','Любчик',32425,80954234115,'Yila@mail.ru','Івано-Франківськ','вул. Дудаєва 20C','Провізор',15000),(4,'Олег','Петрович','Монюк',36434,80951243214,'mon@mail.ru','Івано-Франківськ','вул. Незалежності 35A','Фармацевт',13000),(5,'Іра','Ігорівна','Фризюк',37685,80958087967,'fruz@rambler.ru','Івано-Франківськ','вул. Незалежності 12A','Фармацевт',11500);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `id_manufacturer` int(11) NOT NULL COMMENT 'id_manufacturer - первинний ключ виробника',
  `ma_name` varchar(45) DEFAULT NULL COMMENT 'ma_name - назва виробника',
  `ma_country` varchar(45) DEFAULT NULL COMMENT 'ma_country - країна виробника',
  `ma_address` varchar(60) DEFAULT NULL COMMENT 'ma_address - адреса виробника',
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'TEVA Pharmaceutical Industries Ltd','Ізраїль','HaShikma Str., P.O. Box 353'),(2,'АТ \"Лекхім-Харків\"','Україна','Харків, вул. 17 Партз’їзду, 36'),(3,'ВАТ \"Лубнифарм\"','Україна','Полтава, вул. Петровського, 16'),(4,'ЗАТ НВЦ \"Борщагівський ХФЗ\"','Україна','м.Київ, вул. 17 Мазепи, 36'),(5,'АТ \"Галичфарм\"','Україна','м.Львів, вул. 11 Леся Українка, 36'),(6,'\"Deutche-Homoeopathic Union\" (DHU)','Німеччина','str. 17 Ottostrase, 3, Berlin'),(7,'Grodzisk Pharmaceutical Works \"Polfa\"','Польща','Street Chlodna, 5660, Warsaw'),(8,'\"Beaufour Ipsen Industrie\"','Франція','str. 11 Rue Elthe Virton, 16, Paris'),(9,'\"EGIS\" Pharmaceuticals PLC','Угорщина','str. Budapest, Keresztúri út 0-38.'),(10,'Laboratorios Menarini S.A.','Іспанія','str. Carrer Alfons, Badalona, Barcelona'),(11,'Richter Gedeon Ltd','Угорщина','str. ​1103 Budapest, Gyömrői út 19-21.,'),(12,'Bionorica AG','Німеччина','Kerschensteinerstraße 11, Neumarkt in der Oberpfalz,'),(13,'Richard Bittner AG','Австрія','Ossiacherstraße 7, 9560 Feldkirchen in Kärnten'),(14,'Nabros Pharma Pvt. Ltd.','Індія','Nabros Tower Opposite Art Galary, Behind British Library'),(15,'Sanofi-Winthrop Industrie','Франція','54, rue La Boétie 75008 Paris '),(16,'Solvay Pharmaceuticals B.V.','Нідерланди','C.J. van Houtenlaan 361381 CP Weesp'),(17,'РУП \"Бєлмедпрепарати\"','Білорусь','г. Минск, ул. Фабрициуса, 30'),(18,'ТОВ \"НВФ \"Матеріа Медика Холдинг\"','Російська Федерація','129272, Москва, ул. Трифоновская, д. 47'),(19,'\"EMCURE PHARMACEUTICALS LTD\"','Ісландія','Emcure Pharmaceuticals Ltd.Survey No. 255/2'),(20,'ТОВ \"Донецька фармацевтична фабрика\"','Україна','Донецк, ул. Ивана Ткаченко, ');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication` (
  `id_medication` int(11) NOT NULL COMMENT 'id_medication - первинний ключ',
  `me_name` varchar(200) DEFAULT NULL COMMENT 'm_name - назва медикамента',
  `me_international_name` varchar(200) DEFAULT NULL COMMENT 'm_international_name - міжнародна назва',
  `me_pharmaceutical_form` varchar(200) DEFAULT NULL COMMENT 'm_pharmaceutical_form - лікарська форма',
  `me_form_release` varchar(200) DEFAULT NULL COMMENT 'm_form_release - форма випуску',
  `me_compound` varchar(400) DEFAULT NULL COMMENT 'm_compound - склад медикамента',
  `me_pharmaco_therapeutic_group` varchar(200) DEFAULT NULL COMMENT 'me_pharmaco_therapeutic_group - фармакотерапевтична група',
  `me_testimony` varchar(400) DEFAULT NULL COMMENT 'm_testimony - показання',
  `me_expiration_date` varchar(200) DEFAULT NULL COMMENT 'm_expiration_date - термін придатності',
  `me_dispensing` varchar(200) DEFAULT NULL COMMENT 'm_dispensing - категорія відпуску',
  `manufacturer_id_manufacturer` int(11) NOT NULL,
  PRIMARY KEY (`id_medication`),
  KEY `fk_medication_manufacturer_idx` (`manufacturer_id_manufacturer`),
  CONSTRAINT `fk_medication_manufacturer` FOREIGN KEY (`manufacturer_id_manufacturer`) REFERENCES `manufacturer` (`id_manufacturer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (1,'ЦИНАБСИН','Comb drung','Таблетки','Таблетки № 100','Cinnabaris D3 25 мг, Hydrastis D3 25 мг, Kaliumbichromicum D3 25 мг, Echinacea D1 25 мг','Гомеопатичні засоби','Гострі і хронічні зпалення придаткових пазух носа (синусити).','3','Без рецепта',6),(2,'ГРОПРИНОЗИН','Inosine pranobex','Таблетки','Таблетки по 500 мг № 25, № 50','інозинупранобексу ( метізопринолу) 500 мг','Противірусні препарати','Вірусні інфекції у пацієнтів з нормальним імунним статусом та при імунодефіцитних станах; вірусний бронхіт, вірусний гепатит; хронічні інфекційні захворювання сечовидільної та дихальної систем; стресові ситуації; похилий вік; променева терапія.','3','За рецептом',7),(3,'КЛІОРОН','Chlorhexidine','Супозиторії','Супозиторії вагінальні по 16 мг № 10 (5х2) у блістерах','1 супозиторій містить 20 % розчин хлоргексидину диглюконат у перерахуванні хлоргексидину диглюконат на 16 мг','Протимікробні та антисептичні засоби','Профілактика венеричних захворювань (сифіліс, гонорея, трихомоніаз, хламідіоз, уреплазмоз)','2','Без рецепта',2),(4,'ДИМЕКСИД','Dimethyl sulfoxide','Рідина для зовнішнього застосування','Рідина по 50 мл або по 100 мл у флаконах № 1','димексид (диметилсульфоксиду) 50 мл або 100 мл.','Засіб який застосовується у разі суглобового та м`язового болю','У складі комплексної терапії запальних захворювань опорно-рухового апарату: ревматоїдний артрит, хвороба Бехтєрєва, деформуючий остеоартроз','2','Без рецепта',3),(5,'АЛЕРОН','ALERON','Таблетки','Таблетки, вкриті оболонкою, по 5 мг № 10, № 30','Крохмаль кукурудзяний, лактози моногідрат, целюлоза мікрокристалічна, крохмаль натрію гліколят, кремнію діоксид колоїдний','Антигістамінні препарати','Алергічні риніти, алергічний кон`юнктивіт, хронічна ідіопатична кропив`янка, екзема, свербіж шкіри','2','Без рецепта',19),(6,'АТМА','Comb drug','Краплі','Краплі по 20 мл, або по 50 мл.','00 мл розчину містять: Sambucus nigra D1 - 10.0 мл, Natrium sulfuricum D6 - 10.0 мл, Dulcamara D6 - 10.0 мл, Arsenicum album D12 - 10.0 мл, Tartarus emeticus D12 - 10.0 мл','Гомеопатичні засоби','Хронічний та астматичний бронхіт; комплексне лікування бронхіальної астми.','5','За рецептом',13),(7,'АНАФЕРОН','Comb drug','Таблетки','Таблетки гомеопатичні № 20','Лактоза, магнію стеарат, целюлоза мікрокристалічна','Гомеопатичні засоби','Профілактика та лікування інфекцій верхніх дихальних шляхів різної етіології, в тому числі тих, хто часто хворіє.','3','За рецептом',18),(8,'МУКОСАТ','Chondroitine sulfate','Розчин для ін`єкцій','Розчин по 2 мл (200 мг) в ампулах № 10','1 мл містить хондроїтину сульфату - 100.0 мг','Різні біогенні препарати','Остеоартроз, остеохондроз, спондилоартроз','2','За рецептом',17),(9,'ДУФАСТОН','Dydrogesterone','Таблетки','Таблетки, вкриті плівковою оболонкою, по 10 мг № 20','1 таблетка містить дідрогестерону - 10.0 мг','Препарати жіночих статевих гормонів та їх синтетичні аналоги','Розлади внаслідок прогестинової недостатності, в т.ч. дисменорея, ендометріоз, вторинна аменорея.','5','За рецептом',16),(10,'МАГНЕ-В6','Comb drung','Таблетки','Таблетки, вкриті оболонкою, № 50','1 таблетка містить: магнію лактату дигідрату - 470.0 мг, піридоксину гідрохлориду - 5.0 мг','Препарати магнію','Первинний та вторинний дефіцит магнію','2','За рецептом',16),(11,'ГЛОДУ НАСТОЙКА','Crataegus','Настоянка','Настойка по 25 мл у флаконах','100 мл настойки містять плодів глоду подрібнених - 10.0 г','Спазмолітичні засоби, які розслаблюють гладкі м`язи кровоносних судин','Функціональні розлади серцевої діяльності, ангіоневрози, миготлива аритмія та пароксизмальна тахікардія','4','За рецептом',20),(12,'АМІЗОН','Amizon','Таблетки','Таблетки по 0,25 г № 10','1 таблетка містить амізону - 0.25 г','Противірусні препарати','Грип та інші вірусні інфекції; пневмонії, ангіни','3','За рецептом',4),(13,'ДОЛАРЕН','Comb drug','Таблетки','Таблетки № 4, № 10, № 100, № 200','1 таблетка містить: диклофенаку натрiю - 50.0 мг, парацетамолу - 500.0 мг','Нестероїдні протизапальні препарати','Запальні та дегенеративні захворювання суглобів, позасуглобові прояви ревматизму','4','Без рецепту',14),(14,'АФЛУБІН','Comb drug','Краплі для внутрішнього застосування','Краплі по 20 мл, 50 мл, 100 мл у флаконах','100 мл розчину містять: Gentiana D1 - 1.0 мл, Aconitum D6 - 10.0 мл, Bryonia D6 - 10.0 мл, Ferrum phosphoricum D12 - 10.0 мл, Acidum sarcolacticum D12 - 10.0 мл','Гомеопатичні засоби','Грип та гострі респіраторні захворювання','5','За рецептом',13),(15,'СИНУПРЕТ','Comb drug','Краплі','Краплі по 100 мл у флаконах № 1','100 г крапель містять 29 г водно-спиртового екстракту (1:11) з кореня горечавки (Rаdіх Gеntіаnае); квіток первоцвіту з чашечкою (Flоrеs Рrіmulае сum Саlyсіbus); трави щавлю (Неrba Rumісіs); квіток бузини (Flоrеs Sаmbuсі); трави вербени (Неrbа Vеrbеnае) (1:3:3:3:3)','Препарати, які стимулюють відхаркування','Гострі та хронічні запалення придаткових пазух носa','3','За рецептом',12),(16,'КАНЕФРОН','Kanaferon','Драже','Драже № 60','1 драже містить порошку висушених лікарських рослин: Herbae Centaurii (трави золототисячника) - 18.0 мг, Radicis Levistici (кореня любистку) - 18.0 мг, Foliorum Rosmarini (листя розмарину) - 18.0 мг','Гальмують утворення сечових конкрементів і полегшують їх виділення з сечею','Гострі та хронічні інфекції сечового міхура','3','За рецептом',12),(17,'ПОСТИНОР','Levonorgestrel','Таблетки','Таблетки по 0.75 мг № 2','1 таблетка містить левоноргестрелу - 0.75 мг','Пероральні контрацептиви','Екстрене попередження небажаної вагітності.','5','Без рецепту',11),(18,'МУКАЛТИН','Althaea officinalis','Таблетки','Таблетки по 0,05 г № 10','1 таблетка містить мукалтинy - 0.05 г','Препарати, які стимулюють відхаркування','Гострі та хронічні захворювання верхніх дихальних шляхів.','3','За рецептом',5),(19,'НІМЕСИЛ','Nimesulid','Гранули','Гранулят по 2 г','2 г грануляту містять нiмесулiду - 100.0 мг','Нестероїдні протизапальні препарати','Остеоартрити, остеоартрози, анкілозуючий спондиліт','2','За рецептом',10),(20,'СУПРАСТИН','Chloropyramine','Таблетки','Таблетки по 25 мг № 20','1 таблетка містить хлорпіраміну - 25.0 мг','Блокатори Н1-рецепторів','Алергічні дерматози , алергічний риніт і кон`юнктивіт','5','За рецептом',9),(21,'СМЕКТА','Diosmectite','Порошок для приготування суспензії','Порошок по 3 г у пакетиках № 10','1 пакетик містить діоктаедричного смектиту - 3.0 г','Симптоматичні засоби для лікування діареї','Гостра та хронічна діарея','4','Без рецепта',8),(22,'АСПАРКАМ','Potassium','Таблетки','Таблетки № 50','1 таблетка містить: магнію аспарагінату - 0.175 г, калію аспарагінату - 0.175 г','Препарати калію','Порушення ритму серця','3','За рецептом',5),(23,'ДИПРАЗИН','Promethazine','Таблетки, вкриті оболонкою','Таблетки, вкриті оболонкою, по 0.025 г № 20','1 таблетка містить прометазину - 0.025 г','Блокатори Н1-рецепторів','Алергічні захворювання','3','За рецептом',4),(24,'АБИТОР','Atorvastatin','Таблетки, вкриті оболонкою','Таблетки, вкриті оболонкою, по 10 мг № 30','1 таблетка містить: кальцієву сіль аторвастатину еквівалентно аторвастатину 10 мг','Гіполіпідемічні засоби','Гіперліпідемія','2','За рецептом',14),(25,'АМІЦИЛ','Amikacin','Флакони','Ліофілізат для розчину для ін`єкцій по 0,5 г у флаконах','1 флакон містить амікацину - 1.0 г','Антибіотики-аміноглікозиди','Тяжкі інфекції, спричинені чутливими до препарату штамами мікроорганізмів, включаючи штами, резистентні до інших аміноглікозидів - бактеримія, септицемія, інфекції дихальних шляхів,','2','За рецептом',4),(26,'БАГОТИРОКС','Levothyroxine sodium','Таблетки','Таблетки по 50 мкг № 50 ','1 таблетка містить левотироксину натрію 50 мкг','Препарати, які стимулюють та пригнічують функцію щитоподібної залози','Лікування доброякісних захворювань щитовидної залози.','2','За рецептом',3),(27,'БАКТРИМ','Sulfamethoxazole','Суспензія','Суспензія по 200 мг','5 мл суспензії (1 мірна ложка) містить ко-тримоксазолу 240 мг, що відповідає сульфаметоксазолу 200 мг і триметоприму 40 мг','Сульфаніламідні препарати','Інфекції, спричинені чутливими до ко-тримоксазолу мікроорганізмами','5','За рецептом',20),(28,'ЕБЕРКІНАЗА','Streptokinase','Порошок ліофілізований для ін`єкцій','Порошок по 750000 МО у флаконах № 1','1 флакон містить рекомбінантної стрептокінази - 750000 МО','Фібринолітичні препарати','Відновлення прохідності тромбованих кровоносних судин при емболії легеневої артерії','3','За рецептом',19),(29,'КАБЕРЛОН','Cabergoline','Таблетки','Таблетки по 1 мг № 30','1 таблетка містить: 1 мг каберголіну','Дофамін та дофамінергічні препарати','При хворобі Паркінсона як допоміжна терапія','2','за рецептом',1),(30,'КАГОЦЕЛ','Mono','Таблетки','Таблетки по 0,012 г № 10','1 таблетка містить кагоцелу - 0.012 г','Противірусні препарати','Дорослі: профілактика та лікування грипу та інших респіраторно-вірусних інфекцій, герпесу, а також лікування урогенітального хламідіозу.','2','За рецептом',7);
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price` (
  `id_price` int(11) NOT NULL COMMENT 'id_price - первинний ключ "таблиця ціни"',
  `p_price_number_1` float(10,2) DEFAULT NULL COMMENT 'p_price_number_1 - ціна за один медикамент',
  `medication_id_medication` int(11) NOT NULL COMMENT 'medication_id_medication - ключ медикамента',
  PRIMARY KEY (`id_price`),
  KEY `fk_price_medication1_idx` (`medication_id_medication`),
  CONSTRAINT `fk_price_medication1` FOREIGN KEY (`medication_id_medication`) REFERENCES `medication` (`id_medication`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (101,175.14,1),(102,245.19,2),(103,116.90,3),(104,6.30,4),(105,51.52,5),(106,117.95,6),(107,84.05,7),(108,467.68,8),(109,409.13,9),(110,218.23,10),(111,3.75,11),(112,52.08,12),(113,215.15,13),(114,82.27,14),(115,89.63,15),(116,173.13,16),(117,246.54,17),(118,4.60,18),(119,230.05,19),(120,60.86,20),(121,87.01,21),(122,45.12,22),(123,60.50,23),(124,40.32,24),(125,41.97,25),(126,30.42,26),(127,30.23,27),(128,30.45,28),(129,100.00,29),(130,232.67,30);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `situation_social`
--

DROP TABLE IF EXISTS `situation_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `situation_social` (
  `id_situation` int(11) NOT NULL,
  `situation_social` varchar(45) DEFAULT NULL COMMENT 'situation_social - соціальне становище',
  PRIMARY KEY (`id_situation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situation_social`
--

LOCK TABLES `situation_social` WRITE;
/*!40000 ALTER TABLE `situation_social` DISABLE KEYS */;
INSERT INTO `situation_social` VALUES (1,'ветеран другої світової війни'),(2,'пенсіонер'),(3,'студент'),(4,'інвалід'),(5,'Інвалід-ветеран');
/*!40000 ALTER TABLE `situation_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `id_provider` int(11) NOT NULL COMMENT 'id_provider - первинний ключ таблиці постачальнии',
  `s_name` varchar(45) DEFAULT NULL COMMENT 's_name - назва постачальника \n',
  `s_address` varchar(45) DEFAULT NULL COMMENT 's_address - адреса постачальника',
  `s_telephone` bigint(20) DEFAULT NULL COMMENT 's_telephone - телефон постачальника',
  `s_director` varchar(45) DEFAULT NULL,
  `s_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'АЛЬБА УКРАЇНА','08300, Борисполь, ул. Шевченко Тараса, 100.',444903271,'Шевченко Микола Іванович','petriccione@hotmail.com'),(2,'O.L.KAR. ФАРМ-СЕРВІС','21000, Винница, ул. Липовецкая, 6-а.',666293089,'Коваленко Володимир Миколайович','vandevander@hotmail.com'),(3,'АНАНТА','61161, Харьков, ул. Фурманова, 3',577380970,'Мельник Олександр Васильйович','lowthorp@hotmail.com'),(4,'АМЕРТИН','61050, Харьков, ул. Юрьевская, 17.',577140603,'Ткаченко Олександр Володимирович','spight@hotmail.com'),(5,'БІЗНЕС ЦЕНТР ФАРМАЦІЯ','04205, Киев, ул. Тимошенко, 29.',442390750,'Поліщук Олександр Володимирович','borovetz@gmail.com');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `table_1`
--

DROP TABLE IF EXISTS `table_1`;
/*!50001 DROP VIEW IF EXISTS `table_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `table_1` AS SELECT 
 1 AS `ID`,
 1 AS `Медикамент`,
 1 AS `Міжнародна назва`,
 1 AS `Лікарська форма`,
 1 AS `Форма випуску`,
 1 AS `Склад`,
 1 AS `Фармакотерапевтична група`,
 1 AS `Показання`,
 1 AS `Термін придатност`,
 1 AS `Категорія відпуску`,
 1 AS `Виробник`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `table_10`
--

DROP TABLE IF EXISTS `table_10`;
/*!50001 DROP VIEW IF EXISTS `table_10`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `table_10` AS SELECT 
 1 AS `ID`,
 1 AS `Ім``я`,
 1 AS `Прізвище`,
 1 AS `Телефон`,
 1 AS `Місто`,
 1 AS `Адреса`,
 1 AS `Соціальне становище`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `table_2`
--

DROP TABLE IF EXISTS `table_2`;
/*!50001 DROP VIEW IF EXISTS `table_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `table_2` AS SELECT 
 1 AS `Медикамент`,
 1 AS `Лікарська форма`,
 1 AS `ціна медикамента`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `table_3`
--

DROP TABLE IF EXISTS `table_3`;
/*!50001 DROP VIEW IF EXISTS `table_3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `table_3` AS SELECT 
 1 AS `Ім``я, прізвище (покупець)`,
 1 AS `Ім``я, прізвище (працівник)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `table_4`
--

DROP TABLE IF EXISTS `table_4`;
/*!50001 DROP VIEW IF EXISTS `table_4`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `table_4` AS SELECT 
 1 AS `ID`,
 1 AS `Назва`,
 1 AS `Країна`,
 1 AS `Адреса`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `table_5`
--

DROP TABLE IF EXISTS `table_5`;
/*!50001 DROP VIEW IF EXISTS `table_5`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `table_5` AS SELECT 
 1 AS `ID`,
 1 AS `Ім``я, прізвище`,
 1 AS `Зарплата`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `table_6`
--

DROP TABLE IF EXISTS `table_6`;
/*!50001 DROP VIEW IF EXISTS `table_6`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `table_6` AS SELECT 
 1 AS `ID`,
 1 AS `Дата замовлення`,
 1 AS `Кількість`,
 1 AS `Назва медикамента`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `table_7`
--

DROP TABLE IF EXISTS `table_7`;
/*!50001 DROP VIEW IF EXISTS `table_7`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `table_7` AS SELECT 
 1 AS `ID`,
 1 AS `Назва`,
 1 AS `Країна`,
 1 AS `Адреса`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `table_8`
--

DROP TABLE IF EXISTS `table_8`;
/*!50001 DROP VIEW IF EXISTS `table_8`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `table_8` AS SELECT 
 1 AS `ім``я, прізвище`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `table_9`
--

DROP TABLE IF EXISTS `table_9`;
/*!50001 DROP VIEW IF EXISTS `table_9`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `table_9` AS SELECT 
 1 AS `id_customer`,
 1 AS `Замовник`,
 1 AS `Кількість замовлень`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'apteka_curs_bd'
--

--
-- Dumping routines for database 'apteka_curs_bd'
--
/*!50003 DROP PROCEDURE IF EXISTS `procedure_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_1`()
BEGIN
select 	medication.me_name
from custom join medication
where medication.id_medication = custom.medication_id_medication
and custom.с_number >= 2
group by custom.medication_id_medication;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_2`(
IN date_delivary date)
BEGIN
SELECT 	medication.me_name as 'Медикамент', 
		delivery.d_delivery_date as 'Дата поставки', 
        delivery.d_number_of_medicines as 'Кількість',
        delivery.d_delivery_price as 'Ціна поставки',
        supplier.s_name as 'Постачальник'
FROM medication, delivery, supplier
WHERE medication.id_medication = delivery.medication_id_medication
and supplier.id_provider = delivery.supplier_id_provider
and delivery.d_delivery_date = date_delivary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `table_1`
--

/*!50001 DROP VIEW IF EXISTS `table_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_1` AS select `medication`.`id_medication` AS `ID`,`medication`.`me_name` AS `Медикамент`,`medication`.`me_international_name` AS `Міжнародна назва`,`medication`.`me_pharmaceutical_form` AS `Лікарська форма`,`medication`.`me_form_release` AS `Форма випуску`,`medication`.`me_compound` AS `Склад`,`medication`.`me_pharmaco_therapeutic_group` AS `Фармакотерапевтична група`,`medication`.`me_testimony` AS `Показання`,`medication`.`me_expiration_date` AS `Термін придатност`,`medication`.`me_dispensing` AS `Категорія відпуску`,`manufacturer`.`ma_name` AS `Виробник` from (`medication` join `manufacturer`) where ((`manufacturer`.`id_manufacturer` = `medication`.`manufacturer_id_manufacturer`) and (`medication`.`me_name` like 'А%')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `table_10`
--

/*!50001 DROP VIEW IF EXISTS `table_10`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_10` AS select `customer`.`id_customer` AS `ID`,`customer`.`cu_name` AS `Ім``я`,`customer`.`cu_surname` AS `Прізвище`,`customer`.`cu_telephone` AS `Телефон`,`customer`.`cu_city` AS `Місто`,`customer`.`cu_address` AS `Адреса`,`situation_social`.`situation_social` AS `Соціальне становище` from (`customer` join `situation_social`) where ((`situation_social`.`id_situation` = `customer`.`situation_social_id_situation`) and (`customer`.`cu_city` = 'Київ')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `table_2`
--

/*!50001 DROP VIEW IF EXISTS `table_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_2` AS select `medication`.`me_name` AS `Медикамент`,`medication`.`me_pharmaco_therapeutic_group` AS `Лікарська форма`,`price`.`p_price_number_1` AS `ціна медикамента` from (`medication` join `price`) where ((`medication`.`id_medication` = `price`.`medication_id_medication`) and (`price`.`p_price_number_1` > 100)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `table_3`
--

/*!50001 DROP VIEW IF EXISTS `table_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_3` AS select concat(`customer`.`cu_name`,' ',`customer`.`cu_surname`) AS `Ім``я, прізвище (покупець)`,concat(`employee`.`e_name`,' ',`employee`.`e_middle_name`,' ',`employee`.`e_surname`) AS `Ім``я, прізвище (працівник)` from ((`customer` join `employee`) join `custom`) where ((`employee`.`id_employee` = `custom`.`employee_id_employee`) and (`customer`.`id_customer` = `custom`.`customer_id_customer`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `table_4`
--

/*!50001 DROP VIEW IF EXISTS `table_4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_4` AS select `manufacturer`.`id_manufacturer` AS `ID`,`manufacturer`.`ma_name` AS `Назва`,`manufacturer`.`ma_country` AS `Країна`,`manufacturer`.`ma_address` AS `Адреса` from `manufacturer` where (`manufacturer`.`ma_country` = 'Україна') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `table_5`
--

/*!50001 DROP VIEW IF EXISTS `table_5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_5` AS select `employee`.`id_employee` AS `ID`,concat(`employee`.`e_name`,' ',`employee`.`e_middle_name`,' ',`employee`.`e_surname`) AS `Ім``я, прізвище`,(`employee`.`e_salary` + 250) AS `Зарплата` from `employee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `table_6`
--

/*!50001 DROP VIEW IF EXISTS `table_6`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_6` AS select `custom`.`id_custom` AS `ID`,`custom`.`с_date_of_purchase` AS `Дата замовлення`,`custom`.`с_number` AS `Кількість`,`medication`.`me_name` AS `Назва медикамента` from (`custom` join `medication`) where ((`medication`.`id_medication` = `custom`.`medication_id_medication`) and (`custom`.`с_date_of_purchase` between '2015-05-01' and '2015-05-11')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `table_7`
--

/*!50001 DROP VIEW IF EXISTS `table_7`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_7` AS select `manufacturer`.`id_manufacturer` AS `ID`,`manufacturer`.`ma_name` AS `Назва`,`manufacturer`.`ma_country` AS `Країна`,`manufacturer`.`ma_address` AS `Адреса` from `manufacturer` where (not((`manufacturer`.`ma_country` like 'Україна'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `table_8`
--

/*!50001 DROP VIEW IF EXISTS `table_8`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_8` AS select concat(`customer`.`cu_name`,' ',`customer`.`cu_surname`) AS `ім``я, прізвище` from (`customer` join `custom`) where ((`customer`.`id_customer` = `custom`.`customer_id_customer`) and (`custom`.`с_date_of_purchase` <= '2015-05-03')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `table_9`
--

/*!50001 DROP VIEW IF EXISTS `table_9`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_9` AS select `customer`.`id_customer` AS `id_customer`,concat(`customer`.`cu_name`,' ',`customer`.`cu_surname`) AS `Замовник`,count(`custom`.`customer_id_customer`) AS `Кількість замовлень` from (`custom` join `customer`) where (`customer`.`id_customer` = `custom`.`customer_id_customer`) group by `custom`.`customer_id_customer` */;
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

-- Dump completed on 2015-06-09  1:20:46
