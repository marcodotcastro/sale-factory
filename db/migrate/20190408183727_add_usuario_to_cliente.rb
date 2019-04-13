class AddUsuarioToCliente < ActiveRecord::Migration[5.2]
  def change
    add_reference :clientes, :usuario
  end
end
