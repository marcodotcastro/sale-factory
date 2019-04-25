# == Schema Information
#
# Table name: clientes
#
#  id                :bigint(8)        not null, primary key
#  cep               :string
#  contato           :string
#  deleted_at        :datetime
#  descricao         :string
#  email             :string
#  endereco          :string
#  latitude          :float
#  longitude         :float
#  slug              :string
#  telefone          :string
#  telefone_whatsapp :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cidade_id         :bigint(8)
#  setor_id          :bigint(8)
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_clientes_on_cidade_id   (cidade_id)
#  index_clientes_on_deleted_at  (deleted_at)
#  index_clientes_on_setor_id    (setor_id)
#  index_clientes_on_slug        (slug) UNIQUE
#  index_clientes_on_usuario_id  (usuario_id)
#

FactoryBot.define do
  factory :cliente do
    sequence(:descricao) {|n| "Indústria Farmacêutica Melcon do Brasil S.A. #{n}"}
    endereco {"MD 7 - Viela Vp-2DA - Distrito Agro-Industrial de Anápolis (D A I A)"}
    cep {"75132-055"}
    contato {"Sr João Paulo"}
    sequence(:email) {|n| "joao.paulo#{n}@gmail.com"}
    telefone {"(62) 3902-3200"}
    telefone_whatsapp {"(62) 99902-3200"}
    latitude {-16.4064447}
    longitude {-48.9497198}

    before(:create) do |cliente|
      create(:usuario, tipo: "cliente", email: cliente.email, cliente: cliente)
    end

    cidade {Cidade.first || association(:cidade)}
    setor {Setor.first || association(:setor)}

    trait :com_representante do
      after(:create) do |cliente|
        create(:representante, :com_cliente, :com_lojistas, clientes: [cliente])
      end
    end

    trait :com_representantes do
      after(:create) do |cliente|
        create_list(:representante, 2, :com_cliente, :com_lojista, clientes: [cliente])
      end
    end

  end
end
