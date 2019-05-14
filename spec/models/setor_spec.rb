# == Schema Information
#
# Table name: setores
#
#  id         :bigint(8)        not null, primary key
#  descricao  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Setor, type: :model do

  before(:all) do
    #DADO
    create(:setor, descricao: "Setor 1")
  end

  it "setor" do
    #QUANDO
    setor = Setor.last

    #ENTÃO
    expect(setor.descricao).to eq("Setor 1")
  end
end
