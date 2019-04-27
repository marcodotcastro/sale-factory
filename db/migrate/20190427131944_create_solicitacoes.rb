class CreateSolicitacoes < ActiveRecord::Migration[5.2]
  def change
    create_table :solicitacoes do |t|
      t.references :representante, foreign_key: true
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
