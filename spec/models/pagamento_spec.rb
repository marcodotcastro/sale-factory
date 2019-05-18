# == Schema Information
#
# Table name: pagamentos
#
#  id         :bigint(8)        not null, primary key
#  ativo      :boolean
#  periodo    :integer
#  validade   :date
#  valor      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  plano_id   :bigint(8)
#  usuario_id :bigint(8)
#
# Indexes
#
#  index_pagamentos_on_plano_id    (plano_id)
#  index_pagamentos_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (plano_id => planos.id)
#  fk_rails_...  (usuario_id => usuarios.id)
#

require 'rails_helper'

RSpec.describe Pagamento, type: :model do

  before(:all) do
    #DADO
    @usuario = create(:usuario)
    @plano = create(:plano, descricao: "10 Convites", preco: 100)
    create(:pagamento, periodo: :trimestral, plano: @plano, usuario: @usuario)
  end

  it "realizar pagamento" do
    #QUANDO
    pagamento = Pagamento.last

    #ENTÃO
    expect(pagamento.plano.descricao).to eq("10 Convites")
    expect(pagamento.periodo).to eq("trimestral")
    expect(pagamento.validade).to eq(Date.today + 3.months)
    expect(pagamento.valor).to eq(300)
    expect(pagamento.ativo?).to eq(true)
  end

  it "atualizar plano" do
    #DADO
    create(:pagamento, periodo: :anual, plano: @plano, usuario: @usuario)

    #QUANDO
    pagamento_inativado = Pagamento.first
    pagamento_ativo = Pagamento.last

    #ENTÃO
    expect(pagamento_ativo.plano.descricao).to eq("10 Convites")
    expect(pagamento_ativo.periodo).to eq("anual")
    expect(pagamento_ativo.validade).to eq(Date.today + 12.months)
    expect(pagamento_ativo.valor).to eq(1200)
    expect(pagamento_ativo.ativo?).to eq(true)
    expect(pagamento_inativado.ativo?).to eq(false)
  end

end
