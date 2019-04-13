# == Schema Information
#
# Table name: representantes
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
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_representantes_on_cidade_id   (cidade_id)
#  index_representantes_on_deleted_at  (deleted_at)
#  index_representantes_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (usuario_id => usuarios.id)
#

require 'rails_helper'

RSpec.describe Representante, type: :model do

  it "uma representante" do
    @representante = create(:representante)

    expect(@representante.descricao).to eq(Representante.last.descricao)
    expect(@representante.cidade.descricao).to eq(Cidade.last.descricao)
  end

  it "uma representante com representante" do
    @representante = create(:representante, :com_lojista)

    expect(@representante.lojistas.first.descricao).to eq(Lojista.last.descricao)
  end

  it "uma representante com representantes" do
    @representante = create(:representante, :com_lojistas)

    expect(@representante.lojistas.first.descricao).to eq(Lojista.last(2).first.descricao)
    expect(@representante.lojistas.last.descricao).to eq(Lojista.last(2).last.descricao)
  end

end
