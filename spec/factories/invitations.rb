FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :invitation do
    email
    social_account

    trait :with_user do
      user
    end

    factory :accpeted_invitation, traits: [:with_user]
  end
end
