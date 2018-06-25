USE `SuperheroSightings`;
INSERT INTO `Location` (LocationName, Description, Latitude, Longitude, StreetNumber,StreetName, `City`, State, ZipCode)
VALUES 
('Statue of Liberty', 'Ellis Island', '74.0445', '40.6892', '123','Main Street','New York', 'NY', '10004'), -- 1
('School for the Gifted', 'School', '40.80559', '-73.935494','1','Broadway' ,'New York', 'NY', '10035'), -- 2
('New York Aquarium', 'Aquariaum', '40.574718', '-73.974880','50','Graham Street', 'Brooklyn', 'NY', '112244'), -- 3
('Bronx Brewery','Brewery', '40.80198', '-73.910390','Bronx', '500','Grand Concourse', 'NY','10454'), -- 4
('Brooklyn Navy Yard', 'Navy Yard', '40.702296', '-73.970856','769','Grand Street', 'Brooklyn', 'NY', '11205'), -- 5
('Washington Square Park', 'Park', '40.730847', '-73.997331','1021','Park Ave', 'Manhattan', 'NY', '10012'), -- 6
('Brooklyn Bridge', '1883 Landmark','40.7061', '73.9969','123','Brooklyn Bridge','Brooklyn', 'NY', '10038'), -- 7
('Manhattan BRidge','Iconic Bridge','40.7075', '73.9908','123','Manhattan Bridge','Manhattan','NY','11201'), -- 8
('Empire State Building','102 story Iconic Skyscraper','40.7484','73.9857','350','5th Ave', 'Manhattan', 'NY','10118'), -- 9
('Rockefeller Center','Famous NYC 22 acre commercial complex','40.7587','73.9787', '45', 'Rockefeller Plaza', 'Manhattan', 'NY', '10111'), -- 10
('Times Square','World Famous NYC intersection','40.7589', '73.9851','123','TimeSq','Manhattan', 'NY', '10036') -- 11
;
INSERT INTO `Characters` (CharacterName, Description, IsSuperHero)
VALUES 
('Magneto', 'Manipulates Metal', '0'), -- 1
('White Queen', 'Pscyhic', '0'),-- 2
('Sebastian Shaw', 'Energy', '0'),-- 3
('Selene','Sorceress', '0'),-- 4
('Cyclops', 'Energy', '1'),-- 5
('Wolverine','Regeneration','1'),-- 6
('Gambit','Energy', '1'),-- 7
('Beast','Intelligence','1'),-- 8 
('Rogue','Absorb Power','1'),-- 9
('Storm','Manipulate Nature', '1'),-- 10
('Jean Grey','Telepathic','1'),-- 11
('Iceman','Manipulates Ice','1'),-- 12
('Deadpool','Assassin','0'),-- 13
('Cable','Telepathic and Telekinetic', '1'),-- 14
('Sabretooh','Beast', '0'),-- 15
('Nightcrawler','Teleportation','1'),-- 16
('Blob','Brute', '0'),-- 17
('Pyro','Manipulate Fire','0'),-- 18
('Archangel','Flight, MetalWings', '1'),-- 19 
('Banshee','Sonic Shriek','1'),-- 20
('Stryfe','Telepathic and Telekinetic','1'),-- 21
('Gideon','Duplicate Superhuman Capablities','0'),-- 22
('Mojo','Super Human','0'),-- 23
('Dr.Xavier','Telepathic and Telekinetic','0'),-- 24
('Black Tom Cassidy','Immune to Banshee','0'),-- 25
('Lady Deathstrike','Superhuman Attributes','0'),-- 26
('Mystique','Shapeshifts','0'),-- 27
('Juggernaut','Unstoppable/Impenetrable','0'),-- 28
('Apocalypse','Godly Powers','0'),-- 29
('Colossus','Superhuman Steel Suit','1'),-- 30
('Kitty Pryde','Goes through Mass','1')-- 31
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
('Supehuman Senses'),-- 13
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
('Reflexes') -- 39
;
INSERT INTO Organization (OrganizationName, Description, LocationID)
VALUES 
('Hellfire Club','Villainous organization ' ,'1'), -- 1
('Xmen','Professor X and his heroes' ,'2'), -- 2
('Xfactor','Wrestling group consisting of TripleH ...','3'), -- 3
('BrotherHood of Mutants','Villainous organization','4'), -- 4
('Mutant Liberation Front','Villainous organization','5'), -- 5
('The Profit$','Villainous organization','6'), -- 6
('X Force', 'Mutant Hero Team', '2')  -- 7
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
('21','7'),
('22','6')
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
('11','6')
;