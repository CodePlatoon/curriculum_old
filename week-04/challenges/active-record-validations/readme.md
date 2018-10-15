# Active Record Validations

More than just preventing "bad" or "incomplete" data an application's models can enforce domain rules & requirements. Most applications take a layered approach to data integrity.

### Interface
At the outmost layer, you have the program's interface, e.g. an HTML form that only allows a user to enter an email address that contains `@`.

### Model
The next level of validation is often performed by the application's models. One approach might be to overwrite the `.save` method like so:

```ruby
class Person
  def save
    raise "First name cannot be blank" if first_name.blank?
    
    # save if no validation errors
    super
  end
end
```

While this works, it isn't very scalable. [ActiveRecord](http://guides.rubyonrails.org/active_record_validations.html) takes a different approach.

### Database
The final level of validation is usually performed by the database. Often with `NOT NULL` constraints or particular column types (`integer` vs `varchar(255)` or `char(14)`).

Model level validations are such a common use case, ActiveRecord comes with a number of built-in validation, including a mechanism for generating feedback (error message) that are human friendly.

## Challenge

This challenge includes two models, `Foo` and `Bar`. Follow the tests in `spec/models/foo_spec.rb` and `spec/models/bar_spec.rb`, adding any missing validations using those provided by [ActiveRecord](http://guides.rubyonrails.org/active_record_validations.html)

Most validations can be implemented by using those provided by ActiveRecord, but for some tests you'll need to create your own validation methods.


