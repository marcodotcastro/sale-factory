# == Schema Information
#
# Table name: lojistas
#
#  id                         :bigint(8)        not null, primary key
#  cep                        :string
#  contato                    :string
#  descricao                  :string
#  email                      :string
#  endereco                   :string
#  latitude                   :float
#  longitude                  :float
#  telefone                   :string
#  telefone_whatsapp          :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  cidade_id                  :bigint(8)
#  representante_comercial_id :bigint(8)
#
# Indexes
#
#  index_lojistas_on_cidade_id                   (cidade_id)
#  index_lojistas_on_representante_comercial_id  (representante_comercial_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (representante_comercial_id => representante_comerciais.id)
#

FactoryBot.define do
  factory :lojista do
    sequence(:descricao) {|n| "Drogarias Bifarma #{n}"}
    endereco {"R. Barão do Rio Branco, 535 - Centro, Birigui - SP"}
    cep {"16200-001"}
    contato {"Marcelo Sousa"}
    telefone {"(21) 99254-4332"}
    telefone_whatsapp {"(21) 99254-4332"}
    email {"marcelos@gmail.com"}
    latitude {-22.6195575}
    longitude {-49.3215312}

    association :representante_comercial, :factory => :representante_comercial
    association :cidade, :factory => :cidade

  end
end
