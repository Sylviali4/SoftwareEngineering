--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS Properties;  -- drop these 2 first because it has a foreign key: playerID
DROP TABLE IF EXISTS GameState;

DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;



-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer
	);

CREATE TABLE GameState (
    game_id SERIAL PRIMARY KEY,
    current_turn INT REFERENCES Player(ID),
    round_number INT
);

CREATE TABLE Properties (
    property_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    cost INT,
    rent INT,
    owner_id INT REFERENCES Player(ID)
);


-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON GameState TO PUBLIC;
GRANT SELECT ON Properties TO PUBLIC;


-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');
-- Add more game records.
INSERT INTO Game VALUES (4, '2024-10-27 10:15:00');
INSERT INTO Game VALUES (5, '2024-10-28 14:30:00');
INSERT INTO Game VALUES (6, '2024-10-30 19:45:00');
INSERT INTO Game VALUES (7, '2024-10-31 11:00:00');
INSERT INTO Game VALUES (8, '2024-11-1 16:20:00');


INSERT INTO Player VALUES (1, 'me@calvin.edu', 'Me');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');
-- Add more sample players.
INSERT INTO Player VALUES (4, 'cat@calvin.edu', 'Catty');
INSERT INTO Player VALUES (5, 'iron@gmail.edu', 'Ironman');
INSERT INTO Player VALUES (6, 'hat@gmail.edu', 'Hat');


INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);
-- Add records to PlayerGame for the new games.
INSERT INTO PlayerGame VALUES (4, 1, 1500.00);
INSERT INTO PlayerGame VALUES (4, 4, 2300.00);
INSERT INTO PlayerGame VALUES (4, 5, 500.00);
INSERT INTO PlayerGame VALUES (5, 2, 1200.00);
INSERT INTO PlayerGame VALUES (5, 3, 700.00);
INSERT INTO PlayerGame VALUES (5, 6, 2000.00);
INSERT INTO PlayerGame VALUES (6, 1, 1600.00);
INSERT INTO PlayerGame VALUES (7, 4, 2500.00);
INSERT INTO PlayerGame VALUES (8, 5, 1800.00);
INSERT INTO PlayerGame VALUES (8, 6, 900.00);


INSERT INTO GameState (game_id, current_turn, round_number) VALUES (1, 1, 1);
INSERT INTO GameState (game_id, current_turn, round_number) VALUES (2, 2, 2);
INSERT INTO GameState (game_id, current_turn, round_number) VALUES (3, 3, 3);
INSERT INTO GameState (game_id, current_turn, round_number) VALUES (4, 4, 1);
INSERT INTO GameState (game_id, current_turn, round_number) VALUES (5, 5, 2);
INSERT INTO GameState (game_id, current_turn, round_number) VALUES (6, 6, 3);
INSERT INTO GameState (game_id, current_turn, round_number) VALUES (7, 4, 4);


-- Add more properties.
INSERT INTO Properties (name, cost, rent, owner_id) VALUES ('Boardwalk', 400, 50, 1);
INSERT INTO Properties (name, cost, rent, owner_id) VALUES ('Park Place', 350, 35, 2);
INSERT INTO Properties (name, cost, rent, owner_id) VALUES ('Marvin Gardens', 280, 24, 4);
INSERT INTO Properties (name, cost, rent, owner_id) VALUES ('Baltic Avenue', 60, 4, 5);
INSERT INTO Properties (name, cost, rent, owner_id) VALUES ('St. James Place', 180, 14, 6);
