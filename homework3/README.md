# CS 262 - Homework 3
# Date: November 16, 2024

This homework is based on https://cs.calvin.edu/courses/cs/262/kvlinden/06hci/homework.html.

hacks that I had to make: created a join query and update the React Native app from lab 2 to display a list of all players, the games they participated in, and their scores fetched from an API: https://cs262-monopoly-service-g4cjahhxgze8a2a8.eastus2-01.azurewebsites.net/playerGames.

The HomeScreen will fetch data from the /playerGames endpoint and display a list of players with their game IDs and scores. 
When a player is selected, their details will be passed to the DetailsScreen.

## Answers to the homework questions:
    answer #a 
    /: Returns a "Hello" message to confirm the service is running.
    /players: Returns a list of all players.
    /players/:id: Returns details for a specific player by ID.
    /playerGames: Returns a list of players, the games they participated in, and their scores.

    answer #b
    Idempotent Endpoints:
        /players: Repeated requests return the same list of players.
        /players/:id: Repeated requests return the same player details for the given ID.
        /playerGames: Repeated requests return the same list of players, games, and scores.
    Nullipotent Endpoints:
        /: Does not change any state and always returns the same "Hello" message.
        All the above endpoints are nullipotent because they only perform read operations and do not modify data.

    answer #c
    Yes, the service is RESTful because:
        1. It uses Explicit URIs: Resources are clearly identified by endpoints like /players, /players/:id, and /playerGames.
        2. It uses HTTP Commands(CRUD).
        3. Stateless: Each request is independent, and the server does not store previous states or sessions.
        4. JSON Data Format: All data is transferred in JSON for both requests and responses.

    answer #d
    Yes, there is evidence of an impedance mismatch between the relational database and the object-oriented client:
        The playerGames join query combines data from multiple tables (Player and PlayerGame) into a single object, which doesn’t map directly to a specific table in the database.
        This requires additional logic in the service to merge and format the data appropriately for the client.
