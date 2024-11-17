
import React from 'react';
import { View, Text } from 'react-native';
import { globalStyles } from '../styles/global';

export default function DetailsScreen({ route }) {
    const { player_name, gameid, score } = route.params;

    return (
        <View style={globalStyles.container}>
            <Text style={globalStyles.title}>Player: {player_name}</Text>
            <Text>Game ID: {gameid}</Text>
            <Text>Score: {score}</Text>
        </View>
    );
}
