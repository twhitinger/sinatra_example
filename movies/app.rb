require 'sinatra'
require 'movie'
# Load the MovieStore class
require 'movie_store'
# Create a MovieStore that updates the movies.yml file.
store = MovieStore.new('movies.yml')

get('/movies') do
  @movies = store.all
  erb :index
end

get('/movies/new') do
  erb :new
end
# Submitted form data goes here.
post('/movies/create') do
  @movie = Movie.new
# Assign the contents of the form fields to attributes of the object
  @movie.title = params['title']
  @movie.director = params['director']
  @movie.year = params['year']
# Save the object!
  store.save(@movie)
# Show a new, empty form.
  redirect '/movies/new'
end

get('/movies/:id') do
# Convert the 'id' parameter from a string to an integer
  id = params['id'].to_i
# Use the ID to load the movie from the store.
  @movie = store.find(id)
# Embed the movie in the HTML from show.erb and return it to the browser.
  erb :show
end
