# == Schema Information
#
# Table name: cartoes
#
#  id            :bigint(8)        not null, primary key
#  ano           :string
#  cvv           :string
#  mes           :string
#  numero        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  assinatura_id :bigint(8)
#
# Indexes
#
#  index_cartoes_on_assinatura_id  (assinatura_id)
#
# Foreign Keys
#
#  fk_rails_...  (assinatura_id => assinaturas.id)
#

FactoryBot.define do
  factory :cartao do
    numero {"5208607641206488"}
    ano {"20"}
    mes {"03"}
    cvv {"879"}
  end
end
