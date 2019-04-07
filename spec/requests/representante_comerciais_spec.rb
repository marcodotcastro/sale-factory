require 'rails_helper'

RSpec.describe "RepresentanteComerciais", type: :request do

  before(:all) do
    @representante_comercial = create(:representante_comercial)
    @cliente = @representante_comercial.cliente
  end

  describe "GET /representante_comerciais" do
    it "works! (now write some real specs)" do
      get cliente_representante_comercial_path(@cliente, @representante_comercial)
      expect(response).to have_http_status(200)
    end
  end
end
