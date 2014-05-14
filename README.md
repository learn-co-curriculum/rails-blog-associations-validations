---
tags: rails, associations, validations, join tables, strong params, WIP
language: ruby
resources: 3
---

# Rails Blog Associations and Validations

Second lab iteration off of [Rails Blog Scaffold](https://github.com/flatiron-school-curriculum/rails-blog-scaffold/tree/master)

## Initial Setup

This lab requires passing controller and model specs. We've already built many of them out, but in order to migrate the database, some needed to be commented out. Uncomment the model specs (`post_spec.rb`, `tag_spec.rb`, `user_spec.rb`), and the factory (`posts.rb`). The Controller specs will be generated when you scaffold, and you will need to get them to pass by adding more `valid_attributes` as per what you end up permitting in your params.

## Migrations, Associations, and Routes

1. Change migration for Post to include content (make content text to account of character length).
2. Create migration, model, controller, and views for User and Tag (via scaffolding).
3. In order to create the appropriate associations between Post and Tag, we need to create a join table as well.
4. Build out model associations.
5. Be sure to make the appropriate routes. For now, they can be resources.
6. `create` the database, `migrate` the schema, and `seed` it.

## Validations

Active Record has handy methods you can place on columns in a table to validate certain attributes, like presence, length, and uniqueness. These are called on a controller. Check out the [documentation](http://guides.rubyonrails.org/active_record_validations.html) to see more.

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

Build out the forms for creating a new user, post, and tag and make the tests pass.

## Adding tags to a post

You've got a great post on kittens that was generated via the seed file, but you want to add some tags, for a later feature that will help readers search for posts. Create a form on the posts show page that lists all the tags as checkboxes that.

Check out the documentation for the `collection_check_boxes` form helper [here](http://edgeapi.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-collection_check_boxes) and this post on strong params to be able to make the association between Post and Tag via the Post_Tag join model [here](http://stackoverflow.com/questions/16549382/how-to-permit-an-array-with-strong-parameters).