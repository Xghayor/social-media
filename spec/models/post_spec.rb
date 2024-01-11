require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'testing title', text: 'hello from rspec') }

  it 'should have a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should have content' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'comments counter should be an integer' do
    subject.comments_counter = 'some string'
    expect(subject).to_not be_valid
  end

  it 'likes counter should be an integer' do
    subject.likes_counter = 'some string'
    expect(subject).to_not be_valid
  end
  
  it 'returns the most recent comments' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Europe.')
    post = Post.create(author: user, title: 'testing title', text: 'hello from rspec', likes_counter: 0,
                       comments_counter: 0)

    Comment.create(user:, post:, text: 'comment 1')
    comment2 = Comment.create(user:, post:, text: 'comment 2')
    comment3 = Comment.create(user:, post:, text: 'comment 3')
    comment4 = Comment.create(user:, post:, text: 'comment 4')
    comment5 = Comment.create(user:, post:, text: 'comment 5')
    comment6 = Comment.create(user:, post:, text: 'comment 6')

    five_recent_comments = post.five_recent_comments

    expect(five_recent_comments).to eq([comment6, comment5, comment4, comment3, comment2])
  end

  it 'should update the author posts counter' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Europe.')
    post = Post.create(author: user, title: 'Mission Impossible', text: 'Fallout', likes_counter: 0,
                       comments_counter: 0)
    expect { post.save }.to change { user.posts_counter }.by(1)
  end
end
