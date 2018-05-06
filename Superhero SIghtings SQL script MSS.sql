
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





/**********************Character_Superpower***************/
ALTER TABLE `Character_SuperpowerID`
ADD CONSTRAINT`fk_Character_Superpower_Character` FOREIGN KEY (`Character_SuperpowerID`) REFERENCES `Character`
(`CharacterID`) ON DELETE NO ACTION;

/*********************************************************/
