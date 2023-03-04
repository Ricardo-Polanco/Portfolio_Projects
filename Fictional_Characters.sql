CREATE TABLE characters (id INTEGER,
    fullname varchar(50), 
    age INTEGER,
    origin varchar(50), 
    spirit varchar(50));

INSERT INTO characters (id, fullname, age, origin, spirit)
    VALUES (1, 'Peter Rock', 19, 'Oracle', 'Wolf');
INSERT INTO characters (id, fullname, age, origin, spirit)
    VALUES (2, 'Eric Ilma', 20, 'Pennington', 'Tiger');
INSERT INTO characters (id, fullname, age, origin, spirit)
    VALUES (3, 'Quill Evergreen', 17, 'Wilshire', 'Dragon');
INSERT INTO characters (id, fullname, age, origin, spirit)
    VALUES (4, 'Tyler Underwood', 19, 'Eldia', 'Snake');
INSERT INTO characters (id, fullname, age, origin, spirit)
    VALUES (5, 'Andromeda Galacta', 19, 'Pennington', 'Pheonix');
INSERT INTO characters (id, fullname, age, origin, spirit)
    VALUES (6, 'Pyper Reiss', 18, 'Quantville', 'Manticore');
INSERT INTO characters (id, fullname, age, origin, spirit)
    VALUES (7, 'Nina Lofren', 16, 'Flomannia', 'Gargoyle');
INSERT INTO characters (id, fullname, age, origin, spirit)
    VALUES (8, 'Cleo Ocean', 18, 'Atlantis', 'Siren');

CREATE TABLE characters_powers (id INTEGER,
    character_id INTEGER,
    power TEXT);

INSERT INTO characters_powers (id, character_id, power) 
    VALUES (1, 1, 'Invisibility');
INSERT INTO characters_powers (id, character_id, power) 
    VALUES (2, 2, 'Power Stealing');
INSERT INTO characters_powers (id, character_id, power) 
    VALUES (3, 4, 'Speed');
INSERT INTO characters_powers (id, character_id, power) 
    VALUES (4, 5, 'Teleportation');
INSERT INTO characters_powers (id, character_id, power) 
    VALUES (5, 6, 'Strength');
INSERT INTO characters_powers (id, character_id, power) 
    VALUES (6, 7, 'Lightning');
INSERT INTO characters_powers (id, character_id, power) 
    VALUES (7, 8, 'Healing');
INSERT INTO characters_powers (id, character_id, power) 
    VALUES (8, 5, 'Magic');

CREATE TABLE rivals (id INTEGER,
    character1_id INTEGER,
    character2_id INTEGER);

INSERT INTO rivals (id, character1_id, character2_id)
    VALUES (1, 1, 3);
INSERT INTO rivals (id, character1_id, character2_id)
    VALUES (2, 2, 5);
INSERT INTO rivals (id, character1_id, character2_id)
    VALUES (3, 7, 4);
INSERT INTO rivals (id, character1_id, character2_id)
    VALUES (4, 8, 6);

SELECT * FROM characters;
SELECT * FROM characters_powers;
SELECT * FROM rivals;

/* Shows the character's name, age, origin, spirit, and their respective power by joining the two tables. 
We see that Quill has a power of NULL because he doesn't have a power, whereas Andromeda has two powers. 
This was acheivable using LEFT OUTER JOIN */ 
SELECT characters.fullname, characters.age, characters.origin, characters.spirit, characters_powers.power FROM characters
    LEFT OUTER JOIN characters_powers
    ON characters.id = characters_powers.character_id
    ORDER BY age DESC;

/* Shows each character's rival by combining multiple joins and the name of the teams they belong to */
SELECT a.fullname AS Perinthans, a.age, b.fullname AS Indigos, b.age FROM rivals
    JOIN characters a 
    ON rivals.character1_id = a.id
    JOIN characters b
    ON rivals.character2_id = b.id;
