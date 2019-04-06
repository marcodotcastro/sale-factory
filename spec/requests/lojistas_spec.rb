require 'rails_helper'

RSpec.describe "Lojistas", type: :request do
  describe "GET /lojistas" do
    it "works! (now write some real specs)" do
      get lojistas_path
      expect(response).to have_http_status(200)
    end
  end
end
