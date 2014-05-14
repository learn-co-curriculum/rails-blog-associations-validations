require 'spec_helper'

describe User do

  its "user is valid" do 
    expect(User.create(name: "Crookshanks")).to be_valid
  end

  its "invalid with no name" do 
    expect(User.create(name: nil)).to_not be_valid
  end

  its "invalid if name already exists" do 
    User.create(name: "Crookshanks")
    expect(User.create(name: "Crookshanks")).to_not be_valid
  end

end