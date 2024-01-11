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
end
