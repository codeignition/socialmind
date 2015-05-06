class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, SocialAccount do |social_account|
      user.social_accounts.include? social_account
    end
    can :read, :all
  end
end
