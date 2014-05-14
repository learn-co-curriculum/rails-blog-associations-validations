# require 'spec_helper'

# describe Post do

#   its "post is valid" do 
#     expect(FactoryGirl.create(:cheeseburger_post)).to be_valid
#   end

#   its "invalid with no name" do 
#     expect(FactoryGirl.build(:invalid_post_name)).to_not be_valid
#   end

#   its "invalid with no content" do 
#     expect(FactoryGirl.build(:invalid_post_content)).to_not be_valid
#   end

#   subject(:post_associated_with_one_tag) {FactoryGirl.create(:harry_potter_post)}
#   its "able to have one tag association" do
#     expect(post_associated_with_one_tag.tags.length).to eq(1)
#   end

#   subject(:post_associated_with_tags) {FactoryGirl.create(:kitten_post)}
#   its "able to have multiple tags" do
#     expect(post_associated_with_tags.tags.length).to eq(3)
#   end

# end
