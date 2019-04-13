class AddSetorToCliente < ActiveRecord::Migration[5.2]
  def change
    add_reference :clientes, :setor
  end
end
