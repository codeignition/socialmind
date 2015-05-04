require 'rails_helper'

RSpec.describe "social_accounts/new", type: :view do
  before(:each) do
    assign(:social_account, SocialAccount.new())
  end

  it "renders new social_account form" do
    render

    assert_select "form[action=?][method=?]", social_accounts_path, "post" do
    end
  end
end
