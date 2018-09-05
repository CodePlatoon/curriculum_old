# Objects in Python
- `help(object_here)` will give you a bit of information on what type of object you're dealing with and some methods that are available to call on it
- The double underscore you see (`__`) is called a "dunder"
```python
# Creating a class is as simple as
class Car:
    pass

# If you want a class to inherit from another class
class Chevy(Car):
    pass

# But let's go back to the original
class Car:
    make = 'Chevy' # class variable
    model = 'Cruze' # class variable

    def display_info():
        print(f"You have a {make} {model}")

car1 = Car() # two ways of instantiating a Car
car2 = Car

# The `self` keyword
# You need `self` in order to refer the object to itself
class Company:
    name = 'Coding Temp'

    def intro(self):
        print(f"We are {self.name}")

ct = Company()
ct.intro() # "We are Coding Temple"

# Constructors
class Dog:
    def __init__(self, name, breed):
        self.name = name
        self.breed = breed

# Two ways of instantiating a Dog
dog1 = Dog(name='Lucky', breed='Golden Retriever') 
dog2 = Dog('Lassie', breed='Border Collie')

class Hardware:
    def __init__(self, h_type, make, model):
        self.h_type = h_type
        self.make = make
        self.model = model

macbook = Hardware('laptop', 'Apple', 'MBP')
# multi line string below
print(f"""Hardware Type: {macbook.h_type}
Hardware Make: {macbook.make}
Hardware Model: {macbook.model}
""")

class Employee:
    def __init__(self, first_name, last_name, salary):
        self.first_name = first_name
        self.last_name = last_name
        self.salary = salary
        self.email_address = f"{first_name.lower()}{last_name.lower()}@codingtemple.com"
    
    def apply_raise(self):
        self.salary *= 1.15
        
j = Employee('Jon', 'Young', 50000)
print(j.email_address)
print(j.salary)
j.apply_raise()
print(j.salary)
```

# Dunder methods (double underscore)
```python
class ListItem:
    def __init__(self, name):
        self.name = name
        self.quantity = 1
        
    def __str__(self): # when you usually print out an object (even in Ruby), you get its location in memory. this particular Dunder method returns a prettier print out of the object
        return f"<ListItem: {self.name}>"
```

# Class Variables
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
    
    # ...

employee_1 = Employee('Jon', 'Young', 123123)
employee_2 = Employee('Jon', 'Smith', 321321)
Employee.num_employees # would return 2
```

# Inheritance
```python
class Fruit:
    def __init__(self, name):
        self.name = name

class Berry(Fruit): # this is the way we do inheritance
    pass

strawberry = Berry('strawberry')
print strawberry.name # 'strawberry'
```

You can also pass in `kwargs` (keyword arguments) into the parent class:
```python
class Fruit:
    def __init__(self, name, **kwargs):
        self.name = name

        for k,v in kwargs.items():
            setattr(self, k, v) # basically self.k = v

class Berry(Fruit): # this is the way we do inheritance
    pass

strawberry = Berry('strawberry', color='yellow')
print strawberry.name # 'strawberry'
```

`super` is also available in Python inheritance: 
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

class Developer(Employee):
    raise_amount = 1.10

    def __init__(self, first_name, last_name, pay, language):
        super().__init__(first_name, last_name, pay) # This is so that you don't need to do all of those `self.first_name = first_name` things again. You also get all of the methods in the parent class
        self.language = language

developer_1 = Developer('Jon', 'Young', 123123, 'Ruby')
developer_1.first_name # 'Jon'
developer_1.apply_raise()
developer_1.pay # 123123 * 1.1
```

- keep track of employees for a manager
```python
class Manager(Employee):
    def __init__(self, first_name, last_name, pay):
        super().__init__(first_name, last_name, pay)
        self.employees = []

    def add_employee(self, first_name, last_name, pay):
        self.employees.append(Employee(first_name, last_name, pay))
    
    def add_developer(self, first_name, last_name, pay, language):
        self.employees.append(Developer(first_name, last_name, pay, language))
```

# Lambda Functions
- Anonymous functions / one-liner functions that are written slightly differently from traditional functions but do the exact same thing
```python
def square_number(number):
    print(number ** 2)

# in lambda format
square_number = lambda number: number ** 2

def add_numbers(number_1, number_2):
    print(number_1 + number_2)

# in lambda format
add_numbers = lambda num1, num2: num1 + num2

# You can also pass in entire functions as arguments in a lambda
def my_function(some_function, num):
    return some_function(num)

my_function(lambda x: x + 2, 3) # in this case, the `some_function` parameter is `lambda x: x + 2`. The answer to this would be 5
```

# Map
- Similar to Ruby's `map` functionality - iterates over an array and does something to each of them.
```python
# Let's start with creating a list between 0 and 9
map_list = [number for number in range(0, 10)] # or map_list = list(range(0,10))
print(map_list)
# [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# If we wanted to cube everything, we could probably just do this to get started
cubed_list = []
for i in map_list:
    cubed_list.append(i**3)
print(cubed_list)
# [0, 1, 8, 27, 64, 125, 216, 343, 512, 729]

# Another option below
[i**3 for i in mapList]
# [0, 1, 8, 27, 64, 125, 216, 343, 512, 729]

# But we want to learn how to use `map` and `lambdas` together
cubed_list = list(map(lambda x: x**3, map_list))
# we set a variable called cubed_list equal to a new list created on the right side of the equals sign. `map` takes in two arguments: the function that you're going to run and the array you are going to iterate over. We will `map` over a collection (iterate over every single element of the array) and save it as `x`. From there, we'll raise that number `x` to the third power.
print(cubed_list)
[0, 1, 8, 27, 64, 125, 216, 343, 512, 729]

# Let's create a few functions below
def multiply_numbers_together(x):
    return x * x

def add_numbers_together(x):
    return x + x

def square_the_number(x):
    return x ** 2
    
def cube_the_number(x):
    return x ** 3

functions_to_apply = [multiply_numbers_together, add_numbers_together, square_the_number, cube_the_number]

for index in range(5): # iterate from 0 to 4, save `index` as that number
    value = list(map(lambda x: x(index), functions_to_apply))
    print(value)

# [0, 0, 0, 0] # index is 0
# [1, 2, 1, 1] # index is 1
# [4, 4, 4, 8] # index is 2
# [9, 6, 9, 27] # index is 3
# [16, 8, 16, 64] # index is 4
```

# Filter
- Same thing as map, but instead of doing something over all of the elements of a list, you are only selecting (or `filter`-ing) the things that turn out to be true over the elements of the list
```python
filter_list = list(range(1, 51)) # create a list of numbers between 1-50
evenly_divisible_by_2 = list(filter(lambda number: number % 2 == 0, filter_list))
print(evenly_divisible_by_2)
# [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48]
```

# Regular Expressions
- `import re` at the top of the file. `re` stands for Regular Expressions and it brings in the regular expression Python library into your file
- It's recommended for you to use `raw strings` instead of regular Python strings by prepending your string with `r` (e.g., `r("Hello\n\n")`). These raw strings will interpret the escaped characters as literally escaped characters, rather than Python's usual treatment of them as new line characters
```python
import re

# re.search() will search a string you pass in to see if it matches the regex pattern you have
string = 'June 24'
regex_pattern = r"([a-zA-Z]+) (\d+)" # any combination of letters, capital or not, followed by a space, followed by a digit of any length

re.search(regex_pattern, string) # returns a `match` object with the thing that's matched up. This matches anywhere in the string
re.match(regex_pattern, string) # same as above, but this matches the string starting from the beginning. only returns the first match
re.findall(regex_pattern, 'June 24 August 1 December 22') # this returns a list of all matches

# Another example
regex = r"[a-zA-Z]+ \d+"
matches = re.findall(regex, "June 24, August 9, Dec 12")
for match in matches:
    print(f"Full match: {match}")

# Find and replace
replaced_string = re.sub(pattern, replacement_pattern, input_str, count, flags=0)
regex = r"([a-zA-Z]+) (\d+)"

print(re.sub(regex, r"\2 of \1", "June 24, August 9, Dec 12")) # 24 of June, 9 of August, 12 of Dec
```
- [Great Tutorial](https://www.datacamp.com/community/tutorials/python-regular-expression-tutorial)
- [RegexOne](https://regexone.com/references/python)
