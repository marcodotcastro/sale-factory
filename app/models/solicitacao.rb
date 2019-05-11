# == Schema Information
#
# Table name: solicitacoes
#
#  id               :bigint(8)        not null, primary key
#  status           :string
#  venda_data       :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  industria_id     :bigint(8)
#  lojista_id       :bigint(8)
#  representante_id :bigint(8)
#
# Indexes
#
#  index_solicitacoes_on_industria_id      (industria_id)
#  index_solicitacoes_on_lojista_id        (lojista_id)
#  index_solicitacoes_on_representante_id  (representante_id)
#
# Foreign Keys
#
#  fk_rails_...  (industria_id => industrias.id)
#  fk_rails_...  (lojista_id => lojistas.id)
#  fk_rails_...  (representante_id => representantes.id)
#

class Solicitacao < ApplicationRecord
  include AASM
  belongs_to :representante
  belongs_to :lojista
  belongs_to :industria
  has_many :pedidos
  has_many :comentarios
  has_many :produtos, through: :pedidos
  accepts_nested_attributes_for :pedidos, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :industria_id, :lojista_id

  after_create :vincular_lojista_ao_industria
  after_update :adicionar_data_da_venda

  aasm :column => 'status' do
    #representante
    state :criado, initial: true
    state :solicitado
    #industria
    state :analisado
    state :pendente
    state :resolvido
    state :aceito
    state :recusado
    #comum
    state :cancelado

    event :solicitar do
      transitions from: [:criado, :pendente], to: :solicitado
    end

    event :analisar do
      transitions from: [:solicitado, :resolvido], to: :analisado
    end

    event :pendenciar do
      transitions from: [:solicitado, :resolvido], to: :pendente
    end

    event :resolver do
      transitions from: :pendente, to: :resolvido
    end

    event :aceitar do
      transitions from: [:solicitado, :analisado, :resolvido], to: :aceito
    end

    event :recusar do
      transitions from: [:solicitado, :analisado, :resolvido], to: :recusado
    end

    event :cancelar do
      transitions from: [:criado, :solicitado, :analisando], to: :cancelado
    end

  end

  def valor_total_dos_produtos
    self.pedidos.joins(:produto).group(:id).sum("produtos.preco * quantidade").values.sum
  end

  private

  def vincular_lojista_ao_industria
    self.industria.lojistas << self.lojista
  end

  def adicionar_data_da_venda
    self.venda_data = DateTime.current if self.aceito?
  end

end
