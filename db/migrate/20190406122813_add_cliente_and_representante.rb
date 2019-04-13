class AddClienteAndRepresentante < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes_representantes, id: false do |t|
      t.belongs_to :cliente, index: {name: :index_clientes_representantes_on_cliente_id}
      t.belongs_to :representante, index: {name: :index_representantes_clientes_on_representante_id}
    end
  end
end
