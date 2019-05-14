# == Schema Information
#
# Table name: lojistas
#
#  id                :bigint(8)        not null, primary key
#  cep               :string
#  contato           :string
#  deleted_at        :datetime
#  descricao         :string
#  email             :string
#  endereco          :string
#  latitude          :float
#  longitude         :float
#  slug              :string
#  tamanho           :integer
#  telefone          :string
#  telefone_whatsapp :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cidade_id         :bigint(8)
#
# Indexes
#
#  index_lojistas_on_cidade_id   (cidade_id)
#  index_lojistas_on_deleted_at  (deleted_at)
#  index_lojistas_on_slug        (slug) UNIQUE
#

require 'rails_helper'

RSpec.describe Lojista, type: :model do

  before(:all) do
    #DADO
    create(:cidade, descricao: "Cidade 1")
    create(:setor, descricao: "Setor 1")
    create(:industria, descricao: "Indústria 1")
    create(:representante, descricao: "Representante 1")

    create(:lojista, descricao: "Lojista 1")
  end

  it "lojista do representante" do
    #QUANDO
    lojista = Lojista.last

    #ENTÃO
    expect(lojista.descricao).to eq("Lojista 1")
    expect(lojista.representantes.first.descricao).to eq("Representante 1")
    expect(lojista.cidade.descricao).to eq("Cidade 1")
  end

  xit "lojista da indústria" do
    #Somente quando uma solicitação é aceita
  end

end
