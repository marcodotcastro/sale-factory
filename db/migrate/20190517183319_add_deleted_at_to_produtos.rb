class AddDeletedAtToProdutos < ActiveRecord::Migration[5.2]
  def change
    add_column :produtos, :deleted_at, :datetime
    add_index :produtos, :deleted_at
  end
end
