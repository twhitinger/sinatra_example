# Load the Movie class
require 'movie'
# Load the YAML::Store class
require 'yaml/store'
# Create a store that writes objects to a file named test.yml.
store = YAML::Store.new('test.yml')
# Create a movie object
first_movie = Movie.new
first_movie.title = "Spirited Away"
first_movie.director = "Hayao Miyazaki"
first_movie.year = 2001
# Create a second movie.
second_movie = Movie.new
second_movie.title = "Inception"
second_movie.director = "Christopher Nolan"
second_movie.year = 2010
# Prevent other programs from writing to the file.
store.transaction do
  # Store the two movies
  store["Spirited Away"] = first_movie
  store["Inception"] = second_movie
  # Print one of the store's values.
  p store["Inception"]
end
