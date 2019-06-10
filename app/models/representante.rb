# == Schema Information
#
# Table name: representantes
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
#  raio_cobertura    :integer
#  slug              :string
#  telefone          :string
#  telefone_whatsapp :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cidade_id         :bigint(8)
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_representantes_on_cidade_id   (cidade_id)
#  index_representantes_on_deleted_at  (deleted_at)
#  index_representantes_on_slug        (slug) UNIQUE
#  index_representantes_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

class Representante < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  has_and_belongs_to_many :industrias, -> {distinct}
  has_and_belongs_to_many :lojistas, -> {distinct}
  has_many :solicitacoes
  belongs_to :cidade
  belongs_to :usuario

  friendly_id :descricao, use: :slugged

  has_one_attached :logo

  validates_presence_of :descricao, :cnpj, :cidade_id

  #TODO: Refactoring código duplicado
  #TODO: Mover para model concerns
  def solicitacao_em_aberto?(industria = nil)
    if industria
      self.solicitacoes.where(status: [:solicitado, :analisando, :pendente], industria_id: industria.id).any?
    else
      self.solicitacoes.where(status: [:solicitado, :analisando, :pendente]).any?
    end
  end

  #TODO: Refactoring código duplicado
  #TODO: Mover para model concerns
  def solicitado?
    self.solicitacoes.any?
  end

  #TODO: Mover para model concerns
  def total_de_vendas(industria = nil)
    if industria
      self.solicitacoes.where(status: :aceito, industria_id: industria.id).count
    else
      self.solicitacoes.where(status: :aceito).count
    end
  end

  #TODO: Mover para model concerns
  def total_de_receitas(industria = nil)
    if industria
      self.solicitacoes.joins(:produtos).where("solicitacoes.status = 'aceito' and solicitacoes.industria_id = #{industria.id}").group("pedidos.id").sum("produtos.preco * pedidos.quantidade").values.sum
    else
      self.solicitacoes.joins(:produtos).where("solicitacoes.status = 'aceito'").group("pedidos.id").sum("produtos.preco * pedidos.quantidade").values.sum
    end
  end

  #TODO: Mover para model concerns
  def total_de_lojistas(industria = nil)
    if industria
      Lojista.joins([:industrias, :representantes]).where("industrias_lojistas.industria_id = #{industria.id} and lojistas_representantes.representante_id = #{self.id}").distinct.count
    else
      Lojista.joins(:representantes).where("lojistas_representantes.representante_id = #{self.id}").distinct.count
    end
  end

  #TODO: Mover para model concerns
  def total_de_cidades(industria = nil)
    if industria
      Cidade.joins(lojistas: [:industrias, :representantes]).where("industrias_lojistas.industria_id = #{industria.id} and representantes.id = #{self.id}").distinct.count
    else
      Cidade.joins(lojistas: [:representantes]).where("representantes.id = #{self.id}").distinct.count
    end
  end

end
