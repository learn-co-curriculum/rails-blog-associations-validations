# Rails Blog Associations and Validations

This is the second lab iteration off of [Rails Blog Scaffold](https://github.com/learn-co-curriculum/rails-blog-scaffold/tree/master).

*Remember*: when you generate models, controllers, etc., be sure to include the `--no-test-framework` option so that it skips tests (which the labs already have).

## Objectives:
- Add a column to an existing table.
- Generate models, views, and controllers.
- Create associations between models.
- Define proper routes.
- Add validations.

## Migrations, Associations, and Routes

1. Change the migration for `posts` to include `content` (set `content`'s datatype to `text` to account for character length).
2. Create a migration, model and controller for `User` and `Tag` (via `rails generate`). Check out the documentation on [generators](http://api.rubyonrails.org/classes/Rails/Generators.html), and remember to skip adding tests.
3. In order to create the appropriate associations between `Post` and `Tag`, we need to create a join table as well.
4. Build out model associations and migrations.
5. Be sure to create the appropriate routes. For now, they can be written as `resources`.
6. `create` the database, `migrate` the schema, and `seed` it.
7. Make the model association tests pass.

## Validations

Active Record has handy methods you can place on columns in a table to validate certain attributes, like `presence`, `length`, and `uniqueness`. These are called in a model. Check out the [documentation](http://guides.rubyonrails.org/active_record_validations.html) to see more.

Let's add validations to...

1. `Post` for the `presence` of both `name` and `content`
2. `User` for the `uniqueness` of `name`
3. `Tag` for the `uniqueness` of `name`

Active Record handles errors when validations aren't met via user input on our forms. Take a look at what's happening in the partial `_form.html.erb` for users, which was created when we used Rails's scaffold generator:

```erb
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

1. Build out the forms for creating a new post.

  ## Adding tags to a post
  
  You've got a great post on kittens that was generated via the seed file, but you want to be able to add some tags. Create a form on the posts form page that lists all the tags as checkboxes, allowing a user to select multiple tags.
  
  Check out the documentation for the `collection_check_boxes` form helper [here](http://edgeapi.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-collection_check_boxes) and this post on strong params to be able to make the association between Post and Tag via the Post_Tag join model [here](http://stackoverflow.com/questions/16549382/how-to-permit-an-array-with-strong-parameters).

2. Make the tests in `features/tags_for_posts_spec.rb` pass.

## Resources

[Active Record Validations](http://guides.rubyonrails.org/active_record_validations.html)

[Check Boxes](http://edgeapi.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-collection_check_boxes)

[Strong Params Array](http://stackoverflow.com/questions/16549382/how-to-permit-an-array-with-strong-parameters)

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/rails-blog-associations-validations' title='Rails Blog Associations and Validations'>Rails Blog Associations and Validations</a> on Learn.co and start learning to code for free.</p>
