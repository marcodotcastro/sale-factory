# == Schema Information
#
# Table name: planos
#
#  id              :bigint(8)        not null, primary key
#  descricao       :string
#  numero_convites :integer
#  preco           :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :plano do
    descricao { "MyString" }
    numero_convites { 1 }
    preco { 1.5 }
  end
end
