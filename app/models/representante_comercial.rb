# == Schema Information
#
# Table name: representante_comerciais
#
#  id                :bigint(8)        not null, primary key
#  cep               :string
#  contato           :string
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
#  cliente_id        :bigint(8)
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_representante_comerciais_on_cidade_id   (cidade_id)
#  index_representante_comerciais_on_cliente_id  (cliente_id)
#  index_representante_comerciais_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (cliente_id => clientes.id)
#  fk_rails_...  (usuario_id => usuarios.id)
#

class RepresentanteComercial < ApplicationRecord
  belongs_to :cliente
  has_many :lojistas
  belongs_to :cidade
  belongs_to :usuario

  has_one_attached :logo

  validates :descricao, :cidade_id, presence: true

  def generate_geolocation
    address = "#{self.descricao},#{self.estado}".gsub(" ", "+")
    geolocation = Geolocation.new(address: address)
    self.latitude = geolocation.latitude
    self.longitude = geolocation.longitude
  end

end
