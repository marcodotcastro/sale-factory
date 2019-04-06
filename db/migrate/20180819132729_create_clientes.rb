class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :descricao
      t.string :contato
      t.string :endereco
      t.string :cep
      t.string :telefone
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
