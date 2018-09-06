# Object Oriented Programming in Python
- Python is an object-oriented programming language where everything is an object (i.e., booleans, strings, hashes, arrays, integers, everything)
- Objects are data structures that have methods and attributes. Think of objects as nouns. Most nouns have attributes (adjectives) and methods that it can do (verbs)
    - For example, imagine you have a dog. Every dog has attributes such as breed, weight, and color. Every dog also has methods that it can do, such as sit, fetch, and lay down
- Objects are organized by `class`-es. Classes are used to combine how data is represented and methods to manipulate data
- Before we get started, `help(object_here)` will give you a bit of information on what type of object you're dealing with and some methods that are available to call on it
    - You'll also see methods with double underscores `__`. Those are called `dunder` methods and we'll get into those later

## Basic Objects
- Creating a class is as simple as the following:
```python
class Dog:
    pass

dog = Dog # this is how we instantiate our Dog instance
```
- If we save this and run the file, we don't get any errors. That being said, we also aren't doing anything with this class. Let's give it some class variables:
```python
class Dog:
    eyes = 2
    legs = 4

    def display_info(self):
        print(f"Dogs have {self.eyes} eyes and {self.legs} legs")

dog = Dog() # another way to instantiate a Python object
dog.display_info()
```
- The `self` keyword is extremely important in Python. Without `self`, the program does not know what class to look in to call methods or variables. It's annoying to always put `self` in our code, but until they release a new version that has an implicit `self` (like Ruby does), we'll have to remember to put that in
- We created **class variables** earlier. Those variables can be used across all instances of a class. Take a look at the code we have below:
```python
class Dog:
    eyes = 2
    legs = 4

    def display_info(self):
        print(f"Dogs have {self.eyes} eyes and {self.legs} legs")

jons_dog = Dog()
jons_dog.display_info()

joshs_dog = Dog()
joshs_dog.display_info()
```
- Jon's dog and Josh's dog both get to share that class variable. That being said, each dog is unique and has things that are unique. If we had to create a dog factory, we want to make sure they all come out with 2 eyes and 4 legs (class variables), but there are things that make each dog unique, called `attributes`:
```python
class Dog:
    eyes = 2
    legs = 4

    def __init__(self, name, breed, color):
        self.name = name
        self.color = color
        self.breed = breed
    
    def display_info(self):
        print(f"""
{self.name} is a {self.color} {self.breed}.
It has with {self.eyes} eyes and {self.legs} legs
        """)

# There are two ways of instantiating a Dog
jons_dog = Dog(name='Lucky', breed='Golden Retriever', color='gold') 
joshs_dog = Dog('Lassie', 'Border Collie', 'black and white')

jons_dog.display_info()
joshs_dog.display_info()
```
- Above, I printed a multi-line string. Note the indentation is specific when you print it out
- The `self` in front of the variables in the `__init__` method makes it an `instance` variable, meaning that it is available everywhere within that instance of the class. Don't confuse this with a `local` variable. A local variable is only local to the method it's defined in. Instance variables can go across methods



## Class Variables
- Let's take a look at the code below. Who can explain what is going on here?
```python
class Employee:
    number_of_employees = 0
    raise_amount = 1.04

    def __init__(self, first_name, last_name, pay):
        self.first_name = first_name
        self.last_name = last_name
        self.pay = pay
        self.email = f"{first_name}.{last_name}@email.com".lower()
    
        Employee.number_of_employees += 1 # This line will increase the class variable "number_of_employees" across all instances of the Employee class
    
    def apply_raise(self):
        self.pay = int(self.pay * self.raise_amount)

employee_1 = Employee('Jon', 'Young', 50000)
Employee.number_of_employees
employee_2 = Employee('Josh', 'Alletto', 51000)
Employee.number_of_employees
```