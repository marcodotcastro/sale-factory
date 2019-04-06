# == Schema Information
#
# Table name: cidades
#
#  id         :bigint(8)        not null, primary key
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
    @cidade = create(:cidade)
  end

  it "uma cidade" do
    expect(@cidade.descricao).to eq("Anápolis")
    expect(@cidade.estado).to eq("Goiás")
  end

end
