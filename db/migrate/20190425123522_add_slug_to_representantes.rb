class AddSlugToRepresentantes < ActiveRecord::Migration[5.2]
  def change
    add_column :representantes, :slug, :string
    add_index :representantes, :slug, unique: true
  end
end
