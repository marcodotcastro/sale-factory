# == Schema Information
#
# Table name: representantes
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
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_representantes_on_cidade_id   (cidade_id)
#  index_representantes_on_deleted_at  (deleted_at)
#  index_representantes_on_slug        (slug) UNIQUE
#  index_representantes_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

FactoryBot.define do
  factory :representante do
    sequence(:descricao) {|n| "A R Olivo Representações Ltda ME #{n}"}
    endereco {"R Primeiro de Maio, 77 - Stª Cecilia - Cravinhos, SP"}
    cep {"14140-000"}
    sequence(:contato) {|n| "Ronaldo Henrique Olivo #{n}"}
    telefone {"(16) 99254-5151 / 3637-4299"}
    telefone_whatsapp {"(16) 99254-5151"}
    sequence(:email) {|n| "ronaldo.henrique#{n}@gmail.com"}
    latitude {-21.348714}
    longitude {-47.7651449}

    cidade {Cidade.first || association(:cidade)}

    trait :com_cliente do
      after(:create) do |representante|
        create_list(:cliente, 2, representantes: [representante])
      end
    end

    trait :com_lojista do
      after(:create) do |representante|
        create(:lojista, representantes: [representante])
      end
    end

    trait :com_lojistas do
      after(:create) do |representante|
        create_list(:lojista, 2, representantes: [representante])
      end
    end

    before(:create) do |representante|
      create(:usuario, tipo: "representante", nome: representante.contato, email: representante.email, representante: representante)
    end

  end
end
