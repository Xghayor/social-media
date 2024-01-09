class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
