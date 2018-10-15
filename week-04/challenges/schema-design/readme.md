# Schema Design

In this challenge you'll be designing schemas for three different applications. Use the online tool [Quick Database Diagrams](https://www.quickdatabasediagrams.com) to design your schemas.

Some conventions to keep in mind as you design your schemas:

* Always name your tables as plural nouns
* All identifiers (table names & columns should be lowercase)
* Each table should have an integer primary key named `id`.
* Foreign keys end with a `_id` suffix
* Foreign keys should usually be named as the singular form of the other table, e.g. `product_id` is a foreign key that links to the `id` column of the `products` table.
* Don't repeat the same data in more than one table.
* Avoid storing more than one type of record per table. E.g. don't store a user's address in the users table.


Keep in mind these services have been around for years and you won't have time to design a schema that covers their entire feature set. Your aim is to design a schema that could support the feature set you imagine they launched with, not the one they have today.

Start designing with pen & paper or a whiteboard. Then transfer your design to [Quick Database Diagrams](https://www.quickdatabasediagrams.com).

Each schema design prompt includes some of the models you might consider including. Don't consider this list to be final or even correct. Imagine the typical use cases and ensure you have the tables to support those.

## GrubHub Online Ordering

* order
* restaurant
* menu item
* user

## Blue Apron

* user
* service plans
* recipe
* promotion
* delivery

## Instagram

* user
* post
* comment
* like
* follow


