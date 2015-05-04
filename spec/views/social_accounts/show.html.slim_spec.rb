require 'rails_helper'

RSpec.describe "social_accounts/show", type: :view do
  before(:each) do
    @social_account = assign(:social_account, SocialAccount.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
