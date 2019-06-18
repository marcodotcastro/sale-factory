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

require 'rails_helper'

RSpec.describe Cartao, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
