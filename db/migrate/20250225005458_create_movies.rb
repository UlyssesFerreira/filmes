class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.integer :tmdb_id
      t.string :title
      t.string :original_title
      t.text :description
      t.date :release_date
      t.string :poster_url
      t.float :rating
      t.string :status
      t.integer :runtime

      t.timestamps
    end
    
    add_index :movies, :tmdb_id, unique: true
  end
end
