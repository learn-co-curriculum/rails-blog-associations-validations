class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates_uniqueness_of :name
end
