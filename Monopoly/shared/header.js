import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import { globalStyles } from '../styles/global';

export default function Header({ navigation }) {
  return (
    <View style={{ flexDirection: 'row', justifyContent: 'flex-end', paddingRight: 10 }}>
      <TouchableOpacity onPress={() => navigation.navigate('About')}>
        <MaterialIcons name="help-outline" size={28} style={globalStyles.icon} />
      </TouchableOpacity>
    </View>
  );
}
