class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :posts
end
