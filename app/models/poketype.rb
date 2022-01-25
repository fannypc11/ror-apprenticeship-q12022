class Poketype < ApplicationRecord
  has_many :pokemon_poketypes
  has_many :pokemons, { through: :pokemon_poketypes }
end
