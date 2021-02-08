# Python Fundamentals

- Originally came out in 1991
- Python is a dynamically-typed, high-level language, meaning that variable types can change (i.e., I can set `some_variable = 'string'` and then change `some_variable = 1` or `some_variable = False` in the same program
  - In statically-typed lanuages like Java or C, you have to declare what type of data that variable can hold ahead of time. After you declare it, it can't be changed again
- Programming languages can be high or low level languages
  - Low-level languages are languages that connect very closely with your computer's CPU.
    - Pros: Fast. Games are generally developed in lower level languages because they need to worry about frames per second
    - Cons: Tedious - you have to manually do everything including assigning variables to memory addresses on your computer, more difficult to learn and write code
  - High-level languages are languages that are further removed from your computer's CPU. There is generally an interpreter between what you type and the code it compiles into in order to talk to your computer's CPU
    - Pros: Easier to write code, faster development cycles as a result
    - Cons: A bit slower since it doesn't work too closely with your CPU
  - Most people do not need to worry about performance at this scale so a high level language is a better choice. It's easier to learn and faster to get something off the ground.
- **NOTE**: Proper Python indentation is absolutely mandatory. You will get syntax errors and your code will not execute if indentation is not perfect

## Arithmetic Operations

- Arithmetic is pretty much the same in all languages. Below are all of the operators:
- `+` = addition
- `-` = subtraction
- `*` = multiplication
- `/` = division, returns decimals (e.g., `3/2` would return `1.5`)
- `//` = division, but rounds down (e.g., `3//2` would return `1`)
- `**` = exponent (e.g., `2**3` is "two to the third power")
- `%` = modulus or remainder (e.g., `5 % 2` would return `1`, because 3 divided by 2 is 2 remainder `1`)

## Variables

- We're going back to Algebra I - variables store values
- Values are assigned to variables using the `=` operator, not to be confused with the `==` sign. The `==` is there to compare if something is equal
- Variables are snake cased, which means each new word is separated by underscores and everything is lowercased (e.g., `this_is_a_snakecased_variable = 123` or `first_name = 'Jon`)

## Strings

- Anything enclosed in single or double quotes

```python
'this is a string'
"This 123123123123 is also a string"
```

- Use single quotes when you are not interpolating, double quotes when you are interpolating
- Interpolation is when you substitute a variable into a string. In Python 3, we have the ability to add `f` to the start of a string and you can directly interpolate with the hash tags between the variable. `f` stands for "format"

```python
first_name = 'Jon'
print(f"My first name is {first_name}")
```

- Reminder: Python strings are immutable

## Numbers

- Similar to most other languages, `integers` are whole numbers, `floats` are decimals

## Booleans

- `True` / `False`

## Comments

- Start with a pound sign `#` and extend to the end of the line
- Python will ignore all of this code. It's useful to future readers (including the author and other developers)

## Printing/Getting User Values

- `print('Hello')` will print out the string 'Hello' to the screen
- `user_response = input('How are you today?')` will get a response from the user and save it to the variable `user_response`

## Conditional Logic

- You get to control how a computer goes through your program by using conditional logic (true/false)
- Similar to English, it's basically a bunch of if/ else if / else logic. Here's how basic if/else logic looks:

```python
age = 18
if age >= 21:
    print('Welcome to the bar')
else:
    print('Come back when you are older')

# Sometimes, you can drink if you are in another country if you're 18. Let's account for that.

current_country = 'China'
if age >= 21:
    print('Welcome to the bar')
elif age >= 18 and country == 'China':
    print('You can drink in China starting at age 18!')
else:
    print('Come back when you are older')
```

## Loops

- Loops are very popular in coding. They are basically instructions for your computer to do things over and over again
- Python uses two loops: `while` and `for`

```python
# A while loop will execute a piece of code over and over again until the condition is true
age = 12
while age < 21:
    print(f"You are not old enough yet - you are only {age} years old! Come back when you are older.")
# beware of infinite loops! What is going on above?

# This would be better:
age = 12
while age < 21:
    print(f"You are not old enough yet - you are only {age} years old! Come back when you are older.")
    age += 1
```

- `for` loops are a bit different. It's a way for you to iterate over everything in a list, tuple, string, dictionary, etc.

```python
fruits = ['apple', 'banana', 'cherry']
for fruit in fruits:
    print(fruit)

# each time we iterate over the fruits list, we save the current string as the variable fruit and print it out

```

- If you wanted to see whether something is in a list, you will use the `in` function that is built into Python:

```python
names = ['Jon', 'Rod', 'Josh']
'Jon' in names # would return True
```

## Functions

- Functions and methods are synonymous
- It's a program that does the same thing every time. Write it once, execute it over and over again

```python
def say_hello(first_name):
    print(f"Hello there, {first_name}!")

say_hello('Jon')
# Here we have a method called `say_hello` that takes in a single parameter/argument called `first_name`. We passed in `Jon` as the argument, so `Jon` gets saved as `first_name` when we run through the code. We can then interpolate `first_name` into the string that gets printed out.
```

## Data Types: Arrays/List

- Holds an ordered list of values. These values can be anything: strings, numbers, dictionaries, even other lists!
- Once you put something in an array, it stays at that place forever until you alter the array. You can rely on it always being there. Think of an older person's pill box - the pills for Monday are in the Monday slot. If they were to shake it or drop it or something, it wouldn't matter. Those pills are still at the same place.
- You can access the values in the array by using their `index`. We start counting from 0 and go up from there

```python
days_of_the_week = ['mon', 'tues', 'wed', 'thurs', 'fri']
# Remember, computers start counting at 0 and move up from there
days_of_the_week[3] # "thurs"
```

- If you need to make a copy of a list, here are two popular choices

```python
new_list = old_list[:] # OR
new_list = list(old_list)
```

- Click [here](https://www.w3schools.com/python/python_ref_list.asp) to see useful Python list methods

## Data Types: Dictionaries / Hashes / Objects

- It's a collection of key/value pairs. You can't access it by `index` like with lists because dictionaries do not have an order, but you can access it by `key`
- Useful for things like VIN numbers or social security information where the keys are completely unique

```python
# below, we have a hash called user that has a name/age key on the left and values on the right
user = {
    'name': 'Jonathan',
    'age': 30
}

# you can also write this same hash as
# user = dict(name='Jonathan', age=30)

# To access a particular key's value:
print(user['name'])

# If you want to delete a key/value pair, use "del"
del(user['age'])
user
user['age'] = 28
user
```

- Visit [here](https://www.w3schools.com/python/python_ref_dictionary.asp) to see useful Dictionary methods

## Data Types: Tuples

- Tuples are sequences of Python objects that are immutable

```python
tuple_1 = ('One', 'Two', 'Three', 'Four')
tuple_1[3] # 'Four'

# Updating / Adding Values
tuple_2 = ('Five', 'Six', 'Seven', 'Eight')
tuple_1 + tuple_2 # ('One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight') This returns a new tuple, but does not alter original

# Deleting a Tuple
# Psych! You can't delete a tuple. You can only overwrite it
```

- Visit [here](https://www.w3schools.com/python/python_tuples.asp) to see useful Tuple methods
