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
end
