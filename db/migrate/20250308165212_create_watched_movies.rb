class CreateWatchedMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :watched_movies do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :watched_at
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
