--
-- This SQL script implements sample queries on the Monopoly database.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Get the number of Game records.
SELECT *
  FROM Game
  ;

-- Get the player records.
SELECT * 
  FROM Player
  ;

-- Get all the users with Calvin email addresses.
SELECT *
  FROM Player
 WHERE emailAddress LIKE '%calvin%'
 ;

-- Get the highest score ever recorded.
  SELECT score
    FROM PlayerGame
ORDER BY score DESC
   LIMIT 1
   ;

-- Get the cross-product of all the tables.
SELECT *
  FROM Player, PlayerGame, Game
  ;

-- Retrieve all player states, including cash and location.
SELECT player_id, name, cash, location FROM Players;

-- Fetch property ownership and details.
SELECT * FROM Properties;

-- Retrieve game state information.
SELECT * FROM GameState;

-- Full join for detailed game state.
SELECT Players.name, Properties.name AS property_name, cash, location, round_number, current_turn 
  FROM Players
  LEFT JOIN Properties ON Properties.owner_id = Players.player_id
  JOIN GameState ON GameState.current_turn = Players.player_id;
