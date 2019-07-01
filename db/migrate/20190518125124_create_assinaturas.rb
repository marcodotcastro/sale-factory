class CreateAssinaturas < ActiveRecord::Migration[5.2]
  def change
    create_table :assinaturas do |t|
      t.references :usuario, foreign_key: true
      t.references :plano, foreign_key: true
      t.integer :situacao

      t.timestamps
    end
  end
end
