class Organization
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  has_many :social_accounts, as: :owner
end
