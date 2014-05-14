require 'spec_helper'

describe Tag do

  its "tag is valid" do 
    expect(Tag.create(name: "happy")).to be_valid
  end

  its "invalid with no name" do 
    expect(Tag.create(name: nil)).to_not be_valid
  end

  its "invalid if name already exists" do
    Tag.create(name: "happy")
    expect(Tag.create(name: "happy")).to_not be_valid
  end

end