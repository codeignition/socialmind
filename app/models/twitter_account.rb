class TwitterAccount < SocialAccount
  field :uid
  field :handle
  field :token
  field :secret

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter["consumer_key"]
      config.consumer_secret     = Rails.application.secrets.twitter["consumer_secret"]
      config.access_token        = self.token
      config.access_token_secret = self.secret
    end
  end
end
