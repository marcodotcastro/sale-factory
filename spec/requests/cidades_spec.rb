require 'rails_helper'

RSpec.describe "Cidades", type: :request do
  describe "GET /cidades" do
    it "works! (now write some real specs)" do
      get cidades_path
      expect(response).to have_http_status(200)
    end
  end
end
