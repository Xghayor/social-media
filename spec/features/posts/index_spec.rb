require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Alex', photo: 'https://unsplash.com/photos/1.jpg', bio: 'Teacher from Mexico.',
                          posts_counter: 2)
    @post1 = Post.create!(author: @user1, title: 'First Post', text: 'First text', comments_counter: 2,
                          likes_counter: 2)
    @post2 = Post.create!(author: @user1, title: 'Second Post', text: 'Second text', comments_counter: 0,
                          likes_counter: 0)
    @comment1 = Comment.create!(post: @post1, user: @user1, text: 'Hi Alex!')
    @comment2 = Comment.create!(post: @post1, user: @user1, text: 'Hi user!')
    @like1 = Like.create!(post: @post1, user: @user1)
    @like2 = Like.create!(post: @post1, user: @user1)
  end
  describe 'Index page' do
    it "should display the user's profile picture" do
      visit user_posts_path(user_id: @user1.id)

      expect(page).to have_css("img[src*='https://unsplash.com/photos/1.jpg']")
    end

    it "should display the user's username" do
      visit user_posts_path(user_id: @user1.id)

      expect(page).to have_content(@user1.name)
    end

    it "should display the user's number of posts" do
      visit user_posts_path(user_id: @user1.id)

      expect(page).to have_content(@user1.posts_counter)
    end

    it "should display the post's title" do
      visit user_posts_path(user_id: @user1.id)

      expect(page).to have_content(@post1.title)
    end

    it "should display some of the post's body" do
      visit user_posts_path(user_id: @user1.id)

      expect(page).to have_content(@post1.text)
    end

    it 'should display the first comments on a post' do
      visit user_posts_path(user_id: @user1.id)

      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
    end

    it 'should display the number of comments on a post' do
      visit user_posts_path(user_id: @user1.id)

      expect(page).to have_content(@post1.comments_counter)
    end

    it 'should display the number of likes on a post' do
      visit user_posts_path(user_id: @user1.id)

      expect(page).to have_content(@post1.likes_counter)
    end

    it "should redirect me to that post's show page when clicking on the post's title" do
      visit user_posts_path(user_id: @user1.id)

      click_link @post1.title
      expect(page).to have_current_path(user_post_path(user_id: @user1.id, id: @post1.id))
    end


    it 'Should display the section to create a new post' do
      visit user_posts_path(user_id: @user1.id)
      expect(page).to have_content('Create New Post')
    end
  end
end
