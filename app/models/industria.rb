# == Schema Information
#
# Table name: industrias
#
#  id                :bigint(8)        not null, primary key
#  cep               :string
#  cnpj              :string
#  contato           :string
#  deleted_at        :datetime
#  descricao         :string
#  email             :string
#  endereco          :string
#  latitude          :float
#  longitude         :float
#  slug              :string
#  telefone          :string
#  telefone_whatsapp :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cidade_id         :bigint(8)
#  setor_id          :bigint(8)
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_industrias_on_cidade_id   (cidade_id)
#  index_industrias_on_deleted_at  (deleted_at)
#  index_industrias_on_setor_id    (setor_id)
#  index_industrias_on_slug        (slug) UNIQUE
#  index_industrias_on_usuario_id  (usuario_id)
#

class Industria < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  has_and_belongs_to_many :representantes, -> {distinct}
  has_and_belongs_to_many :lojistas, -> {distinct}
  has_many :produtos
  has_many :solicitacoes
  belongs_to :cidade
  belongs_to :usuario
  belongs_to :setor

  friendly_id :descricao, use: :slugged

  has_one_attached :logo

  validates :descricao, :setor_id, :cidade_id, presence: true

  #TODO: Mover para model concerns
  def total_de_representantes
    self.representantes.count
  end

  #TODO: Mover para model concerns
  def total_de_vendas
    self.solicitacoes.where(status: :aceito).count
  end

  #TODO: Mover para model concerns
  def total_de_receitas
    self.solicitacoes.joins(:produtos).where("solicitacoes.status = 'aceito'").group("pedidos.id").sum("produtos.preco * pedidos.quantidade").values.sum
  end

  #TODO: Mover para model concerns
  def total_de_lojistas
    self.lojistas.count
  end

  #TODO: Mover para model concerns
  def total_de_cidades
    Cidade.joins(lojistas: :industrias).where("industrias_lojistas.industria_id = #{self.id}").distinct.count
  end

end
