---
tags: rails, associations, validations, join tables, WIP
language: ruby
---

# Rails Blog Associations and Validations

Second lab iteration off of [Rails Blog Scaffold](https://github.com/flatiron-school-curriculum/rails-blog-scaffold/tree/master)

## Migrations and Associations

1. Change migration for Post to include content (instead of string it should be text).
2. Create migration, model, controller, and views for User and Tag.
3. In order to create the appropriate associations between Post and Tag, we need to create a join table as well.
4. Build out model associations.

## Validations

Active Record has handy methods you can place on columns in a table to validate certain attributes, like presence, length, and uniqueness.

Let's add the following validations on:
1. Posts for the presence of both name and content
2. User for uniqueness of name
3. Tag for presence of name

## Adding a tag to a post

You've got a great post on kittens, but you want to add some tags. Create a form on the posts show page that lists all the tags as checkboxes.