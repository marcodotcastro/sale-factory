require 'rails_helper'

RSpec.describe "Industrias", type: :request do
  describe "GET /industrias" do
    it "works! (now write some real specs)" do
      get industrias_path
      expect(response).to have_http_status(200)
    end
  end
end
