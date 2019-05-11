# == Schema Information
#
# Table name: solicitacoes
#
#  id               :bigint(8)        not null, primary key
#  status           :string
#  venda_data       :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  industria_id     :bigint(8)
#  lojista_id       :bigint(8)
#  representante_id :bigint(8)
#
# Indexes
#
#  index_solicitacoes_on_industria_id      (industria_id)
#  index_solicitacoes_on_lojista_id        (lojista_id)
#  index_solicitacoes_on_representante_id  (representante_id)
#
# Foreign Keys
#
#  fk_rails_...  (industria_id => industrias.id)
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
      representante = Representante.all.sample
      #Vincular representante
      solicitacao.representante = representante
      #Vincular industria
      solicitacao.industria = representante.industrias.all.sample
      #Vincular lojista
      solicitacao.lojista = representante.lojistas.all.sample
    end

    after(:create) do |solicitacao|
      solicitacao.update(venda_data: rand(6.months.ago..Time.now)) if solicitacao.aceito?
    end

  end
end
