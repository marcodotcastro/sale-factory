# == Schema Information
#
# Table name: pedidos
#
#  id             :bigint(8)        not null, primary key
#  quantidade     :integer
#  produto_id     :bigint(8)
#  solicitacao_id :bigint(8)
#
# Indexes
#
#  index_produtos_solicitacoes_on_produto_id      (produto_id)
#  index_solicitacoes_produtos_on_solicitacao_id  (solicitacao_id)
#

FactoryBot.define do
  factory :pedido do
    quantidade {Faker::Number.number(2)}

    before(:create) do |pedido|
      pedido.produto = Produto.all.sample
    end

  end
end
