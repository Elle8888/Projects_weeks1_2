# {{PROBLEM}} Method Design Recipe

``` 
Design a method that will check if text includes the string #TODO

```

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can keep track of my tasks
> I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
todo = contains_todo?(text)

* todo is a boolean returns true if the text contains #TODO, otherwise returns false
* text is a string, containing the word #TODO (e.g. "laundry #TODO)

```
## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby

contains_todo?("laundry#TODO") => true
contains_todo?("shopping") => false
contains_todo?("") => false
contains_todo?(8) => raised error "not a string"
contains_todo?(nil) => raised error "not a string"

```
_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behavior

_After each test you write, follow the test-driving process of red, green, refactor to implement the behavior._