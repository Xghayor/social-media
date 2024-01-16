require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'renders a successful response with the correct template and includes all users' do
      users = [
        User.create!(name: 'Ali'),
        User.create!(name: 'Bob'),
        User.create!(name: 'Charlie')
      ]

      get users_path
      expect(response).to be_successful
      expect(response).to render_template(:index)

      users.each do |user|
        expect(response.body).to include(user.name)
      end
    end
  end

  describe 'GET /show' do
    it 'renders a specific user with the correct template and includes user name' do
      user = User.create!(name: 'Ali')
      get user_path(user)
      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response.body).to include('Ali')
    end
  end
end
