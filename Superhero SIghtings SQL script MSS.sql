
/*
Add changes, commit, pull, resolve conflicts, commit again (if need to), push
*/

DROP DATABASE IF EXISTS `SuperheroSightings`;

-- my changes:

blah blah blah

CREATE DATABASE `SuperheroSightings`;

<<<<<<< HEAD
<<<<<<< HEAD
USE `SuperheroSightings`;

-- my change to master
=======
USE `MyDatabase`;

CREATE TABLE IF NOT EXISTS ();
>>>>>>> 41571b443decff58c53b35ed02c1b3801a88d560
=======
USE `SuperheroSightings`;

CREATE TABLE IF NOT EXISTS `Character_Superpower`(

`Character_SuperpowerID` int not null auto_increment
`SuperpowerID` int not null,

PRIMARY KEY(`Character_SuperpowerID`)
);
/**********************Character_Superpower***************
>>>>>>> sosaTest
