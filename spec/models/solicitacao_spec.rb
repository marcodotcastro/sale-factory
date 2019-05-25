# == Schema Information
#
# Table name: solicitacoes
#
#  id               :bigint(8)        not null, primary key
#  status           :string
#  venda_data       :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  industria_id     :bigint(8)
#  lojista_id       :bigint(8)
#  representante_id :bigint(8)
#
# Indexes
#
#  index_solicitacoes_on_industria_id      (industria_id)
#  index_solicitacoes_on_lojista_id        (lojista_id)
#  index_solicitacoes_on_representante_id  (representante_id)
#
# Foreign Keys
#
#  fk_rails_...  (industria_id => industrias.id)
#  fk_rails_...  (lojista_id => lojistas.id)
#  fk_rails_...  (representante_id => representantes.id)
#

require 'rails_helper'

RSpec.describe Solicitacao, type: :model do

  before(:all) do
    #DADO
    create(:cidade)
    create(:setor, descricao: "Setor 1")
    industria = create(:industria, descricao: "Indústria 1")
    representante = create(:representante, descricao: "Representante 1", industrias: [industria])
    lojista = create(:lojista, descricao: "Lojista 1", representantes: [representante])
    create(:produto, descricao: "Produto 1", industria: industria)

    create(:solicitacao, :com_pedido, industria: industria, representante: representante, lojista: lojista, status: "criado")
  end

  it "solicitacao" do
    #QUANDO
    solicitacao = Solicitacao.last

    #ENTÃO
    expect(solicitacao.industria.descricao).to eq("Indústria 1")
    expect(solicitacao.representante.descricao).to eq("Representante 1")
    expect(solicitacao.lojista.descricao).to eq("Lojista 1")
    expect(solicitacao.produtos.first.descricao).to eq("Produto 1")
  end


  it "solicitacao aceita" do
    #QUANDO
    solicitacao = Solicitacao.last
    solicitacao.solicitar!
    solicitacao.aceitar!

    #ENTÃO
    expect(solicitacao.status).to eq("aceito")
    expect(solicitacao.venda_data).to eq(Date.today)
  end
end
