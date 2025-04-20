class HomeController < ApplicationController
  def index
    home_movie_ids = Movie.where("release_date > '2024-01-01' AND runtime > 100 AND rating < 8").order(rating: :desc).limit(16).pluck(:id)
    @movies = Movie.where(id: home_movie_ids)
  end
end
