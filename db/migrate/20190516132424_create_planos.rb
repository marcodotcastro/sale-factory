class CreatePlanos < ActiveRecord::Migration[5.2]
  def change
    create_table :planos do |t|
      t.string :descricao
      t.integer :numero_convites
      t.float :preco

      t.timestamps
    end
  end
end
