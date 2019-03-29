# Persistence

Most of the programs you've written up until now have have lacked any _real_ method of persistence. That is to say, you've been writing to a CSV file rather than a real database.

This week we're going to focus on writing programs that save their output by reading from and writing to a Relational Database Management System (RDBMS). You might hear this type of database called a "SQL database", after the language (Structured Query Language) that's commonly used to query a relational database.

## Why Use a Database?

Before we just jump into a new technology we should pause and ask ourselves if we have a simpler option available? You'll soon see that combining an RDBMS, SQL and Python is no small feat.

One option we always have available is reading & writing from a text or CSV file. Let's imagine storing a school's database of students in text files. We could store one file per student, naming each file with the student's school id number:

```
data/
  321-531.json
  934-894.json
  947-189.json
```

Each file might contain the student's entire school record:

```json
{
  "first_name": "Meghan",
  "last_name": "Remy",
  "birthdate:" "09/13/87"
  "address": {
    "line_1": "234 Maple St.",
    "city": "Chicago",
    "state": "IL",
    "zip": "60657"
  },
  "classes": [
    "CS 101",
    "HIST 107",
    "SPAN 210",
    "PHYS 218",
    "ART 118"
  ]
}
```

If the only use case for the school database was retrieving a student's record by their school id, this persistence design might be exactly what we need. In fact the entire lookup program could be written as such:

```python
import 'json'

print("** WELCOME TO THE ACME SCHOOL DATABASE **")

id = raw_input('Enter a student id: ')

filename = "data".join("#{id[0..3]}-#{id[3..6]}.json")

student_data = json.loads(open(filename, 'r'))
print(f"{student_data['first_name']} {student_data['last_name']}")
print(f"Birthdate: {student_data["birthdate"]}")

for address in student_data["address"]:
  print("Mailing Address")
  print(f"{address['line_1']}")
  print(f"{address['city']}, {address['state']}")
  print(f"{address['zip']}")

print("Classes")
for class_name in student_data["classes"]:
  print(f"{class_name}")
```

But consider how we'd have to modify our program to support these additional use cases:

* Finding a student record by name instead of id number
* Listing all the students enrolled in a particular course
* Finding the number of students whose birthday is in the next month

You should be realizing that our persistence approach of one file per student isn't very flexible. It's a great fit for some use cases and cumbersome fit for others. These design pains were felt almost as soon as software developers began to solve real world problems with software. They found a hierarchical, file focused approach to persistence limiting.

You might have also heard of NoSQL databases. These are generally schema-less databases that don't speak SQL. Don't get to thinking one type of database is better than another, there's a time & place for each type of database.

## A Relational Approach

The solution proposed in 1970 by E.F. Codd in his paper ["A Relational Model of Data for Large Shared Data Banks"](http://www.seas.upenn.edu/~zives/03f/cis550/codd.pdf) was the genesis of what we consider an RDBMS today. You might read the paper if you're feeling extra curious, but if not, here are some choice quotes from the abstract:

> Future users of large data banks must be protected from having to know how the data is organized in the machine (the internal representation).

Translation: We need some flexible persistence mechanism that insulates users (and our code) from exactly how the data is stored.

> Activities of users at terminals and most application programs should remain unaffected when the internal representation of data is changed and even when some aspects of the external representation are changed. Changes in data representation will often be needed as a result of changes in query, update, and report traffic and natural growth in the types of stored information.

> Existing noninferential, formatted data systems provide users with tree-structured files or slightly more general network models of the data. In Section 1, inadequacies of these models are discussed.

Translation: Existing hierarchical tree approaches to persisting & organizing data aren't adequate.

The relational approach to our student record system means we'll be storing our data in tables with columns & rows. Each table will store a different type of record. We'd likely design our schema of tables like so:

**students** |
--- |
id |
first_name |
last_name |
birthdate |
address_id |

**addresses** |
--- |
line_1 |
city |
state |
zipcode |


**classes** |
--- |
id |
name |
credits |

**enrollments** |
--- |
id |
student_id |
class_id |
grade |


In contrast with our earlier hierarchical approach, an RDBMS approach is flat. While there are connections between rows in different tables (these are called foreign keys), there isn't a fixed final form. We're able to retrieve records from one or more tables, mixing the data to fit the question we're trying to answer.

By separating our records into different tables that only contain the fields for a particular type of record, we can avoid committing to any single structure. This flexibility is one of the key features of an RDBMS.


In an RDBMS with our new schema we can support the use cases we couldn't with our file based approach. Here are the solutions in SQL:

* Find a student record by name instead of id number

```sql
SELECT * FROM students WHERE last_name = 'Garvis';
```

* List all the students enrolled in a particular course

```sql
SELECT * FROM students LEFT JOIN enrollments ON student.id = student_id WHERE class_id = 4;
```

* Find the number of students whose birthday is in the next month

```sql
SELECT count(*) FROM STUDENTS WHERE birthdate >= 2017/01/01 AND birthdate <= 2017/01/30;
```

## Additional RDBMS Benefits

A modern RDBMS (Postgres, MySql, MS SQL, Oracle, etc) can do more than just store our data. Additional benefits include:

### Scaling
Modern database servers allow multiple users to query & update records at the same time so our programs can scale.

### Data Validation
They can also validate records, preventing incomplete or incorrect data from entering a system. For example, if `birthdate` is a required column, the database won't let us `INSERT` a row in the `students` table without a value for `birthdate`.

### Data Integrity
With features like transactions & locking, we can ensure that critical updates like debiting one bank account only succeeds when crediting another also succeeds.

### Filtering & Searching
Things we take for granted today like only returning records that match a certain criteria or summing a particular column are all standard features of database servers.
