class HomeController < ApplicationController
  def index
    @movies =  Movie.where("release_date > '2024-01-01' AND runtime > 100 AND rating < 8").order(rating: :desc).limit(16)
  end
end
