require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  let(:post) do
    Post.create(author: user, title: 'Mission Impossible', text: 'Fallout', likes_counter: 0, comments_counter: 0)
  end

  describe 'validations' do
    it 'should validate presence of text' do
      comment = Comment.create(user:, post:, text: 'Hi Tom!')
      expect(comment).to be_valid
    end
  end

  describe 'after_save' do
    it 'should update the post comments counter' do
      comment = Comment.create(user:, post:, text: 'Hi Tom!')
      expect { comment.save }.to change { post.reload.comments_counter }.by(1)
    end
  end
end
