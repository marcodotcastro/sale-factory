require 'rails_helper'

RSpec.describe "RepresentanteComerciais", type: :request do
  describe "GET /representante_comerciais" do
    it "works! (now write some real specs)" do
      get representante_comerciais_path
      expect(response).to have_http_status(200)
    end
  end
end
