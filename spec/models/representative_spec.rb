# == Schema Information
#
# Table name: representatives
#
#  id          :integer          not null, primary key
#  description :string
#  contact     :string
#  address     :string
#  phone       :string
#  email       :string
#  latitude    :float
#  longitude   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

require 'csv'
require 'httparty'
require 'via_cep'


RSpec.describe "Representative" do

  it "import" do

    CSV.foreach("spec/files/representantes.csv", headers: :true) do |row|
      Representative.create(row.to_hash)
    end

    expect(Representative.count).to eq(4)
  end

  it "geolocation" do
    # Ao cadastrar o representative é preciso informar o cep da area que será responsável
    # Depois deve buscar o endereço pelo cep
    #    https://viacep.com.br/
    #    https://github.com/marcelobarreto/via_cep
    # https://cep.guiamais.com.br/

    address = ViaCep::Address.new('30110-000')

    address = "#{address.street},#{address.neighborhood},#{address.city},#{address.state}".gsub!(" ", "+")

    # Depois deve buscar a longitude e latitude pelo endereço ou cep
    #    https://developers.google.com/maps/documentation/geocoding/intro

    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=AIzaSyCYXKThnJTkgWDCRY_8iio0A-yvM0xStgY"
    response = HTTParty.get(URI.escape(url))
    response.parsed_response

    expect(response.parsed_response["results"].first["geometry"]["location"]["lat"]).to eq(-19.9215507)
    expect(response.parsed_response["results"].first["geometry"]["location"]["lng"]).to eq(-43.9402886)

  end

  it "map marker clustering" do
    #https://developers.google.com/maps/documentation/javascript/marker-clustering
  end

end
