# Create a School API

For this challenge you are going to create an applicaiton for a school to help keep track of students and classes. You'll be in charge of the backend, which will be an api that returns JSON. This challenge is pretty open ended. Read through the requirements and work with your partner to create a plan before jumping into the code. What models will you need to create? How will they be associated? 

## Release 0 
Set up a new Django project. By now you should be familiar with setting one up from scratch. This project will eventually be deployed to Heroku, so you will need to use Postgres as your database. What do you need to set up so that django works with Postgres? 


## Release 1 - Students 
Start off by creating CRUD functionality for students. A user should be able to:
- create new students 
- see a list of all the students in the school 
- see data for one particular student 
- update student records
- delete a student

 You can use the interface that comes with Django Rest Framework to do interact with the database and make sure your routes are working. If you want to stretch your learning a bit, try setting up [Postman](https://www.getpostman.com/) and use it to test your endpoints. 

## Release 2 - Classes 
Add the abilitiy to CRUD classes to your app. A class can have many students and a student can take many classes. What routes will you need? How can you set up nested routes to be able to get all the students enrolled in a particular class or see all of a student's current classes? 
You must be able to: 

- Create, Read, Update, and Destory a class 
- Enroll a student in a class 
- Remove a student from a class
- See all the students currently enrolled in a class 
- See all of a students current classes 

## Release 3 - Deploy

Deploy your project to Heroku. Follow the steps from today's lesson.