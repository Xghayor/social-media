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
end
