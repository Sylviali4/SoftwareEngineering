# CS 262 - Lab 7
# Date: Oct 26, 2024

This lab is based on https://cs.calvin.edu/courses/cs/262/kvlinden/07is/lab.html

hacks that I had to make: Expanded a Monopoly database to support ongoing games by adding tables for player cash, property ownership, and game state, then verified the setup using SQL queries.

## Answers to the lab questions:
    answer #a 
    Monopoly Database Schema

    Players Table:
    Tracks each player’s cash and location (board position).
    Columns: player_id, name, cash, location.

    Properties Table:
    Represents properties with details like owner_id, houses, and hotels.
    Columns: property_id, name, cost, rent, owner_id, houses, hotels.

    GameState Table:
    Tracks the overall game status, including current_turn and round_number.
    Columns: game_id, current_turn, round_number.
