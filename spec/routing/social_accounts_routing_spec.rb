require "rails_helper"

RSpec.describe SocialAccountsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/social_accounts").to route_to("social_accounts#index")
    end

    it "routes to #new" do
      expect(:get => "/social_accounts/new").to route_to("social_accounts#new")
    end

    it "routes to #show" do
      expect(:get => "/social_accounts/1").to route_to("social_accounts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/social_accounts/1/edit").to route_to("social_accounts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/social_accounts").to route_to("social_accounts#create")
    end

    it "routes to #update" do
      expect(:put => "/social_accounts/1").to route_to("social_accounts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/social_accounts/1").to route_to("social_accounts#destroy", :id => "1")
    end

  end
end
