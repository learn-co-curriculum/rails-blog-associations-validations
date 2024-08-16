class User < ApplicationRecord
  has_many :posts

  validates :name, presence: true
  validates :name, uniqueness: true
end
