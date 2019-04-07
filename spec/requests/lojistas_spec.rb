require 'rails_helper'

RSpec.describe "Lojistas", type: :request do

  before(:all) do
    @lojista = create(:lojista)
    @representante_comercial = @lojista.representante_comercial
    @cliente = @representante_comercial.cliente
  end

  describe "GET /lojistas" do
    it "works! (now write some real specs)" do
      get cliente_representante_comercial_lojista_path(@cliente, @representante_comercial, @lojista)
      expect(response).to have_http_status(200)
    end
  end
end
