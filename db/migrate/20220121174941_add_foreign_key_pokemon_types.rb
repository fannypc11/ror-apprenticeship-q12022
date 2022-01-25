class AddForeignKeyPokemonTypes < ActiveRecord::Migration[6.1]
  def up
    add_foreign_key :pokemon_poketypes, :pokemons
    add_foreign_key :pokemon_poketypes, :poketypes
  end

  def down
    remove_foreign_key :pokemon_poketypes, :pokemons
    remove_foreign_key :pokemon_poketypes, :poketypes
  end
end
