# == Schema Information
#
# Table name: solicitacoes
#
#  id               :bigint(8)        not null, primary key
#  status           :string
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

class Solicitacao < ApplicationRecord
  include AASM
  belongs_to :representante
  belongs_to :cliente
  has_many :pedidos
  has_many :produtos, through: :pedidos
  accepts_nested_attributes_for :pedidos, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :cliente_id

  aasm :representante, :column => 'status' do
    state :criado, initial: true
    state :solicitado
    state :cancelado

    event :solicitar do
      transitions from: :criado, to: :solicitado
    end

    event :cancelar do
      transitions from: [:criado, :solicitado], to: :cancelado
    end

  end

  aasm :cliente, :column => 'status' do
    state :solicitado
    state :cancelado
    state :analisado
    state :aceito
    state :nao_aceito

    event :analisar do
      transitions from: :solicitado, to: :analisado
    end

    event :aceitar do
      transitions from: :analisado, to: :aceito
    end

    event :nao_aceitar do
      transitions from: :analisado, to: :nao_aceito
    end

    event :cancelar do
      transitions from: :solicitado, to: :cancelado
    end

  end


end
