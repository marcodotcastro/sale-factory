class AddClienteAndLojista < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes_lojistas, id: false do |t|
      t.belongs_to :lojista, index: {name: :index_lojistas_clientes_on_lojista_id}
      t.belongs_to :cliente, index: {name: :index_clientes_lojistas_on_cliente_id}
    end
  end
end
