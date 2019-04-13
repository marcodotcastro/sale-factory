require 'rails_helper'

RSpec.describe RepresentantesController, type: :controller do

  let(:valid_attributes) {
    attributes_for(
        :representante,
        cliente_id: create(:cliente).id,
        cidade_id: create(:cidade).id
    )
  }

  let(:invalid_attributes) {
    attributes_for(:representante, cidade_id: nil)
  }

  let(:valid_session) {{}}

  before(:all) do
    @representante = create(:representante)
    @cliente = @representante.cliente
  end

  describe "GET #index" do
    it "returns a success response" do
      representante = Representante.create! valid_attributes
      get :index, params: {cliente_id: @cliente.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      representante = Representante.create! valid_attributes
      get :show, params: {cliente_id: @cliente.id, id: representante.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {cliente_id: @cliente.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      representante = Representante.create! valid_attributes
      get :edit, params: {cliente_id: @cliente.id, id: representante.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Representante" do
        expect {
          post :create, params: {cliente_id: @cliente.id, representante: valid_attributes}, session: valid_session
        }.to change(Representante, :count).by(1)
      end

      it "redirects to the created representante" do
        post :create, params: {cliente_id: @cliente.id, representante: valid_attributes}, session: valid_session
        representante = Representante.last
        expect(response).to redirect_to(cliente_representante_path(@cliente, representante))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {cliente_id: @cliente.id, representante: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:representante)
      }

      it "updates the requested representante" do
        representante = Representante.create! valid_attributes
        put :update, params: {cliente_id: @cliente.id, id: representante.to_param, representante: new_attributes}, session: valid_session
        representante.reload
        expect(response).to redirect_to(cliente_representante_path(@cliente, representante))
      end

      it "redirects to the representante" do
        representante = Representante.create! valid_attributes
        put :update, params: {cliente_id: @cliente.id, id: representante.to_param, representante: valid_attributes}, session: valid_session
        expect(response).to redirect_to(cliente_representante_path(@cliente, representante))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        representante = Representante.create! valid_attributes
        put :update, params: {cliente_id: @cliente.id, id: representante.to_param, representante: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested representante" do
      representante = Representante.create! valid_attributes
      expect {
        delete :destroy, params: {cliente_id: @cliente.id, id: representante.to_param}, session: valid_session
      }.to change(Representante, :count).by(-1)
    end

    it "redirects to the representantes list" do
      representante = Representante.create! valid_attributes
      delete :destroy, params: {cliente_id: @cliente.id, id: representante.to_param}, session: valid_session
      expect(response).to redirect_to(cliente_representantes_path(@cliente))
    end
  end

end
