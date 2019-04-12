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
#  index_clientes_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (setor_id => setores.id)
#  fk_rails_...  (usuario_id => usuarios.id)
#

class Cliente < ApplicationRecord
  acts_as_paranoid
  has_many :representante_comerciais, dependent: :destroy
  belongs_to :cidade
  belongs_to :usuario
  belongs_to :setor

  has_one_attached :logo

  validates :descricao, :setor_id, :cidade_id, presence: true


  def generate_geolocation
    address = "#{self.descricao},#{self.estado}".gsub(" ", "+")
    geolocation = Geolocation.new(address: address)
    self.latitude = geolocation.latitude
    self.longitude = geolocation.longitude
  end

end
