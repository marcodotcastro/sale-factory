# == Schema Information
#
# Table name: produtos
#
#  id         :bigint(8)        not null, primary key
#  descricao  :string
#  preco      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cliente_id :bigint(8)
#
# Indexes
#
#  index_produtos_on_cliente_id  (cliente_id)
#
# Foreign Keys
#
#  fk_rails_...  (cliente_id => clientes.id)
#

require 'rails_helper'

RSpec.describe Produto, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
