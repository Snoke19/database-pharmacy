-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema apteka_curs_bd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema apteka_curs_bd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `apteka_curs_bd` DEFAULT CHARACTER SET utf8 ;
USE `apteka_curs_bd` ;

-- -----------------------------------------------------
-- Table `apteka_curs_bd`.`situation_social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apteka_curs_bd`.`situation_social` (
  `id_situation` INT(11) NOT NULL,
  `situation_social` VARCHAR(45) NULL DEFAULT NULL COMMENT 'situation_social - соціальне становище',
  PRIMARY KEY (`id_situation`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `apteka_curs_bd`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apteka_curs_bd`.`customer` (
  `id_customer` INT(11) NOT NULL COMMENT 'id_customer - первинний ключ для таблиці customer',
  `cu_name` VARCHAR(45) NULL DEFAULT NULL COMMENT 'cu_name - ім`я покупця',
  `cu_surname` VARCHAR(45) NULL DEFAULT NULL COMMENT 'cu_surname - прізвище покупця',
  `cu_telephone` BIGINT(20) NULL DEFAULT NULL COMMENT 'cu_telephone - телефон покупця',
  `cu_city` VARCHAR(45) NULL DEFAULT NULL COMMENT 'cu_city - місто покупця',
  `cu_address` VARCHAR(45) NULL DEFAULT NULL COMMENT 'cu_address - адреса покупця',
  `situation_social_id_situation` INT(11) NOT NULL,
  PRIMARY KEY (`id_customer`),
  INDEX `fk_customer_situation_social1_idx` (`situation_social_id_situation` ASC),
  CONSTRAINT `fk_customer_situation_social1`
    FOREIGN KEY (`situation_social_id_situation`)
    REFERENCES `apteka_curs_bd`.`situation_social` (`id_situation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `apteka_curs_bd`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apteka_curs_bd`.`employee` (
  `id_employee` INT(11) NOT NULL COMMENT 'id_employee - первинний ключ для таблиці працівники',
  `e_name` VARCHAR(45) NULL DEFAULT NULL COMMENT 'e_name - ім`я',
  `e_middle_name` VARCHAR(45) NULL DEFAULT NULL COMMENT 'e_middle_name - по батькові',
  `e_surname` VARCHAR(45) NULL DEFAULT NULL COMMENT 'e_surname - прізвище',
  `e_phone_home` BIGINT(20) NULL DEFAULT NULL COMMENT 'e_phone_home - домашній телефон',
  `e_mobile_phone` BIGINT(20) NULL DEFAULT NULL COMMENT 'e_mobile_phone - мобільний телефон',
  `e_email` VARCHAR(45) NULL DEFAULT NULL COMMENT 'e_email - емаїл',
  `e_city` VARCHAR(45) NULL DEFAULT NULL COMMENT 'e_city - місто',
  `e_street` VARCHAR(45) NULL DEFAULT NULL COMMENT 'e_street - вулиця',
  `e_position` VARCHAR(45) NOT NULL COMMENT 'e_position - посада',
  `e_salary` INT(11) NOT NULL COMMENT 'e_salary - зарплата',
  PRIMARY KEY (`id_employee`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `apteka_curs_bd`.`manufacturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apteka_curs_bd`.`manufacturer` (
  `id_manufacturer` INT(11) NOT NULL COMMENT 'id_manufacturer - первинний ключ виробника',
  `ma_name` VARCHAR(45) NULL DEFAULT NULL COMMENT 'ma_name - назва виробника',
  `ma_country` VARCHAR(45) NULL DEFAULT NULL COMMENT 'ma_country - країна виробника',
  `ma_address` VARCHAR(60) NULL DEFAULT NULL COMMENT 'ma_address - адреса виробника',
  PRIMARY KEY (`id_manufacturer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `apteka_curs_bd`.`medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apteka_curs_bd`.`medication` (
  `id_medication` INT(11) NOT NULL COMMENT 'id_medication - первинний ключ',
  `me_name` VARCHAR(200) NULL DEFAULT NULL COMMENT 'm_name - назва медикамента',
  `me_international_name` VARCHAR(200) NULL DEFAULT NULL COMMENT 'm_international_name - міжнародна назва',
  `me_pharmaceutical_form` VARCHAR(200) NULL DEFAULT NULL COMMENT 'm_pharmaceutical_form - лікарська форма',
  `me_form_release` VARCHAR(200) NULL DEFAULT NULL COMMENT 'm_form_release - форма випуску',
  `me_compound` VARCHAR(400) NULL DEFAULT NULL COMMENT 'm_compound - склад медикамента',
  `me_pharmaco_therapeutic_group` VARCHAR(200) NULL DEFAULT NULL COMMENT 'me_pharmaco_therapeutic_group - фармакотерапевтична група',
  `me_testimony` VARCHAR(400) NULL DEFAULT NULL COMMENT 'm_testimony - показання',
  `me_expiration_date` VARCHAR(200) NULL DEFAULT NULL COMMENT 'm_expiration_date - термін придатності',
  `me_dispensing` VARCHAR(200) NULL DEFAULT NULL COMMENT 'm_dispensing - категорія відпуску',
  `manufacturer_id_manufacturer` INT(11) NOT NULL,
  PRIMARY KEY (`id_medication`),
  INDEX `fk_medication_manufacturer_idx` (`manufacturer_id_manufacturer` ASC),
  CONSTRAINT `fk_medication_manufacturer`
    FOREIGN KEY (`manufacturer_id_manufacturer`)
    REFERENCES `apteka_curs_bd`.`manufacturer` (`id_manufacturer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `apteka_curs_bd`.`price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apteka_curs_bd`.`price` (
  `id_price` INT(11) NOT NULL COMMENT 'id_price - первинний ключ \"таблиця ціни\"',
  `p_price_number_1` FLOAT(10,2) NULL DEFAULT NULL COMMENT 'p_price_number_1 - ціна за один медикамент',
  `medication_id_medication` INT(11) NOT NULL COMMENT 'medication_id_medication - ключ медикамента',
  PRIMARY KEY (`id_price`),
  INDEX `fk_price_medication1_idx` (`medication_id_medication` ASC),
  CONSTRAINT `fk_price_medication1`
    FOREIGN KEY (`medication_id_medication`)
    REFERENCES `apteka_curs_bd`.`medication` (`id_medication`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `apteka_curs_bd`.`custom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apteka_curs_bd`.`custom` (
  `id_custom` INT(11) NOT NULL COMMENT 'id_custom - первинний ключ таблиці замовлення',
  `с_date_of_purchase` DATE NOT NULL COMMENT 'с_date_of_purchase - дата купівлі',
  `с_number` INT(11) NOT NULL COMMENT 'с_number - кількість медикаментів (куплені)',
  `medication_id_medication` INT(11) NOT NULL COMMENT 'medication_id_medication - медикаменти',
  `price_id_price` INT(11) NOT NULL COMMENT 'price_id_price - ціна за один',
  `employee_id_employee` INT(11) NOT NULL COMMENT 'employee_id_employee - працівник',
  `customer_id_customer` INT(11) NULL DEFAULT NULL COMMENT 'customer_id_customer - покупець',
  `situation_social_id_situation` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_custom`),
  INDEX `fk_custom_medication1_idx` (`medication_id_medication` ASC),
  INDEX `fk_custom_price1_idx` (`price_id_price` ASC),
  INDEX `fk_custom_employee1_idx` (`employee_id_employee` ASC),
  INDEX `fk_custom_customer1_idx` (`customer_id_customer` ASC),
  INDEX `fk_custom_situation_social1_idx` (`situation_social_id_situation` ASC),
  CONSTRAINT `fk_custom_customer1`
    FOREIGN KEY (`customer_id_customer`)
    REFERENCES `apteka_curs_bd`.`customer` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_employee1`
    FOREIGN KEY (`employee_id_employee`)
    REFERENCES `apteka_curs_bd`.`employee` (`id_employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_medication1`
    FOREIGN KEY (`medication_id_medication`)
    REFERENCES `apteka_curs_bd`.`medication` (`id_medication`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_price1`
    FOREIGN KEY (`price_id_price`)
    REFERENCES `apteka_curs_bd`.`price` (`id_price`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_custom_situation_social1`
    FOREIGN KEY (`situation_social_id_situation`)
    REFERENCES `apteka_curs_bd`.`situation_social` (`id_situation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `apteka_curs_bd`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apteka_curs_bd`.`supplier` (
  `id_provider` INT(11) NOT NULL COMMENT 'id_provider - первинний ключ таблиці постачальнии',
  `s_name` VARCHAR(45) NULL DEFAULT NULL COMMENT 's_name - назва постачальника \n',
  `s_address` VARCHAR(45) NULL DEFAULT NULL COMMENT 's_address - адреса постачальника',
  `s_telephone` BIGINT(20) NULL DEFAULT NULL COMMENT 's_telephone - телефон постачальника',
  `s_director` VARCHAR(45) NULL DEFAULT NULL,
  `s_email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_provider`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `apteka_curs_bd`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apteka_curs_bd`.`delivery` (
  `id_delivery` INT(11) NOT NULL COMMENT 'id_delivery - первинний ключ для таблиці поставка',
  `d_delivery_date` DATE NULL DEFAULT NULL COMMENT 'd_delivery_date - дата поставки',
  `d_number_of_medicines` INT(11) NULL DEFAULT NULL COMMENT 'd_number_of_medicines - кількість медикаментів',
  `d_delivery_price` FLOAT(10,2) NOT NULL COMMENT 'd_ delivery_price - ціна поставки',
  `supplier_id_provider` INT(11) NOT NULL COMMENT 'supplier_id_provider - постачальник',
  `medication_id_medication` INT(11) NOT NULL,
  PRIMARY KEY (`id_delivery`),
  INDEX `fk_delivery_supplier1_idx` (`supplier_id_provider` ASC),
  INDEX `fk_delivery_medication1_idx` (`medication_id_medication` ASC),
  CONSTRAINT `fk_delivery_medication1`
    FOREIGN KEY (`medication_id_medication`)
    REFERENCES `apteka_curs_bd`.`medication` (`id_medication`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_supplier1`
    FOREIGN KEY (`supplier_id_provider`)
    REFERENCES `apteka_curs_bd`.`supplier` (`id_provider`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
