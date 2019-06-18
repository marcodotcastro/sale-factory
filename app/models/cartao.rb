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

class Cartao < ApplicationRecord
  belongs_to :assinatura

  validates_presence_of :numero, :mes, :ano, :cvv
end
