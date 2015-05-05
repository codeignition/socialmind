require 'rails_helper'

RSpec.describe SocialAccountsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all social_accounts as @social_accounts" do
      social_account = SocialAccount.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:social_accounts)).to eq([social_account])
    end
  end

  describe "GET #show" do
    it "assigns the requested social_account as @social_account" do
      social_account = SocialAccount.create! valid_attributes
      get :show, {:id => social_account.to_param}, valid_session
      expect(assigns(:social_account)).to eq(social_account)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested social_account" do
      social_account = SocialAccount.create! valid_attributes
      expect {
        delete :destroy, {:id => social_account.to_param}, valid_session
      }.to change(SocialAccount, :count).by(-1)
    end

    it "redirects to the social_accounts list" do
      social_account = SocialAccount.create! valid_attributes
      delete :destroy, {:id => social_account.to_param}, valid_session
      expect(response).to redirect_to(social_accounts_url)
    end
  end
end
