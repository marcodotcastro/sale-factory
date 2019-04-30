class AddMeritFieldsToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :sash_id, :integer
    add_column :usuarios, :level,   :integer, :default => 0
  end
end
