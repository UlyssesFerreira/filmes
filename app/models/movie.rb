class Movie < ApplicationRecord

  def self.update_in_batch size=500
    Movie.where(title: nil).limit(size).each do |movie|
      FetchMovieJob.perform_later(movie.id)
    end
    true
  end

  def fetch_movie
    request = Typhoeus.get(
      "https://api.themoviedb.org/3/movie/#{tmdb_id}",
      headers: { "Authorization" => "Bearer #{Rails.application.credentials.tmdb.access_token}" }
    )
    JSON.parse(request.body)  
  end
end
