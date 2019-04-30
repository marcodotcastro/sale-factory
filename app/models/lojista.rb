# == Schema Information
#
# Table name: lojistas
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
#
# Indexes
#
#  index_lojistas_on_cidade_id   (cidade_id)
#  index_lojistas_on_deleted_at  (deleted_at)
#  index_lojistas_on_slug        (slug) UNIQUE
#

class Lojista < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  has_and_belongs_to_many :representantes, -> {distinct}
  has_and_belongs_to_many :clientes, -> {distinct}
  has_and_belongs_to_many :lojistas, -> {distinct}
  has_many :solicitacaos
  belongs_to :cidade

  validates_presence_of :cidade_id

  friendly_id :descricao, use: :slugged

end
