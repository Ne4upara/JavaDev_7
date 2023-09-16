SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `myosbb` DEFAULT CHARACTER SET utf8 ;
USE `myosbb` ;

CREATE TABLE IF NOT EXISTS `myosbb`.`�������` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `������` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `myosbb`.`��������` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `��������` INT NOT NULL,
  `ϳ���` TINYINT(1) NOT NULL,
  `������` TINYINT(1) NOT NULL,
  `�����` FLOAT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `myosbb`.`�������_��_�������` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `�������_��` INT NOT NULL,
  `��������_��` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `�������_idx` (`�������_��` ASC) VISIBLE,
  INDEX `��������_idx` (`��������_��` ASC) VISIBLE,
  CONSTRAINT `�������`
    FOREIGN KEY (`�������_��`)
    REFERENCES `myosbb`.`�������` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `��������`
    FOREIGN KEY (`��������_��`)
    REFERENCES `myosbb`.`��������` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `myosbb`.`��������_����` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `���` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `�������` VARCHAR(20) NOT NULL,
  `����_����������` DATE NULL,
  PRIMARY KEY (`ID`),
  FULLTEXT INDEX `���` (`���`) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `myosbb`.`��� ����` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `�������_ID` INT NOT NULL,
  `����` ENUM('�������', '���������', '���� ��������', '������') NOT NULL DEFAULT '�������',
  INDEX `������� ����` (`������� ����_ID` ASC) INVISIBLE,
  PRIMARY KEY (`ID`),
  CONSTRAINT `����`
    FOREIGN KEY (`������� ����_ID`)
    REFERENCES `myosbb`.`��������_����` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `myosbb`.`��������` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `¿��_��_��` TINYINT NOT NULL DEFAULT 0,
  `��������_��` INT NULL,
  `�������_��` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_kv_idx` (`��������_��` ASC) VISIBLE,
  INDEX `fk_ucha_idx` (`�������_��` ASC) VISIBLE,
  CONSTRAINT `fk_kv`
    FOREIGN KEY (`��������_��`)
    REFERENCES `myosbb`.`��������` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ucha`
    FOREIGN KEY (`�������_��`)
    REFERENCES `myosbb`.`��������_����` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;