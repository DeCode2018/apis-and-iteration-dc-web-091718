require 'rest-client'
require 'json'
require 'pry'



def get_character_movies_from_api(character)
  #make the web request
  film_list = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  # binding.pry
  response_hash = JSON.parse(response_string)

  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  response_hash["results"].each do |item|
    if item["name"].downcase == character
      film_list = item["films"]
    end

  end

  movie_list = film_list.map do |film|
    response_string = RestClient.get(film)
  # binding.pry
    response_hash = JSON.parse(response_string)
  end


  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def print_movies(movie_list)

  movie_list.each do |item|
    puts item['title']
  end
  # # some iteration magic and puts out the movies in a nice list
    #   film_list.each do |film|
    #   response_string = RestClient.get(film)
    #   # binding.pry
    #   response_hash = JSON.parse(response_string)
    #   puts response_hash['title']
    #   binding.pry
    # end

end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
