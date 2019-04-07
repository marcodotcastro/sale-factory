require 'rails_helper'

RSpec.describe RepresentanteComerciaisController, type: :controller do

  let(:valid_attributes) {
    attributes_for(
        :representante_comercial,
        cliente_id: create(:cliente).id,
        cidade_id: create(:cidade).id
    )
  }

  let(:invalid_attributes) {
    attributes_for(:representante_comercial, cidade_id: nil)
  }

  let(:valid_session) {{}}

  before(:all) do
    @representante_comercial = create(:representante_comercial)
    @cliente = @representante_comercial.cliente
  end

  describe "GET #index" do
    it "returns a success response" do
      representante_comercial = RepresentanteComercial.create! valid_attributes
      get :index, params: {cliente_id: @cliente.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      representante_comercial = RepresentanteComercial.create! valid_attributes
      get :show, params: {cliente_id: @cliente.id, id: representante_comercial.to_param}, session: valid_session
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
      representante_comercial = RepresentanteComercial.create! valid_attributes
      get :edit, params: {cliente_id: @cliente.id, id: representante_comercial.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new RepresentanteComercial" do
        expect {
          post :create, params: {cliente_id: @cliente.id, representante_comercial: valid_attributes}, session: valid_session
        }.to change(RepresentanteComercial, :count).by(1)
      end

      it "redirects to the created representante_comercial" do
        post :create, params: {cliente_id: @cliente.id, representante_comercial: valid_attributes}, session: valid_session
        representante_comercial = RepresentanteComercial.last
        expect(response).to redirect_to(cliente_representante_comercial_path(@cliente, representante_comercial))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {cliente_id: @cliente.id, representante_comercial: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:representante_comercial)
      }

      it "updates the requested representante_comercial" do
        representante_comercial = RepresentanteComercial.create! valid_attributes
        put :update, params: {cliente_id: @cliente.id, id: representante_comercial.to_param, representante_comercial: new_attributes}, session: valid_session
        representante_comercial.reload
        expect(response).to redirect_to(cliente_representante_comercial_path(@cliente, representante_comercial))
      end

      it "redirects to the representante_comercial" do
        representante_comercial = RepresentanteComercial.create! valid_attributes
        put :update, params: {cliente_id: @cliente.id, id: representante_comercial.to_param, representante_comercial: valid_attributes}, session: valid_session
        expect(response).to redirect_to(cliente_representante_comercial_path(@cliente, representante_comercial))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        representante_comercial = RepresentanteComercial.create! valid_attributes
        put :update, params: {cliente_id: @cliente.id, id: representante_comercial.to_param, representante_comercial: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested representante_comercial" do
      representante_comercial = RepresentanteComercial.create! valid_attributes
      expect {
        delete :destroy, params: {cliente_id: @cliente.id, id: representante_comercial.to_param}, session: valid_session
      }.to change(RepresentanteComercial, :count).by(-1)
    end

    it "redirects to the representante_comerciais list" do
      representante_comercial = RepresentanteComercial.create! valid_attributes
      delete :destroy, params: {cliente_id: @cliente.id, id: representante_comercial.to_param}, session: valid_session
      expect(response).to redirect_to(cliente_representante_comerciais_path(@cliente))
    end
  end

end
