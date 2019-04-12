class AddCidadeToRepresentanteComercial < ActiveRecord::Migration[5.2]
  def change
    add_reference :representante_comerciais, :cidade, foreign_key: true, on_delete: :cascade
  end
end
