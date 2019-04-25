# == Schema Information
#
# Table name: clientes
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
#  index_clientes_on_cidade_id   (cidade_id)
#  index_clientes_on_deleted_at  (deleted_at)
#  index_clientes_on_setor_id    (setor_id)
#  index_clientes_on_slug        (slug) UNIQUE
#  index_clientes_on_usuario_id  (usuario_id)
#

require 'rails_helper'

RSpec.describe Cliente, type: :model do

  it "uma cliente" do
    @cliente = create(:cliente)

    expect(@cliente.descricao).to eq(Cliente.last.descricao)
    expect(@cliente.cidade.descricao).to eq(Cidade.last.descricao)
  end

  it "uma cliente com representante" do
    @cliente = create(:cliente, :com_representante)

    expect(@cliente.representantes.last.descricao).to eq(Representante.last.descricao)
  end

  it "uma cliente com representantes" do
    @cliente = create(:cliente, :com_representantes)

    expect(@cliente.representantes.first).to eq(Representante.last(2).first)
    expect(@cliente.representantes.last).to eq(Representante.last(2).last)
  end

end
