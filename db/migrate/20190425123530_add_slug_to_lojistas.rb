class AddSlugToLojistas < ActiveRecord::Migration[5.2]
  def change
    add_column :lojistas, :slug, :string
    add_index :lojistas, :slug, unique: true
  end
end
