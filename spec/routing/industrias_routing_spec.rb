require "rails_helper"

RSpec.describe IndustriasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/industrias").to route_to("industrias#index")
    end

    it "routes to #new" do
      expect(:get => "/industrias/new").to route_to("industrias#new")
    end

    it "routes to #show" do
      expect(:get => "/industrias/1").to route_to("industrias#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/industrias/1/edit").to route_to("industrias#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/industrias").to route_to("industrias#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/industrias/1").to route_to("industrias#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/industrias/1").to route_to("industrias#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/industrias/1").to route_to("industrias#destroy", :id => "1")
    end

  end
end
