class AddCidadeToCliente < ActiveRecord::Migration[5.2]
  def change
    add_reference :clientes, :cidade, foreign_key: true, on_delete: :cascade
  end
end
