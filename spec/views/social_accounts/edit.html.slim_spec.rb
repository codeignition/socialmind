require 'rails_helper'

RSpec.describe "social_accounts/edit", type: :view do
  before(:each) do
    @social_account = assign(:social_account, SocialAccount.create!())
  end

  it "renders the edit social_account form" do
    render

    assert_select "form[action=?][method=?]", social_account_path(@social_account), "post" do
    end
  end
end
