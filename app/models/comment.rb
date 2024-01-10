class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_counter) if post.has_attribute?(:comments_counter)
  end
end
