class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, :through => :post_tags
  
    validates_uniqueness_of :name
end
