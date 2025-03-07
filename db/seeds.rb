Rails.logger.level = 1

movies = File.open('movie_ids_02_23_2025.json').readlines
movies_upsert = []
movies.each do |movie|
  movie_json = JSON.parse(movie)
  movies_upsert << {tmdb_id: movie_json["id"], original_title: movie_json["original_title"]}
end

movies_upsert.each_slice(10000) do |movies_10000|
  Movie.upsert_all(movies_10000, unique_by: :tmdb_id)
  puts Movie.count
end
