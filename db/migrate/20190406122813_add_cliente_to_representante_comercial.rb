class AddClienteToRepresentanteComercial < ActiveRecord::Migration[5.2]
  def change
    add_reference :representante_comerciais, :cliente, foreign_key: true
  end
end