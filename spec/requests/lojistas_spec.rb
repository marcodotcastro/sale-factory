require 'rails_helper'

RSpec.describe "Lojistas", type: :request do

  before(:all) do
    @lojista = create(:lojista)
    @representante = @lojista.representante
    @industria = @representante.industria
  end

  describe "GET /lojistas" do
    it "works! (now write some real specs)" do
      get industria_representante_lojista_path(@industria, @representante, @lojista)
      expect(response).to have_http_status(200)
    end
  end
end
