class AddMaximToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :movie_maxim, :string
  end
end
