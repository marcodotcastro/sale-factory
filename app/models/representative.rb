# == Schema Information
#
# Table name: representatives
#
#  id          :integer          not null, primary key
#  description :string
#  contact     :string
#  address     :string
#  cep         :string
#  phone       :string
#  email       :string
#  latitude    :float
#  longitude   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Representative < ApplicationRecord

  before_save :generate_geolocation

  validates :cep, presence: true

  def generate_geolocation
    geolocation = Geolocation.new(cep: self.cep)
    self.latitude = geolocation.latitude
    self.longitude = geolocation.longitude
  end

end
