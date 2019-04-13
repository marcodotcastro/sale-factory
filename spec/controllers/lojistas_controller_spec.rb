require 'rails_helper'

RSpec.describe LojistasController, type: :controller do

  let(:valid_attributes) {
    attributes_for(
        :lojista,
        representante_id: create(:representante).id,
        cidade_id: create(:cidade).id
    )
  }

  let(:invalid_attributes) {
    attributes_for(:lojista, cidade_id: nil)
  }

  let(:valid_session) {{}}

  before(:all) do
    @lojista = create(:lojista)
    @representante = @lojista.representante
    @cliente = @representante.cliente
  end

  describe "GET #index" do
    it "returns a success response" do
      lojista = Lojista.create! valid_attributes
      get :index, params: {cliente_id: @cliente.id, representante_id: @representante.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      lojista = Lojista.create! valid_attributes
      get :show, params: {cliente_id: @cliente.id, representante_id: @representante.id, id: lojista.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {cliente_id: @cliente.id, representante_id: @representante.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      lojista = Lojista.create! valid_attributes
      get :edit, params: {cliente_id: @cliente.id, representante_id: @representante.id, id: lojista.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Lojista" do
        expect {
          post :create, params: {cliente_id: @cliente.id, representante_id: @representante.id, lojista: valid_attributes}, session: valid_session
        }.to change(Lojista, :count).by(1)
      end

      it "redirects to the created lojista" do
        post :create, params: {cliente_id: @cliente.id, representante_id: @representante.id, lojista: valid_attributes}, session: valid_session
        lojista = Lojista.last
        expect(response).to redirect_to(cliente_representante_lojista_path(@cliente, @representante, lojista))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {cliente_id: @cliente.id, representante_id: @representante.id, lojista: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(
            :lojista,
            representante_id: create(:representante).id,
            cidade_id: create(:cidade).id
        )
      }

      it "updates the requested lojista" do
        lojista = Lojista.create! valid_attributes
        put :update, params: {cliente_id: @cliente.id, representante_id: @representante.id, id: lojista.to_param, lojista: new_attributes}, session: valid_session
        lojista.reload
        expect(response).to redirect_to(cliente_representante_lojista_path(@cliente, @representante, lojista))
      end

      it "redirects to the lojista" do
        lojista = Lojista.create! valid_attributes
        put :update, params: {cliente_id: @cliente.id, representante_id: @representante.id, id: lojista.to_param, lojista: valid_attributes}, session: valid_session
        expect(response).to redirect_to(cliente_representante_lojista_path(@cliente, @representante, lojista))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        lojista = Lojista.create! valid_attributes
        put :update, params: {cliente_id: @cliente.id, representante_id: @representante.id, id: lojista.to_param, lojista: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested lojista" do
      lojista = Lojista.create! valid_attributes
      expect {
        delete :destroy, params: {cliente_id: @cliente.id, representante_id: @representante.id, id: lojista.to_param}, session: valid_session
      }.to change(Lojista, :count).by(-1)
    end

    it "redirects to the lojistas list" do
      lojista = Lojista.create! valid_attributes
      delete :destroy, params: {cliente_id: @cliente.id, representante_id: @representante.id, id: lojista.to_param}, session: valid_session
      expect(response).to redirect_to(cliente_representante_lojistas_path(@cliente, @representante))
    end
  end

end
