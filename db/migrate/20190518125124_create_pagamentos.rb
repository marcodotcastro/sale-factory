class CreatePagamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :pagamentos do |t|
      t.references :usuario, foreign_key: true
      t.references :plano, foreign_key: true
      t.integer :periodo
      t.date :validade
      t.boolean :ativo
      t.float :valor

      t.timestamps
    end
  end
end
