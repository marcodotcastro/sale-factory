# == Schema Information
#
# Table nome: lojistas
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

RSpec.describe "Via Cep" do

  it "search" do
    lojista = Lojista.create({"nome" => "OutLat Lynd", "endereco" => "Rua Padre Libério ", "estado" => "MG ", "cidade" => "Nova Serrana", "telefone" => nil})

    endereco = "#{lojista.estado.strip}/#{lojista.city.strip}"

    url = "https://viacep.com.br/ws/#{endereco}/json/"
    response = HTTParty.get(URI.escape(url))

    expect(response.parsed_response.first["cep"]).to eq("35519-000")
  end


end
