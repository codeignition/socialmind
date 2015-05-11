require 'rails_helper'

RSpec.describe User, type: :model do
  let(:twitter_auth) do
    Hashie::Mash.new YAML::load_file(Rails.root.join('spec/fixtures/omniauth-twitter.yaml'))
  end

  describe "from_twitter" do
    it "should create a new user from twitter oauth hash" do
      user = User.from_twitter twitter_auth
      expect(user.twitter_id).to eq(twitter_auth.uid)
      expect(user.name).to eq(twitter_auth.info.name)
      expect(user.image).to eq(twitter_auth.info.image)
    end

    it "should create a new twitter account for user" do
      user = User.from_twitter twitter_auth
      expect(TwitterAccount.count).to eq 1
      expect(TwitterAccount.first.owners).to include user
    end

    it "should return the user if already created" do
      User.from_twitter twitter_auth
      user = User.from_twitter twitter_auth
      expect(User.count).to eq 1
      expect(TwitterAccount.count).to eq 1
    end
  end

  describe "accept_invitation" do
    it "should do nothing for invalid token" do
      user = create :user
      expect(user.accept_invitation('sdadasd')).to be_nil
      expect(user.accept_invitation(nil)).to be_nil
    end

    it "should add user as collaborators" do
      invitation = create :invitation
      user = create :user
      user.accept_invitation invitation.token
      invitation.reload
      expect(user.shared_accounts).to include invitation.social_account
      expect(invitation.social_account.collaborators).to include user
      expect(invitation.user).to eq user
    end
  end
end
