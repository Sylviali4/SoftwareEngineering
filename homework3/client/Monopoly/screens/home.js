import React, { useState, useEffect } from 'react';
import { View, Text, TouchableOpacity, FlatList } from 'react-native';
import { globalStyles } from '../styles/global';

export default function HomeScreen({ navigation }) {
    const [playerGames, setPlayerGames] = useState([]);

    useEffect(() => {
        fetch('https://cs262-monopoly-service-g4cjahhxgze8a2a8.eastus2-01.azurewebsites.net/playerGames')
            .then((response) => response.json())
            .then((data) => {
                // Sort by player_id and gameid for better organization
                const sortedData = data.sort((a, b) => {
                    if (a.player_id === b.player_id) {
                        return a.gameid - b.gameid;
                    }
                    return a.player_id - b.player_id;
                });
                setPlayerGames(sortedData);
            })
            .catch((error) => console.error('Error fetching player-game data:', error));
    }, []);

    return (  
        <View style={globalStyles.container}>
            <FlatList 
                data={playerGames} 
                keyExtractor={(item, index) => index.toString()} 
                renderItem={({ item }) => (
                    <TouchableOpacity onPress={() => navigation.navigate('Details', item)}>
                        <Text style={globalStyles.title}>
                            {item.player_name} (Game ID: {item.gameid})
                        </Text>
                        <Text>Score: {item.score}</Text>
                    </TouchableOpacity>
                )} 
            />
        </View>
    );
}
