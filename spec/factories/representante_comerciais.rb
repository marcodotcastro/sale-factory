# == Schema Information
#
# Table name: representante_comerciais
#
#  id         :bigint(8)        not null, primary key
#  cep        :string
#  contato    :string
#  descricao  :string
#  email      :string
#  endereco   :string
#  latitude   :float
#  longitude  :float
#  telefone   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cidade_id  :bigint(8)
#  cliente_id :bigint(8)
#
# Indexes
#
#  index_representante_comerciais_on_cidade_id   (cidade_id)
#  index_representante_comerciais_on_cliente_id  (cliente_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (cliente_id => clientes.id)
#

FactoryBot.define do
  factory :representante_comercial do
    sequence(:descricao) {|n| "A R Olivo Representações Ltda ME #{n}"}
    endereco {"R Primeiro de Maio, 77 - Stª Cecilia - Cravinhos, SP"}
    cep {"14140-000"}
    contato {"Ronaldo Henrique Olivo"}
    telefone {"(16) 99254-5151 / 3637-4299"}
    email {"rholivo@yahoo.com.br"}
    latitude {-21.348714}
    longitude {-47.7651449}

    association :cidade, :factory => :cidade
    association :cliente, :factory => :cliente

    trait :com_lojista do
      after(:create) do |representante_comercial|
        create(:lojista, representante_comercial: representante_comercial)
      end
    end

    trait :com_lojistas do
      after(:create) do |representante_comercial|
        create_list(:lojista, 2, representante_comercial: representante_comercial)
      end
    end

  end
end
