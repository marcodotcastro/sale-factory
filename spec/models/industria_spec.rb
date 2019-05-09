# == Schema Information
#
# Table name: industrias
#
#  id                :bigint(8)        not null, primary key
#  cep               :string
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

  it "uma industria" do
    @industria = create(:industria)

    expect(@industria.descricao).to eq(Industria.last.descricao)
    expect(@industria.cidade.descricao).to eq(Cidade.last.descricao)
  end

  it "uma industria com representante" do
    @industria = create(:industria, :com_representante)

    expect(@industria.representantes.last.descricao).to eq(Representante.last.descricao)
  end

  it "uma industria com representantes" do
    @industria = create(:industria, :com_representantes)

    expect(@industria.representantes.first).to eq(Representante.last(2).first)
    expect(@industria.representantes.last).to eq(Representante.last(2).last)
  end

end
