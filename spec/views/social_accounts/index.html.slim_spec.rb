require 'rails_helper'

RSpec.describe "social_accounts/index", type: :view do
  before(:each) do
    assign(:social_accounts, [
      SocialAccount.create!(),
      SocialAccount.create!()
    ])
  end

  it "renders a list of social_accounts" do
    render
  end
end
