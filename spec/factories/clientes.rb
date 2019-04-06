# == Schema Information
#
# Table name: clientes
#
#  id         :bigint(8)        not null, primary key
#  cep        :string
#  contato    :string
#  descricao  :string
#  endereco   :string
#  latitude   :float
#  longitude  :float
#  setor      :string
#  telefone   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cidade_id  :bigint(8)
#
# Indexes
#
#  index_clientes_on_cidade_id  (cidade_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

FactoryBot.define do
  factory :cliente do
    descricao {"Indústria Farmacêutica Melcon do Brasil S.A."}
    contato {"João Paulo"}
    endereco {"MD 7 - Viela Vp-2DA - Distrito Agro-Industrial de Anápolis (D A I A)"}
    cep {"75132-055"}
    telefone {"(62) 3902-3200"}
    setor {"Farmacêutica"}
    latitude {-16.4064447}
    longitude {-48.9497198}

    association :cidade, :factory => :cidade

    trait :com_representante_comercial do
      after(:create) do |cliente|
        create(:representante_comercial, cliente: cliente)
      end
    end

    trait :com_representante_comerciais do
      after(:create) do |cliente|
        create_list(:representante_comercial, 2, cliente: cliente)
      end
    end

  end
end
