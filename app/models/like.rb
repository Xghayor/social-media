class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:likes_counter) if post.has_attribute?(:likes_counter)
  end
end
