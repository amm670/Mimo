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
