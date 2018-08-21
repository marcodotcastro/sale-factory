class City < ApplicationRecord
  before_save :generate_geolocation

  def generate_geolocation
    address = "#{self.description},#{self.uf}".gsub(" ", "+")
    geolocation = Geolocation.new(address: address)
    self.latitude = geolocation.latitude
    self.longitude = geolocation.longitude
  end
end
