require 'csv'
require 'httparty'
require 'via_cep'

class Geolocation

  def initialize(cep: nil, address: nil)
    if cep
      get_address_by_cep(cep.strip)
    else
      get_cep_by_address(address.strip)
    end
    get_geocode
  end

  def longitude
    @longitude
  end

  def latitude
    @latitude
  end

  def cep
    @cep
  end

  private

  def get_address_by_cep(cep)
    # Ao cadastrar o representative é preciso informar o cep da area que será responsável
    # Depois deve buscar o endereço pelo cep
    # https://viacep.com.br/
    # https://github.com/marcelobarreto/via_cep
    # https://cep.guiamais.com.br/

    url = "https://viacep.com.br/ws/#{cep}/json/"
    viacep = HTTParty.get(URI.escape(url))

    unless viacep["erro"]
      @address = ""
      @address.concat("#{viacep["bairro"]},".gsub(" ", "+")) unless viacep["bairro"].empty?
      @address.concat("#{viacep["localidade"]},".gsub(" ", "+")) unless viacep["localidade"].empty?
      @address.concat("#{viacep["uf"]}".gsub(" ", "+")) unless viacep["uf"].empty?
    end
  end

  def get_cep_by_address(address)
    @address = address
  end

  def get_geocode
    # Depois deve buscar a longitude e latitude pelo endereço ou cep
    # https://developers.google.com/maps/documentation/geocoding/intro
    #FIXME: Google Apis Geocode não está funcionando
    # if @address
    #   url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@address}&key=AIzaSyCa4Lbfk7nSV-HXuB2xHZ_nq-7QxZZmwFQ"
    #   response = HTTParty.get(URI.escape(url))
    #   @latitude = response.parsed_response["results"].first["geometry"]["location"]["lat"]
    #   @longitude = response.parsed_response["results"].first["geometry"]["location"]["lng"]
    # end
  end

end
