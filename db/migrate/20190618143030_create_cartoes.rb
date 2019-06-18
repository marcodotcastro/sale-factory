class CreateCartoes < ActiveRecord::Migration[5.2]
  def change
    create_table :cartoes do |t|
      t.string :numero
      t.string :ano
      t.string :mes
      t.string :cvv
      t.references :assinatura, foreign_key: true

      t.timestamps
    end
  end
end
