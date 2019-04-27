class CreateProdutos < ActiveRecord::Migration[5.2]
  def change
    create_table :produtos do |t|
      t.string :descricao
      t.string :preco
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
