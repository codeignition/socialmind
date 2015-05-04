class UsersController < ApplicationController
  def index
    @social_accounts = current_user.social_accounts
  end
end
