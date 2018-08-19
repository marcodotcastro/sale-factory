require "rails_helper"

RSpec.describe RepresentativesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/representatives").to route_to("representatives#index")
    end

    it "routes to #new" do
      expect(:get => "/representatives/new").to route_to("representatives#new")
    end

    it "routes to #show" do
      expect(:get => "/representatives/1").to route_to("representatives#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/representatives/1/edit").to route_to("representatives#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/representatives").to route_to("representatives#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/representatives/1").to route_to("representatives#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/representatives/1").to route_to("representatives#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/representatives/1").to route_to("representatives#destroy", :id => "1")
    end

  end
end
