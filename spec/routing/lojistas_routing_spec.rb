require "rails_helper"

RSpec.describe LojistasController, type: :routing do

  before(:all) do
    @lojista = create(:lojista)
    @representante_comercial = @lojista.representante_comercial
    @cliente = @representante_comercial.cliente
  end

  describe "routing" do

    it "routes to #index" do
      expect(:get => cliente_representante_comercial_lojistas_path(@cliente, @representante_comercial)).to route_to("lojistas#index", cliente_id: @cliente.id.to_s, representante_comercial_id: @representante_comercial.id.to_s)
    end

    it "routes to #new" do
      expect(:get => new_cliente_representante_comercial_lojista_path(@cliente, @representante_comercial)).to route_to("lojistas#new", cliente_id: @cliente.id.to_s, representante_comercial_id: @representante_comercial.id.to_s)
    end

    it "routes to #show" do
      expect(:get => cliente_representante_comercial_lojista_path(@cliente, @representante_comercial, @lojista)).to route_to("lojistas#show", cliente_id: @cliente.id.to_s, representante_comercial_id: @representante_comercial.id.to_s, :id => @lojista.id.to_s)
    end

    it "routes to #edit" do
      expect(:get => edit_cliente_representante_comercial_lojista_path(@cliente, @representante_comercial, @lojista)).to route_to("lojistas#edit", cliente_id: @cliente.id.to_s, representante_comercial_id: @representante_comercial.id.to_s, :id => @lojista.id.to_s)
    end

    it "routes to #create" do
      expect(:post => cliente_representante_comercial_lojistas_path(@cliente, @representante_comercial)).to route_to("lojistas#create", cliente_id: @cliente.id.to_s, representante_comercial_id: @representante_comercial.id.to_s)
    end

    it "routes to #update via PUT" do
      expect(:put => cliente_representante_comercial_lojista_path(@cliente, @representante_comercial, @lojista)).to route_to("lojistas#update", cliente_id: @cliente.id.to_s, representante_comercial_id: @representante_comercial.id.to_s, :id => @lojista.id.to_s)
    end

    it "routes to #update via PATCH" do
      expect(:patch => cliente_representante_comercial_lojista_path(@cliente, @representante_comercial, @lojista)).to route_to("lojistas#update", cliente_id: @cliente.id.to_s, representante_comercial_id: @representante_comercial.id.to_s, :id => @lojista.id.to_s)
    end

    it "routes to #destroy" do
      expect(:delete => cliente_representante_comercial_lojista_path(@cliente, @representante_comercial, @lojista)).to route_to("lojistas#destroy", cliente_id: @cliente.id.to_s, representante_comercial_id: @representante_comercial.id.to_s, :id => @lojista.id.to_s)
    end

  end
end
