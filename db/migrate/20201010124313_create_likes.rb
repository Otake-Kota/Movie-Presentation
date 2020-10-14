class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :movie_id

      t.timestamps


      t.index :user_id
      t.index :movie_id
      t.index [:user_id, :movie_id], unique: true
    end
  end
end
