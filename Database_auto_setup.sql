/******************************************************************************/
/*										                                      */
/*	Hopper:													            	  */
/*		Jose								                                  */
/*		Grace								                                  */
/*		Gabe								                                  */
/*										                                      */
/*	Auto Repair Shop-Load sample data									      */
/*										                                      */
/*										                                      */
/******************************************************************************/

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hopperauto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hopperauto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hopperauto` DEFAULT CHARACTER SET utf8 ;
USE `hopperauto` ;

-- -----------------------------------------------------
-- Table `hopperauto`.`car_owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopperauto`.`car_owner` (
  `OwnerID` INT NOT NULL AUTO_INCREMENT,
  `OwnerLastName` CHAR(25) NULL,
  `OwnerFirstName` CHAR(25) NULL,
  `OwnerPhone` CHAR(12) NULL,
  `OwnerEmail` VARCHAR(100) NULL,
  PRIMARY KEY (`OwnerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hopperauto`.`car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopperauto`.`car` (
  `CarID` INT NOT NULL AUTO_INCREMENT,
  `ManufacturerName` VARCHAR(100) NULL,
  `ModelName` VARCHAR(100) NULL,
  `LicencePlate` VARCHAR(100) NULL,
  `Year` YEAR NULL,
  PRIMARY KEY (`CarID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hopperauto`.`appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopperauto`.`appointment` (
  `AppointmentID` INT NOT NULL AUTO_INCREMENT,
  `OwnerID` INT NOT NULL,
  `CarID` INT NOT NULL,
  `AppoinmentDate` DATE NULL,
  PRIMARY KEY (`AppointmentID`),
  INDEX `OwnerID_idx` (`OwnerID` ASC),
  INDEX `CarID_idx` (`CarID` ASC),
  CONSTRAINT `OwnerID`
    FOREIGN KEY (`OwnerID`)
    REFERENCES `hopperauto`.`car_owner` (`OwnerID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `CarID`
    FOREIGN KEY (`CarID`)
    REFERENCES `hopperauto`.`car` (`CarID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hopperauto`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopperauto`.`service` (
  `ServiceID` INT NOT NULL AUTO_INCREMENT,
  `AppointmentID` INT NOT NULL,
  `ServiceName` CHAR(50) NOT NULL,
  `ServiceCost` INT NOT NULL,
  PRIMARY KEY (`ServiceID`),
  INDEX `AppointmentID_idx` (`AppointmentID` ASC),
  CONSTRAINT `AppointmentID`
    FOREIGN KEY (`AppointmentID`)
    REFERENCES `hopperauto`.`appointment` (`AppointmentID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
