class AddOriginalLanguageToMovies < ActiveRecord::Migration[8.0]
  def change
    add_column :movies, :original_language, :string
  end
end
