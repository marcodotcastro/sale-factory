# == Schema Information
#
# Table name: assinaturas
#
#  id         :bigint(8)        not null, primary key
#  situacao   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gateway_id :string
#  plano_id   :bigint(8)
#  usuario_id :bigint(8)
#
# Indexes
#
#  index_assinaturas_on_plano_id    (plano_id)
#  index_assinaturas_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (plano_id => planos.id)
#  fk_rails_...  (usuario_id => usuarios.id)
#

require 'rails_helper'

RSpec.describe Assinatura, type: :model do

  before(:all) do
    #DADO
    @usuario = create(:usuario)
    @plano = create(:plano, descricao: "10 Convites", preco: 100)
    create(:assinatura, periodo: :trimestral, plano: @plano, usuario: @usuario)
  end

  it "realizar assinatura" do
    #QUANDO
    assinatura = Assinatura.last

    #ENTÃO
    expect(assinatura.plano.descricao).to eq("10 Convites")
    expect(assinatura.periodo).to eq("trimestral")
    expect(assinatura.validade).to eq(Date.today + 3.months)
    expect(assinatura.valor).to eq(300)
    expect(assinatura.ativo?).to eq(true)
  end

  it "atualizar plano" do
    #DADO
    create(:assinatura, periodo: :anual, plano: @plano, usuario: @usuario)

    #QUANDO
    assinatura_inativado = Assinatura.first
    assinatura_ativo = Assinatura.last

    #ENTÃO
    expect(assinatura_ativo.plano.descricao).to eq("10 Convites")
    expect(assinatura_ativo.periodo).to eq("anual")
    expect(assinatura_ativo.validade).to eq(Date.today + 12.months)
    expect(assinatura_ativo.valor).to eq(1200)
    expect(assinatura_ativo.ativo?).to eq(true)
    expect(assinatura_inativado.ativo?).to eq(false)
  end

end
