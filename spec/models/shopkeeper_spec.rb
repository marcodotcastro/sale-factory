# == Schema Information
#
# Table name: shopkeepers
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
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
    # search = ViaCep::SearchByAddress.new(state: 'SP', city: 'São Paulo', street: 'Praça da Sé')
    #
    # search.zipcode
  end


end
