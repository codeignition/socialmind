class SocialAccount
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :owner, polymorphic: true
end
