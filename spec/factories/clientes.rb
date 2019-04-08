# == Schema Information
#
# Table name: clientes
#
#  id                     :bigint(8)        not null, primary key
#  cep                    :string
#  contato                :string
#  descricao              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  endereco               :string
#  latitude               :float
#  longitude              :float
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  setor                  :string
#  telefone               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  cidade_id              :bigint(8)
#
# Indexes
#
#  index_clientes_on_cidade_id             (cidade_id)
#  index_clientes_on_email                 (email) UNIQUE
#  index_clientes_on_reset_password_token  (reset_password_token) UNIQUE
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
    email {"joao.paulo@melcon.com.br"}
    password {12345678}
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
