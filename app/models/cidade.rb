# == Schema Information
#
# Table name: cidades
#
#  id         :bigint(8)        not null, primary key
#  descricao  :string
#  estado     :string
#  latitude   :float
#  longitude  :float
#  populacao  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cidade < ApplicationRecord
  has_many :clientes
  has_many :representantes
  has_many :lojistas

  validates :estado, presence: true

  before_save :generate_geolocation

  def generate_geolocation
    address = "#{self.descricao},#{self.estado}".gsub(" ", "+")
    geolocation = Geolocation.new(address: address)
    self.latitude = geolocation.latitude
    self.longitude = geolocation.longitude
  end

end
