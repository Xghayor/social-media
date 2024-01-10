class AddPostsCounterToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :posts_counter, :integer, default: 0
  end
end
