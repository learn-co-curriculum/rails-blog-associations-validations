require 'spec_helper'

describe Post do

  its "post is valid" do 
    expect(Post.create(name: "hi", content: "hello")).to be_valid
  end

  its "invalid with no name" do 
    expect(Post.create(name: nil, content: "i have no name")).to_not be_valid
  end

  its "invalid with no content" do 
    expect(Post.create(name: "Name", content: nil)).to_not be_valid
  end

end