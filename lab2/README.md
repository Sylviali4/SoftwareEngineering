# CS 262 - Lab 2 
# Date: Sep 13, 2024

This lab is based on https://cs.calvin.edu/courses/cs/262/kvlinden/02management/lab.html.

hacks that I had to make: Do Expo’s Tutorial: Introduction, including all sections under “Get started” through “Use an image picker”. 

## Answers to the lab questions:
    answer #a 
    The main component of this function returns an image. It is seen using the ImageViewer. "The launchImageLibraryAsync() method returns an object containing information about the selected image." source: https://docs.expo.dev/tutorial/image-picker/


    answer #b
    Using core components help make our code easier to manage and work with. Everything is not in a single file. It helps us breakdown our project into parts. (Buttons, images, backgrounds, etc)
    
    answer #c 
    The App.js file acts as a main driver for all of the other files so that they can work together easily. App.js talks to the other files. In Lab 2, files like Button.js and ImageViewer.js are like templates that can be used to create blueprints for these features. We can call them multiple times in App.js and have them used as many times as we want. In Lab 1, we only used App.js and had everything pasted into the one file.

    answer #d
    Curly braces are used to create blocks of code. They help us stay organized. Helps us understand the code for what it is, instead of plain text.

    answer #e
    Async is used to help handle all of the information that we are working with. In this instance, we are working with images so we need all of the metadata for that image to work with. "The pickImageAsync() function is responsible for invoking ImagePicker.launchImageLibraryAsync() and then handling the result. The launchImageLibraryAsync() method returns an object containing information about the selected image." source: https://docs.expo.dev/tutorial/image-picker/

    answer #f 
    Yes! We use the hook useState from React. We use this to manage the state of the selectedImage variable.

    answer #g 
    I would like to learn more about the pickImageAsync function. All I really know is that this function helps with picking an image from the device.
