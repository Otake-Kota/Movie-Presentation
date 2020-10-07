class AddMaximToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :movie_maxim, :string
  end
end
