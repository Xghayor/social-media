require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Lilly two') }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be an integer' do
    subject.posts_counter = 'some_string'
    expect(subject).to_not be_valid
  end

  it 'returns the most recent posts' do
    second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Poland.')

    Post.create(author: second_user, title: 'Hello', text: 'This is my first post')
    Post.create(author: second_user, title: 'Hello', text: 'This is my second post')
    Post.create(author: second_user, title: 'Hello', text: 'This is my third post')
    Post.create(author: second_user, title: 'Hello', text: 'This is my fourth post')
    Post.create(author: second_user, title: 'Hello', text: 'This is my fifth post')

    three_recent_posts = second_user.three_recent_posts
    expect(three_recent_posts ).to eq(second_user.posts.order(created_at: :desc).limit(3))
  end
  
  
end
