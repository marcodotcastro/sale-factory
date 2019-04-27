# == Schema Information
#
# Table name: clientes
#
#  id                :bigint(8)        not null, primary key
#  cep               :string
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
#  index_clientes_on_cidade_id   (cidade_id)
#  index_clientes_on_deleted_at  (deleted_at)
#  index_clientes_on_setor_id    (setor_id)
#  index_clientes_on_slug        (slug) UNIQUE
#  index_clientes_on_usuario_id  (usuario_id)
#

class Cliente < ApplicationRecord
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

end
