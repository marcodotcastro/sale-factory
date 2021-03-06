# == Schema Information
#
# Table name: representantes
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

RSpec.describe "Geolocation" do


  context "geolocation cep" do

    xit "38740-076" do
      cep = '38740-076'
      geolocation = Geolocation.new(cep: cep)

      expect(geolocation.latitude).to eq(-18.9443834)
      expect(geolocation.longitude).to eq(-46.9926574)

    end

    xit "37757-000" do
      cep = '37757-000'
      geolocation = Geolocation.new(cep: cep)

      expect(geolocation.latitude).to eq(-21.777416)
      expect(geolocation.longitude).to eq(-45.9677701)

    end

    it "37130-000" do
      cep = '37130-000'
      geolocation = Geolocation.new(cep: cep)

      expect(geolocation.latitude).to eq(nil)
      expect(geolocation.longitude).to eq(nil)
    end

  end

  context "geolocation address" do

    xit "GO,Panamá" do
      #FIXME: A API não está pesquisando cidades do Brasil. No exemplo da cidade Paramá GO, a api busca o país.

      address = 'GO,Panamá'
      geolocation = Geolocation.new(address: address)

      expect(geolocation.latitude).to eq(-18.4871142)
      expect(geolocation.longitude).to eq(-47.402741)
    end

  end


end
