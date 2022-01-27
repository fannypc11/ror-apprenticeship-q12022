class PokemonPoketype < ApplicationRecord

  belongs_to :pokemon
  belongs_to :poketype
end
