# Mimo Challenge Comments

This was a fun challenge. Estimated time : 3 hours 
The hardest part of this challenge was actually understanding what was expected and how exactly I wanted to implement

My application is comprised of 2 View Controllers : LoadingLessonsViewController and the LessonScreenViewController

The LoadingLessonsViewController: 
  comprised of two outlets to the lessonsTextLabel that is controlled by a switch statement, in the case of an error the text is returned by an error statement, otherwise returning a statement that the lessons loaded with a count for how many lessons their are. 
  the second outlet is just to the startLesson button that segues to the LessonScreenViewController 
  
LessonScreenViewController: 
Assuming (based on the provided api) that each lesson is made of 3 sections, I created 3 outlets, one being the textfield. 
The main aspect of this view controller is the setupLesson function that creates each lesson and controlsd the inout. 
The only other function in this controller is the goToNextLesson function that determines what lesson the user is on and whether or not run the setuplesson function. If the lessons are finsihed it converts the first label to No More Lessons" 


The additional files included are: 
  UIColor that handles the given HEX color string
  Lessons that parses the json using codable that is comprised of a struct for the overall Lesson, Content, and Input
  
  Essentially this is just a start to the challenge. I plan on wrapping this upwith a Datamodel to store timestamps of when a lesson was started an completed for each lesson ID.
  
  Some additional things I could add to really put this application at where it should be :
  Add in some more comments, everything was done pretty short and precise and seems fairly easy to understand but for future reference I should go back and add more commenting 
  A restart button when the lessons are over instead of just displaying a text label saying it's complete
  A hints button like in the real mimo app for when someone gets stuck
  I would change the functionality of the run button
  
  THANK YOU FOR THIS OPPORTUNITY 
 
  
  



# Mimo Mobile Coding Challenge

The goal of this challenge is to create an extremely simplified version of the Mimo app that can retrieve some very basic lessons from a server and display them.

## Implementation

- While you can write the challenge any way you want, we use Reactive Extensions + MVVM to build our apps at Mimo, so if you know those technologies, it would make sense to apply them in this challenge
- You won't be judged on the visual design at all, the only metric is your code.
- Part of this coding challenge is to read the documentation for the APIs provided to you.
- Use Git to track your changes and upload your Git repo either on [GitHub](https://github.com) or [Bitbucket](https://bitbucket.com) to share it with us.

## Goal

Write a small app that can display a few very simple Mimo lessons. You get the information for the lessons from an API and should display the first lesson. The lessons have a specific format (documented later) and should be rendered to the screen. If the lesson contains an interaction, display the interaction. Also display a "Next" button that, when pressed, checks that the lesson has been solved and continues to the next lesson.

When a lesson has been solved, store this event in a mobile database of your choice on the device (see "Lesson completion event").

If the user solved the last lesson, display a simple screen that says "Done".

## Data structure

### Lessons

- Each lesson has an ID and JSON content that describes how the lesson is formatted
- Lessons come in a specific order

#### Lesson Content Format

Every lesson contains content, formatted as JSON, that represents an array of content objects:

```json
{
  "id": 5,
  "content": [{
      "color": "#FFFFFF",
      "text": "Hello "
  },
  {
      "color": "#FFFFFF",
      "text": "World"
  },
  {
      "color": "#FFFFFF",
      "text": "!"
  }],
  "input": {
    "startIndex": 7,
    "endIndex": 11
  }
}
```

Each object in the content array represents a text snippet that each can have a different color. If the `input` object exists, it represents the range where the user has to type in the expected input. In this example the user has to input "World" in order to proceed to the next lesson. If an input interaction exists, and the user hasn't typed in the correct input yet, disable the button. As soon as the input is the correct text, enable the button, so the user can proceed to the next lesson. If there is no input interaction, the button should always be enabled.

Here's an example of how this lesson could look like:

<img width="217" alt="challengedisplay" src="https://user-images.githubusercontent.com/964691/39253366-fe542ad0-48a7-11e8-98c4-8e1c2c6a470d.PNG">

### Lesson completion event

A lesson completion event object is created when a lesson has been completed

It contains the following properties:
- The ID of the lesson
- A timestamp when the lesson started
- A timestamp when the lesson completed

## Server API

The server API for getting the lessons is extremely simple. Just do a GET request on https://mimochallenge.azurewebsites.net/api/lessons, which returns a JSON object that contains all of the lesson information.
