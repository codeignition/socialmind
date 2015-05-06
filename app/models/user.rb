class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  devise :omniauthable, :trackable, :omniauth_providers => [:twitter]

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  field :twitter_id
  field :name
  field :image

  has_many :organizations
  has_many :social_accounts, as: :owner
  has_and_belongs_to_many :shared_accounts, class_name: 'SocialAccount', inverse_of: :collaborators

  def self.from_twitter(auth)
    where(twitter_id: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end
end
