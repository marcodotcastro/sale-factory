# == Schema Information
#
# Table name: industrias
#
#  id                :bigint(8)        not null, primary key
#  cep               :string
#  cnpj              :string
#  contato           :string
#  deleted_at        :datetime
#  descricao         :string
#  email             :string
#  endereco          :string
#  latitude          :float
#  longitude         :float
#  slug              :string
#  telefone          :string
#  telefone_whatsapp :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cidade_id         :bigint(8)
#  setor_id          :bigint(8)
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_industrias_on_cidade_id   (cidade_id)
#  index_industrias_on_deleted_at  (deleted_at)
#  index_industrias_on_setor_id    (setor_id)
#  index_industrias_on_slug        (slug) UNIQUE
#  index_industrias_on_usuario_id  (usuario_id)
#

require 'rails_helper'

RSpec.describe Industria, type: :model do

  before(:all) do
    #DADO
    create(:cidade, descricao: "Cidade 1")
    create(:setor, descricao: "Setor 1")

    create(:industria, descricao: "Indústria 1")
  end

  it "industria" do
    #QUANDO
    industria = Industria.last

    #ENTÃO
    expect(industria.descricao).to eq("Indústria 1")
    expect(industria.cidade.descricao).to eq("Cidade 1")
    expect(industria.setor.descricao).to eq("Setor 1")
  end

end
