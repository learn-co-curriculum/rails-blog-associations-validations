FactoryGirl.define do
  # tags
  factory :happy_tag, class: Tag do |t|
    t.name "happy"
  end
  factory :funny_tag, class: Tag do |t|
    t.name "funny"
  end
  factory :fluffy_tag, class: Tag do |t|
    t.name "fluffy"
  end
  factory :hogwarts_tag, class: Tag do |t|
    t.name "hogwarts"
  end
  factory :invalid_tag_presence, class: Tag do |t|
    t.name nil
  end
  factory :invalid_tag_uniqueness, class: Tag do |t|
    t.name "happy"
  end
  factory :cheeseburger_post, class: Post do |p|
    p.name "can i has cheezburger?"
    p.content "Kitty ipsum dolor sit amet, toss the mousie feed me purr attack your ankles, hairball rip the couch sleep on your face puking sleep on your face jump. Knock over the lamp puking fluffy fur stretching biting chase the red dot, meow stretching chuf toss the mousie catnip bat."
  end
  factory :pizza_post, class: Post do |p|
    p.name "can i has pizza?"
    p.content "Kitty ipsum dolor sit amet, toss the mousie feed me purr attack your ankles, hairball rip the couch sleep on your face puking sleep on your face jump. Knock over the lamp puking fluffy fur stretching biting chase the red dot, meow stretching chuf toss the mousie catnip bat."
  end
  factory :tag_associated_with_posts, class: Tag do |t|
    t.name "fluffy"
    t.after(:build) do |tag|
      tag.posts << FactoryGirl.build(:cheeseburger_post)
    end
    t.after(:create) do |tag|
      tag.posts.each do |post| 
        post.save!
      end
    end
  end
  factory :multiple_posts, class: Tag do |t|
    t.name "fluffy"
    t.after(:build) do |tag|
      tag.posts << FactoryGirl.build(:cheeseburger_post)
      tag.posts << FactoryGirl.build(:pizza_post)
    end
    t.after(:create) do |tag|
      tag.posts.each do |post| 
        post.save!
      end
    end
  end
 
  # posts
  factory :harry_potter_post, class: Post do |p|
    p.name "Harry Potter"
    p.content "Alohamora wand elf parchment, Wingardium Leviosa hippogriff, house dementors betrayal. Holly, Snape centaur portkey ghost Hermione spell bezoar Scabbers. Peruvian-Night-Powder werewolf, Dobby pear-tickle half-moon-glasses, Knight-Bus. Padfoot snargaluff seeker: Hagrid broomstick mischief managed. Snitch Fluffy rock-cake, 9 ¾ dress robes I must not tell lies. Mudbloods yew pumpkin juice phials Ravenclaw’s Diadem 10 galleons Thieves Downfall."
    p.after(:build) do |post|
      post.tags << FactoryGirl.build(:hogwarts_tag)
    end
    p.after(:create) do |post|
      post.tags.each do |tag| 
        tag.save!
      end
    end
  end
  factory :kitten_post, class: Post do |p|
    p.name "Kittens"
    p.content "Kitty ipsum dolor sit amet, toss the mousie feed me purr attack your ankles, hairball rip the couch sleep on your face puking sleep on your face jump. Knock over the lamp puking fluffy fur stretching biting chase the red dot, meow stretching chuf toss the mousie catnip bat."
    p.after(:build) do |post|
      post.tags << FactoryGirl.build(:happy_tag)
      post.tags << FactoryGirl.build(:funny_tag)
      post.tags << FactoryGirl.build(:fluffy_tag)
    end
    p.after(:create) do |post|
      post.tags.each do |tag| 
        tag.save!
      end
    end
  end
  factory :invalid_post_name, class: Post do |p|
    p.name nil
    p.content "Kitty ipsum dolor sit amet, toss the mousie feed me purr attack your ankles, hairball rip the couch sleep on your face puking sleep on your face jump. Knock over the lamp puking fluffy fur stretching biting chase the red dot, meow stretching chuf toss the mousie catnip bat."
  end
  factory :invalid_post_content, class: Post do |p|
    p.name "can i has cheezburger?"
    p.content nil
  end
 
  # users
  factory :create_user, class: User do |u|
    u.name "Crookshanks"
  end
  factory :crookshanks, class: User do |u|
    u.name "Crookshanks"
    u.after(:build) do |user|
      user.posts << FactoryGirl.build(:harry_potter_post)
      user.posts << FactoryGirl.build(:kitten_post)
    end
    u.after(:create) do |user|
      user.posts.each do |post| 
        post.save!
      end
    end
  end
  factory :ron, class: User do |u|
    u.name "Ron"
    u.after(:build) do |user|
      user.posts << FactoryGirl.build(:harry_potter_post)
    end
    u.after(:create) do |user|
      user.posts.each do |post| 
        post.save!
      end
    end
  end
  factory :invalid_user_presence, class: User do |u|
    u.name nil
  end
  factory :invalid_user_uniqueness, class: User do |u|
    u.name "Crookshanks"
  end
 
end
