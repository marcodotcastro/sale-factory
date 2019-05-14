# == Schema Information
#
# Table name: comentarios
#
#  id             :bigint(8)        not null, primary key
#  descricao      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  solicitacao_id :bigint(8)
#  usuario_id     :bigint(8)
#
# Indexes
#
#  index_comentarios_on_solicitacao_id  (solicitacao_id)
#  index_comentarios_on_usuario_id      (usuario_id)
#

require 'rails_helper'

RSpec.describe Comentario, type: :model do

  before(:all) do
    #DADO
    create(:cidade, descricao: "Cidade 1")
    create(:setor, descricao: "Setor 1")
    industria = create(:industria, descricao: "Indústria 1")
    representante = create(:representante, descricao: "Representante 1")
    lojista = create(:lojista, descricao: "Lojista 1")
    solicitacao = create(:solicitacao, industria: industria, representante: representante, lojista: lojista)

    create(:comentario, descricao: "Comentário 1", solicitacao: solicitacao)
  end

  it "comentário" do
    #QUANDO
    comentario = Comentario.last

    #ENTÃO
    expect(comentario.descricao).to eq("Comentário 1")
    expect(comentario.solicitacao.industria.descricao).to eq("Indústria 1")
    expect(comentario.solicitacao.representante.descricao).to eq("Representante 1")
    expect(comentario.solicitacao.lojista.descricao).to eq("Lojista 1")
    #TODO: Adicionar mais expect
  end

end
