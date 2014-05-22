---
tags: rails, associations, validations, join tables, strong params
language: ruby
resources: 3
---

# Rails Blog Associations and Validations

Second lab iteration off of [Rails Blog Scaffold](https://github.com/flatiron-school-curriculum/rails-blog-scaffold/tree/master)

## Migrations, Associations, and Routes

1. Change migration for Post to include content (make content text to account of character length).
2. Create migration, model, controller, and views for User and Tag (when generating models, run `rails g model [model_name] --skip spec/models/[model_name]_spec.rb`, because we already have model unit tests to test our validations).
3. A User has a name, and a Tag has a name.
4. In order to create the appropriate associations between Post and Tag, we need to create a join table as well. Remember, join tables only have foreign keys for the tables its joining.
5. Build out model associations.
6. Be sure to make the appropriate routes. For now, they can be written as `resources`.
7. `create` the database, `migrate` the schema, and `seed` it.

## Validations

Active Record has handy methods you can place on columns in a table to validate certain attributes, like presence, length, and uniqueness. These are called in a model. Check out the [documentation](http://guides.rubyonrails.org/active_record_validations.html) to see more.

Let's add the following validations on:

1. Posts for the presence of both name and content
2. User for uniqueness of name
3. Tag for presence and uniqueness of name

Active Record handles errors when validations aren't met via user input on our forms. Take a look at what's happening in the partial `_form.html.erb` for users, which was generated when we scaffolded:

```
<%= form_for(@user) do |f| %>
  <% if @user.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@user.errors.count, "error") %> prohibited this user from being saved:</h2>

      <ul>
      <% @user.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
    </div>
  <% end %>
```

Build out the forms for creating a new user, post, and tag and make the tests pass (run `rspec`).

## Adding tags to a post

You've got a great post on kittens that was generated via the seed file, but you want to be able to add some tags. Create a form on the posts form page that lists all the tags as checkboxes, where a user can select multiple tags.

Check out the documentation for the `collection_check_boxes` form helper [here](http://edgeapi.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-collection_check_boxes) and this post on strong params to be able to make the association between Post and Tag via the Post_Tag join model [here](http://stackoverflow.com/questions/16549382/how-to-permit-an-array-with-strong-parameters).

## Resources

[Active Record Validations](http://guides.rubyonrails.org/active_record_validations.html)

[Check Boxes](http://edgeapi.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-collection_check_boxes)

[Strong Params Array](http://stackoverflow.com/questions/16549382/how-to-permit-an-array-with-strong-parameters)
