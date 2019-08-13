# == Schema Information
#
# Table name: produtos
#
#  id           :bigint(8)        not null, primary key
#  ativo        :boolean
#  codigo       :string
#  deleted_at   :datetime
#  descricao    :string
#  detalhe      :text
#  preco        :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  industria_id :bigint(8)
#
# Indexes
#
#  index_produtos_on_deleted_at    (deleted_at)
#  index_produtos_on_industria_id  (industria_id)
#

class Produto < ApplicationRecord
  acts_as_paranoid
  belongs_to :industria, optional: true
  has_many :pedidos
  has_many :solicitacoes, through: :pedidos

  has_one_attached :foto
  has_many_attached :arquivos

  validates_presence_of :codigo, :descricao, :preco, :detalhe

  scope :ativos, -> {where(ativo: true)}

  #TODO: Refactoring código duplicado
  #TODO: Mover para model concerns
  def solicitado?
    self.solicitacoes.any?
  end

  def solicitacao_em_andamento?
    self.solicitacoes.where.not(status: [:criado, :aceito, :recusado]).any?
  end

end
