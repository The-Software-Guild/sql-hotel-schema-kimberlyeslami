-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema KimberlyEslamiHotelDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `KimberlyEslamiHotelDB` ;

-- -----------------------------------------------------
-- Schema KimberlyEslamiHotelDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `KimberlyEslamiHotelDB` DEFAULT CHARACTER SET utf8 ;
USE `KimberlyEslamiHotelDB` ;

-- -----------------------------------------------------
-- Table `KimberlyEslamiHotelDB`.`Room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KimberlyEslamiHotelDB`.`Room` ;

CREATE TABLE IF NOT EXISTS `KimberlyEslamiHotelDB`.`Room` (
  `roomId` INT NOT NULL,
  `roomType` VARCHAR(45) NOT NULL,
  `amenities` VARCHAR(45) NOT NULL,
  `adaAccessable` ENUM("Yes", "No") NOT NULL,
  `standardOccupancy` INT NOT NULL,
  `maxiumOccupancy` INT NOT NULL,
  `basePrice` DOUBLE NOT NULL,
  `extraPerson` DOUBLE NULL,
  PRIMARY KEY (`roomId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KimberlyEslamiHotelDB`.`Guest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KimberlyEslamiHotelDB`.`Guest` ;

CREATE TABLE IF NOT EXISTS `KimberlyEslamiHotelDB`.`Guest` (
  `guestId` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `addressLine1` VARCHAR(45) NOT NULL,
  `addressLine2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`guestId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KimberlyEslamiHotelDB`.`Reservations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KimberlyEslamiHotelDB`.`Reservations` ;

CREATE TABLE IF NOT EXISTS `KimberlyEslamiHotelDB`.`Reservations` (
  `reservationId` INT NOT NULL,
  `adults` VARCHAR(45) NOT NULL,
  `children` VARCHAR(45) NULL,
  `Guest_guestId` INT NOT NULL,
  PRIMARY KEY (`reservationId`, `Guest_guestId`),
  INDEX `fk_Reservations_Guest_idx` (`Guest_guestId` ASC) VISIBLE,
  CONSTRAINT `fk_Reservations_Guest`
    FOREIGN KEY (`Guest_guestId`)
    REFERENCES `KimberlyEslamiHotelDB`.`Guest` (`guestId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KimberlyEslamiHotelDB`.`Room_has_Reservations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KimberlyEslamiHotelDB`.`Room_has_Reservations` ;

CREATE TABLE IF NOT EXISTS `KimberlyEslamiHotelDB`.`Room_has_Reservations` (
  `Room_roomId` INT NOT NULL,
  `Reservations_reservationId` INT NOT NULL,
  `Reservations_Guest_guestId` INT NOT NULL,
  `startDate` VARCHAR(45) NOT NULL,
  `endDate` VARCHAR(45) NOT NULL,
  `totalRoomCost` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Room_roomId`, `Reservations_reservationId`, `Reservations_Guest_guestId`),
  INDEX `fk_Room_has_Reservations_Reservations1_idx` (`Reservations_reservationId` ASC, `Reservations_Guest_guestId` ASC) VISIBLE,
  INDEX `fk_Room_has_Reservations_Room1_idx` (`Room_roomId` ASC) VISIBLE,
  CONSTRAINT `fk_Room_has_Reservations_Room1`
    FOREIGN KEY (`Room_roomId`)
    REFERENCES `KimberlyEslamiHotelDB`.`Room` (`roomId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Room_has_Reservations_Reservations1`
    FOREIGN KEY (`Reservations_reservationId` , `Reservations_Guest_guestId`)
    REFERENCES `KimberlyEslamiHotelDB`.`Reservations` (`reservationId` , `Guest_guestId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
