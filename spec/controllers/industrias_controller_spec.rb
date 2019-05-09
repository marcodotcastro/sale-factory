require 'rails_helper'

RSpec.describe IndustriasController, type: :controller do

  let(:valid_attributes) {
    attributes_for(
        :industria,
        cidade_id: create(:cidade).id,
        usuario_id: create(:usuario).id
    )
  }

  let(:invalid_attributes) {
    attributes_for(:industria, cidade_id: nil)
  }

  let(:valid_session) {{}}

  describe "GET #index" do
    it "returns a success response" do
      industria = Industria.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      industria = Industria.create! valid_attributes
      get :show, params: {id: industria.to_param}, session: valid_session
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
      industria = Industria.create! valid_attributes
      get :edit, params: {id: industria.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Industria" do
        expect {
          post :create, params: {industria: valid_attributes}, session: valid_session
        }.to change(Industria, :count).by(1)
      end

      it "redirects to the created industria" do
        post :create, params: {industria: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Industria.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {industria: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(
            :industria,
            cidade_id: create(:cidade).id
        )
      }

      it "updates the requested industria" do
        industria = Industria.create! valid_attributes
        put :update, params: {id: industria.to_param, industria: new_attributes}, session: valid_session
        industria.reload
        expect(response).to redirect_to(industria)
      end

      it "redirects to the industria" do
        industria = Industria.create! valid_attributes
        put :update, params: {id: industria.to_param, industria: valid_attributes}, session: valid_session
        expect(response).to redirect_to(industria)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        industria = Industria.create! valid_attributes
        put :update, params: {id: industria.to_param, industria: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested industria" do
      industria = Industria.create! valid_attributes
      expect {
        delete :destroy, params: {id: industria.to_param}, session: valid_session
      }.to change(Industria, :count).by(-1)
    end

    it "redirects to the industrias list" do
      industria = Industria.create! valid_attributes
      delete :destroy, params: {id: industria.to_param}, session: valid_session
      expect(response).to redirect_to(industrias_url)
    end
  end

end
