# == Schema Information
#
# Table name: representatives
#
#  id          :integer          not null, primary key
#  description :string
#  contact     :string
#  address     :string
#  cep         :string
#  phone       :string
#  email       :string
#  latitude    :float
#  longitude   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe "Representative" do

  before(:all) do
    @representative = Representative.create({"description" => "CLAUDIO COUTO", "contact" => " CLAUDIO", "address" => " GRANDE BH", "cep" => " 30110-000", "phone" => " 31-98485-9555", "email" => " CLAUDIOPCOUTO@HOTMAIL.COM"})
  end

  it "create" do
    expect(@representative.latitude).to eq(-19.9215507)
    expect(@representative.longitude).to eq(-43.9402886)
  end

  it "update" do
    @representative.update({"description" => "WDF REPRESENTAÇÕES", "contact" => " WENDEL", "address" => " Triângulo Pte. Nova MG", "cep" => " 35430-577", "phone" => " (34) 9 9298-0505", "email" => " WENDELDANIEL2102@GMAIL.COM"})
    expect(@representative.latitude).to eq(-20.40527)
    expect(@representative.longitude).to eq(-42.9107433)
  end


end
