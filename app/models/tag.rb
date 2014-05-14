class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :post_tags

  validates_presence_of :name
  validates_uniqueness_of :name
end
