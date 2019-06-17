require 'rails_helper'

RSpec.describe "Gateway Assinatura" do

  before(:all) do
    create(:cidade)
    create(:plano)
    @industria = create(:industria)
    @assinatura = @industria.usuario.assinaturas.first
  end

  context "integração" do

    it "criar assinatura" do
      GatewayAssinatura.new(@assinatura).criar_assinatura
    end

    it "atualizar assinatura" do
      GatewayAssinatura.new(@assinatura).atualizar_assinatura
    end

    it "cancelar assinatura" do
      GatewayAssinatura.new(@assinatura).cancelar_assinatura
    end

  end

end
