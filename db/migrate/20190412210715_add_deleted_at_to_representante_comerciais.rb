class AddDeletedAtToRepresentanteComerciais < ActiveRecord::Migration[5.2]
  def change
    add_column :representante_comerciais, :deleted_at, :datetime
    add_index :representante_comerciais, :deleted_at
  end
end
