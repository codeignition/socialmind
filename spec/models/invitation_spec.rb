require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it "should set token for newly created token" do
    invitation = Invitation.create email: 'a@a.a'
    expect(invitation.token).to_not be_nil
  end
end
