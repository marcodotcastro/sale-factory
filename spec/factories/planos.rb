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
#  gateway_id      :string
#

FactoryBot.define do
  factory :plano do
    descricao {"10 Convites"}
    numero_convites {10}
    preco {300}
    gateway_id {["427635", "427675", "427676"].sample}
  end
end
