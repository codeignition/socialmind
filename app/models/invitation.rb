class Invitation
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user
  belongs_to :social_account
  field :token
end
