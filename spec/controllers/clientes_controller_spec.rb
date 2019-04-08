require 'rails_helper'

RSpec.describe ClientesController, type: :controller do

  let(:valid_attributes) {
    attributes_for(
        :cliente,
        cidade_id: create(:cidade).id,
        usuario_id: create(:usuario).id
    )
  }

  let(:invalid_attributes) {
    attributes_for(:cliente, cidade_id: nil)
  }

  let(:valid_session) {{}}

  describe "GET #index" do
    it "returns a success response" do
      cliente = Cliente.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cliente = Cliente.create! valid_attributes
      get :show, params: {id: cliente.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      cliente = Cliente.create! valid_attributes
      get :edit, params: {id: cliente.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cliente" do
        expect {
          post :create, params: {cliente: valid_attributes}, session: valid_session
        }.to change(Cliente, :count).by(1)
      end

      it "redirects to the created cliente" do
        post :create, params: {cliente: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Cliente.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {cliente: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(
            :cliente,
            cidade_id: create(:cidade).id
        )
      }

      it "updates the requested cliente" do
        cliente = Cliente.create! valid_attributes
        put :update, params: {id: cliente.to_param, cliente: new_attributes}, session: valid_session
        cliente.reload
        expect(response).to redirect_to(cliente)
      end

      it "redirects to the cliente" do
        cliente = Cliente.create! valid_attributes
        put :update, params: {id: cliente.to_param, cliente: valid_attributes}, session: valid_session
        expect(response).to redirect_to(cliente)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        cliente = Cliente.create! valid_attributes
        put :update, params: {id: cliente.to_param, cliente: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cliente" do
      cliente = Cliente.create! valid_attributes
      expect {
        delete :destroy, params: {id: cliente.to_param}, session: valid_session
      }.to change(Cliente, :count).by(-1)
    end

    it "redirects to the clientes list" do
      cliente = Cliente.create! valid_attributes
      delete :destroy, params: {id: cliente.to_param}, session: valid_session
      expect(response).to redirect_to(clientes_url)
    end
  end

end
