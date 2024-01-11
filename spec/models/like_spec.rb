require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.create(author: user, title: 'Mission Impossible', text: 'Fallout', comments_counter: 0, likes_counter: 0) }
  let(:like) { Like.create(user:, post:) }

  describe 'validation' do
    it 'should confirm the validation of the attributes' do
      expect(like).to be_valid
    end

    it 'should show an error if likes_counter is negative' do
      post.likes_counter = -2
      expect(post).not_to be_valid
    end

    it 'should be valid when likes_counter is zero' do
      post.likes_counter = 0
      expect(post).to be_valid
    end

    it 'should be valid when likes_counter is positive' do
      post.likes_counter = 2
      expect(post).to be_valid
    end
  end

  describe 'after_save' do
    it 'should update the post likes counter' do
      like = Like.create(user:, post:)
      expect { like.save }.to change { post.likes_counter }.by(1)
    end
  end
end
