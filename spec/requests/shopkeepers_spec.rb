require 'rails_helper'

RSpec.describe "Shopkeepers", type: :request do
  describe "GET /shopkeepers" do
    it "works! (now write some real specs)" do
      get shopkeepers_path
      expect(response).to have_http_status(200)
    end
  end
end
