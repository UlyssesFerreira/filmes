class HomeController < ApplicationController
  def index
    @best_rating_movies =  Movie.where.not(title: nil, original_language: "en").where("release_date > '2024-01-01'").order("RANDOM()").limit(16)
  end
end
