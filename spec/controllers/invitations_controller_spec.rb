require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Invitation" do
        expect {
          post :create, {:invitation => valid_attributes}, valid_session
        }.to change(Invitation, :count).by(1)
      end

      it "assigns a newly created invitation as @invitation" do
        post :create, {:invitation => valid_attributes}, valid_session
        expect(assigns(:invitation)).to be_a(Invitation)
        expect(assigns(:invitation)).to be_persisted
      end

      it "redirects to the created invitation" do
        post :create, {:invitation => valid_attributes}, valid_session
        expect(response).to redirect_to(Invitation.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved invitation as @invitation" do
        post :create, {:invitation => invalid_attributes}, valid_session
        expect(assigns(:invitation)).to be_a_new(Invitation)
      end

      it "re-renders the 'new' template" do
        post :create, {:invitation => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested invitation" do
      invitation = Invitation.create! valid_attributes
      expect {
        delete :destroy, {:id => invitation.to_param}, valid_session
      }.to change(Invitation, :count).by(-1)
    end

    it "redirects to the invitations list" do
      invitation = Invitation.create! valid_attributes
      delete :destroy, {:id => invitation.to_param}, valid_session
      expect(response).to redirect_to(invitations_url)
    end
  end
end
