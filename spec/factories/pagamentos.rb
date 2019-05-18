# == Schema Information
#
# Table name: pagamentos
#
#  id         :bigint(8)        not null, primary key
#  ativo      :boolean
#  periodo    :integer
#  validade   :date
#  valor      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  plano_id   :bigint(8)
#  usuario_id :bigint(8)
#
# Indexes
#
#  index_pagamentos_on_plano_id    (plano_id)
#  index_pagamentos_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (plano_id => planos.id)
#  fk_rails_...  (usuario_id => usuarios.id)
#

FactoryBot.define do
  factory :pagamento do
    periodo {[:mensal, :trimestral, :semestral, :anual].sample}
    plano {Plano.all.sample}
  end
end
