require 'rails_helper'

RSpec.describe SocialAccountsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

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
