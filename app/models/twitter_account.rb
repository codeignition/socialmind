class TwitterAccount < SocialAccount
  field :uid
  field :image
  field :nickname
  field :name
  field :token
  field :secret

  def self.from_oauth auth, owner
    account = where(uid: auth.uid).first_or_initialize
    account.uid      = auth.uid
    account.name     = auth.info.name
    account.nickname = auth.info.nickname
    account.image    = auth.info.image
    account.token    = auth.credentials.token
    account.secret   = auth.credentials.secret
    account.owners.push owner
    account.save
    return account
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter["consumer_key"]
      config.consumer_secret     = Rails.application.secrets.twitter["consumer_secret"]
      config.access_token        = self.token
      config.access_token_secret = self.secret
    end
  end
end
