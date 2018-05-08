
/*
Add changes, commit, pull, resolve conflicts, commit again (if need to), push
*/

DROP DATABASE IF EXISTS `SuperheroSightings`;

CREATE DATABASE `SuperheroSightings`;

USE `SuperheroSightings`;

-- Bridge Table:
CREATE TABLE IF NOT EXISTS `Character_SuperPower`(
`SuperPowerID` int not null,
`CharacterID` int not null,

PRIMARY KEY(`Character_SuperPowerID`)
);


-- Character Table:
CREATE TABLE IF NOT EXISTS `Character` (
`CharacterID` int not null auto_increment,
`Name` VARCHAR(45),
`Description` VARCHAR(45),
`IsSuperHero` BIT(1),

PRIMARY KEY (`CharacterID`)

);

-- SuperPower Table:
CREATE TABLE IF NOT EXISTS `SuperPower`(
`SuperPowerID` int not null auto_increment,
`SuperPowerType` VARCHAR(45),

PRIMARY KEY (`SuperPowerType`)
);


-- Sighting Table:
CREATE TABLE IF NOT EXISTS `Sighting` (
 `SightingID` INT NOT NULL auto_increment,
 `LocationID` INT NOT NULL,
 `CharacterID` INT NOT NULL,
 `SightingDate` DATETIME NOT NULL,

 PRIMARY KEY (`SightingID`)

);


--Location Table:
 CREATE TABLE IF NOT EXISTS `Location` (
 `LocationID` INT NOT NULL auto_increment,
 `Name` VARCHAR(45) NOT NULL,
 `Description` VARCHAR(45) NOT NULL,
 `Latitude` VARCHAR(45) NOT NULL,
 `Longitude` VARCHAR(45) NOT NULL,
 `StreetNumber` VARCHAR(15) NOT NULL,
 `StreetName` VARCHAR(15) NOT NULL,
 `City` VARCHAR(15) NOT NULL,
 `State` VARCHAR(25),
 `ZipCode` CHAR NOT NULL,

 PRIMARY KEY (`LocationID`));


--Character_Organization Table:
CREATE TABLE IF NOT EXISTS Character_Organization (
`CharacterID` int not null,
`OrganizationID` int not null

-- PRIMARY KEY (`CustomerID`, `OrganizationID`) ..... Do bridge tables need primary keys?
);

-- Organization Table:
CREATE TABLE IF NOT EXISTS Organization (
`OrganizationID` int not null auto_increment,
`OrganizationName` varchar(15) not null,

`LocationID` int not null,
PRIMARY KEY (`OrganizationID`)
);



/**********************Character_Superpower***************/
ALTER TABLE `Character_SuperpowerID`
ADD CONSTRAINT`fk_Character_Superpower_Character` FOREIGN KEY (`Character_SuperpowerID`) REFERENCES `Character`
(`CharacterID`) ON DELETE NO ACTION;

/*********************************************************/



/*************************Sighting************************/
ALTER TABLE `Sighting`
ADD CONSTRAINT `fk_Sighting_Location` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`)
ON DELETE NO ACTION;

ADD CONSTRAINT `fk_Sighting_Character`FOREIGN KEY (`CharacterID`) REFERENCES `Character` (`CharacterID`)
ON DELETE NO ACTION;

/*********************************************************/



/*******************Character_Organization****************/

ALTER TABLE `Character_Organization`
ADD CONSTRAINT `fk_Character_Organization_Character` foreign key (`CharacterID`) references `Character` (`CharacterID`) 
ON DELETE NO ACTION;

ADD CONSTRAINT `fk_Character_Organization_Organization` foreign key (`OrganizationID`)references `Organization` (`OrganizationID`) ON DELETE NO ACTION;

/*********************************************************/



/************************Location*************************/

ALTER TABLE `Organization`
ADD CONSTRAINT `fk_Organization_Location` foreign key (`LocationID`)references `Location` (`LocationID`) ON DELETE NO ACTION;

/*********************************************************/
