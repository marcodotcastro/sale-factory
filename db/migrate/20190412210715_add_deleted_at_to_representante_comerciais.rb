class AddDeletedAtToRepresentanteComerciais < ActiveRecord::Migration[5.2]
  def change
    add_column :representantes, :deleted_at, :datetime
    add_index :representantes, :deleted_at
  end
end
