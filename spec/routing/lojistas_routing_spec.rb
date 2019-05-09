require "rails_helper"

RSpec.describe LojistasController, type: :routing do

  before(:all) do
    @lojista = create(:lojista)
    @representante = @lojista.representante
    @industria = @representante.industria
  end

  describe "routing" do

    it "routes to #index" do
      expect(:get => industria_representante_lojistas_path(@industria, @representante)).to route_to("lojistas#index", industria_id: @industria.id.to_s, representante_id: @representante.id.to_s)
    end

    it "routes to #new" do
      expect(:get => new_industria_representante_lojista_path(@industria, @representante)).to route_to("lojistas#new", industria_id: @industria.id.to_s, representante_id: @representante.id.to_s)
    end

    it "routes to #show" do
      expect(:get => industria_representante_lojista_path(@industria, @representante, @lojista)).to route_to("lojistas#show", industria_id: @industria.id.to_s, representante_id: @representante.id.to_s, :id => @lojista.id.to_s)
    end

    it "routes to #edit" do
      expect(:get => edit_industria_representante_lojista_path(@industria, @representante, @lojista)).to route_to("lojistas#edit", industria_id: @industria.id.to_s, representante_id: @representante.id.to_s, :id => @lojista.id.to_s)
    end

    it "routes to #create" do
      expect(:post => industria_representante_lojistas_path(@industria, @representante)).to route_to("lojistas#create", industria_id: @industria.id.to_s, representante_id: @representante.id.to_s)
    end

    it "routes to #update via PUT" do
      expect(:put => industria_representante_lojista_path(@industria, @representante, @lojista)).to route_to("lojistas#update", industria_id: @industria.id.to_s, representante_id: @representante.id.to_s, :id => @lojista.id.to_s)
    end

    it "routes to #update via PATCH" do
      expect(:patch => industria_representante_lojista_path(@industria, @representante, @lojista)).to route_to("lojistas#update", industria_id: @industria.id.to_s, representante_id: @representante.id.to_s, :id => @lojista.id.to_s)
    end

    it "routes to #destroy" do
      expect(:delete => industria_representante_lojista_path(@industria, @representante, @lojista)).to route_to("lojistas#destroy", industria_id: @industria.id.to_s, representante_id: @representante.id.to_s, :id => @lojista.id.to_s)
    end

  end
end
