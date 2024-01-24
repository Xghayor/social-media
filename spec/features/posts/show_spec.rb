RSpec.describe 'Post', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Martin', photo: 'https://unsplash.com/photos/1.jpg', bio: 'pianist.', posts_counter: 1)
    @post1 = Post.create!(author: @user1, title: 'First Post', text: 'First text', comments_counter: 2,
                          likes_counter: 1)
    @comment1 = Comment.create!(post: @post1, user: @user1, text: 'nice!')
    @comment2 = Comment.create!(post: @post1, user: @user1, text: 'good!')
    @like1 = Like.create!(post: @post1, user: @user1)
  end

  describe 'Show page' do
    it "should display the post's title" do
      visit user_post_path(@user1, @post1)

      expect(page).to have_content(@post1.title)
    end

    it "should display the post's author" do
      visit user_post_path(@user1, @post1)

      expect(page).to have_content(@user1.name)
    end

    it "should display the post's number of comments" do
      visit user_post_path(@user1, @post1)

      expect(page).to have_content(@post1.comments_counter)
    end

    it "should display the post's number of likes" do
      visit user_post_path(@user1, @post1)

      expect(page).to have_content(@post1.likes_counter)
    end

    it "should display the post's body" do
      visit user_post_path(@user1, @post1)

      expect(page).to have_content(@post1.text)
    end

    it 'should display the username of each commentator' do
      visit user_post_path(@user1, @post1)

      expect(page).to have_content(@user1.name)
    end

    it 'should display the text of each comment' do
      visit user_post_path(@user1, @post1)

      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
    end

    it "Should display the 'Back to Posts' button" do
      visit user_post_path(@user1, @post1)

      expect(page).to have_link('Back to Posts')
    end
  end
end

require 'rails_helper'
