require "rails_helper"

RSpec.describe RepresentantesController, type: :routing do

  before(:all) do
    @representante = create(:representante)
    @cliente = @representante.cliente
  end

  describe "routing" do

    it "routes to #index" do
      expect(:get => cliente_representantes_path(@cliente)).to route_to("representantes#index", cliente_id: @cliente.id.to_s)
    end

    it "routes to #new" do
      expect(:get => new_cliente_representante_path(@cliente)).to route_to("representantes#new", cliente_id: @cliente.id.to_s)
    end

    it "routes to #show" do
      expect(:get => cliente_representante_path(@cliente, @representante)).to route_to("representantes#show", :id => @representante.id.to_s, cliente_id: @cliente.id.to_s)
    end

    it "routes to #edit" do
      expect(:get => edit_cliente_representante_path(@cliente, @representante)).to route_to("representantes#edit", :id => @representante.id.to_s, cliente_id: @cliente.id.to_s)
    end

    it "routes to #create" do
      expect(:post => cliente_representantes_path(@cliente)).to route_to("representantes#create", cliente_id: @cliente.id.to_s)
    end

    it "routes to #update via PUT" do
      expect(:put => cliente_representante_path(@cliente, @representante)).to route_to("representantes#update", :id => @representante.id.to_s, cliente_id: @cliente.id.to_s)
    end

    it "routes to #update via PATCH" do
      expect(:patch => cliente_representante_path(@cliente, @representante)).to route_to("representantes#update", :id => @representante.id.to_s, cliente_id: @cliente.id.to_s)
    end

    it "routes to #destroy" do
      expect(:delete => cliente_representante_path(@cliente, @representante)).to route_to("representantes#destroy", :id => @representante.id.to_s, cliente_id: @cliente.id.to_s)
    end

  end
end
