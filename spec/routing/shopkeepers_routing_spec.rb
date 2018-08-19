require "rails_helper"

RSpec.describe ShopkeepersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shopkeepers").to route_to("shopkeepers#index")
    end

    it "routes to #new" do
      expect(:get => "/shopkeepers/new").to route_to("shopkeepers#new")
    end

    it "routes to #show" do
      expect(:get => "/shopkeepers/1").to route_to("shopkeepers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shopkeepers/1/edit").to route_to("shopkeepers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shopkeepers").to route_to("shopkeepers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shopkeepers/1").to route_to("shopkeepers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shopkeepers/1").to route_to("shopkeepers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shopkeepers/1").to route_to("shopkeepers#destroy", :id => "1")
    end

  end
end
