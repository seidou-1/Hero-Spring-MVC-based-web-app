USE `SuperheroSightings`;
INSERT INTO `Location` (LocationName, Description, Latitude, Longitude, StreetNumber,StreetName, `City`, State, ZipCode)
VALUES 
('Statue of Liberty', 'Ellis Island',  '40.6892', '-74.0445','123','Main Street','New York', 'NY', '10004'), -- 1
('School for the Gifted', 'School', '40.80559', '-73.935494','1','Broadway' ,'New York', 'NY', '10035'), -- 2
('New York Aquarium', 'Aquariaum', '40.574718', '-73.974880','50','Graham Street', 'Brooklyn', 'NY', '112244'), -- 3
('Bronx Brewery','Brewery', '40.80198', '-73.910390','Bronx', '500','Grand Concourse', 'NY','10454'), -- 4
('Brooklyn Navy Yard', 'Navy Yard', '40.702296', '-73.970856','769','Grand Street', 'Brooklyn', 'NY', '11205'), -- 5
('Washington Square Park', 'Park', '40.730847', '-73.997331','1021','Park Ave', 'Manhattan', 'NY', '10012'), -- 6
('Brooklyn Bridge', '1883 Landmark','40.7061', '-73.9969','123','Brooklyn Bridge','Brooklyn', 'NY', '10038'), -- 7
('Manhattan Bridge','Iconic Bridge','40.7075', '-73.9908','123','Manhattan Bridge','Manhattan','NY','11201'), -- 8
('Empire State Building','102 story Iconic Skyscraper','40.7484','-73.9857','350','5th Ave', 'Manhattan', 'NY','10118'), -- 9
('Rockefeller Center','Famous NYC 22 acre commercial complex','40.7587','-73.9787', '45', 'Rockefeller Plaza', 'Manhattan', 'NY', '10111'), -- 10
('Times Square','World Famous NYC intersection','40.7589', '-73.9851','123','TimeSq','Manhattan', 'NY', '10036'), -- 11
('Unknown Location','0', '0','0','N/A','N/A', 'N/A', 'N/A', 'N/A') -- 12
;
INSERT INTO `Characters` (CharacterName, Description, IsSuperHero, Photograph)
VALUES 
('Magneto', 'Currently revolutionary and conqueror, secret agent', '0', 'https://www.superherodb.com/pictures2/portraits/11/100/13424.jpg?t=-62169955200'), -- 1
('White Queen', 'Adventurer, teacher, dancer', '0', 'https://www.superherodb.com/pictures2/portraits/10/100/14128.jpg?t=1532139437'),-- 2
('Sebastian Shaw', 'Evil AF', '0', 'https://www.superherodb.com/pictures2/portraits/11/100/1482.jpg?t=1308776011'),-- 3
('Selene','She is a mutant, and an enemy of the X-Men', '0', 'https://www.superherodb.com/pictures2/portraits/11/100/11103.jpg?t=-62169955200'),-- 4
('Cyclops', 'Leader of mutant race, adventurer, headmaster, f', '1', 'https://www.superherodb.com/pictures2/portraits/11/100/14452.jpg?t=-62169955200'),-- 5
('Wolverine','Bouncer, spy, government operative, mercenary, soldier','1', 'https://www.superherodb.com/pictures2/portraits/11/100/12713.jpg?t=-62169955200'),-- 6
('Gambit','Abandoned at birth due to his burning red eyes', '1', 'https://www.superherodb.com/pictures2/portraits/10/100/64.jpg?t=1331838506'),-- 7
('Beast','Biochemist, formerly Xavier Institute for Higher Learning science and math Instructor','1', 'https://www.superherodb.com/pictures2/portraits/11/100/13906.jpg?t=-62169955200'),-- 8 
('Rogue','Adventurer, former mechanic, waitress, terrorist','1', 'https://www.superherodb.com/pictures2/portraits/11/100/13989.jpg?t=-62169955200'),-- 9
('Storm','Manipulate nature, adventurer', '1', 'https://www.superherodb.com/pictures2/portraits/10/100/135.jpg?t=1399372417'),-- 10
('Jean Grey','Adventurer, telepathic','1', 'https://www.superherodb.com/pictures2/portraits/10/100/814.jpg?t=1492414862'),-- 11
('Iceman','Manipulates ice, adventurer, formerly teacher, accountant, student','1', 'https://www.superherodb.com/pictures2/portraits/10/100/816.jpg?t=1492410364'),-- 12
('Deadpool','Mercenary, former enforcer, government operative, assassin','0', 'https://www.superherodb.com/pictures2/portraits/11/100/12733.jpg?t=-62169955200'),-- 13
('Cable','Adventurer,  freedom fighter, United States government agent', '1', 'https://www.superherodb.com/pictures2/portraits/10/100/40.jpg?t=1492103640'),-- 14
('Sabretooth','Mercenary, professional criminal, assassin, serial killer', '0', 'https://www.superherodb.com/pictures2/portraits/10/100/17.jpg?t=1453152536'),-- 15
('Nightcrawler','Adventurer, Teacher','1', 'https://www.superherodb.com/pictures2/portraits/10/100/107.jpg?t=1444734097'),-- 16
('Blob','Former criminal, terrorist, government agent, carnival performer', '0', 'https://www.superherodb.com/pictures2/portraits/10/100/1119.jpg?t=1217958613'),-- 17
('Pyro','Terrorist, bodyguard, novelist, journalist','0', 'https://www.superherodb.com/pictures2/portraits/10/100/853.jpg?t=-62169955200'),-- 18
('Archangel','Chairman of Worthington Industries', '1', 'https://www.superherodb.com/pictures2/portraits/10/100/829.jpg?t=-62169955200'),-- 19 
('Banshee','Currently founder and director of operation for X-Corps, ','1', 'https://www.superherodb.com/pictures2/portraits/10/100/26.jpg?t=1453150493'),-- 20
('Stryfe','Cables clone','1', 'https://vignette.wikia.nocookie.net/marveldatabase/images/8/8b/Stryfe_(Earth-4935)_from_Deadpool_Vol_4_23_001.jpg/revision/latest/scale-to-width-down/223?cb=20161211000922'),-- 21
('Gideon','Duplicate Superhuman Capablities','0', 'https://placeimg.com/200/200/arch/grayscale?t=1534712200242'),-- 22
('Mojo','Super Human','0', 'https://placeimg.com/200/200/arch/grayscale?t=1534712200242'),-- 23
('Dr.Xavier','Mutant leader, mutant rights activist, geneticist, teacher, adventurer','0', 'https://www.superherodb.com/pictures2/portraits/10/100/113.jpg?t=1399361028'),-- 24
('Black Tom Cassidy','Supervillian, Immune to Banshee (Cousin)','0', 'https://placeimg.com/200/200/arch/grayscale?t=1534712200242'),-- 25
('Lady Deathstrike','Whereabouts and activities are unknown.','0', 'https://www.superherodb.com/pictures2/portraits/10/100/810.jpg?t=1492452509'),-- 26
('Mystique','Special operative for Germany and the United States governments','0', 'https://www.superherodb.com/pictures2/portraits/10/100/817.jpg?t=-62169955200'),-- 27
('Juggernaut','He is the stepbrother of Professor X','0', 'https://www.superherodb.com/pictures2/portraits/11/100/14012.jpg?t=-62169955200'),-- 28
('Apocalypse','Godly Powers, Student; formerly Conqueror; Scientist','0', 'https://www.superherodb.com/pictures2/portraits/10/100/852.jpg?t=1314777772'),-- 29
('Colossus','Superhuman Steel Suit, (former) Artist','1', 'https://www.superherodb.com/pictures2/portraits/11/100/12370.jpg?t=-62169955200'),-- 30
('Kitty Pryde','Teacher, Adventurer, former student','1', 'https://www.superherodb.com/pictures2/portraits/10/100/122.jpg?t=1454962513')-- 31
;
INSERT INTO Superpower(SuperPowerType)
VALUES ('Strength'),-- 1
('Speed'),-- 2
('Flight'),-- 3
('Endurance'),-- 4
('Telepathy'),-- 5
('Telekinesis'),-- 6
('Teleportation'),-- 7
('Mind Control'),-- 8
('Memory Manipulation'),-- 9
('Astral Projection'),-- 10
('Psychic Attack'),-- 11
('Technopathy'),-- 12
('Superhuman Senses'),-- 13
('Regenerative Healing'),-- 14
('Concussion Beams'),-- 15
('Energy Blasts'),-- 16
('Magnetism Manipulation'),-- 17
('Shapeshifting'),-- 18
('Energy Conversion'),-- 19
('Sonic Scream'),-- 20
('Reality Warping'),-- 21
('Weather Manipulation'),-- 22
('Fire Manipulation'),-- 23
('Ice Manipulation'),-- 24
('Plant Manipulation'),-- 25
('Absorb LifeForce/Power'),-- 26
('Kinetic Conversion'),-- 27
('Flexibility'),-- 28
('Intelligence'),-- 29
('Nightvision'),-- 30
('Camouflage'),-- 31
('Immortality'), -- 32
('Magical Powers'), -- 33
('Molecular Manipulation'), -- 34
('Phasing'), -- 35
('Animal Physical Attributes'), -- 36
('Cold Manipulation'), --  37
('Skilled Combat'), -- 38
('Reflexes'), -- 39
('Durability'), -- 40
('Skilled Combat'), -- 41
('Strength'), -- 42
('Duplication'), -- 40
('Thermal Vision'), -- 41
('Audio Control'), -- 42
('Enhanced Hearing')-- 43

;
INSERT INTO Organization (OrganizationName, Description, LocationID)
VALUES 
('Hellfire Club','Archenemy of the X-Men ' ,'1'), -- 1
('X-Men','Professor X and his heroes' ,'2'), -- 2
('X-Factor','Wrestling group consisting of TripleH ...','3'), -- 3
('BrotherHood of Mutants','Evil group of people that voews to destroy humanity','4'), -- 4
('Mutant Liberation Front','Evil People who are out to take over the worl','5'), -- 5
('The Profit$','Villainous organization','6'), -- 6
('X-Force', 'Mutant Hero Team made up of cool mutants', '2'), -- 7
('X-Corps','Heroes that want to save the world','12'), -- 8
('New Canaanites','They replaced the empire of the mutant overlord Apocalypse','12'), -- 8
('Marvel Universe','Comic Book Organization that rivals DC Comic Universe','12'), -- 9
('DC Comics','Comic Book Organization that rivals Marvel Universe','12'), -- 10
('The Hand','Group of merciless bad guys','12'), -- 11 
('Gods','The strength of the gods are within them','12') -- 12
; 

INSERT INTO Sighting ( LocationId, CharacterId, SightingDate)
VALUES ('2','1','2018-03-20 23:59:59'),
('3','2','2018-04-20 12:30:30'),
('6','3','2018-02-20 23:59:59'),
('11','8','2018-05-20 12:30:30'),
('9','7','2018-06-20 12:30:30'),
('10','5','2018-07-20 23:59:59'),
('8','10','2018-08-20 12:30:30'),
('1','9','2018-09-20 12:30:30'),
('2','4','2018-10-20 23:59:59'),
('3','6','2018-04-20 12:30:30')
;
INSERT INTO Character_Organization (CharacterID, OrganizationID)
VALUES ('1','1'),
('1','9'),
('2','1'),
('3','1'),
('4','1'),
('5','2'),
('6','2'),
('7','2'),
('8','2'),
('9','2'),
('10','2'),
('11','2'),
('12','2'),
('13','3'),
('14','3'),
('15','4'),
('16','3'),
('17','4'),
('18','5'),
('19','2'),
('20','7'),
('20','8'),
('21','7'),
('21','8'),
('22','6'),
('23','8'),
('24','2'),
('24','9'),
('25','4'),
('25','9'),
('26','11'),
('26','9'),
('27','11'),
('27','9'),
('27','4'),
('27','1'),
('28','4'),
('28','9'),
('29','12'),
('29','9'),
('30','2'),
('30','9'),
('31','2'),
('31','9')
;
INSERT INTO `Character_Superpower` (CharacterID, SuperpowerID)
VALUES ('1','17'),
('1','3'),
('2','5'),
('2','8'),
('3','19'),
('3','16'),
('4','5'),
('4','33'),
('5','15'),
('5','16'),
('6','14'),
('6','38'),
('7','15'),
('7','19'),
('8','36'),
('8','1'),
('9','26'),
('9','1'),
('10','22'),
('10','3'),
('11','5'),
('11','6'),
('12','5'),
('12','6'),
('13','14'),
('13','5'),
('14','5'),
('14','6'),
('15','13'),
('15','29'),
('16','7'),
('16','30'),
('17','40'),
('17','41'),
('17','42'),
('18','23'),
('19','3'),
('19','14'),
('20','20'),
('20','42'),
('20','43'),
('21','5'),
('21','6'),
('22','32'),
('22','42'),
('23','7'),
('23','42'),
('24','5'),
('24','6'),
('24','8'),
('25','25'),
('25','34'),
('26','12'),
('26','29'),
('27','18'),
('27','31'),
('28','1'),
('28','4'),
('29','31'),
('29','9'),
('29','14'),
('29','1'),
('30','1'),
('31','28'),
('31','35'),
('31','31')
;