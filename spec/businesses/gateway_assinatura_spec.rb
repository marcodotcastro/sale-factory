require 'rails_helper'

RSpec.describe "Gateway Assinatura" do

  before(:all) do
    create(:cidade)
    create(:plano)
    @industria = create(:industria)
    @assinatura = @industria.usuario.assinatura
  end

  context "integração" do

    it "criar assinatura" do
      assinatura = GatewayAssinatura.new(@assinatura).criar_assinatura

      expect(assinatura.id).to_not be_nil
      expect(assinatura.status).to eq("paid")
    end

    it "atualizar assinatura" do
      GatewayAssinatura.new(@assinatura).atualizar_assinatura
    end

    it "cancelar assinatura" do
      GatewayAssinatura.new(@assinatura).cancelar_assinatura
    end

  end

end
