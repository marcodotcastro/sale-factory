require 'rails_helper'

RSpec.describe "RepresentanteComerciais", type: :request do

  before(:all) do
    @representante = create(:representante)
    @industria = @representante.industria
  end

  describe "GET /representantes" do
    it "works! (now write some real specs)" do
      get industria_representante_path(@industria, @representante)
      expect(response).to have_http_status(200)
    end
  end
end
