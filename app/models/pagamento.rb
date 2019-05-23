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

class Pagamento < ApplicationRecord
  belongs_to :usuario
  belongs_to :plano

  enum periodo: [:mensal, :trimestral, :semestral, :anual]

  before_create :calcular
  before_create :inativa_pagamento_anterior
  before_create :ativar

  validates_presence_of :plano_id, :periodo

  private

  def calcular
    case
    when self.mensal?
      self.validade = Date.today + 1.months
      self.valor = self.plano.preco * 1
    when self.trimestral?
      self.validade = Date.today + 3.months
      self.valor = self.plano.preco * 3
    when self.semestral?
      self.validade = Date.today + 6.months
      self.valor = self.plano.preco * 6
    when self.anual?
      self.validade = Date.today + 12.months
      self.valor = self.plano.preco * 12
    else
      self.validade = nil
      self.valor = 0
    end
  end

  def ativar
    self.ativo = true
  end

  def inativa_pagamento_anterior
    ultimo_pagamento = self.usuario.pagamentos.last
    ultimo_pagamento.update(ativo: false) if ultimo_pagamento
  end
end
