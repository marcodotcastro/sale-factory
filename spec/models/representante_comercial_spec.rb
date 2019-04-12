# == Schema Information
#
# Table name: representante_comerciais
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
#  telefone          :string
#  telefone_whatsapp :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cidade_id         :bigint(8)
#  cliente_id        :bigint(8)
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_representante_comerciais_on_cidade_id   (cidade_id)
#  index_representante_comerciais_on_cliente_id  (cliente_id)
#  index_representante_comerciais_on_deleted_at  (deleted_at)
#  index_representante_comerciais_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (cliente_id => clientes.id)
#  fk_rails_...  (usuario_id => usuarios.id)
#

require 'rails_helper'

RSpec.describe RepresentanteComercial, type: :model do

  it "uma representante_comercial" do
    @representante_comercial = create(:representante_comercial)

    expect(@representante_comercial.descricao).to eq(RepresentanteComercial.last.descricao)
    expect(@representante_comercial.cidade.descricao).to eq(Cidade.last.descricao)
  end

  it "uma representante_comercial com representante comercial" do
    @representante_comercial = create(:representante_comercial, :com_lojista)

    expect(@representante_comercial.lojistas.first.descricao).to eq(Lojista.last.descricao)
  end

  it "uma representante_comercial com representantes comerciais" do
    @representante_comercial = create(:representante_comercial, :com_lojistas)

    expect(@representante_comercial.lojistas.first.descricao).to eq(Lojista.last(2).first.descricao)
    expect(@representante_comercial.lojistas.last.descricao).to eq(Lojista.last(2).last.descricao)
  end

end
