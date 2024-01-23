require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let(:user) { User.create(name: 'Ali', photo: 'https://unsplash.com/photos/F_-0000BxGuVvo', bio: 'A pianist.') }
  let(:post) { Post.create(author: user, title: 'hello', text: 'To the world') }

  context 'displays' do
    it 'displays user names' do
      visit users_path
      users = User.all
      users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'displays user photo' do
      visit users_path
      users = User.all
      users.each do |user|
        expect(page).to have_selector("img[src='#{user.photo}']")
      end
    end

    it 'displays number of posts of each user' do
      visit users_path
      users = User.all
      users.each do |user|
        expect(page).to have_content("Number of posts: #{user.post_counter}")
      end
    end

    it 'redirects when clicked on a user' do
      visit users_path
      users = User.all
      users.each do |user|
        click_link(user.name)
        expect(page).to have_current_path(user_path(user))
        visit users_path
      end
    end
  end
end