# == Schema Information
#
# Table name: lojistas
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
#
# Indexes
#
#  index_lojistas_on_cidade_id   (cidade_id)
#  index_lojistas_on_deleted_at  (deleted_at)
#  index_lojistas_on_slug        (slug) UNIQUE
#

FactoryBot.define do
  factory :lojista do
    sequence(:descricao) {|n| "Drogarias Bifarma #{n}"}
    sequence(:contato) {|n| "Marcelo Sousa #{n}"}
    sequence(:email) {|n| "marcelos#{n}@gmail.com"}
    endereco {"R. Barão do Rio Branco, 535 - Centro, Birigui - SP"}
    cep {"16200-001"}
    telefone {"(21) 99254-4332"}
    telefone_whatsapp {"(21) 99254-4332"}
    latitude {-22.6195575}
    longitude {-49.3215312}

    cidade {Cidade.first || association(:cidade)}

    after(:create) do |lojista|
      lojista.logo.attach(io: File.open(Rails.root.join("spec", "files", "lojista-logo-#{rand(1..6)}.jpg")), filename: "lojista-logo-#{rand(1..6)}.jpg", content_type: "image/jpeg")
    end

    before(:create) do |lojista|
      lojista.representantes << Representante.last(rand(Representante.count) + 1)
    end

  end
end
