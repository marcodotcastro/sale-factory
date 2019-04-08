class CreateLojistas < ActiveRecord::Migration[5.2]
  def change
    create_table :lojistas do |t|
      t.string :descricao
      t.string :endereco
      t.string :cep
      t.string :contato
      t.string :telefone
      t.string :email
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
