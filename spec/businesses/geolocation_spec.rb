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

    expect(Representative.last.latitude).to eq(-21.7882576)
    expect(Representative.last.longitude).to eq(-43.3652338)
  end

  it "geolocation" do
    cep = '30110-000'
    geolocation = Geolocation.new(cep)

    expect(geolocation.latitude).to eq(-19.9215507)
    expect(geolocation.longitude).to eq(-43.9402886)

  end

end
