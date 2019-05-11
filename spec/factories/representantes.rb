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
#  raio_cobertura    :integer
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

    before(:create) do |representante|
      #Criar usuário
      create(:usuario, :vincular_convite, tipo: "representante", nome: representante.contato, email: representante.email, representante: representante)
      #Vincular cidade
      representante.cidade = Cidade.all.sample
      representante.industrias << [Industria.all.sample]
    end

    after(:create) do |representante|
      #Anexar logo
      representante.logo.attach(io: File.open(Rails.root.join("spec", "files", "logos", "representante-logo-#{rand(1..7)}.jpg")), filename: "representante-logo-#{rand(1..7)}.jpg", content_type: "image/jpeg")
    end

  end
end
