# CS 262 - Lab 6
# Date: Oct 12, 2024

This lab is based on https://cs.calvin.edu/courses/cs/262/kvlinden/06hci/lab.html.

hacks that I had to make: Implement the “Fetch Example” in React Native’s Networking tutorial, then change movie list to book list which fetched from: https://www.googleapis.com/books/v1/volumes?q=jane%20austen.

## Answers to the lab questions:
    answer #a 
    useState: This hook is used to create and update state variables. In this code, it's used to keep track of two things: whether the app is still loading (isLoading) and the data that comes from the API (data).
    
    useEffect: This hook runs code when the component is first displayed. It’s used here to call the getBooks function to fetch data from the API when the app starts.

    answer #b
    With the invalid URL(not matching), the app won’t find any data, so the list will be empty. If the URL itself is invalid (e.g., a typo), the app will catch the error and log it to the console.
    
