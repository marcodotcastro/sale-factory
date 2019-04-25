class AddSlugToClientes < ActiveRecord::Migration[5.2]
  def change
    add_column :clientes, :slug, :string
    add_index :clientes, :slug, unique: true
  end
end
