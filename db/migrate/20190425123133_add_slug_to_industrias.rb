class AddSlugToIndustrias < ActiveRecord::Migration[5.2]
  def change
    add_column :industrias, :slug, :string
    add_index :industrias, :slug, unique: true
  end
end
