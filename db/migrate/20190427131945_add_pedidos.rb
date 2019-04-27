class AddPedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.belongs_to :produto, index: {name: :index_produtos_solicitacoes_on_produto_id}
      t.belongs_to :solicitacao, index: {name: :index_solicitacoes_produtos_on_solicitacao_id}
      t.integer :quantidade
    end
  end
end
