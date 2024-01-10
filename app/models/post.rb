class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  def comments_counter; end

  def likes_counter; end
end
