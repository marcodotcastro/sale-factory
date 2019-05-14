# == Schema Information
#
# Table name: cidades
#
#  id         :bigint(8)        not null, primary key
#  codigo     :string
#  descricao  :string
#  estado     :string
#  latitude   :float
#  longitude  :float
#  populacao  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Cidade, type: :model do

  before(:all) do
    #DADO
    create(:cidade, descricao: "Cidade 1", estado: "ES1")
  end

  it "cidade" do
    #QUANDO
    cidade = Cidade.last

    #ENTÃO
    expect(cidade.descricao).to eq("Cidade 1")
    expect(cidade.estado).to eq("ES1")
  end

end
