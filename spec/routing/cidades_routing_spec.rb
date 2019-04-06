require "rails_helper"

RSpec.describe CidadesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cidades").to route_to("cidades#index")
    end

    it "routes to #new" do
      expect(:get => "/cidades/new").to route_to("cidades#new")
    end

    it "routes to #show" do
      expect(:get => "/cidades/1").to route_to("cidades#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cidades/1/edit").to route_to("cidades#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cidades").to route_to("cidades#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cidades/1").to route_to("cidades#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cidades/1").to route_to("cidades#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cidades/1").to route_to("cidades#destroy", :id => "1")
    end

  end
end
