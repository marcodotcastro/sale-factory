# == Schema Information
#
# Table name: setores
#
#  id         :bigint(8)        not null, primary key
#  descricao  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :setor do
    descricao {"Farmacêutico"}
  end
end
