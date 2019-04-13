class AddCidadeToCliente < ActiveRecord::Migration[5.2]
  def change
    add_reference :clientes, :cidade
  end
end
