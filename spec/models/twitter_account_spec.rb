require 'rails_helper'

RSpec.describe TwitterAccount, type: :model do
  let(:twitter_auth) do
    Hashie::Mash.new YAML::load_file(Rails.root.join('spec/fixtures/omniauth-twitter.yaml'))
  end

  describe "from_oauth" do
    it "should create a new twitter account form oauth hash" do
      user = create(:user)
      twitter_account = TwitterAccount.from_oauth twitter_auth, user
      expect(twitter_account.uid).to eq(twitter_auth.uid)
      expect(twitter_account.name).to eq(twitter_auth.info.name)
      expect(twitter_account.nickname).to eq(twitter_auth.info.nickname)
      expect(twitter_account.image).to eq(twitter_auth.info.image)
      expect(twitter_account.token).to eq(twitter_auth.credentials.token)
      expect(twitter_account.secret).to eq(twitter_auth.credentials.secret)
      expect(twitter_account.owners).to include user
    end

    it "should create a new twitter account form oauth hash" do
      user = create(:user)
      TwitterAccount.from_oauth twitter_auth, create(:user)
      twitter_account = TwitterAccount.from_oauth twitter_auth, user
      expect(TwitterAccount.count).to eq 1
      expect(twitter_account.owners.count).to eq 2
      expect(twitter_account.owners).to include user
    end
  end
end
