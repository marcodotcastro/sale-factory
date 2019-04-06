class AddRepresentanteComercialToLojista < ActiveRecord::Migration[5.2]
  def change
    add_reference :lojistas, :representante_comercial, foreign_key: true
  end
end
