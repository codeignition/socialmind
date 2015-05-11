class SocialAccount
  include Mongoid::Document
  include Mongoid::Timestamps
  has_and_belongs_to_many :owners,        class_name: "User", inverse_of: :social_accounts, autosave: true
  has_and_belongs_to_many :collaborators, class_name: "User", inverse_of: :shared_accounts, autosave: true
  has_many :invitations
end
