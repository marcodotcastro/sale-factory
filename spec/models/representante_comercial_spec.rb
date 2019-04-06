# == Schema Information
#
# Table name: representante_comerciais
#
#  id         :bigint(8)        not null, primary key
#  cep        :string
#  contato    :string
#  descricao  :string
#  email      :string
#  endereco   :string
#  latitude   :float
#  longitude  :float
#  telefone   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cidade_id  :bigint(8)
#  cliente_id :bigint(8)
#
# Indexes
#
#  index_representante_comerciais_on_cidade_id   (cidade_id)
#  index_representante_comerciais_on_cliente_id  (cliente_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (cliente_id => clientes.id)
#

require 'rails_helper'

RSpec.describe RepresentanteComercial, type: :model do

  it "uma representante_comercial" do
    @representante_comercial = create(:representante_comercial)

    expect(@representante_comercial.descricao).to eq("A R Olivo Representações Ltda ME 5")
    expect(@representante_comercial.cidade.descricao).to eq("Anápolis")
  end

  it "uma representante_comercial com representante comercial" do
    @representante_comercial = create(:representante_comercial, :com_lojista)

    expect(@representante_comercial.lojistas.first.descricao).to eq("Drogarias Bifarma 2")
  end

  it "uma representante_comercial com representantes comerciais" do
    @representante_comercial = create(:representante_comercial, :com_lojistas)

    expect(@representante_comercial.lojistas.first.descricao).to eq("Drogarias Bifarma 3")
    expect(@representante_comercial.lojistas.last.descricao).to eq("Drogarias Bifarma 4")
  end

end
