class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user_id, uniqueness: { scope: :movie_id, message: "já possui esse filme na lista de favoritos" }
end
