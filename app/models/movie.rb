class Movie < ApplicationRecord
  has_many :watched_movies
  has_many :users, through: :watched_movies

  has_many :favorites
  has_many :favorited_by_users, through: :favorites, source: :user

  def self.search query
    @search = Movie.ransack(title_or_original_title_cont: query)
    @search.result.order(rating: :desc, original_title: :asc)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["original_title", "title"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.ransackable_scopes(auth_object = nil)
    []
  end

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
    return false if already_on_watched_list?(user)
    watched_movies.create(
      user_id: user.id,
      watched_at: watched_at,
      rating: rating,
      comment: comment
    )
  end

  def favorite(user)
    fav = favorites.new(user_id: user.id)
    fav.save
  end

  def remove_favorite(user)
    user.favorites.find_by(movie_id: id).delete
  end

  def already_on_watched_list?(user)
    user.movies.include?(self)
  end

  def runtime_in_hours
    "#{runtime/60}h #{runtime%60}m"
  end
end
