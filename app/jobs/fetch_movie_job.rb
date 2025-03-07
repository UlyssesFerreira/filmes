class FetchMovieJob < ApplicationJob
  queue_as :default

  def perform(movie_id)
    movie = Movie.find(movie_id)
    json = movie.fetch_movie
    release_date = json.dig("release_date").present? ? Date.parse(json.dig("release_date")) : nil
    movie.update(
      title: json.dig("title"),
      description: json.dig("overview"),
      release_date: release_date,
      poster_url: "https://image.tmdb.org/t/p/w500#{json.dig("poster_path")}",
      rating: json.dig("vote_average"),
      status: json.dig("status"),
      runtime: json.dig("runtime")
    )
  end
end
