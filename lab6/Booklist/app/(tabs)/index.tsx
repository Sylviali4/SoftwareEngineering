import React, {useEffect, useState} from 'react';
import {ActivityIndicator, FlatList, Text, View, StyleSheet} from 'react-native';

type Book = {
  id: string;
  title: string;
  publishedDate: string; 
};

const App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState<Book[]>([]);

  const getBooks = async () => {
    try {
      const response = await fetch('https://www.googleapis.com/books/v1/volumes?q=jane%20austen');
      const json = await response.json();

      // Log the entire API response to check its structure
      // console.log(json);

      // Check if the response has an error
      if (json.error) {
        console.error(json.error);
        alert(`Error: ${json.error.message}`);
        return;
      }

      // Access the 'items' array in the response to get the books data
      const books = json.items.map((item: { id: string; volumeInfo: { title: string; publishedDate: string } }): Book => ({
        id: item.id,
        title: item.volumeInfo.title,
        publishedDate: item.volumeInfo.publishedDate,
      }));
      


      // Sort the books by publishedDate (if publishedDate exists)
      books.sort((a:Book, b:Book) => {
      if (a.publishedDate && b.publishedDate) {
        return new Date(b.publishedDate).getTime() - new Date(a.publishedDate).getTime();
      }
      return 0; // If there's no date, maintain current order
    });

      setData(books);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getBooks();
  }, []);

  return (
    <View style={styles.container}>
      {isLoading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={data}
          keyExtractor={({id}) => id}
          renderItem={({item}) => (
            <View style={styles.item}>
              <Text style={styles.title}>{item.title}</Text>
              <Text style={styles.date}>Published: {item.publishedDate || 'N/A'}</Text>
            </View>
          )}
        />
      )}
    </View>
  );
};


const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    backgroundColor: '#f0f0f0',
  },
  item: {
    backgroundColor: '#fff',
    padding: 15,
    marginVertical: 8,
    borderRadius: 5,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 5,
    elevation: 2,
  },

  title: {
    fontSize: 18,
    fontWeight: 'bold',
  },
  date: {
    fontSize: 14,
    color: '#888',
    marginTop: 5,
  },
});


export default App;

