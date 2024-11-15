# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Movie.destroy_all

require "json"
require "open-uri"

api_url = "https://tmdb.lewagon.com/movie/top_rated"

# Fetch the API response and parse it as JSON
api_response = URI.open(api_url).read
api_parsed = JSON.parse(api_response)

# Loop through the top-rated movies and save them
api_parsed["results"].first(10).each do |movie_data|
  movie = Movie.new(
    title: movie_data["title"],
    overview: movie_data["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie_data['poster_path']}",
    rating: movie_data["vote_average"]
  )
  movie.save!
end
