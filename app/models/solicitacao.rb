# == Schema Information
#
# Table name: solicitacoes
#
#  id               :bigint(8)        not null, primary key
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cliente_id       :bigint(8)
#  lojista_id       :bigint(8)
#  representante_id :bigint(8)
#
# Indexes
#
#  index_solicitacoes_on_cliente_id        (cliente_id)
#  index_solicitacoes_on_lojista_id        (lojista_id)
#  index_solicitacoes_on_representante_id  (representante_id)
#
# Foreign Keys
#
#  fk_rails_...  (cliente_id => clientes.id)
#  fk_rails_...  (lojista_id => lojistas.id)
#  fk_rails_...  (representante_id => representantes.id)
#

class Solicitacao < ApplicationRecord
  include AASM
  belongs_to :representante
  belongs_to :lojista
  belongs_to :cliente
  has_many :pedidos
  has_many :produtos, through: :pedidos
  accepts_nested_attributes_for :pedidos, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :cliente_id, :lojista_id

  after_create :vincular_lojista_ao_cliente

  aasm :column => 'status' do
    #representante
    state :criado, initial: true
    state :solicitado
    #cliente
    state :analisado
    state :aceito
    state :recusado
    #comum
    state :cancelado

    event :solicitar do
      transitions from: :criado, to: :solicitado
    end

    event :analisar do
      transitions from: [:solicitado], to: :analisado
    end

    event :aceitar do
      transitions from: [:solicitado, :analisado], to: :aceito
    end

    event :recusar do
      transitions from: [:solicitado, :analisado], to: :recusado
    end

    event :cancelar do
      transitions from: [:criado, :solicitado, :analisando], to: :cancelado
    end

  end

  private

  def vincular_lojista_ao_cliente
    self.cliente.lojistas << self.lojista
  end

end
