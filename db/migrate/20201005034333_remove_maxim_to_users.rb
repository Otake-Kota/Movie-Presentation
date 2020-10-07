class RemoveMaximToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :movie_maxim, :string
  end
end
