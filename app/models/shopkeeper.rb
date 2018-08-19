# == Schema Information
#
# Table name: shopkeepers
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  state      :string
#  city       :string
#  phone      :string
#  cep        :string
#  latitude   :string
#  longitude  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shopkeeper < ApplicationRecord

  before_save :generate_geolocation

  def generate_geolocation
    geolocation = Geolocation.new(cep: self.cep)
    self.latitude = geolocation.latitude
    self.longitude = geolocation.longitude
  end

end
