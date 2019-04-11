class AddConviteClienteToUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :convite_cliente, :integer
  end
end
