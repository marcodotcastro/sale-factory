# == Schema Information
#
# Table name: clientes
#
#  id         :bigint(8)        not null, primary key
#  cep        :string
#  contato    :string
#  descricao  :string
#  endereco   :string
#  latitude   :float
#  longitude  :float
#  setor      :string
#  telefone   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cidade_id  :bigint(8)
#
# Indexes
#
#  index_clientes_on_cidade_id  (cidade_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

require 'rails_helper'

RSpec.describe Cliente, type: :model do

  it "uma cliente" do
    @cliente = create(:cliente)

    expect(@cliente.descricao).to eq("Indústria Farmacêutica Melcon do Brasil S.A.")
    expect(@cliente.cidade.descricao).to eq("Anápolis")
  end

  it "uma cliente com representante comercial" do
    @cliente = create(:cliente, :com_representante_comercial)

    expect(@cliente.representante_comercials.first.descricao).to eq("A R Olivo Representações Ltda ME 1")
  end

  it "uma cliente com representantes comerciais" do
    @cliente = create(:cliente, :com_representante_comerciais)

    expect(@cliente.representante_comercials.first.descricao).to eq("A R Olivo Representações Ltda ME 2")
    expect(@cliente.representante_comercials.last.descricao).to eq("A R Olivo Representações Ltda ME 3")
  end

end
