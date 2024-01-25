class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: :author_id

  validates :name, presence: true
  validates_numericality_of :posts_counter, only_integer: true, greater_than_or_equal_to: 0

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
