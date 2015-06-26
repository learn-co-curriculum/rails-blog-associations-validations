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
    it 'has many posts' do
      expect(@tag1.posts.count).to eq(2)
    end
  end

end
