describe Tag do
  context 'Tag validations' do
    it "tag is valid" do
      expect(Tag.create(name: "happy")).to be_valid
    end

    it "invalid if name already exists" do
      Tag.create(name: "happy")
      expect(Tag.create(name: "happy")).to_not be_valid
    end
  end

  context 'Tag relationship to Post' do
    let(:tag) { Tag.create(name: 'cute') }
    let(:user) { User.create(name: 'kitten') }
    let(:post) { Post.create(user: user, name: 'post', content: 'content') }

    before do
      PostTag.create(tag: tag, post: post)
    end

    it 'has many posts' do
      expect(tag.posts.count).to eq(1)
    end
  end

end
