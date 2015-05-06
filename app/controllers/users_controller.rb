class UsersController < ApplicationController
  def index
    @shared_accounts = current_user.shared_accounts
    @social_accounts = current_user.social_accounts
  end
end
