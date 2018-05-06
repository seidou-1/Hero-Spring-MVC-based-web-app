
/*
Add changes, commit, pull, resolve conflicts, commit again (if need to), push
*/

DROP DATABASE IF EXISTS `SuperheroSightings`;

CREATE DATABASE `SuperheroSightings`;

USE `SuperheroSightings`;

CREATE TABLE IF NOT EXISTS `Character_Superpower`(

`Character_SuperpowerID` int not null auto_increment
`SuperpowerID` int not null,

PRIMARY KEY(`Character_SuperpowerID`)
);
/**********************Character_Superpower***************
