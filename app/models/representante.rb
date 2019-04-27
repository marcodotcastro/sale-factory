# == Schema Information
#
# Table name: representantes
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

  has_and_belongs_to_many :clientes, -> {distinct}
  has_and_belongs_to_many :lojistas, -> {distinct}
  belongs_to :cidade
  belongs_to :usuario

  friendly_id :descricao, use: :slugged

  has_one_attached :logo

  validates :descricao, :cidade_id, presence: true

end