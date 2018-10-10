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

## SQL's Underscore Wildcard
- Let's say that you wanted to find a record in a database that started with some random letter, but had the letters "re" right afterwards, followed by anything else. That SQL query would look like:
```sql
SELECT * FROM table_name
    WHERE column_name =  '_re%'
```
- The underscore is a singular occurence of a random character. More information can be found [here](https://www.w3schools.com/sql/sql_wildcards.asp)