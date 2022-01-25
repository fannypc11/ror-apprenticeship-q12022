#require 'rubygems'
require 'rest-client'
#require 'byebug'
require 'json'

#Class to fetch pokemons
class Pokemons::PokemonService
  #include HTTParty
  # base_uri 'https://pokeapi.co/api/v2/'
  attr_accessor :types, :pokemons

  def initialize
    @types = []
    @final = []
    @pokemons = []
    @base_url = 'https://pokeapi.co/api/v2'
  end

  def fetch_types(page: 1, limit: 100)
    offset = (page - 1) * limit
    response = JSON.parse RestClient.get "#{@base_url}/type?offset=#{offset}&limit=#{limit}"
    page += 1

    # byebug
    @types.concat(response['results'])

    fetch_types(page: page, limit: 100) unless response['results'].empty?
  end

  def fetch_pokemons
    response = JSON.parse RestClient.get "#{@base_url}/pokemon?offset=0&limit=20"
    response['results'].each { |result| @pokemons.push(JSON.parse(RestClient.get(result['url']))) }
  end

  def relation
    p @pokemons.length
    @pokemons.each do |pokemon|
      p '***********************'
      p pokemon['name']
      p pokemon['types']
    end
  end
end

#ed = TestApi.new
#ed.fetch_types
#ed.fetch_pokemons
#ed.relation

#p 'pokemons **************'

#p 'types *****************'
#p ed.types






#class Pokemons::PokemonService
#  class >> self
#    def fetch_pokemons
      #llamada a la API
#    end
#  end
#end
#Pokemons::PokemonService.fetch_pokemons

#class Pokemons::PokemonService
  
#  def def initialize(attribute)
#    @attribute = attribute
#  end
#  def fetch_pokemons
    #llamada a la API
#  end
  
#end

#Pokemons::PokemonService.new().fetch_pokemons

#module Pokemon
#  module PokemonService
#    def def initialize(attribute)
#      @attribute = attribute
#    end
#    def fetch_pokemons
      #llamada a la API
#    end
#  end
#end