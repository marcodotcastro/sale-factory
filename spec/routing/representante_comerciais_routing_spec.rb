require "rails_helper"

RSpec.describe RepresentanteComerciaisController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/representante_comerciais").to route_to("representante_comerciais#index")
    end

    it "routes to #new" do
      expect(:get => "/representante_comerciais/new").to route_to("representante_comerciais#new")
    end

    it "routes to #show" do
      expect(:get => "/representante_comerciais/1").to route_to("representante_comerciais#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/representante_comerciais/1/edit").to route_to("representante_comerciais#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/representante_comerciais").to route_to("representante_comerciais#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/representante_comerciais/1").to route_to("representante_comerciais#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/representante_comerciais/1").to route_to("representante_comerciais#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/representante_comerciais/1").to route_to("representante_comerciais#destroy", :id => "1")
    end

  end
end
