class AddDeletedAtToLojistas < ActiveRecord::Migration[5.2]
  def change
    add_column :lojistas, :deleted_at, :datetime
    add_index :lojistas, :deleted_at
  end
end
