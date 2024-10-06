import React from 'react';
import { View, Text } from 'react-native';
import { globalStyles } from '../styles/global';


export default function AboutScreen({ route, navigation }) {
    return (
        <View style={globalStyles.container}>
            <Text style={globalStyles.title}>About</Text>
            <Text>This application lists movies and movie reviews.</Text>
        </View>
    );
  }
  