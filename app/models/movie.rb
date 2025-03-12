class Movie < ApplicationRecord
  has_many :watched_movies
  has_many :users, through: :watched_movies

  def self.update_in_batch size=500
    Movie.where(original_language: nil).limit(size).each do |movie|
      FetchMovieJob.perform_later(movie.id)
    end
    true
  end

  def fetch_movie
    request = Typhoeus.get(
      "https://api.themoviedb.org/3/movie/#{tmdb_id}?language=pt-BR",
      headers: { "Authorization" => "Bearer #{Rails.application.credentials.tmdb.access_token}" }
    )
    JSON.parse(request.body)  
  end

  def mark_as_watched(user:, watched_at: DateTime.now, rating: nil, comment: "")
    return false if already_on_watchlist?(user)
    watched_movies.create(
      user_id: user.id,
      watched_at: watched_at,
      rating: rating,
      comment: comment
    )
  end

  def already_on_watchlist?(user)
    user.movies.include?(self)
  end
end
