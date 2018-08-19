require 'csv'
require 'httparty'
require 'via_cep'

class Geolocation

  def initialize(cep)
    @cep = cep.strip
    get_cep
    get_geocode
  end

  def get_cep
    # Ao cadastrar o representative é preciso informar o cep da area que será responsável
    # Depois deve buscar o endereço pelo cep
    # https://viacep.com.br/
    # https://github.com/marcelobarreto/via_cep
    # https://cep.guiamais.com.br/

    viacep = ViaCep::Address.new(@cep)

    @address = "#{viacep.street},#{viacep.neighborhood},#{viacep.city},#{viacep.state}".gsub!(" ", "+")
  end

  def get_geocode
    # Depois deve buscar a longitude e latitude pelo endereço ou cep
    # https://developers.google.com/maps/documentation/geocoding/intro

    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@address}&key=AIzaSyCYXKThnJTkgWDCRY_8iio0A-yvM0xStgY"
    response = HTTParty.get(URI.escape(url))
    @latitude = response.parsed_response["results"].first["geometry"]["location"]["lat"]
    @longitude = response.parsed_response["results"].first["geometry"]["location"]["lng"]
  end


  def longitude
    @longitude
  end

  def latitude
    @latitude
  end

end