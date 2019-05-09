class AddDeletedAtToIndustrias < ActiveRecord::Migration[5.2]
  def change
    add_column :industrias, :deleted_at, :datetime
    add_index :industrias, :deleted_at
  end
end
