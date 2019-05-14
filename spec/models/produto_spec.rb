# == Schema Information
#
# Table name: produtos
#
#  id           :bigint(8)        not null, primary key
#  descricao    :string
#  preco        :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  industria_id :bigint(8)
#
# Indexes
#
#  index_produtos_on_industria_id  (industria_id)
#
# Foreign Keys
#
#  fk_rails_...  (industria_id => industrias.id)
#

require 'rails_helper'

RSpec.describe Produto, type: :model do

  before(:all) do
    #DADO
    create(:cidade)
    create(:setor, descricao: "Setor 1")
    create(:industria, descricao: "Indústria 1")

    create(:produto, descricao: "Produto 1")
  end

  it "produto" do
    #QUANDO
    produto = Produto.last

    #ENTÃO
    expect(produto.descricao).to eq("Produto 1")
    expect(produto.industria.descricao).to eq("Indústria 1")
    expect(produto.industria.setor.descricao).to eq("Setor 1")
  end

end
