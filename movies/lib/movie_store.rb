# Load the YAML::Store class.
require 'yaml/store'

  class MovieStore

    def initialize(file_name)
# Create a store that reads/writes the given filename.
      @store = YAML::Store.new(file_name)
    end
# Take an ID to use as a key.
    def find(id)
# Needs to be in a transaction...
      @store.transaction do
# Return the movie object stored under this key.
        @store[id]
      end
    end
# Retrieves all movies in the store
    def all
# Accessing the store requires a transaction
      @store.transaction do
# Create an array with the values for each key.
        @store.roots.map { |id| @store[id] }
      end
    end
# Saves a Movie to the store.
    def save(movie)
# Must be in a transaction
      @store.transaction do
# if the movie doesn't have an ID...
        unless movie.id
# ...find the highest key...
          highest_id = @store.roots.max || 0
#...and increment it
          movie.id = highest_id + 1
      end
# store the movie under the key matching its ID.
      @store[movie.id] = movie
    end
  end

end
