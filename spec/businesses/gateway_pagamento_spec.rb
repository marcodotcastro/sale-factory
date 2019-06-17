require 'rails_helper'

RSpec.describe "Gateway Pagamento" do

  before(:all) do
    create(:cidade)
    create(:plano)
    @industria = create(:industria)
    @pagamento = @industria.usuario.pagamentos.first
  end

  context "integração" do

    it "criar assinatura" do
      GatewayPagamento.new(@pagamento).criar_assinatura
    end

    it "atualizar assinatura" do
      GatewayPagamento.new(@pagamento).atualizar_assinatura
    end

    it "cancelar assinatura" do
      GatewayPagamento.new(@pagamento).cancelar_assinatura
    end

  end

end
