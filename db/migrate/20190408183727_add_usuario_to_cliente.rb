class AddUsuarioToCliente < ActiveRecord::Migration[5.2]
  def change
    add_reference :clientes, :usuario, foreign_key: true, on_delete: :cascade
  end
end
