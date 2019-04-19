class CreateCidades < ActiveRecord::Migration[5.2]
  def change
    create_table :cidades do |t|
      t.string :codigo
      t.string :descricao
      t.string :estado
      t.integer :populacao
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
