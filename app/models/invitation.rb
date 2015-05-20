class Invitation
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user
  belongs_to :social_account
  belongs_to :host, class_name: 'User'
  field :token
  field :email
  validates_presence_of :email
  before_create :generate_token, unless: :token?
  after_create do
    InvitationMailer.invite(self).deliver_now
  end

  private
  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Invitation.where(token: random_token).exists?
    end
  end
end
