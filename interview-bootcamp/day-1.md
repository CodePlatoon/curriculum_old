
## Interview Bootcamp

### Big O Notation
- Describes how long it takes to run your function based on the size of the input you put in
- The question this is answering is "How does the runtime of this function grow as input grows?"
  - Runtime is the time it takes to execute a piece of code
- Time complexity is a way of showing how the runtime of a function creases as the size of the input increases

## Constant Time Complexity
- It takes the same amount of time no matter what
- The big O notation is `O(1)`
- Example: `array[0]` is always going to take the exact same amount of time to execute every time, regardless of how big or small `array` is.

## Linear Time Complexity
- As the size of your input grows, it'll take a correspondingly larger amount of time to run through your function
- The big O notation is `O(n)`. `n` is the size of your input
- If your algorithm is `Do this. When you're done, do that`, you add the runtimes together O(A+B). This ends up being closer to `O(n)`
- Example:
```python
colors = ['red', 'blue', 'green']
for color in colors:
  print(color)

# This is O(n) because your output is reliant on how large the input in. If it's super small, it takes a small amount of time to run. If it's large, the it takes a long time to run.
```

## Quadratic Time Complexity
- The big O notation is `O(n^2)`
- If your algorithm is `Do this for each time you do that` (loop within a loop), you will generally have quadratic time complexity.
- Example:
```python
numbers = [1,2,3,4,5]
def all_combinations_of_numbers(numbers):
  results = []
  for number_1 in numbers:
    for number_2 in numbers:
      results.append([number_1, number_2])
  return results

# The input (n) is 5 numbers. The number of times the loop runs is 25 times or (n^2)
```

## Recursion Time Complexity
- The big O notation is `O(2^n)`
- Usually not the best solution in a production environment as compared to a linear solution because you're limited to the stack space that your process is running on. With many other things running at the same time, you will easily max that stack space out
- Anything that you can do recursively, you can do iteratively
  - Consider doing a bottom up approach instead of recursion where you build a collection starting from the bottom and use elements in that collection rather than calculating something new every time. Only keep track of the things that you need to keep track of rather than allocating more space to keep track of everything in the collection
- Example: factorial. Let's go over this together.

# Space Complexity
- Space Complexity is how much space in memory you need to use in order to solve the problem
- Every variable that you create is another bit of space that your program uses
- Example: Bubble Sort is O(1) space complexity because it doesn't create anything new. It just alters the original
- Example: You add the numbers 1-N to an array. It requires O(n) space complexity because the space complexity grows as the input grows


# General Interview Notes

**Behavioral**
- Be you. People may not be able to read BS right away, but they can certainly tell if you're a genuine person
- Practice your behavioral interview questions a lot. You'll get a lot of variations of the questions we did in class but overall, you should have the basics of the answer.
- Know your resume very well
- Be able to speak on your personal and group projects
- Have good questions to ask at the end of the interview
- The key thing that senior engineers are looking for is passion. That passion should come through in your voice and your answer. If you have it, amp it up. If you don't, practice lying.

**Technical**
1. Ask questions to define the scope of the problem you've been assigned
  - For example if you've been asked to sort a list of numbers, clarify if the numbers are positive or negative. Ask if it's just integers or if it includes floats. Are there non-integer elements in your array? How large is it?
2. Spit off your thought process and if you have an idea of the space or time complexity, talk about it. If you're not comfortable with these topics, either get better at them or leave it off your interview.
3. Implement a terrible solution and WRITE CODE. Do not get to the end of the interview without writing code!
4. Test your terrible solution with a...
  - Small valid input
  - Large valid input
  - Small invalid input
  - Large invalid input
4. Optimize
  - Ask your interviewer what they'd like for you to optimize
