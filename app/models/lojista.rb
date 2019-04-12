# == Schema Information
#
# Table name: lojistas
#
#  id                         :bigint(8)        not null, primary key
#  cep                        :string
#  contato                    :string
#  deleted_at                 :datetime
#  descricao                  :string
#  email                      :string
#  endereco                   :string
#  latitude                   :float
#  longitude                  :float
#  telefone                   :string
#  telefone_whatsapp          :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  cidade_id                  :bigint(8)
#  representante_comercial_id :bigint(8)
#
# Indexes
#
#  index_lojistas_on_cidade_id                   (cidade_id)
#  index_lojistas_on_deleted_at                  (deleted_at)
#  index_lojistas_on_representante_comercial_id  (representante_comercial_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (representante_comercial_id => representante_comerciais.id)
#

class Lojista < ApplicationRecord
  acts_as_paranoid
  belongs_to :representante_comercial
  belongs_to :cidade

  def generate_geolocation
    address = "#{self.descricao},#{self.estado}".gsub(" ", "+")
    geolocation = Geolocation.new(address: address)
    self.latitude = geolocation.latitude
    self.longitude = geolocation.longitude
  end

end
