describe Post do
  context 'Post validations' do
    it "post is valid" do
      expect(Post.create(name: "hi", content: "hello")).to be_valid
    end

    it "invalid with no name" do
      expect(Post.create(name: nil, content: "i have no name")).to_not be_valid
    end

    it "invalid with no content" do
      expect(Post.create(name: "Name", content: nil)).to_not be_valid
    end
  end

  context 'Post relationship to User and Tag' do
    it 'belongs to a user' do
      expect(@post1.user).to eq(@crookshanks)
    end

    it 'has many tags' do
      expect(@post1.tags.count).to eq(2)
    end
  end

end
