# == Schema Information
#
# Table name: clientes
#
#  id                     :bigint(8)        not null, primary key
#  cep                    :string
#  contato                :string
#  descricao              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  endereco               :string
#  latitude               :float
#  longitude              :float
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  setor                  :string
#  telefone               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  cidade_id              :bigint(8)
#
# Indexes
#
#  index_clientes_on_cidade_id             (cidade_id)
#  index_clientes_on_email                 (email) UNIQUE
#  index_clientes_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

class Cliente < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :representante_comerciais
  belongs_to :cidade

  def generate_geolocation
    address = "#{self.descricao},#{self.estado}".gsub(" ", "+")
    geolocation = Geolocation.new(address: address)
    self.latitude = geolocation.latitude
    self.longitude = geolocation.longitude
  end

end
