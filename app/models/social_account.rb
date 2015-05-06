class SocialAccount
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :owner, polymorphic: true
  has_and_belongs_to_many :collaborators, class_name: "User", inverse_of: :shared_accounts
end
