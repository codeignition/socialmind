require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  let(:twitter_auth) do
    Hashie::Mash.new YAML::load_file(Rails.root.join('spec/fixtures/omniauth-twitter.yaml'))
  end

  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = twitter_auth
  end

  describe "get :twitter" do
    it "should create a new user when no user logged in" do
      get :twitter
      expect(User.count).to eq(1)
      expect(TwitterAccount.count).to eq(1)
      expect(response).to redirect_to user_root_url
    end

    it "should add a social acccount when user logged in" do
      sign_in create(:user)
      get :twitter
      expect(User.count).to eq(1)
      expect(TwitterAccount.count).to eq(1)
      expect(response).to redirect_to user_root_url
    end
  end
end
