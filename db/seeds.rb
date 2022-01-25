# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

instance_pokemon = Pokemons::PokemonService.new
instance_pokemon.fetch_types
instance_pokemon.fetch_pokemons
instance_pokemon.types.each do |type|
  Poketype.find_or_create_by!(name: type['name'])
end

instance_pokemon.pokemons.each do |pokemon|
  poketypes = []
  pokemon['types'].each do |poketype|
    poketypes << Poketype.find_by_name(poketype['type']['name'])
  end

  pokemon = Pokemon.find_or_create_by(
    name: pokemon['name'],
    base_experience: pokemon['base_experience'],
    height: pokemon['height'],
    order: pokemon['order'],
    image: pokemon['sprites']['front_default']
  )
  pokemon.poketypes = poketypes
  pokemon.save!
end
