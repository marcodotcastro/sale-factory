class AddDeletedAtToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :deleted_at, :datetime
    add_index :usuarios, :deleted_at
  end
end
