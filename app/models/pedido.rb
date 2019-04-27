# == Schema Information
#
# Table name: pedidos
#
#  quantidade     :integer
#  produto_id     :bigint(8)
#  solicitacao_id :bigint(8)
#
# Indexes
#
#  index_produtos_solicitacoes_on_produto_id      (produto_id)
#  index_solicitacoes_produtos_on_solicitacao_id  (solicitacao_id)
#

class Pedido < ApplicationRecord
  belongs_to :produto
  belongs_to :solicitacao
end
