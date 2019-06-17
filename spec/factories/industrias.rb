# == Schema Information
#
# Table name: industrias
#
#  id                :bigint(8)        not null, primary key
#  cep               :string
#  cnpj              :string
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
#  index_industrias_on_cidade_id   (cidade_id)
#  index_industrias_on_deleted_at  (deleted_at)
#  index_industrias_on_setor_id    (setor_id)
#  index_industrias_on_slug        (slug) UNIQUE
#  index_industrias_on_usuario_id  (usuario_id)
#

FactoryBot.define do
  factory :industria do
    sequence(:descricao) {|n| "Indústria Farmacêutica Melcon do Brasil S.A. #{n}"}
    cnpj {Faker::CNPJ.numeric}
    endereco {"MD 7 - Viela Vp-2DA - Distrito Agro-Industrial de Anápolis (D A I A)"}
    cep {"75132-055"}
    sequence(:contato) {|n| "Sra Ana Paula #{n}"}
    sequence(:email) {|n| "ana.paula#{n}@gmail.com"}
    telefone {"6239023200"}
    telefone_whatsapp {"62999023200"}
    latitude {-16.4064447}
    longitude {-48.9497198}

    setor {Setor.last || association(:setor)}

    before(:create) do |industria|
      #Criar usuário
      usuario = create(:usuario, tipo: "industria", nome: industria.contato, email: industria.email, industria: industria)
      #Criar assinatura
      create(:assinatura, usuario_id: usuario.id)
      #Criar equipe com membro
      create(:usuario, tipo: "equipe_industria", nome: Faker::Name.name, email: Faker::Internet.email, invited_by_id: usuario.id, invited_by_type: "Industria", invitation_accepted_at: Time.now)
      #Vincular cidade
      industria.cidade = Cidade.all.sample
    end

    after(:create) do |industria|
      #Anexar foto
      industria.logo.attach(io: File.open(Rails.root.join("spec", "files", "logos", "industria-logo-#{rand(1..4)}.jpg")), filename: "industria-logo-#{rand(1..4)}.jpg", content_type: "image/jpeg")
    end

  end
end
