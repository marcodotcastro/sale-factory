require "rails_helper"

RSpec.describe LojistasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lojistas").to route_to("lojistas#index")
    end

    it "routes to #new" do
      expect(:get => "/lojistas/new").to route_to("lojistas#new")
    end

    it "routes to #show" do
      expect(:get => "/lojistas/1").to route_to("lojistas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lojistas/1/edit").to route_to("lojistas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lojistas").to route_to("lojistas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lojistas/1").to route_to("lojistas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lojistas/1").to route_to("lojistas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lojistas/1").to route_to("lojistas#destroy", :id => "1")
    end

  end
end
