class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.string :descricao
      t.references :usuario
      t.references :solicitacao

      t.timestamps
    end
  end
end
