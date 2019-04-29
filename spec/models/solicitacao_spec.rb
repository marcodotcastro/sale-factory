# == Schema Information
#
# Table name: solicitacoes
#
#  id               :bigint(8)        not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cliente_id       :bigint(8)
#  representante_id :bigint(8)
#
# Indexes
#
#  index_solicitacoes_on_cliente_id        (cliente_id)
#  index_solicitacoes_on_representante_id  (representante_id)
#
# Foreign Keys
#
#  fk_rails_...  (cliente_id => clientes.id)
#  fk_rails_...  (representante_id => representantes.id)
#

require 'rails_helper'

RSpec.describe Solicitacao, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end