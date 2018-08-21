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

RSpec.describe "Geolocation" do

  it "import" do

    CSV.foreach("spec/files/representantes.csv", headers: :true) do |row|
      Representative.create(row.to_hash)
    end

    expect(Representative.last.latitude).to eq(-21.7923558)
    expect(Representative.last.longitude).to eq(-43.3622146)
  end

  context "geolocation cep" do

    it "38740-076" do
      cep = '38740-076'
      geolocation = Geolocation.new(cep: cep)

      expect(geolocation.latitude).to eq(-18.9443834)
      expect(geolocation.longitude).to eq(-46.9926574)

    end

    it "37757-000" do
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

    it "MG,Abadia dos Dourados" do
      address = 'Abadia dos Dourados,MG'
      geolocation = Geolocation.new(address: address)

      expect(geolocation.latitude).to eq(-18.4871142)
      expect(geolocation.longitude).to eq(-47.402741)
    end

  end


end
