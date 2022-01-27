class AddColumnsToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :base_experience, :integer
    add_column :pokemons, :height, :integer
  end
end
