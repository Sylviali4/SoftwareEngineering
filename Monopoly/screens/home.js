import React, { useState, useEffect } from 'react';
import { View, Text, TouchableOpacity, FlatList } from 'react-native';
import { globalStyles } from '../styles/global';


export default function HomeScreen({ navigation }) {
    const [players, setPlayers] = useState([]);

    useEffect(() => {
        fetch('https://cs262-webservice.azurewebsites.net/players')
            .then((response) => response.json())
            .then((data) => {
                // Sort players by ID in ascending order
                const sortedPlayers = data.sort((a, b) => a.id - b.id);
                setPlayers(sortedPlayers);
            })
            .catch((error) => console.error('Error fetching player data:', error));
    }, []);

    return (  
        <View style={globalStyles.container}>
            <FlatList 
                data={players} 
                keyExtractor={(item) => item.id.toString()} 
                renderItem={({ item }) => (
                    <TouchableOpacity onPress={() => navigation.navigate('Details', {
                        playerId: item.id,
                        email: item.email,
                        name: item.name
                    })}>
                        <Text style={globalStyles.title}>{ item.email }</Text>
                    </TouchableOpacity>
                )} 
            />
        </View>
    );
}