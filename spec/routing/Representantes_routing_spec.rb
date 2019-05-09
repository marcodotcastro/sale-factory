require "rails_helper"

RSpec.describe RepresentantesController, type: :routing do

  before(:all) do
    @representante = create(:representante)
    @industria = @representante.industria
  end

  describe "routing" do

    it "routes to #index" do
      expect(:get => industria_representantes_path(@industria)).to route_to("representantes#index", industria_id: @industria.id.to_s)
    end

    it "routes to #new" do
      expect(:get => new_industria_representante_path(@industria)).to route_to("representantes#new", industria_id: @industria.id.to_s)
    end

    it "routes to #show" do
      expect(:get => industria_representante_path(@industria, @representante)).to route_to("representantes#show", :id => @representante.id.to_s, industria_id: @industria.id.to_s)
    end

    it "routes to #edit" do
      expect(:get => edit_industria_representante_path(@industria, @representante)).to route_to("representantes#edit", :id => @representante.id.to_s, industria_id: @industria.id.to_s)
    end

    it "routes to #create" do
      expect(:post => industria_representantes_path(@industria)).to route_to("representantes#create", industria_id: @industria.id.to_s)
    end

    it "routes to #update via PUT" do
      expect(:put => industria_representante_path(@industria, @representante)).to route_to("representantes#update", :id => @representante.id.to_s, industria_id: @industria.id.to_s)
    end

    it "routes to #update via PATCH" do
      expect(:patch => industria_representante_path(@industria, @representante)).to route_to("representantes#update", :id => @representante.id.to_s, industria_id: @industria.id.to_s)
    end

    it "routes to #destroy" do
      expect(:delete => industria_representante_path(@industria, @representante)).to route_to("representantes#destroy", :id => @representante.id.to_s, industria_id: @industria.id.to_s)
    end

  end
end
