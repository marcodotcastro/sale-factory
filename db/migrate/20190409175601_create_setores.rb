class CreateSetores < ActiveRecord::Migration[5.2]
  def change
    create_table :setores do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
