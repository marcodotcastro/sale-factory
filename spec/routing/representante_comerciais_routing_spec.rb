require "rails_helper"

RSpec.describe RepresentanteComerciaisController, type: :routing do

  before(:all) do
    @representante_comercial = create(:representante_comercial)
    @cliente = @representante_comercial.cliente
  end

  describe "routing" do

    it "routes to #index" do
      expect(:get => cliente_representante_comerciais_path(@cliente)).to route_to("representante_comerciais#index", cliente_id: @cliente.id.to_s)
    end

    it "routes to #new" do
      expect(:get => new_cliente_representante_comercial_path(@cliente)).to route_to("representante_comerciais#new", cliente_id: @cliente.id.to_s)
    end

    it "routes to #show" do
      expect(:get => cliente_representante_comercial_path(@cliente, @representante_comercial)).to route_to("representante_comerciais#show", :id => @representante_comercial.id.to_s, cliente_id: @cliente.id.to_s)
    end

    it "routes to #edit" do
      expect(:get => edit_cliente_representante_comercial_path(@cliente, @representante_comercial)).to route_to("representante_comerciais#edit", :id => @representante_comercial.id.to_s, cliente_id: @cliente.id.to_s)
    end

    it "routes to #create" do
      expect(:post => cliente_representante_comerciais_path(@cliente)).to route_to("representante_comerciais#create", cliente_id: @cliente.id.to_s)
    end

    it "routes to #update via PUT" do
      expect(:put => cliente_representante_comercial_path(@cliente, @representante_comercial)).to route_to("representante_comerciais#update", :id => @representante_comercial.id.to_s, cliente_id: @cliente.id.to_s)
    end

    it "routes to #update via PATCH" do
      expect(:patch => cliente_representante_comercial_path(@cliente, @representante_comercial)).to route_to("representante_comerciais#update", :id => @representante_comercial.id.to_s, cliente_id: @cliente.id.to_s)
    end

    it "routes to #destroy" do
      expect(:delete => cliente_representante_comercial_path(@cliente, @representante_comercial)).to route_to("representante_comerciais#destroy", :id => @representante_comercial.id.to_s, cliente_id: @cliente.id.to_s)
    end

  end
end
