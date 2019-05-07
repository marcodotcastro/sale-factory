# == Schema Information
#
# Table name: solicitacoes
#
#  id               :bigint(8)        not null, primary key
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cliente_id       :bigint(8)
#  lojista_id       :bigint(8)
#  representante_id :bigint(8)
#
# Indexes
#
#  index_solicitacoes_on_cliente_id        (cliente_id)
#  index_solicitacoes_on_lojista_id        (lojista_id)
#  index_solicitacoes_on_representante_id  (representante_id)
#
# Foreign Keys
#
#  fk_rails_...  (cliente_id => clientes.id)
#  fk_rails_...  (lojista_id => lojistas.id)
#  fk_rails_...  (representante_id => representantes.id)
#

FactoryBot.define do
  factory :solicitacao do

    status {["criado", "solicitado", "aceito"].sample}

    trait :com_pedido do
      after(:create) do |solicitacao|
        create(:pedido, solicitacao: solicitacao)
      end
    end

    before(:create) do |solicitacao|
      solicitacao.cliente = Cliente.first
    end

    before(:create) do |solicitacao|
      solicitacao.representante = Representante.first
    end

    before(:create) do |solicitacao|
      solicitacao.lojista = Lojista.all.sample
    end

  end
end
