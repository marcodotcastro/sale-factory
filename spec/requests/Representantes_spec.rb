require 'rails_helper'

RSpec.describe "RepresentanteComerciais", type: :request do

  before(:all) do
    @representante = create(:representante)
    @cliente = @representante.cliente
  end

  describe "GET /representantes" do
    it "works! (now write some real specs)" do
      get cliente_representante_path(@cliente, @representante)
      expect(response).to have_http_status(200)
    end
  end
end
