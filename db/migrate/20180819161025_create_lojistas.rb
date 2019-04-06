class CreateLojistas < ActiveRecord::Migration[5.2]
  def change
    create_table :lojistas do |t|
      t.string :descricao
      t.string :endereco
      t.string :telefone
      t.string :cep
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
