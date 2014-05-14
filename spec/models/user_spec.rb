require 'spec_helper'

describe User do

  its "user is valid" do 
    expect(FactoryGirl.create(:create_user)).to be_valid
  end

  its "invalid with no name" do 
    expect(FactoryGirl.build(:invalid_user_presence)).to_not be_valid
  end

  its "invalid if name already exists" do 
    FactoryGirl.create(:create_user)
    expect(FactoryGirl.build(:invalid_user_uniqueness)).to_not be_valid
  end

  subject(:ron) {FactoryGirl.create(:ron)}
  its "able to have one post" do
    expect(ron.posts.length).to eq(1)
  end

  subject(:crookshanks) {FactoryGirl.create(:crookshanks)}
  its "able to have multiple posts" do
    expect(crookshanks.posts.length).to eq(2)
  end

end
