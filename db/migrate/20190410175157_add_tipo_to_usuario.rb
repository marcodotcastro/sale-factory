class AddTipoToUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :tipo, :integer
  end
end
