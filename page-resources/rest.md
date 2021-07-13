| HTTP Method | URI / Route    | Controller action | What it does                                                                                          |
|-------------|----------------|-------------------|-------------------------------------------------------------------------------------------------------|
|             |                |                   |                                                                                                       |
| GET         | /dogs          | index             | Lists all dogs on an index page                                                                       |
| GET         | /dogs/new      | new               | Presents you a form to create a new dog                                                               |
| GET         | /dogs/:id      | show              | Finds the dog by the :id in the URI and shows that specific dog's page                                |
| GET         | /dogs/:id/edit | edit              | Finds the dog by the :id in the URI and shows that specific dog's page                                |
|             |                |                   |                                                                                                       |
| POST        | /dogs          | create            | Creates a dog in the database, generally redirects you to that dog's specific page                    |
|             |                |                   |                                                                                                       |
| PUT         | /dogs/:id      | update            | Finds the dog by the :id in the URI, updates that record in the database, redirects to the dog's page |
|             |                |                   |                                                                                                       |
| DELETE      | /dogs/:id      | destroy           | Finds the dog by the :id in the URI, deletes it from the database, redirects to index page            |
