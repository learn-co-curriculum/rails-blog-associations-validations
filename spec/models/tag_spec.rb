# require 'spec_helper'

# describe Tag do

#   its "tag is valid" do 
#     expect(FactoryGirl.create(:happy_tag)).to be_valid
#   end

#   its "invalid with no name" do 
#     expect(FactoryGirl.build(:invalid_tag_presence)).to_not be_valid
#   end

#   its "invalid if name already exists" do
#     FactoryGirl.create(:happy_tag) 
#     expect(FactoryGirl.build(:invalid_tag_uniqueness)).to_not be_valid
#   end

#   subject(:tag_associated_with_posts) {FactoryGirl.create(:tag_associated_with_posts)}
#   its "able to have one post" do
#     expect(tag_associated_with_posts.posts.length).to eq(1)
#   end

#   subject(:multiple_posts) {FactoryGirl.create(:multiple_posts)}
#   its "able to have multiple posts" do
#     expect(multiple_posts.posts.length).to eq(2)
#   end

# end