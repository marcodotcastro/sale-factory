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
#  index_clientes_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (setor_id => setores.id)
#  fk_rails_...  (usuario_id => usuarios.id)
#

FactoryBot.define do
  factory :cliente do
    descricao {"Indústria Farmacêutica Melcon do Brasil S.A."}
    endereco {"MD 7 - Viela Vp-2DA - Distrito Agro-Industrial de Anápolis (D A I A)"}
    cep {"75132-055"}
    contato {"Sr João Paulo"}
    email {"joao.paulo@melcon.com.br"}
    telefone {"(62) 3902-3200"}
    telefone_whatsapp {"(62) 99902-3200"}
    latitude {-16.4064447}
    longitude {-48.9497198}

    association :setor, :factory => :setor
    association :cidade, :factory => :cidade
    association :usuario, :factory => :usuario

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
