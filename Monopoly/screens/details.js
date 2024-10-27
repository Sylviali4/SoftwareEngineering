import React, { useState, useEffect } from 'react';
import { View, Text } from 'react-native';
import { globalStyles } from '../styles/global';


export default function DetailsScreen({ route }) {
    const { playerId } = route.params;
    const [player, setPlayer] = useState(null);

    useEffect(() => {
        // Fetch the details for a single player
        fetch(`https://cs262-webservice.azurewebsites.net/players/${playerId}`)
            .then((response) => response.json())
            .then((data) => setPlayer(data))
            .catch((error) => console.error('Error fetching player details:', error));
    }, [playerId]);

    return (
        <View style={globalStyles.container}>
            {player ? (
                <>
                    <Text style={globalStyles.title}>{player.email}</Text>
                    <Text>ID: {player.id}</Text>
                    <Text>Aka: {player.name}</Text>
                </>
            ) : (
                <Text>Loading...</Text>
            )}
        </View>
    );
}