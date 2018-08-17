DROP DATABASE IF EXISTS `SuperheroSightingsTest`;
CREATE DATABASE `SuperheroSightingsTest`;
USE `SuperheroSightingsTest`;
CREATE TABLE IF NOT EXISTS `Characters` (
 `CharacterID` INT NOT NULL AUTO_INCREMENT,
 `CharacterName` VARCHAR(100) NOT NULL,
 `Description` VARCHAR(100) NULL,
 `IsSuperHero` BOOLEAN NOT NULL,
 PRIMARY KEY (`CharacterID`));
CREATE TABLE IF NOT EXISTS `Superpower` (
 `SuperpowerID` INT NOT NULL AUTO_INCREMENT,
 `SuperPowerType` VARCHAR(100) NOT NULL,
 PRIMARY KEY (`SuperpowerID`));
CREATE TABLE IF NOT EXISTS `Character_Superpower` (
 `CharacterID` INT NOT NULL,
 `SuperpowerID` INT NOT NULL,
 PRIMARY KEY (`CharacterID`, `SuperpowerID`),
 CONSTRAINT `fk_Character_Superpower_Character`
   FOREIGN KEY (`CharacterID`)
   REFERENCES `Characters` (`CharacterID`)
  --  ON DELETE NO ACTION
--     ON UPDATE NO ACTION
   ON DELETE CASCADE
   ,
 CONSTRAINT `fk_Character_Superpower_Superpower`
   FOREIGN KEY (`SuperpowerID`)
   REFERENCES `Superpower` (`SuperpowerID`)
   ON DELETE CASCADE
--    ON DELETE NO ACTION
--     ON UPDATE NO ACTION
   );
CREATE TABLE IF NOT EXISTS `Location` (
`LocationID` INT NOT NULL auto_increment,
`LocationName` VARCHAR(100) NOT NULL,
`Description` VARCHAR(100) NOT NULL,
`Latitude` DOUBLE NOT NULL, -- 
`Longitude` DOUBLE NOT NULL, -- 
`StreetNumber` VARCHAR(100) NOT NULL,
`StreetName` VARCHAR(100) NOT NULL,
`City` VARCHAR(100) NOT NULL,
`State` VARCHAR(100),
`ZipCode` VARCHAR(100) NOT NULL,
PRIMARY KEY (`LocationID`));
CREATE TABLE IF NOT EXISTS `Organization` (
 `OrganizationID` INT NOT NULL AUTO_INCREMENT,
 `OrganizationName` VARCHAR(100) NOT NULL,
 `LocationID` INT NOT NULL,
 `Description` VARCHAR(100) NOT NULL,
 PRIMARY KEY (`OrganizationID`),
 CONSTRAINT `fk_Organization_Location`
   FOREIGN KEY (`LocationID`)
   REFERENCES `Location` (`LocationID`)
   ON DELETE CASCADE
   )
   ;
   -- ON DELETE NO ACTION
   -- ON UPDATE NO ACTION
CREATE TABLE IF NOT EXISTS `Character_Organization` (
 `CharacterID` INT NOT NULL,
 `OrganizationID` INT NOT NULL,
 PRIMARY KEY (`CharacterID`, `OrganizationID`),
 CONSTRAINT `fk_Character_Organization_Character`
   FOREIGN KEY (`CharacterID`)
   REFERENCES `Characters` (`CharacterID`)
   ON DELETE CASCADE
   -- ON DELETE NO ACTION
--     ON UPDATE NO ACTION
   ,
 CONSTRAINT `fk_Character_Organization_Organization`
   FOREIGN KEY (`OrganizationID`)
   REFERENCES `Organization` (`OrganizationID`)
   ON DELETE CASCADE
   -- ON DELETE NO ACTION
--     ON UPDATE NO ACTION
   );
CREATE TABLE IF NOT EXISTS `Sighting` (
 `SightingID` INT NOT NULL AUTO_INCREMENT,
 `LocationID` INT NOT NULL,
 `CharacterID` INT NOT NULL,
 `SightingDate` DATETIME NOT NULL,
 PRIMARY KEY (`SightingID`),
 CONSTRAINT `fk_Sighting_Location`
   FOREIGN KEY (`LocationID`)
   REFERENCES `Location` (`LocationID`)
   ON DELETE CASCADE
  --  ON DELETE NO ACTION
--     ON UPDATE NO ACTION
   ,
 CONSTRAINT `fk_Sighting_Character`
   FOREIGN KEY (`CharacterID`)
   REFERENCES `Characters` (`CharacterID`)
   ON DELETE CASCADE
   -- ON DELETE NO ACTION
--     ON UPDATE NO ACTION
)
   ;