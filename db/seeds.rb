Rails.logger.level = 1

movies = JSON.load_file("movies.json")
movies.each_slice(10000) do |movies_10000|
  Movie.upsert_all(movies_10000, unique_by: :tmdb_id)
  puts Movie.count
end
