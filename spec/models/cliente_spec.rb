# == Schema Information
#
# Table name: clientes
#
#  id                     :bigint(8)        not null, primary key
#  cep                    :string
#  contato                :string
#  descricao              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  endereco               :string
#  latitude               :float
#  longitude              :float
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  setor                  :string
#  telefone               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  cidade_id              :bigint(8)
#
# Indexes
#
#  index_clientes_on_cidade_id             (cidade_id)
#  index_clientes_on_email                 (email) UNIQUE
#  index_clientes_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

require 'rails_helper'

RSpec.describe Cliente, type: :model do

  it "uma cliente" do
    @cliente = create(:cliente)


    expect(@cliente.descricao).to eq(Cliente.last.descricao)
    expect(@cliente.cidade.descricao).to eq(Cidade.last.descricao)
  end

  it "uma cliente com representante comercial" do
    @cliente = create(:cliente, :com_representante_comercial)

    expect(@cliente.representante_comerciais.last.descricao).to eq(RepresentanteComercial.last.descricao)
  end

  it "uma cliente com representantes comerciais" do
    @cliente = create(:cliente, :com_representante_comerciais)

    expect(@cliente.representante_comerciais.first).to eq(RepresentanteComercial.last(2).first)
    expect(@cliente.representante_comerciais.last).to eq(RepresentanteComercial.last(2).last)
  end

end
