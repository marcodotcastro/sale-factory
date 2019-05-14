# == Schema Information
#
# Table name: cidades
#
#  id         :bigint(8)        not null, primary key
#  codigo     :string
#  descricao  :string
#  estado     :string
#  latitude   :float
#  longitude  :float
#  populacao  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :cidade do
    descricao {"Anápolis"}
    estado {"GO"}
    populacao {361.991}
    latitude {-16.3285}
    longitude {-48.9534}
  end
end
