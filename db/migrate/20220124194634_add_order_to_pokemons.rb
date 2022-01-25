class AddOrderToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :order, :integer
  end
end
