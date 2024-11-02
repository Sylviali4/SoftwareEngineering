# CS 262 - Lab 8
# Student Name: Lujia Li
# Email: ll44
# Date: Nov 1, 2024

This lab is based on https://cs.calvin.edu/courses/cs/262/kvlinden/08is/lab.html

hacks that I had to make: Wrote some Single-Table Queries and Multiple-Table Queries for Monopoly database in SQL.

## Answers to the lab questions:
    answer #c. So what does that P1.ID < P2.ID clause do in the last example query (i.e., the from SQL Examples)?
    -- It ensures that the query only returns one row for each pair of players. 
    -- Without this clause, the query would return two rows for each pair of players, one for each order in which the players are listed in the PlayerGame table.

    Answer #d. The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself?
    -- A self-join can be used to find friends within a Person table where each person has a friend_id linking to another person in the same table. This allows you to create a list showing who is friends with whom.
