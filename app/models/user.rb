class User < ActiveRecord::Base
  has_many :posts

  validates_uniqueness_of :name
  validates_presence_of :name
end
