--
-- This SQL script implements sample queries on the Monopoly database.
--

-- Exercise 8.1
-- Write SQL queries that return the following information from your Monopoly database:

-- a. Get the number of Game records.
-- SELECT *
--   FROM Game
--   ORDER BY time DESC
--   ;

-- -- b. Retrieve all the games that occurred in the past week.
-- SELECT *
--   FROM Game
--  WHERE time > NOW()::DATE - 7
--   ;

-- -- c. Retrieve a list of players who have (non-NULL) names.
-- SELECT *
--   FROM Player
--  WHERE name IS NOT NULL
--   ;

-- d. Retrieve a list of IDs for players who have some game score larger than 2000.
-- SELECT playerID
--   FROM PlayerGame
--  WHERE score > 2000
--   ;

-- -- e. Retrieve a list of players who have GMail accounts.
-- SELECT *
--   FROM Player
--  WHERE emailAddress LIKE '%gmail%'
--   ;


-- Exercise 8.2 Multiple-Table Queries in PostgreSQL 
-- a. Retrieve all “The King”’s game scores in decreasing order.
SELECT *
  FROM PlayerGame, Player
 WHERE Player.name = 'The King'
 ORDER BY score DESC
  ;

-- b. Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
SELECT Player.name
  FROM Player, Game, PlayerGame
 WHERE Game.time = '2006-06-28 13:20:00'
   AND Player.ID = PlayerGame.playerID
   AND Game.ID = PlayerGame.gameID
 ORDER BY score DESC
 LIMIT 1
  ;
  
-- c. So what does that P1.ID < P2.ID clause do in the last example query (i.e., the from SQL Examples)?
  -- It ensures that the query only returns one row for each pair of players. 
  -- Without this clause, the query would return two rows for each pair of players, one for each order in which the players are listed in the PlayerGame table.

-- d. The query that joined the Player table to itself seems rather contrived. 
-- Can you think of a realistic situation in which you’d want to join a table to itself?
  -- A self-join can be used to find friends within a Person table where each person has a friend_id linking to another person in the same table. 
  -- This allows you to create a list showing who is friends with whom.
