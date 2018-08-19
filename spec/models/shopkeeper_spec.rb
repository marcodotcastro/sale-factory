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

require 'rails_helper'
require 'via_cep'

RSpec.describe "Shopkeeper" do

  it "via cep search" do
    shopkeeper = Shopkeeper.create({"name" => "OutLat Lynd", "address" => "Rua Padre Libério ", "state" => "MG ", "city" => "Nova Serrana", "phone" => nil})

    address = "#{shopkeeper.state.strip}/#{shopkeeper.city.strip}"

    url = "https://viacep.com.br/ws/#{address}/json/"
    response = HTTParty.get(URI.escape(url))

    expect(response.parsed_response.first["cep"]).to eq("35519-000")
  end


end
