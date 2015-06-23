#Objectives:
- Add a column to an existing table via a migration.
- Generate scaffolds for User and Tag, creating models, views, controllers.
Before
- Create associations between Post and Tag via a join table.
- Define proper routes.
- Add validations to your models.

The first thing we need to do is add a `content` column to our `posts` table. Open up your `db/migrate/create_posts` and update the `change` table to look like the following. 

```ruby
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :content

      t.timestamps null: false
    end
  end
end
```

We now need to run `rake db:migrate RAILS_ENV=test`, to migrate our  changes to the test database. 

The next thing we need to do is create migration, model, controller, and views for User and Tag, so let's start with our `user`. If we look in `spec/models/user_spec.rb` we can see that our `user` only needs a name attribute. In your command line run the following code.
`rails generate resource user name:string --no-test-framework`. Here we are using the resource generator which will give us a model, view and controller for our new `user` class. Make sure to add the `--no-test-framework` flag to skip the default rails test suite, we will be using `rspec` instead.

Next we need to generate tags for our application. If we look into our spec folder, we will see that tags just have a name as well. In your console run  `rails generate resource tag name:string --no-test-framework`. 

In order to create the appropriate associations between `post` and `tag`, we need a join table that we will call `PostTag`. In your console run `rails generate model PostTag post_id:integer tag_id:integer --no-test-framework`. In this case we did not generate a resource since we do not need views, or a controller. To make the associates, we will do that in the `PostTag` model, which is the only file we need. Now you can run `rake db:migrate RAILS_ENV=test` to add you changes to the database. 

Now that we've migrated, we can run `rspec` and begin working on our tests. The first thing we want to focus on is your models.
###CHANGE FOLDER NAMES SO THEY RUN IN ORDER.
###CONFUSING WHEN TO BUILD ASSOCIATIONS

The first thing we want to do is creat our associations between `User` and `Post`. If we thing about how a blog works, a user can `have_many` posts and a `Post` `belongs_to` a `User`. Open up `models/post.rb` and `models/user.rb` and create the following associations.

```ruby
class User < ActiveRecord::Base
	has_many :posts
end
```

```ruby
class Post < ActiveRecord::Base
	belongs_to :user
end
```
There is one more thing we need to do to make this work. Since `posts` belong to a single `user`, they will have what is a called a `foreign_key` to associate them to that user. This way we can do things like `User.posts.all`. That `foreign_key` lives in a column in the database, but currently does not exist. So let's create it with a migration. In your console run `rails generate migration AddUserToPost user_id:integer`. Open up `db/migrate/add_user_to_post` and you can see your new migration.  Now we can run `rake db:migrate RAILS_ENV=test`. 

###Association Tips
Any class that has a `belongs_to` will have a `foreign_key`.
When you use `AddTableNameToTableName attribute:type`, by convention rails looks for that table and tries to add the column that you've supplied.

So now that we've migrated, let's run `rspec`. We cna see that we have a few green tests, great!. 

###Post Specs
`post is invalid if it has no name`
`post is nvalid with no content`

Our validation errors will be handled in the models. Open up `models/post.rb` and add the following associations. Here we are handling both errors for name and content in one statement.

```ruby
class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :content
end
```

`post should have many tags`
In order for a post to have many tags, we have to form an association between the two. In `models/posts.rb`, we need to add two lines of code. The first is `has_many :post_tags`, which is our join table. We then can say, `has_many :tags, :through => :post_tags`. In our `PostTag` model we need to add the other side of the association, which you can see below. Take a look at the <a href="http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association">rails guides on associations</a> for a great visualization of what is going on here.

```ruby
class Post < ActiveRecord::Base
  belongs_to :user
  
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content
  
end
```

```ruby
class PostTag < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag
end
```
Great, now all of our `Post` tests should be passing.

Let's run `rspec` and move on to our `Tag` specs.

`tag is invalid if name already exists`
`tag has many posts`


###Tag Specs
Adding the correct validations and associations to `models/tag.rb`, your code should look like the following. 

```ruby
class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :post_tags

  validates_uniqueness_of :name
end
```
For our validation, we are checking for uniqueness. If you tried to create a duplicate tag, it would throw an error saying that tag already exists. Our associations are similar to the way we set up `Post`, adding the join table of `post_tags` then associating `posts` through `post_tags`.

###User Specs

`invalid with no name`
`invalid if name already exists`

```ruby
class User < ActiveRecord::Base
  has_many :posts

  validates_uniqueness_of :name
  validates_presence_of :name
end
```
At this point it would be a good time to visit our browser to see what our application looks like. Start up your server by typing `rails s` in your console. Visit `localhost:3000/posts/new`. You should get a routing error that says `No route matches [GET] "/posts/new"`. If you run `rake routes`, you will see all of the routes we have defined. We will also notice that we do not have any routes for our `posts` controller, so let's create them now. Open up `config/routes.rb`. You should already see routes defined for `users` and `tags`, let's add in `posts` as well. Resources is a method that gives you all of the CRUD routes that you need. Take a look at the <a href="http://guides.rubyonrails.org/routing.html">rails guides on routing</a> for more information on how routes work.

```ruby

RailsBlog::Application.routes.draw do

  resources :users
  resources :tags
  resources :posts
end
```

###`can create a post without adding tags`
If you visit `localhost:3000/posts/new` you can see our form has a heading, label and submit button. In order to write a post, we need a content field, so lets add that. Open up `posts/_form.html.erb`
Underneath your forms name text field, add in your content.

```ruby
<div class="field">
  <%= f.label :name %><br>
  <%= f.text_field :name %><br>
  <%= f.label :content %><br>
  <%= f.text_area :content %>
</div>
```
So now we have a text field to enter content into a post. However, if you try to submit a post, your content will not be saved. Rails has a safeguard called strong params. "With strong parameters, Action Controller parameters are forbidden to be used in Active Model mass assignments until they have been whitelisted. This means that you'll have to make a conscious decision about which attributes to allow for mass update. This is a better security practice to help prevent accidentally allowing users to update sensitive model attributes."

So in our case, we have to whitelist our new content field.
Open up `controller/posts_controller.rb` and scroll down to the bottom. Update your `post_params` method to look like the following.

```ruby
def post_params
  params.require(:post).permit(:name, :content)
end
```

###`can create a post adding one tag`
At this point let seed our database by running `rake db:seed` in your console. This will give us a bunch of tags to work with. Open up `localhost:3000/posts/new` and you should see an assortment of different tags that you could add to a post.

```ruby
<div class="field">
  <%= f.collection_check_boxes :tag_ids, Tag.all, :id, :name %>
</div>
```
There is a lot going on with this form, so let's break it down piece by piece. 

- `:tag_ids` This is the key in params. You check the checkbox, the tag ids get sorted into an array, which goes into params with a key of :tag_ids.

- `Tag.all` This represents all of the possible tags that we could choose from, which is our collection. 

- `:id` This is the id of the tag, that when checked, will be passed into your `params`. 

- `:name` This the label for each tag. It is the text that shows up next to each tag in your browser.

Since we are updating our form again, we have to whitelist our new params just like we did with our content field.

Once again open `controller/posts_controller.rb` and scroll down to the bottom. Update your `post_params` method to look like the following.
Since `:tag_ids` is an array, we set it as a hash, with the key pointing to an empty array.

```ruby
def post_params
  params.require(:post).permit(:name, :content, :tag_ids => [])
end
```

###`expected to find text "cute" in "Post was successfully created..."`
Let's open `/views/posts/show.html.erb` and take a look at our `show` page. We are submitting a post name, content and a tag, but we only are showing the name. So let's update our page to reflect the whole post. Update your code to look like the following. Since our `tags` are an array, we have to iterate through them to display them all.

```ruby
<p id="notice"><%= notice %></p>

<p>
  <h3>Name:</h3>
  <%= @post.name %>
  <h3>Content:</h3>
  <%= @post.content %>
  <h3>Tags:</h3>
  <ul>
    <% @post.tags.each do |tag| %>
    <li><%= tag.name %></li>
    <% end %>
  </ul>
</p>


<%= link_to 'Edit', edit_post_path(@post) %> |
<%= link_to 'Back', posts_path %>
```
At this point all of your tests should be passing. You should also be able to submit a post with a name, content, tag(s) and have it display in your browser. 