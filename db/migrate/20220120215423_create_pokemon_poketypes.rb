class CreatePokemonPoketypes < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_poketypes do |t|
      t.references :pokemon
      t.references :poketype

      t.timestamps
    end
  end
end
