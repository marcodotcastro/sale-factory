# == Schema Information
#
# Table name: solicitacoes
#
#  id               :bigint(8)        not null, primary key
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cliente_id       :bigint(8)
#  representante_id :bigint(8)
#
# Indexes
#
#  index_solicitacoes_on_cliente_id        (cliente_id)
#  index_solicitacoes_on_representante_id  (representante_id)
#
# Foreign Keys
#
#  fk_rails_...  (cliente_id => clientes.id)
#  fk_rails_...  (representante_id => representantes.id)
#

FactoryBot.define do
  factory :solicitacao do

    trait :com_pedido do
      after(:create) do |solicitacao|
        create(:pedido, solicitacao: solicitacao)
      end
    end

    before(:create) do |solicitacao|
      solicitacao.cliente = Cliente.all.sample
    end

    before(:create) do |solicitacao|
      solicitacao.representante = Representante.all.sample
    end

  end
end
