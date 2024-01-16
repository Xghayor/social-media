require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) do
    User.create!(name: 'John', photo: 'example.jpg', bio: 'Some bio', posts_counter: 0)
  end

  describe 'GET /index' do
    it 'renders a successful response, correct template and includes correct placeholder text' do
      post = user.posts.create!(title: 'Example Post', text: 'This is an example post', comments_counter: 0,
                                likes_counter: 0)
      get user_posts_path(user)
      expect(response).to be_successful
      expect(response).to render_template(:index)
      expect(response.body).to include(post.title)
    end
  end

  describe 'GET /show' do
    let(:post) do
      user.posts.create!(title: 'Example Post', text: 'This is an example post', comments_counter: 0,
                         likes_counter: 0)
    end

    it 'renders a successful response, correct template and includes correct placeholder text' do
      get user_post_path(user, id: post.id)
      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response.body).to include(post.title)
    end
  end
end
