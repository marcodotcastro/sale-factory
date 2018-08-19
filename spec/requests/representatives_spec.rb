require 'rails_helper'

RSpec.describe "Representatives", type: :request do
  describe "GET /representatives" do
    it "works! (now write some real specs)" do
      get representatives_path
      expect(response).to have_http_status(200)
    end
  end
end
