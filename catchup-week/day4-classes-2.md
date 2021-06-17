# Catch-up Week, Day 4: Classes Part II: Inheritance and Composition

## Introduction
---
[Yesterday](./day3-classes.md) (Classes Part I), we learned all about creating classes and instances.  Today we will learn how to do even more with classes.  

The real power of classes comes with two features: inheritance and composition.  We'll talk about each of them.

### Inheritance
---
Let's say that you are designing a personnel system and you need to represent different kinds of employees.  We will need lots of employees, so this sounds like the perfect use-case for classes.  We can create a template for each kind of employee, and then create instances as we need them.  Let's get started:

```python
class Programmer:
    def __init__(self, name, employee_id, department, languages):
        self.name = name
        self.employee_id = employee_id
        self.department = department
        self.languages = languages

class Accountant:
    def __init__(self, name, employee_id, department, certification):
        self.name = name
        self.employee_id = employee_id
        self.department = department
        self.certification = certification
```
*Begin dramatic re-enactment*

><i>Determined, you stare at the glowing screen through the gloomy haze.  A burning cigarette rests atop an old Mountain Dew Code Red can, your fingers luminescet orange from Dorito dust--so focused that you neglected to savor the flavor of that most delectable of programmer's delights.  Something gnaws at you.  Is is hunger?  No, Mom brought in sandwiches this afternoon.  Something else...  Suddenly, it hits you: you are repeating yourself.  Your arms go limp.  Your hands slide off the keyboard, into your lap, and off your boxer-briefs, to hang listlessly beside the cushion of your Secretlab OMEGA 2020 Stealth Gaming Chair.  They leave phosphorescent trail lines in the fabric of your boxer-briefs like the claws of a defeated tiger.  You hang your head in shame, recalling the last words of your treacherously assassinated guru sensai master: "Keep it DRY."</i>

*End dramatic re-enactment*

Do you see anything wrong with this?  So far, it looks like every employee will have a `name`, `employee_id`, and `department`.  If we have 50 different kinds of employees, we are going to end up repeating that information 50 times.  Not only that, but if we ever needed to add or change that basic information, we would have to do so in 50 different places.  Since our code should be DRY, we will need to take a different approach.

Fortunately, we can solve this problem with inheritance.  Inheritance is just sharing.  If I inherit from you, I can use your stuff.  If someone inherits from me, they can use my stuff.  

What does that look like in Python code?

Let's try and get all the common features of all employees.  In our case that is: `name`, `employee_id`, and `department`.  Once we have that, we can create a new class.  Let's call it `BasicEmployee`:

```python
class BasicEmployee:
    def __init__(self, name, employee_id, department):
        self.name = name
        self.employee_id = employee_id
        self.department = department
```
Now when we create `Programmer` and `Accountant` classes, we can use all of `BasicEmployee`'s stuff:

```python
class Programmer(BasicEmployee):
    def __init__(self, name, employee_id, department, languages):
        super().__init__(name, employee_id, department)
        self.languages = languages

class Accountant(BasicEmployee):
    def __init__(self, name, employee_id, department, certification):
        super().__init__(name, employee_id, department)
        self.certification = certification  
```

Let's create a `Programmer`:
```python
cp_grad = Programmer("Bob", 1234, "Development", ["Javascript", "Python"])
```
We can also check Bob's name, employee_id, department, and languages:
```python
print(cp_grad.name, cp_grad.employee_id, cp_grad.department, cp_grad.languages)
# Bob 1234 Development ['Javascript', 'Python']
```
`cp_grad` has everything that a `Programmer` has, plus everything that a `BasicEmployee` has.  This is because `cp_grad` "is-a" `BasicEmployee`. 

The call to `super()` is probably a little confusing.  Let's walk through it.

`BasicEmployee` needs three things to get going: `name`, `employee_id`, and `department`.  That means that a `Programmer` needs those three things, plus `languages`.  When we create an instance of `Programmer`, we need all four:
```python
cp_grad = Programmer("Bob", 1234, "Development", ["Javascript", "Python"])
```

But `name`, `employee_id`, and `department` don't directly belong to `Programmer`, they belong to `BasicEmployee`.  So we have to explicitly tell `Programmer` that the first three parameters really belong to `BasicEmployee`.  Don't worry, `Programmer` will still be able to use them as if they were its own properties, because `Programmer` "is-a" `BasicEmployee`.  That's what `super()` does.  It is basically just a reference to `Programmer`'s parent class `BasicEmployee`.


### Composition
---
If inheritance can be described as an "is-a" relationship (`Programmer` "is-a" `BasicEmployee`), then composition can be described as a "has-a" relationship.

Meet Lamassu:<br/>
![lamassu](readme/lamassu.png)

Lamassu is an Assyrian immigrant and retired palace guard who enjoys feeding pigeons and watching <i>The Price is Right</i> reruns.

Lamassu "has-a" bull body, "has-a" wing, and "has-a" human head.  Don't ask me what he <i>is</i>.

How could we represent such an uncommon creature with classes?  We could certainly try inheritance, but there might not be very much that Lamassu has in common with other animals.

Another approach is to use composition.  Let's try it out:

```python
class Wings:
    def __init__(self, num):
        self.num_of_wings = num

class Body:
    def __init__(self, girth, kind):
        self.girth = girth
        self.kind = kind

class Head:
    def __init__(self, kind):
        self.kind = kind

class Lamassu:
    def __init__(self, body_parts):
        self.body_parts = body_parts
```

The first three classes are body parts, and the fourth class is `Lamassu`.  You can make a `Lamassu` from all kinds of parts.

Let's make one:
```python
wings = Wings(2)
body = Body("very much so", "Bull")
head = Head("Human")

lam = Lamassu([wings, body, head])
```

Lamassu <i>has</i> all these things, but <i>is</i> not any of them.  Still, Lamassu can use all of his parts:
```python
print(lam.body_parts[1].girth)
```


## Exercises
---
#### 1. Model the bad guys in a video game <br/>
- The bad guys should share basic features, but there should be different kinds of bad guys with special abilities and traits.

#### 2. Model a Mechanic and a Car <br/>
- A Car should have a defect.  
- A mechanic should have skills.  
- A mechanic should also "have" the car while he works on it.  
- A mechanic should check if he can fix the car.  
- If he can, he fixes it.  
- The Car now has no defects.