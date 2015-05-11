require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "get index" do
    it "should accept invitation for social" do
      user = create(:user)
      invitation = create :invitation
      sign_in user
      get :index, token: invitation.token
      expect(user.reload.shared_accounts).to include invitation.reload.social_account
    end
  end
end
