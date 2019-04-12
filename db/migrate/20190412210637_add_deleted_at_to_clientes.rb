class AddDeletedAtToClientes < ActiveRecord::Migration[5.2]
  def change
    add_column :clientes, :deleted_at, :datetime
    add_index :clientes, :deleted_at
  end
end
